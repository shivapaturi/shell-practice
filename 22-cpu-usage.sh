     #!/bin/bash
     while true; do
       cpu_usage=$(mpstat 1 1 | awk '/all/ {print 100 - $NF}')
       echo "CPU Usage: $cpu_usage%"
       sleep 5  # Check every 5 seconds
     done