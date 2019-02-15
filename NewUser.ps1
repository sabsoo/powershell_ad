$objOU=[ADSI] "LDAP://OU=Persons,DC=ingetis,DC=com"
$objUser=$objOU.Create("user","CN=Alex HAMIN")
$objUser.Put("sAMAccountName","alex.hamin")
$objUser.Setinfo()
