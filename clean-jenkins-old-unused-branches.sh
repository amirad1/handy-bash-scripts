#!/bin/bash

#colorize results
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

#change directory
MICROSERVICES_DIR="/var/lib/jenkins/jobs/{your-path}/jobs"

# Find all jenkins pipelines directories
find "${MICROSERVICES_DIR}" -mindepth 1 -maxdepth 1 -type d -print0 | while IFS= read -r -d $'\0' microservice_dir; do
    microservice=$(basename "${microservice_dir}")
    branches_dir="${microservice_dir}/branches"
    
    echo -e "${GREEN}--------- Branches list of ${microservice} microservice -----------${ENDCOLOR}"
    
    # Process branches sorted by modification time (newest first)
    if [[ -d "${branches_dir}" ]]; then
        find "${branches_dir}" -mindepth 1 -maxdepth 1 -type d -printf '%T@ %p\0' | \
            sort -znr | \
            while IFS= read -r -d $'\0' branch_entry; do
                branch_path="${branch_entry#* }"
                branch_name=$(basename "${branch_path}")
                
                branchsize=$(du -sh "${branch_path}")
                branchdate=$(stat -c '%y' "${branch_path}" | cut -d' ' -f1)
                
                echo -e "${branchdate} --- ${branchsize}"
            done
    fi
done
