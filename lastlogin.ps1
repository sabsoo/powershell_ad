$nom=Read-Host -Prompt "saisir un nom de compte local"
$compte=[ADSI]"WinNT://./$nom"
if ($compte.path)
{
    Write-Host $compte.LastLogin
    $compte | Get-Member
    $compte.Name
    $compte.MaxBadPasswordsAllowed
    $compte.FullName
    $compte.LastLogin
    
    
}
else
{
    Write-Host "$nom non trouvé"
}
#[ADSI]"WinNT://." acces à la base de ocmpte utilisateur , sensible à la casse
#resultat
##S C:\Users\Lenovo> C:\Users\Lenovo\Documents\lastlogin.ps1
#13/04/2018 10:04:15
##PS C:\Users\Lenovo> C:\Users\Lenovo\Documents\lastlogin.ps1
##us1 non trouvé

##ajout d'un compte local du systeme


