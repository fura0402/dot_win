function print_message ($msg) {
  Write-Host $msg -ForegroundColor "Green"
}

function print_error ($msg) {
  Write-Host $msg -ForegroundColor "Red"
}

function has_command ($command) {
  Get-command -Name $command  -ErrorAction "silentlycontinue"
}

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser


$scoop_main_package_list = @(
  "bat",
  "clangd",
  "cmake",
  "curl",
  "delta",
  "fd",
  "fzf",
  "gcc",
  "git",
  "go",
  "gzip",
  "jq",
  "llvm",
  "lua",
  "make",
  "msys2",
  "neovim",
  "nodejs-lts",
  "oh-my-posh",
  "python",
  "ripgrep",
  "rust-analyzer",
  "rustup",
  "sudo",
  "tree-sitter",
  "unzip",
  "uutils-coreutils",
  "vim",
  "wget",
  "zoxide"
)
$scoop_extras_package_list = @(
  "lazygit",
  "posh-docker",
  "posh-git",
  "psfzf",
  "terminal-icons"
)

if (!(has_command scoop)) {
  print_message("Installing scoop...")
  # Command to install scoop
  irm get.scoop.sh | iex
}
scoop update
foreach ($package in $scoop_main_package_list) {
  scoop install $package
}
scoop bucket add extras
foreach ($package in $scoop_extras_package_list) {
  scoop install $package
}
{
  scoop bucket add nerd-fonts
  scoop install Hack-NF-Mono
}

.\symbolic.ps1

# setup Winget
$winget_app_list = @{
  "Adobe Creative Cloud"      = "XPDLPKWG9SW2WD"
  "AutoHotkey"                = "AutoHotkey.AutoHotkey"
  "Autodesk Desktop App"      = "Autodesk.DesktopApp"
  "Bandicam"                  = "BandicamCompany.Bandicam"
  "DeepL"                     = "XPDNX7G06BLH2G"
  "Discord"                   = "Discord.Discord"
  "Docker Desktop"            = "Docker.DockerDesktop"
  "Everything"                = "voidtools.Everything"
  "EverythingToolbar"         = "stnkl.EverythingToolbar"
  "Flow Launcher"             = "Flow-Launcher.Flow-Launcher"
  "Google Chrome"             = "Google.Chrome"
  "Google 日本語入力"         = "Google.JapaneseIME"
  "KiCad"                     = "KiCad.KiCad"
  "Line Desktop"              = "XPFCC4CD725961"
  "OBS Studio"                = "XPFFH613W8V6LV"
  "PowerToys"                 = "Microsoft.PowerToys"
  "QuickLook"                 = "QL-Win.QuickLook"
  "Spotify"                   = "9NCBCSZSJRSB"
  "Twitter"                   = "9WZDNCRFJ140"
  "Visual Studio Build Tools" = "Microsoft.VisualStudio.2022.BuildTools" # rustに必要
  "Visual Studio Code"        = "Microsoft.VisualStudioCode"
  "Windows Terminal"          = "Microsoft.WindowsTerminal"
  "Zoom"                      = "Zoom.Zoom"
}

if (!(has_command winget)) {
  print_error("Error: `"winget`" is not found.")
} else {
  foreach ($app in $winget_app_list.GetEnumerator()) {
    print_message("Installing $($app.Key)...")
    winget install $app.Value
  }
  winget upgrade
}

# "Import-Module DockerCompletion"を実行可能にするため以下が必要
Install-Module DockerCompletion -Scope CurrentUser

Write-Output ". `$env:USERPROFILE\.config\powershell\user_profile.ps1" > $PROFILE
