# Display introduction
Write-Host "🚀 Welcome to the Git Commit Script! 🚀"
Write-Host "This script helps you to commit and push your changes to Git."
Write-Host

$commitMessage = Read-Host -Prompt "Enter your commit message:"

Write-Host "🛠️ Running Git commands... 🛠️"

$gitCommands = @(
    @{
        Command        = { git add * }
        SuccessMessage = "✅ Git command: git add * executed successfully."
    },
    @{
        Command        = { git commit -m $commitMessage }
        SuccessMessage = "✅ Git command: git commit -m '$commitMessage' executed successfully."
    },
    @{
        Command        = { git push }
        SuccessMessage = "✅ Git command: git push executed successfully."
    }
)

foreach ($gitCommand in $gitCommands) {
    try {
        & $gitCommand.Command
        Write-Host $gitCommand.SuccessMessage
    }
    catch {
        Write-Host "❌ An error occurred while executing the Git commands: $_"
        $_ | Out-File -FilePath .\error.log -Append
        break
    }
}

Write-Host "✅ Git commands executed successfully. Your changes have been committed and pushed."