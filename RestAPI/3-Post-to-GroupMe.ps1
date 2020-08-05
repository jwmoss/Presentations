## Link to REST API documentation: https://dev.groupme.com/docs/v3

## Base URI 
$BaseURI = "https://api.groupme.com/v3"

## What method we'll be using
$Method = "POST"

## the "endpoint", or what we're targeting 
$Endpoint = "/bots/post"

## The text that we're sending in the body of the web request
$Text = "Hello I'm a bot posting from PowerShell" #-f $env:NUMBER_OF_PROCESSORS

## The username and password (username being the bot_id and password being the token)
$botapi = (Import-Clixml "$ENV:USERPROFILE\Presentations\RestAPI\apitoken.cred")

$Body = @{
    text = $Text
    bot_id = $botapi.username
    token = $API.GetNetworkCredential().Password
}

$uri = ($BaseURI + $Endpoint)

## Posting to GroupMe as a bot
Invoke-RestMethod -Method $Method -Uri $uri -Body $Body -

## Get my access token and converto-secure string
$jonathanapi = (get-Content "$ENV:USERPROFILE\Presentations\RestAPI\jonathanapi.txt") | ConvertTo-SecureString

## Get more information about Jonathan, using the authentication token from $JonathanAPI
$JonathanInformation = Invoke-RestMethod -Uri ($BaseURI + "/users/me") -Body @{
    token = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR((($jonathanapi))))
}

## All the groups he's a part of
$JonathanGroups = Invoke-RestMethod -URI ($BaseURI + "/groups") -Body @{
    token = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR((($jonathanapi))))
}