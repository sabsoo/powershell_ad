# PasswordGenerator.ps1
param(
    [int] $len=11,
    [string] $chars =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ?/&*!@#$%"
    )
    
$bytes=new-object "System.Byte[]" $len
$rnd= new-object System.Security.Cryptography.RNGCryptoServiceProvider
$rnd.GetBytes($bytes)
$result=""
for($i=0;$i -lt $len;$i++)
{
    $result += $chars[ $bytes[$i] % $chars.Length ]
}
$result