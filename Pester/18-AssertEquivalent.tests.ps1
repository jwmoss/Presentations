## Show off Assert module from @nohwnd

Clear-Host

$Kevin = [PSCustomObject]@{
    Age                 = 32
    KnowsPowerShell     = $true
    Languages           = 'English'
    PowershellExperienceInYears = 8
}

$Jonathan = [PSCustomObject]@{
    Age                 = 31
    KnowsPowerShell     = $true
    Languages           = 'English'
    PowershellExperienceInYears = 2
}

$Mike = [PSCustomObject]@{
    Age                 = 49
    KnowsPowerShell     = $true
    Languages           = 'English'
    PowershellExperienceInYears = 4
}

Assert-Equivalent -Actual $Jonathan -Expected $Kevin -Verbose
Assert-Equivalent -Actual $Jonathan -Expected $Mike -Verbose


$jonathan.Age | Assert-Equal $Kevin.Age