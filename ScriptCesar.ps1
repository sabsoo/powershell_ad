#ScriptCesar.ps1
#Chiffrement d un message grâce au code Cesar 
Param(
    [parameter(Mandatory=$true)]
    [string]$Texte,
    [parameter(Mandatory=$false)]
    [int]$Cle=10
    )
    
$message_origine=$texte
$alphabet_MAJ='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
$alphabet_MIN='abcdefghijklmnopqrstuvwxyz'

for($i=0;$i -lt $message_origine.length;$i++)
{
    $trouve=0
    for($j=0;$j -lt $alphabet_MAJ.length;$j++)
    {
        $tmp=$cle
        While($($j+$tmp) -ge $alphabet_MAJ.length)
        {
            $tmp -=26
        }
        If($message_origine[$i] -ceq $alphabet_MAJ[$j])
        {
            $message_modif += $alphabet_MAJ[$j+$tmp]
            $trouve=1
        }
        Elseif($message_origine[$i] -ceq $alphabet_MIN[$j])
        {
            $message_modif += $alphabet_MIN[$j+$tmp]
            $trouve=1
        }
    }
    if(!$trouve)
    {
        $message_modif += $message_origine[$i]
    }
}

$Resultat = New-Object PSObject
$Resultat |
    Add-Member Noteproperty -Name 'Message Origine' -value $message_origine
$Resultat |
    Add-Member Noteproperty -Name 'Message Modifié' -value $message_modif
$Resultat