function print_error ($msg) {
	Write-Host $msg -ForegroundColor "Red"
}

function has_command ($command) {
  Get-command -Name $command  -ErrorAction "silentlycontinue"
}

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# setup Scoop
irm get.scoop.sh | iex

$scoop_package_list = @(
  "7zip",
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
  "lazygit",
  "llvm",
  "lua",
  "make",
  "msys2",
  "neovim",
  "nodejs-lts",
  "oh-my-posh",
  "posh-docker",
  "posh-git",
  "psfzf",
  "python",
  "ripgrep",
  "rust-analyzer",
  "rustup",
  "sudo",
  "terminal-icons",
  "tree-sitter",
  "unzip",
  "uutils-coreutils",
  "vim",
  "wget",
  "zoxide"
)

if (!(has_command scoop)) {
	print_error("Error: `"scoop`" is not found.")
} else {
	scoop bucket add extras
  scoop update

	foreach ($package in $scoop_package_list) {
		scoop install $package
	}
}

.\symbolic.ps1

# setup Winget
$winget_app_list = @{
	"Adobe Creative Cloud"      = "XPDLPKWG9SW2WD"
	"Autodesk Fusion 360"       = "73e72ada57b7480280f7a6f4a289729f"
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
	"PowerToys"                 = "Microsoft.PowerToys"
	"QuickLook"                 = "QL-Win.QuickLook"
	"Spotify"                   = "9NCBCSZSJRSB"
	"Twitter"                   = "9WZDNCRFJ140"
	"Visual Studio Code"        = "Microsoft.VisualStudioCode"
	"Windows Terminal"          = "Microsoft.WindowsTerminal"
	"Zoom"                      = "Zoom.Zoom"
    "AutoHotkey"                = "AutoHotkey.AutoHotkey"
    "Visual Studio Build Tools" = "Microsoft.VisualStudio.2022.BuildTools" # rustに必要
}

if (!(has_command winget)) {
	print_error("Error: `"winget`" is not found.")
} else {
	foreach ($app in $winget_app_list) {
    winget install $app.Values
	}
  winget upgrade
}

# "Import-Module DockerCompletion"を実行可能にするため以下が必要
Install-Module DockerCompletion -Scope CurrentUser

Write-Output ". $env:USERPROFILE\.config\powershell\user_profile.ps1" >> $PROFILE
