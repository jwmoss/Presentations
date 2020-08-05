#Start-Process "https://www.reddit.com/r/PowerShell/comments/hrlv72/powershell_and_apis/fy5b3id/"

## link: https://docs.github.com/en/rest/overview/resources-in-the-rest-api#current-version

## Base URL

$headers = @{
    Accept = "application/vnd.github.v3+json"
}

$url = "https://api.github.com"

## get the gists from jwmoss
$response = Invoke-RestMethod -Uri $Url -Headers $headers


## Get the PowerShell repositories' pull requests
$ps_pulls = @{
    Headers = @{
        Accept = "application/vnd.github.v3+json"
    }
    Uri = "$url/repos/powershell/powershell/pulls"
}
$prs = Invoke-RestMethod @ps_pulls
