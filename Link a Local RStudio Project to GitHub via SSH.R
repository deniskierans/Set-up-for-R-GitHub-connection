# ------------------------------------------------------------------------
# SCRIPT: Link a Local RStudio Project to GitHub via SSH (Apple Silicon)
# ------------------------------------------------------------------------
# Run this script directly in RStudio to:
# - Initialize Git in your project
# - Create a sensible .gitignore
# - Commit all files
# - Link your local project to a new GitHub repo using SSH
# - Push your project to GitHub
#
# PREREQUISITES:
# ✅ You already have Git and SSH set up and tested (ssh -T git@github.com)
# ✅ You created a new GitHub repo via browser (see below)
# ✅ This is an existing RStudio project you want to link
# ------------------------------------------------------------------------

# ------------------------------------------------------------------------
# STEP 0: Before running this script
# ------------------------------------------------------------------------
# Go to: https://github.com/new
# - Name your repo named exactly the same as the R project you want to sync
# - Let's call the project/repo "EXAMPLE"
# - Set visibility to public or private
# - IMPORTANT: Leave "Initialize this repository with a README" UNCHECKED
# - Click "Create repository"
# - Copy the SSH URL (format: git@github.com:your-username/repo-name.git) 
# - Note if you have installed the default to SSH this last step doesn't matter

# ------------------------------------------------------------------------
# STEP 1: Set working directory to your local RStudio project
# Replace with your actual project path -- to the folder not file
setwd("/Users/deniskierans/Library/CloudStorage/Dropbox/Data Science Course/R/RProjects/Set up for R-GitHub connection")

# ------------------------------------------------------------------------
# STEP 2: Initialize Git
# This creates a .git folder and prepares the project for version control
system("git init")

# ------------------------------------------------------------------------
# STEP 3: Create a .gitignore file
# This excludes unnecessary files from being tracked by Git
# You can add more patterns as needed
gitignore_contents <- c(".Rproj.user/", ".Rhistory", ".RData", ".DS_Store")
writeLines(gitignore_contents, ".gitignore")

# ------------------------------------------------------------------------
# STEP 4: Stage all files in the project
# This includes .R files, .Rproj, and any data/code
system("git add .")

# ------------------------------------------------------------------------
# STEP 5: Commit the files to your local Git repo
# This saves the current project state in Git history
system("git commit -m \"Initial commit\"")

# ------------------------------------------------------------------------
# STEP 6: Add GitHub as the remote origin (using SSH)
# Replace the URL below with your actual SSH URL from GitHub
repo_ssh_url <- "https://github.com/deniskierans/Set-up-for-R-GitHub-connection"
system(paste("git remote add origin", repo_ssh_url))

# ------------------------------------------------------------------------
# STEP 7: Rename the default branch to 'main' (standard practice)
system("git branch -M main")

# ------------------------------------------------------------------------
# STEP 8: Push your project to GitHub
# This uploads your files and links the local project to the remote repo
system("git push -u origin main")

# ------------------------------------------------------------------------
# DONE!
# Your local RStudio project is now linked to GitHub via SSH.
# - You can use the Git tab in RStudio to stage, commit, and push changes.
# - No more username/password prompts thanks to SSH.
# ------------------------------------------------------------------------