#!/bin/bash
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
echo "TIMESTAMP $TIMESTAMP" >> output.txt
sh_files_dir="./health-checks"

for script in "$sh_files_dir"/*; do
    echo "in main $script"
    chmod +x "$script" 
    #"$script" |& tee -a output.txt
    "$script" >> output.txt

done

echo "......................................................................................................." >> output.txt
