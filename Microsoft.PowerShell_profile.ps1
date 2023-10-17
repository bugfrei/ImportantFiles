Function Switch-Profile
{
    [CmdletBinding()]
    [Alias("swpro")]
    param(
    )
    $pf = "/Users/carstenschlegel/.config/powershell/Microsoft.PowerShell_profile.ps1"
    $ps = "/Users/carstenschlegel/.config/powershell/Microsoft.PowerShell_profile_sw.ps1"
    $pt = "/Users/carstenschlegel/.config/powershell/Microsoft.PowerShell_profile_temp.ps1"
    ren $pf $pt
    ren $ps $pf
    ren $pt $ps
    pwsh
}    

$startpath = (Get-Location)

$profilesw = "/Users/carstenschlegel/.config/powershell/Microsoft.PowerShell_profile_sw.ps1"

# Um dieses Profile auch im VSC nutzen zu können, muss es in der Profile-Datei von VSC reinkopiert werden
# = als Platzhalter für Measure-Object
New-Alias -Name term -Value zsh
New-Alias -Name vim -Value nvim
New-Alias -Name typem -Value "Show-Markdown"
New-Alias -Name .. -Value ForEach-Object

# Variablen
$username = [System.Environment]::Username
$icloud = "/Users/$username/Library/Mobile Documents"

$vimrc = "/Users/$username/.config/nvim/init.vim"
$viminst = "/usr/share/vim/vim90"
$gitcfg = "/Users/$username/.gitconfig"
$mod = "/Users/$username/.local/share/powershell/Modules"
$global:__VSCodeOriginalPrompt = "x"
$temp = "/Users/$username/temp"
$dl = "/Users/$username/downloads"
$dok = "/Users/$username/documents"
# Aliase für folgende Cmdlets laden
$WarningPreference = "SilentlyContinue"
Import-Module -Name Path | Out-Null
Import-Module -Name TranslateSearch | Out-Null
Import-Module -Name Commands | Out-Null
Import-Module -Name sup | Out-Null
Import-Module -Name PSYaml | Out-Null
# /Users/carstenschlegel/.local/share/powershell/Modules/sup/sup.ps1 -Silent
Import-Module -Name githelper | Out-Null
Import-Module -Name Helper | Out-Null
$WarningPreference = "Continue"

# UTF8 als Standard Encoding für Get-Content (type) und Out-File
$PSDefaultParameterValues = @{'Get-Content:Encoding' = 'utf8'; 'Out-File:Encoding' = 'utf8' }
# JSON Tiefer von 2 (Default) aus 10 ändern
$PSDefaultParameterValues['ConvertTo-Json:depth'] = 10
#
# Keybindings
if ((Get-PSReadLineOption).EditMode -eq "Vi")
{
    Set-PSReadLineKeyHandler -Key 'F5' -ViMode Command -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::UndoAll(); [Microsoft.PowerShell.PSConsoleReadLine]::Insert(". /Users/carstenschlegel/.local/share/powershell/Modules/sup/sup.ps1 -nocls;"); [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine(); copy /Users/carstenschlegel/.local/share/powershell/Modules/sup/sup.ps1 /Users/carstenschlegel/Downloads -Force } -BriefDescription "Lädt das SUP Script neu"
    Set-PSReadLineKeyHandler -Key 'F5' -ViMode Insert -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::UndoAll(); [Microsoft.PowerShell.PSConsoleReadLine]::Insert(". /Users/carstenschlegel/.local/share/powershell/Modules/sup/sup.ps1 -nocls;"); [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine(); copy /Users/carstenschlegel/.local/share/powershell/Modules/sup/sup.ps1 /Users/carstenschlegel/Downloads -Force } -BriefDescription "Lädt das SUP Script neu"
    Set-PSReadLineKeyHandler -Key ' ,a' -ViMode Command -Function SelectAll
    Set-PSReadLineKeyHandler -Key ' ,h' -ViMode Command -Function ShowKeyBindings
    Set-PSReadLineKeyHandler -Key ' ,k' -ViMode Command -Function WhatIsKey
}
Set-PSReadLineKeyHandler -Key 'F5' -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::UndoAll(); [Microsoft.PowerShell.PSConsoleReadLine]::Insert(". /Users/carstenschlegel/.local/share/powershell/Modules/sup/sup.ps1 -nocls;"); [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine(); copy /Users/carstenschlegel/.local/share/powershell/Modules/sup/sup.ps1 /Users/carstenschlegel/Downloads -Force } -BriefDescription "Lädt das SUP Script neu"

Set-PSReadLineKeyHandler -Key F12 -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::BeginningOfLine(); [Microsoft.PowerShell.PSConsoleReadLine]::Insert("("); [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine(); [Microsoft.PowerShell.PSConsoleReadLine]::Insert(")"); } -BriefDescription "Umklammern" -ViMode Insert
Set-PSReadLineKeyHandler -Key F11 -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::BeginningOfLine(); [Microsoft.PowerShell.PSConsoleReadLine]::Insert("`$xx = ("); [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine(); [Microsoft.PowerShell.PSConsoleReadLine]::Insert(")"); } -BriefDescription "Umklammern" -ViMode Insert


