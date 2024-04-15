# Prompt the user for the commit message
$commitMessage = Read-Host -Prompt "Enter your commit message"

Write-Host "Running Git commands..."

# Add all changes to the staging area
git add *

# Commit the changes
git commit -m $commitMessage

# Push the changes
git push

Write-Host "Git commands executed successfully."