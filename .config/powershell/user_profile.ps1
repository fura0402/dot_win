# Encoding
$utf8 = [System.Text.Encoding]::GetEncoding("UTF-8")
$OutputEncoding = $utf8
[System.Console]::OutputEncoding = $utf8
Remove-Variable utf8


# oh-my-posh
oh-my-posh init pwsh --config "~/.config/powershell/default.omp.json" | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource None

# Terminal-Icons
Import-Module -Name Terminal-Icons

# posh-git
$env:POSH_GIT_ENABLED = $True

# docker
Import-Module DockerCompletion
# Alias
Set-Alias n "nvim"
Set-Alias lg "lazygit"

# Functions
function .. { Set-Location .. }
function dot { Set-Location ~/dotfiles }
function which ($command) {
    Get-command -Name $command -ShowCommandInfo | Format-List -Property Definition
}

## pyenv
#$env:PYENV="$env:USERPROFILE\scoop\apps\pyenv\current\pyenv-win"
#$env:PYENV_HOME="$env:USERPROFILE\scoop\apps\pyenv\current\pyenv-win"
#$env:PYENV_ROOT="$env:USERPROFILE\scoop\apps\pyenv\current\pyenv-win"
#$env:PATH="$env:PYENV\bin;" `
#          +"$env:PYENV\shims;" `
#          +$env:PATH

# fzf
$env:FZF_DEFAULT_OPTS='--height 60% --reverse --border'

$env:FZF_CTRL_T_COMMAND='fd --type=file --hidden --follow --no-ignore --strip-cwd-prefix --exclude=.git --exclude=node_modules'
$env:FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid --line-range :100 {}"'

$env:FZF_ALT_C_COMMAND="fd --type=directory --no-ignore-vcs --strip-cwd-prefix --exclude=.git --exclude=node_modules"
$env:FZF_ALT_C_OPTS="--preview 'exa --icons --tree {} | head -200'"

#$env:PSModulePath="$env:USERPROFILE\scoop\modules;"+$env:PSModulePath
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' `
                -PSReadlineChordReverseHistory 'Ctrl+r' `
                -PSReadlineChordSetLocation 'Alt+c'


# zoxide
Invoke-Expression (& {
  $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
  (zoxide init --cmd j --hook $hook powershell | Out-String)
})

# rust
$env:PATH="$env:USERPROFILE\scoop\apps\rustup\current\.cargo\bin;"+$env:PATH
$env:CARGO_HOME="$env:USERPROFILE\scoop\persist\rustup\.cargo"
$env:RUSTUP_HOME="$env:USERPROFILE\scoop\persist\rustup\.rustup"

# go
$env:PATH="$env:USERPROFILE\go\bin;"+$env:PATH
$env:GOROOT="$env:USERPROFILE\scoop\apps\go\current"
