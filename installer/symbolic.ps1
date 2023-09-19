# create Symbolic Links
sudo New-Item -ItemType SymbolicLink -Path $env:USERPROFILE\AppData\Local\nvim -Target $env:USERPROFILE\dotfiles\.config\nvim\
sudo New-Item -ItemType SymbolicLink -Path $env:USERPROFILE\.gitconfig -Target $env:USERPROFILE\dotfiles\.gitconfig
sudo New-Item -ItemType SymbolicLink -Path $env:USERPROFILE\.gitignore_global -Target $env:USERPROFILE\dotfiles\.gitignore_global
sudo New-Item -ItemType SymbolicLink -Path $env:USERPROFILE\.config\powershell -Target $env:USERPROFILE\dotfiles\dot_win\.config\powershell\
