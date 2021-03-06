#PassWord-Generate.ps1
[void][Reflection.Assembly]::LoadWithPartialName('system.Windows.Forms')
$textBox_resultat=New-Object System.Windows.Forms.TextBox
$progressBar=New-Object System.Windows.Forms.ProgressBar
$button_generer=New-Object System.Windows.Forms.Button
$checkBox_chiffres=New-Object System.Windows.Forms.CheckBox
$checkBox_minuscules=New-Object System.Windows.Forms.CheckBox
$checkBox_majuscules=New-Object System.Windows.Forms.CheckBox
$button_quitter=New-Object System.Windows.Forms.Button
$label1=New-Object System.Windows.Forms.Label
$checkBox_autres=New-Object System.Windows.Forms.CheckBox
$label2=New-Object System.Windows.Forms.Label
$label3=New-Object System.Windows.Forms.Label
$textBox_Nb_caracteres=New-Object System.Windows.Forms.TextBox
$label4=New-Object System.Windows.Forms.Label
$label_principal=New-Object System.Windows.Forms.Label
#
#textBox_resultat
#
$textBox_resultat.Location=New-Object System.Drawing.Point(205,225)
$textBox_resultat.Multiline=$true
$textBox_resultatName='textBox_resultat'
$textBox_resultat.Size=New-Object System.Drawing.Size(206,31)
$textBox_resultat.TabIndex=2
#
#progressBar
#
$progressBar.Location=New-Object System.Drawing.Point(205,271)
$progressBar.Name='progressBar'
$progressBar.Size=New-Object System.Drawing.Size(206,23)
$progressBar.TabIndex=3
$progressBar.set_forecolor('darkblue')
#
#button_generer
#
$button_generer.Location=New-Object System.Drawing.Point(53,317)
$button_generer.Name='button_generer'
$button_generer.Size=New-Object System.Drawing.Size(94,24)
$button_generer.TabIndex=4
$button_generer.Text='Générer'
$button_generer.UseVisualStyleBackColor=$true

$button_generer.Add_Click({
	[int]$len=$textBox_Nb_caracteres.get_text()
	$textBox_resultat.Text=""
	$complex=0
	$progressBar.Value=0
	[string]$chars=""

	if($checkBox_chiffres.Checked)
		{$chars +='0123456789';$complex+=1}
	if($checkBox_majuscules.Checked)
		{$chars +='ABCDEFGHIJKLMNOPQRSTUVWXYZ';$complex+=1}
	if($checkBox_minuscules.Checked)
		{$chars +='abcdefghijklmnopqrstuvwxyz';$complex+=1}
	if($checkBox_autres.Checked)
		{$chars+='_!@#$%';$complex+=1}

	if($chars -ne ""){
		$bytes=new-object 'System.Byte[]' $len
		$rnd=new-object System.Security.Cryptography.RNGCryptoServiceProvider
		$rnd.GetBytes($bytes)
		$result=""
        for($i=0;$i -lt $len;$i++)
        {
        	$result+=$chars[ $bytes[$i]%$chars.Length ]
        }
        $complex*=$(2.57*$len)
        if($complex -gt 100) {$complex = 100}
        $progressBar.Value=$complex
        $textBox_resultat.Text=$result

	}

})

