#ajout d'un compte dans la base locale du système
#à partir de la saisie du nom et d ela description
$local=[ADSI]"WinNT://."
$nom=Read-Host -Prompt "Saisir un nom"
$description=Read-Host -Prompt "Saisir une description"
$nomcomplet=Read-Host -Prompt "Saisir un nom complet"
$compte=[ADSI]"WinNT://./$nom"
if (!$compte.path)
{
    $utilisateur=$local.create("user",$nom)
    $utilisateur.InvokeSet("Description",$description)
    $utilisateur.InvokeSet("Description",$nomcomplet)
    $utilisateur.CommitChanges()
    Write-Host "$nom.ajoute"
}
else
{
    Write-Host "$nom existe deja"
}