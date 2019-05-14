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

$bad = Measure-Command -Expression {

    $Numbers = 1..10000

    $a = @()
    foreach ($item in $Numbers) {
        $a += $item
    }

}


## Better

$better = Measure-Command -Expression {

    $Numbers = 1..10000

    $b = foreach ($item in $Numbers) {
        $item
    }
}

## Best

$Best = Measure-Command -Expression {

    $Numbers = 1..10000

    $c = [System.Collections.Generic.List[psobject]]$Numbers

}

#EndRegion Collections