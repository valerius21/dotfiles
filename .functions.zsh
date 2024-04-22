
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
  # TODO: assert Darwin

  sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
}

