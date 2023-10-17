# .vimrc : Für 'vim', 'mvim'
# -> ~
copy ~/.vimrc ./home -Force

# .vimrccode : Für Visual Studio Code
# -> ~
copy ~/.vimrccode ./home -Force

# /Users/carstenschlegel/.config/nvim
# Komplette NeoVIM Konfiguration
# -> /Users/carstenschlegel/.config/nvim
copy /Users/carstenschlegel/.config/nvim/* ./nvim -Recurse -Force -Container

# PowerShell Profile
# -> /Users/carstenschlegel/.config/powershell/Microsoft.PowerShell_profile.ps1
# -> $profile
copy /Users/carstenschlegel/.config/powershell/Microsoft.PowerShell_profile.ps1 . -Force

# SSH Keys
copy /Users/carstenschlegel/.ssh/* ./NoGit/SSH/ -Recurse -Force




git a
git c "Update"
git push