# Ausgabe von Informationen
function info
{
    param(
        [Switch] $nocls
    )
    if (-not $nocls)
    {
        cls
    }
    Write-Host "YouTube (y), Bing (b), Google (g), Get-English (en), Get-German (de), Start-Search (suche), Projekt" -ForeGroundColor Red
    Write-Host "ts, js, sap (TypeScript, JavaScript, SAP)" -ForegroundColor Gray
    Write-Host "vim `$profile, vim `$vimrc, vim `$gitcfg" -ForegroundColor Gray
    Write-Host "Compress-Archive <files> <archivename.zip>  |  Expand-Archive <archivename.zip> <destPath>" -ForegroundColor Yellow
    Write-Host "c (code .), cw (work) für VS Code Workspaces" -ForegroundColor Red
    Write-Host "url [copy|open] für Github-Repository URL" -ForegroundColor Yellow 
    Write-Host "vh (vim, multiple files in tabs + help)" -ForegroundColor Yellow 
    Write-Host "connect, enter für Server-Verbindung" -ForegroundColor Yellow 
    Write-Host "" -ForegroundColor Yellow 
    Write-Host
}
. "/Users/carstenschlegel/Library/Application Support/.btp/autocomplete/scripts/sapbtpcli-autocomplete.plugin.ps1"

function Remote
{
    [Alias("Connect", "Con")]
    param(
    )
    $s = New-PSSession -hostName 82.165.56.11 -UserName root 
    $Global:Session = $s
    return $s
}
function Enter
{
    param(
        $session = $null
    )
    if ($session -is [String]) {
        ssh $session
    }
    else {
        if ($session -eq $null)
        {
            $s = $Global:Session
        }
        else
        {
            $s = $session
        }
        if ($session -eq $null) {
            ssh vm -t pwsh
        }
        else {
            Enter-PSSession $s
        }
    }
}


cd ~
info -nocls

function mc
{
    if ($session.State -ne "Opened")
    {
        connect | Out-Null
    }
    Invoke-Command -Session $session -ScriptBlock { docker logs --since 24h mc; Read-Host 'Enter for Stats'; docker container stats mc }
}

function aus
{
    param(
        $z,
        $dividator = 3
    )
    $s = ($z - ($z % $dividator)) / $dividator; 1..$dividator | ForEach-Object { $z - ( $s * $_ ) }
}


# Text2MP3
function VoiceArgumentCompleter
{
    param(
        $commandName,
        $parameterName,
        $wordToComplete,
        $commandAst,
        $fakeBoundParameters
    )
    if ($Global:_voices -eq $null)
    {
        $key = "b2da8862091c6f36d5fbbfc09fa74bcf"

        $headers = @{
            'xi-api-key' = $key
        }

        $url = "https://api.elevenlabs.io/v1/voices"

        $Global:_voices = Invoke-RestMethod -Uri $url -Method Get -Headers $headers -ContentType "application/json" 
    }

    foreach ($voice in $Global:_voices.voices)
    {
        if ($voice.name -match "$wordToComplete.*")
        {
            $tt = "Akzent: $($voice.labels.accent), Alter: $($voice.labels.age), Geschlecht: $($voice.labels.gender)"
            New-Object System.Management.Automation.CompletionResult (
                $voice.name,
                $voice.name,
                "ParameterValue",
                $tt
            )
        }
    }
}
    
function Load-TextVoice
{
    [CmdletBinding()]
    [Alias("voice", "mp3", "text")]
    param(
        [ArgumentCompleter({ VoiceArgumentCompleter @args })]
        [string] $Voice,
        $FileMP3,
        $Text

    )

    $v = $Global:_voices.voices | Where-Object { $_.name -eq $Voice }
    $vid = "21m00Tcm4TlvDq8ikWAM"
    if ($v.Count -eq 1)
    {
        $vid = $v.voice_id
    }
    elseif ($v.Count -gt 1)
    {
        Write-Host "Mehere Voices gefunden! - Abbruch" -ForegroundColor Red
        return
    }
    else
    {
        Write-Host "Standard-Voice wird verwendet"
    }
    
    $body = [PSCustomObject]@{
        text           = $Text
        model_id       = "eleven_monolingual_v1"
        voice_settings = [PSCustomObject]@{
            stability        = 0.5
            similarity_boost = 0.5
        }
    }
    $bodyJson = ConvertTo-Json -InputObject $body -Depth 3
    $key = "b2da8862091c6f36d5fbbfc09fa74bcf"

    $headers = @{
        'xi-api-key'      = $key
        "Accept"          = "*/*"
        "Accept-Encoding" = "gzip"
    }

    $url = "https://api.elevenlabs.io/v1/text-to-speech/$vid"

    if ($FileMP3 -eq "")
    {
        Write-Host "Kein Dateiname für MP3-Datei angegeben - Abbruch" -ForegroundColor Red
        return
    }
    if (Test-Path $FileMP3)
    {
        $e = Read-Host "Datei $FileMP3 bereits vorhanden, überschreiben? (j/N)"
        if ($e -ne "J")
        {
            Write-Host "Abbruch" -ForegroundColor Red
            return
        }
        Remove-Item $FileMP3 -Force
    }
    Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $bodyJson -ContentType "application/json" -OutFile $FileMP3
}

function vimrem
{
    param(
        [parameter(position = 1, mandatory = $true)][string]$Path
    )
    $TempFile = [System.IO.Path]::GetTempFileName()

    copy-item -fromsession $Global:Session -path $Path -destination $TempFile

    vim $TempFile

    copy-item -tosession $Global:Session -path $TempFile -destination $Path

    remove-item -path $TempFile
}

. /Users/carstenschlegel/.local/share/powershell/Modules/Speech/speech.ps1

Set-Location $startpath

function val {
    ii "/Users/carstenschlegel/Music/VALHALLA CALLING by Miracle Of Sound ft. Peyton Parrish (Assassin's Creed) (DUET VERSION).mp4"
    Start-Sleep -Seconds 3
    mvim -f /Users/carstenschlegel/valhalla
    Get-Process -Name VLC | Stop-Process
}

function logs {
    param(
        [Switch] $Live
    )
    if ($Live) {
        ssh vm "docker logs -f mc"
    }
    else {
        ssh vm "docker logs mc"
    }
}

function ExitF { exit }
Set-Alias -Name ":q" -Value "ExitF"

