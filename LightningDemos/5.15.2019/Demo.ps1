## Lightning Demo!

#Region Splat

## Bad Practice
Send-MailMessage `
    -To "someone@blah.com" `
    -From "me@me.com" `
    -Bcc "secret@blah.com" `
    -SmtpServer "mail.blah.com"

## Good Practice
$MailParams = @{
    To         = "someone@blah.com"
    From       = "me@me.com"
    Bcc        = "secret@blah.com"
    SmtpServer = "mail.blah.com"
}

Send-MailMessage @MailParams

#EndRegion Splat

#Region FilterArray
## Ugh Active Directory Filter parameter
Get-ADUser -Filter 'givenName -eq "Jonathan" -and surName -eq "Moss" -and enabled -eq "$true" -and userPrincipalName -like "*admin*"' -Properties Title

## What I use
$FilterArray = @(
    "Jonathan",
    "Moss",
    $True,
    "Admin"
)

$params = @{
    Filter      = 'givenName -eq "{0}" -and surName -eq "{1}" -and Enabled -eq "{2}" -and UserPrincipalName -like "*{3}*"' -f $FilterArray
    Properties  = "Title"
    Erroraction = "stop"
}

Get-ADUser @params
#EndRegion FilterArray

#Region Collections

## Baaaad

Measure-Command -Expression {
    $a = @()
    
    foreach ($item in 1..10000) {
    ## completely rebuilding the array on each loop
    $a += $item
}
} | Select-Object @{n='Test';e={ 'Array' }},TotalMilliseconds

## Better

Measure-Command -Expression {

## make the loop the value of the array
$b = foreach ($item in 1..10000) {
    ## return each result to $b 
    $item
}

} | Select-Object @{n='Test';e={ 'Array eq ForEach' }},TotalMilliseconds


## Best

## .NET

Measure-Command -Expression {
    $c = [System.Collections.Generic.List[psobject]]@(1..10000)
} | Select-Object @{n='Test';e={ 'Generic List' }},TotalMilliseconds

## https://www.reddit.com/r/PowerShell/comments/8ecvbz/arrays_and_the_assignment_operator/dxud3q9?utm_source=share&utm_medium=web2x

<#

When you use ArrayList or Generic.List, internally .NET dynamically doubles the capacity 
of your list at every 2n + 1 element. While this still means that the array is 
regenerated at 2n - 1, the more elements you add, the better performance you will see.

#>