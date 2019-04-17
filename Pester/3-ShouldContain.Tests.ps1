Clear-Host

Describe -Name "Raleigh Airport Code" -Fixture {

    ## Source: https://www.cntraveler.com/galleries/2014-11-24/the-best-and-worst-airports-in-america-readers-choice-awards-2014
    
    $BestAirports = @("BWI", "IAH", "DFW", "PHX", "DTW", "TPA", "MSP", "BDL", "PDX", "IND")

    It -Name "RDU is the one of the best airports" -Test {
        $BestAirports | Should -Contain "RDU"
    }
}