#
#checkBox_chiffres
#
$checkBox_chiffres.AutoSize=$true
$checkBox_chiffres.Location=New-Object System.Drawing.Point(317,85)
$checkBox_chiffres.Name="checkBox_chiffres"
$checkBox_chiffres.Size=New-Object System.Drawing.Size(61,17)
$checkBox_chiffres.TabIndex=5
$checkBox_chiffres.Text="Chiffres"
$checkBox_chiffres.UseVisualStyleBackColor=$true
#
#checkBox_minuscules
#
$checkBox_minuscules.AutoSize=$true
$checkBox_minuscules.Location=New-Object System.Drawing.Point(317,108)
$checkBox_minuscules.Name="checkBox_minuscules"
$checkBox_minuscules.Size=New-Object System.Drawing.Size(79,17)
$checkBox_minuscules.TabIndex=6
$checkBox_minuscules.Text='Minuscules'
$checkBox_minuscules.UseVisualStyleBackColor=$true
#
#checkBox_majuscules
#
$checkBox_majuscules.AutoSize=$true
$checkBox_majuscules.Location=New-Object System.Drawing.Point(317,131)
$checkBox_majuscules.Name='checkBox_majuscules'
$checkBox_majuscules.Size=New-Object System.Drawing.Size(79,17)
$checkBox_majuscules.TabIndex=7
$checkBox_majuscules.Text='Majuscules'
$checkBox_majuscules.UseVisualStyleBackColor=$true
#$checkBox_majuscules.CheckedChanged+=new-object System.EventHandler($checkBox3_CheckedChanged)
#
#button_quitter
#
$button_quitter.Location=New-Object System.Drawing.Point(317,317)
$button_quitter.Name='button_quitter'
$button_quitter.Size=New-Object System.Drawing.Size(94,24)
$button_quitter.TabIndex=8
$button_quitter.Text='Quitter'
$button_quitter.UseVisualStyleBackColor=$true
$button_quitter.Add_Click({$Form1.close()})
#
#label1
#
$label1.AutoSize=$true
$label1.Location=New-Object System.Drawing.Point(50,271)
$label1.Name='label1'
$label1.Size=New-Object System.Drawing.Size(139,13)
$label1.TabIndex=9
$label1.Text='Complexité du mot de passe'
#
#checkBox_autres
#
$checkBox_autres.AutoSize=$true
$checkBox_autres.Location=New-Object System.Drawing.Point(317,154)
$checkBox_autres.Name='checkBox_autres'
$checkBox_autres.Size=New-Object System.Drawing.Size(56,17)
$checkBox_autres.TabIndex=10
$checkBox_autres.Text='Autres'
$checkBox_autres.UseVisualStyleBackColor=$true
#
#label2
#
$label2.AutoSize=$true
$label2.Location=New-Object System.Drawing.Point(50,119)
$label2.Name='label2'
$label2.Size=New-Object System.Drawing.Size(227,15)
$label2.TabIndex=11
$label2.Text='Le mot de passe doit etre composé avec'
#
#label3
#
$label3.AutoSize=$true
$label3.Location=New-Object System.Drawing.Point(50,185)
$label3.Name='label3'
$label3.Size=New-Object System.Drawing.Size(129,15)
$label3.TabIndex=12
$label3.Text='Nombre de caracteres'
#
#textBox_Nb_caracteres
#
$textBox_Nb_caracteres.Location=New-Object System.Drawing.Point(205,184)
$textBox_Nb_caracteres.Name='textBox_Nb_caracteres'
$textBox_Nb_caracteres.Size=New-Object System.Drawing.Size(69,20)
$textBox_Nb_caracteres.TabIndex=13
$textBox_Nb_caracteres.Text='10'
#
#label4
#
$label4.AutoSize=$true
$label4.Location=New-Object System.Drawing.Point(50,228)
$label4.Name='label4'
$label4.Size=New-Object System.Drawing.Size(71,13)
$label4.TabIndex=14
$label4.Text='Mot de passe'
#
#label_principal
#
$label_principal.AutoSize=$true
$label_principal.Location=New-Object System.Drawing.Point(37,25)
$label_principal.Name='label_principal'
$label_principal.Size=new-object System.Drawing.Size(355,20)
$label_principal.TabIndex=15
$label_principal.Text='Bienvenue dans le generateur de mot de passe'
#
$Form1=new-object System.Windows.Forms.form
#Form1
#
$Form1.ClientSize=New-Object System.Drawing.Size(475,395)
$Form1.Controls.Add($label_principal)
$Form1.Controls.Add($label4)
$Form1.Controls.Add($textBox_Nb_caracteres)
$Form1.Controls.Add($label3)
$Form1.Controls.Add($label2)
$Form1.Controls.Add($checkBox_autres)
$Form1.Controls.Add($label1)
$Form1.Controls.Add($button_quitter)
$Form1.Controls.Add($checkBox_majuscules)
$Form1.Controls.Add($checkBox_minuscules)
$Form1.Controls.Add($checkBox_chiffres)
$Form1.Controls.Add($button_generer)
$Form1.Controls.Add($progressBar)
$Form1.Controls.Add($textBox_resultat)
$Form1.Name='Form1'
$Form1.Text='Generateur de mots de passe'
$Form1.ShowDialog()




































































