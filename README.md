# Windows専用のdotfiles
> :memo: Windowsで必要な設定ファイルのみを置いている。
> 
> メインリポジトリは[ここ](https://github.com/fura0402/dotfiles)

## How to Install.
> :warning: Full Install のみサポート

#### 1. Microsoft Storeから`Windows Terminal` & `Powershell`をインストール

#### 2. Windows Terminalを管理者権限で起動

#### 3. ホストとしてインストールする場合、SSHの設定を行う

#### 4. 以下を実行

> :warning: 前提: dotfilesのサブモジュールとしてdot_winにアクセスしている

```pwsh
. env:USERPROFILE\dotfiles\dot_win\installer\installer.ps1
```

#### 5. 手動でインストールが必要なアプリ
	* Adobe製品
	* Orchis

#### 6. 手動で設定が必要な項目
	* PowerToys
