function Send-GMMessage {
    [CmdletBinding()]
    param (
        [string]
        $Text,

        [PSCredential]
        $API = (Import-Clixml "$ENV:Temp\apitoken.cred")
    )

    $body = @{
        text   = $Text
        bot_id = $API.UserName
        token = $API.GetNetworkCredential().Password
    }

    $splat = @{
        URI    = "https://api.groupme.com/v3/bots/post"
        Method = "POST"
        Body   = $body
    }
        
    Invoke-RestMethod @splat

}

## Send-GMMessage -Text "This is being recorded lol" 
$MARA = Invoke-RestMethod "https://query1.finance.yahoo.com/v7/finance/download/MARA?period1=1564972583&period2=1596594983&interval=1d&events=history" | ConvertFrom-Csv