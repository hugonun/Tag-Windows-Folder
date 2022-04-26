<# : Tag_Folder.bat v1.2
:: v1.2
:: Only input textbox as result, not calls like OK or Cancel
:: Clear tag when textbox is empty
:: by Hugo Nunes 2022/04/24
:: 
:: 
:: v1.1
:: Adds a tag to current folder in Windows 10
:: by Pinjoy  2-10-2019  
:: pinjoy99@gmail.com
:: https://youtu.be/vyFhSdm4gD8
:: v1.1 updated on 5-1-2019: Refresh folder tags instantly

@ECHO OFF
SETLOCAL
FOR /f "delims=" %%I in ('powershell -noprofile "iex (${%~f0} | out-string)"') DO (
    ATTRIB -h -s desktop.ini >NUL
    TYPE desktop.ini|FINDSTR /V "F29F85E0 Prop5" > "%temp%\desktop.ini"
    ECHO [{F29F85E0-4FF9-1068-AB91-08002B27B3D9}] >> "%temp%\desktop.ini"
    ECHO Prop5=31,%%~I >> "%temp%\desktop.ini"
    (
     echo set shell = CreateObject^("Shell.Application"^)
	 echo set folder = shell.NameSpace^("%cd%"^)
	 echo folder.MoveHere "%temp%\desktop.ini", 4+16+1024
    )>"%temp%\updateTag.vbs"
    cscript //nologo //b "%temp%\updateTag.vbs"
    ATTRIB +h +s desktop.ini
)
EXIT

: end Batch portion / begin PowerShell hybrid chimera #>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-object Windows.Forms.Form
$label = New-Object Windows.Forms.Label
$textbox = New-Object Windows.Forms.TextBox
$button = New-Object Windows.Forms.Button

$form.StartPosition = 'CenterScreen'
$form.Size = New-Object Drawing.Size(240,150)
$form.Text = "Tag Folder"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.AcceptButton = $button

$label.Location = New-Object Drawing.Point(20,20)
$label.Size  = New-Object Drawing.Size(180,23)
$label.Text  = "Enter your tag"

$textbox.Location = New-Object Drawing.Point(20,43)
$textbox.Size  = New-Object Drawing.Size(180,23)

$button.Location = New-Object Drawing.Point(160,76)
$button.Size  = New-Object Drawing.Size(50,23)
$button.Text  = "OK"
$button.DialogResult = "OK"
$button.Add_Click({$form.Close()})

$form.Controls.Add($label)
$form.Controls.Add($textbox)
$form.Controls.Add($button)

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
  if ($textbox.Text -eq "")
  {
    Write-Output """"
  }
  else
  {
    Write-Output ""$textbox.Text""
  }
}
