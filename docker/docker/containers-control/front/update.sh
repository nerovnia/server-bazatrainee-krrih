#!/bin/bash

log() {
    local log_directory="/var/log/450-kr"
    local log_file="$log_directory/front-server.log"
    
    if [ ! -d "$log_directory" ]; then
        mkdir -p "$log_directory"
    fi

    local timestamp=$(date +"%Y-%m-%d %T")
    echo "[$timestamp] $1" >> "$log_file"
}

log "*** Start update ***" 

# Specify the path to the Git repository
git_repo_dir="/home/nerovnia/docker/frontend/450-kherson-humanitarian-landing-page"

# Change the current working directory to the Git repository
cd "$git_repo_dir"

# Now you can run Git commands
git fetch
if [ $? -eq 0 ]; then
  if ! git pull | grep -q "Already up to date."; then
    cd -
    if [ $? -eq 0 ]; then
      source ./rebuild.sh
      if [ $? -eq 0 ]; then
        log "Front-end server is up to date." 
      else  
        log "Error: Front-end server update has error and can't be finished." 
      fi
    fi  
  else
    log "Front-end server is already up to date." 
  fi
fi

cd -


