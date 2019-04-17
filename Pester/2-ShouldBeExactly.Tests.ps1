Clear-Host

. .\Get-Airport.ps1

Describe -Name "Airport Code" -Fixture {
    
    $Actual = Get-Airport -City "Raleigh"

    It -Name "Raleigh Code is always uppercase" -Test {
        $Actual.Code | Should -BeExactly "RDU"
    }

    It -Name "Raleigh Code is always uppercase" -Test {
        $Actual.Code | Should -BeExactly "rdu"
    }

}