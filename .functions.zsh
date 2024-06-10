#!/bin/zsh

function biome_init() {
  # This script installs biome in the current repository and migrates exisitng prettier/eslint configs
  echo "Initializing biome for repository $(pwd)"
  if [[ ! -d node_modules ]]; then
    echo "node_modules not present. please install them and then run the command again"
    return 1
  # Figure out, which package manager is used
  PACKAGE_MANAGER=""

  elif [[ -f package-lock.json ]]; then
    echo "Found NPM. Running"
    PACKAGE_MANAGER=`which npm`
    if [[ ! -f "$PACKAGE_MANAGER" ]]; then
      echo "Cannot find $PACKAGE_MANAGER"
      return 1
    fi
    npm install --save-dev --save-exact @biomejs/biome
    npx biome init
    npx biome migrate eslint --write
    npx biome migrate prettier --write
  elif [[ -f bun.lockb ]]; then
    echo "Found Bun. Running..."
    PACKAGE_MANAGER=`which bun`
    if [[ ! -f "$PACKAGE_MANAGER" ]]; then
      echo "Cannot find $PACKAGE_MANAGER"
      return 1
    fi
    bun add --dev --exact @biomejs/biome
    bunx biome init
    bunx biome migrate eslint --write
    bunx biome migrate prettier --write
  elif [[ -f pnpm-lock.json ]]; then
    echo "Found PNPM. Running..."
    PACKAGE_MANAGER=`which pnpm`
    if [[ ! -f "$PACKAGE_MANAGER" ]]; then
      echo "Cannot find $PACKAGE_MANAGER"
      return 1
    fi
    pnpm add --save-dev --save-exact @biomejs/biome
    pnpm biome init
    pnpm biome migrate eslint --write
    pnpm biome migrate prettier --write
  elif [[ -f yarn.lock ]]; then
    echo "Found Yarn. Running..."
    PACKAGE_MANAGER=`which yarn`
    if [[ ! -f "$PACKAGE_MANAGER" ]]; then
      echo "Cannot find $PACKAGE_MANAGER"
      return 1
    fi
    yarn add --dev --exact @biomejs/biome
    yarn biome init
    yarn biome migrate eslint --write
    yarn biome migrate prettier --write
  else
    echo "Package Manager unknown. Exiting..."
    return 1
  fi
  return 0
}

function setup_venv() {
    if [[ ! -d .venv ]]; then 
        echo "creating .venv"
        python3 -m venv .venv
        if [[ ! -f ./.gitignore ]] || ! grep -q "^venv/$" ./.gitignore; then
            curl -L "https://www.gitignore.io/api/python" > ./.gitignore
        fi
        if [[ -f ./requirements.txt ]]; then 
            echo "requirements.txt found, installing"
            ./.venv/bin/pip install -r ./requirements.txt
        fi
    fi
    source ./.venv/bin/activate
}

# Kill Port
function kill_port() {
  echo "Killing multiple processes is not supported."
  if [ -z "$1" ]; then
    echo "Usage: kill_port <port_number>"
    return 1
  fi

  local port="$1"
  local pid

  # Check if lsof is available
  if ! command -v lsof > /dev/null; then
    echo "Error: lsof command is not installed."
    return 1
  fi

  # Find the process using the specified port
  pid=$(lsof -t -i :$port)

  if [ -z "$pid" ]; then
    echo "No process found on port $port."
    return 1
  fi

  # Kill the process
  kill -9 "$pid"
  echo "Killed process $pid running on port $port."
}


function flush_dns() {
  # assert Darwin
  if [[ "$OSTYPE" != "darwin"* ]]; then
    sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
    return 0
  fi

  sudo resolvectl flush-caches
  sudo systemd-resolve --flush-caches
}

