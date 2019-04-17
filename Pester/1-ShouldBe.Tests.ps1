Clear-Host

. .\Get-Airport.ps1

Describe -Name "Raleigh Airport Code" -Fixture {
    
    $Actual = Get-Airport -City "Raleigh"

    It -Name "Raleigh Code is accurate" -Test {
        $Actual.Code | Should -Be "RDU" -Because "Raleigh's airport is named RDU"
    }

}
