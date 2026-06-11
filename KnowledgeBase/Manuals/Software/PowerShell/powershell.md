
# PowerShell

## Add Directory to Path variable for User
1. `$newPath = "C:\ProgramData\anaconda3\Scripts"`
2. `$oldPath = [Environment]::GetEnvironmentVariable("PATH", "User")`
3. `[Environment]::SetEnvironmentVariable("PATH","$oldPath;$newPath", "User")`
4. verify using `[Environment]::GetEnvironmentVariable("PATH", "User")`



C:\Users\600889\AppData\Local\Microsoft\WindowsApps;C:\ProgramData\anaconda3\;C:\ProgramData\anaconda3\Scripts\;