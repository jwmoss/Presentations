Clear-Host

. .\Get-Airport.ps1

Describe -Name "Null or Empty Tests" -Fixture {

    It -Name "Empty or Null" -Test {
        Get-Airport -City "New York" | Should -BeNullOrEmpty
    }
    
}