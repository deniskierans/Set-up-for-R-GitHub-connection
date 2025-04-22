# -----------------------------------------------------------
# Git + GitHub + SSH Setup for MacBook (Apple Silicon)
# -----------------------------------------------------------

# 1. Install Git using Homebrew
# If you don't have Homebrew:
system("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"")

# Then install Git
system("brew install git")

# Check Git version
system("git --version")

# -----------------------------------------------------------

# 2. Set up Git user name and email
# Use the same email registered with GitHub (does not need to be primary)
system("git config --global user.name \"Your Name\"")
system("git config --global user.email \"you@example.com\"")

# -----------------------------------------------------------

# 3. Generate a new SSH key
# Hit Enter at each prompt to accept the default
system("ssh-keygen -t ed25519 -C \"you@example.com\"")

# Start the SSH agent and add your key
system("eval \"$(ssh-agent -s)\"")
system("ssh-add --apple-use-keychain ~/.ssh/id_ed25519")

# -----------------------------------------------------------

# 4. Add your SSH public key to GitHub
# First, copy it to your clipboard:
system("pbcopy < ~/.ssh/id_ed25519.pub")

# Then go to: https://github.com/settings/keys
# Click "New SSH key", give it a name (e.g., "MacBook Air")
# Paste the copied key — it will look like this:

# ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFV8FjIr1UDooRKGftJuIS/Dc5utV8A0WV67irzn9XCH deniskierans@gmail.com

# DO NOT use the fingerprint format (e.g. SHA256:xxxxx...) — GitHub requires the full key starting with "ssh-ed25519".

# -----------------------------------------------------------

# 5. Test the SSH connection
system("ssh -T git@github.com")

# You should see:
# Hi your-username! You've successfully authenticated, but GitHub does not provide shell access.

# -----------------------------------------------------------

# 6. Set Git to always use SSH instead of HTTPS for GitHub
system("git config --global url.\"git@github.com:\".insteadOf \"https://github.com/\"")

# This ensures RStudio and terminal always use your SSH key, even if you paste HTTPS URLs from GitHub.

# -----------------------------------------------------------

# 7. Set up Git in RStudio
# In RStudio:
# - Go to Tools > Global Options > Git/SVN
# - Enable "Version control interface"
# - Ensure Git executable path is auto-detected (usually /opt/homebrew/bin/git)

# -----------------------------------------------------------

# 8. Clone a GitHub repo in RStudio via SSH
# File > New Project > Version Control > Git
# Repository URL: git@github.com:your-username/your-repo.git
# Directory name: your-repo
# Choose where to save the project and click "Create Project"

# You’re all set! You can now push/pull with no password prompts in RStudio.

# -----------------------------------------------------------