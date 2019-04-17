Clear-Host

Describe -Name "Throw stuff" -Fixture {
    
    It -Name "Throw!" -Test {
        { Write-Hostt "RDU Airport is the best!" } | Should -Not -Throw 
    }
    
}