$Uri = "https://pbs.twimg.com/media/D1C-REyXQAABCU7?format=png&name=900x900"

$tempF = [system.io.path]::GetTempPath()

## store the file here
$OutFile = "$tempF/pic.png"

## download the file and output it to local disk
Invoke-WebRequest -Uri $uri -OutFile $OutFile

## open the pic
Start-Process $OutFile