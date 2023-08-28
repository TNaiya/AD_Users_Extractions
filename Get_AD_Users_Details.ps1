$datetime = Get-Date -Format 'dd_MM_yyyy'
$path = $PSScriptRoot
cls
$users= Get-ADUser -Filter * -Properties userprincipalname,SamAccountName,employeeType,Mail,EmailAddress,Office, city,state,co,Department,Created,Deleted,isDeleted
foreach($user in $users)
{
$obj = New-Object psobject
$obj | Add-Member -MemberType NoteProperty -Name userprincipalname -Value $user.userprincipalname
$obj | Add-Member -MemberType NoteProperty -Name SamAccountName -Value $user.SamAccountName
$obj | Add-Member -MemberType NoteProperty -Name employeeType -Value $user.employeeType
$obj | Add-Member -MemberType NoteProperty -Name Mail -Value $user.Mail
$obj | Add-Member -MemberType NoteProperty -Name EmailAddress -Value $user.EmailAddress
$obj | Add-Member -MemberType NoteProperty -Name Office -Value $user.Office
$obj | Add-Member -MemberType NoteProperty -Name city -Value $user.city
$obj | Add-Member -MemberType NoteProperty -Name state -Value $user.state
$obj | Add-Member -MemberType NoteProperty -Name co -Value $user.co
$obj | Add-Member -MemberType NoteProperty -Name Department -Value $user.Department
$obj | Add-Member -MemberType NoteProperty -Name Created -Value $user.Created
$obj | Add-Member -MemberType NoteProperty -Name Deleted -Value $user.Deleted
$obj | Add-Member -MemberType NoteProperty -Name isDeleted -Value $user.isDeleted
$obj | Export-Csv -path $path\AD_Users_$datetime.csv -NoTypeInformation -Append
}
