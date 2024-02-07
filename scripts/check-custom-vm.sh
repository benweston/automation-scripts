#!/bin/bash
###
 # Check for custom machine-type Google Cloud Compute Engine VM instances
 # 
 # By Ben Weston
 # Version 1.0
 # Feb 2024
 # 
 # USAGE INSTRUCTIONS:
 # 
 # 1. Assumes user is already authenticated to their Google Cloud account
 # 2. Grant execute permissions to file
 #    (ie. sudo chmod +x ./check-custom-vm.sh)
 # 4. Run file ./check-custom-vm.sh
 ##

# Define function for custom machines
custom_machines(){
    gcloud compute instances list \
    --project $select_project \
    | grep custom
}

# Check project owner to contact
check_owner(){
    gcloud projects describe $select_project \
    | grep owner \
    | awk '{print $2 }'
}

echo "Which project do you wish to check for custom machine types?"
read select_project

# grep project for custom machines
custom_machines

echo "The project owner is:"
check_owner
