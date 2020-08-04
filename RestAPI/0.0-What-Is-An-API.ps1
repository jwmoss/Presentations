#Start-Process "https://www.reddit.com/r/PowerShell/comments/hrlv72/powershell_and_apis/fy5b3id/"

## link: https://docs.github.com/en/rest/overview/resources-in-the-rest-api#current-version

## Base URL
$url = "https://api.github.com"

## get the gists from jwmoss
$urlGists = @{
    Headers = @{
        Accept = "application/vnd.github.v3+json"
    }
    Uri = "$url/users/jwmoss/gists"
}
$gists = Invoke-RestMethod @urlGists

## Get the PowerShell repositories' pull requests
$ps_pulls = @{
    Headers = @{
        Accept = "application/vnd.github.v3+json"
    }
    Uri = "$url/repos/powershell/powershell/pulls"
}
$prs = Invoke-RestMethod @ps_pulls