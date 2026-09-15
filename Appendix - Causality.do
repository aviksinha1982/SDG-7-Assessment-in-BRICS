quietly {

clear
 
local dir `c(pwd)'
pwd
use data711.dta

xtset Code Year
cls

ren ElectricityGenerationPerCapit EG
ren FinancialAccess FA
ren RuralPopulationGrowth RUR
ren IncomeInequality INEQ
ren HealthExpenditure EXP

capture file close fh
file open fh using "Causality_results_SDG711.txt", write replace

xtgcause EG SDG711, lag(2)
file write fh "EG <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause FA SDG711, lag(2)
file write fh "FA <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause RUR SDG711, lags(3)
file write fh "RUR <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause INEQ SDG711, lags(2)
file write fh "INEQ <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause EXP SDG711, lags(2)
file write fh "EXP <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause EV SDG711
file write fh "EV <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause FV SDG711, lags(5)
file write fh "FV <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause HELV SDG711, lags(3)
file write fh "HELV <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause IV SDG711, lags(3)
file write fh "IV <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause WV SDG711, lag(1)
file write fh "WV <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause CORR SDG711, lags(2)
file write fh "CORR <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause GOVEFF SDG711, lags(2)
file write fh "GOVEFF <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause POLST SDG711
file write fh "POLST <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause REG SDG711, lags(3)
file write fh "REG <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause RULE SDG711
file write fh "RULE <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG711.txt", write append
xtgcause VOICE SDG711, lags(3)
file write fh "VOICE <- SDG711: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh

//SDG 7.1.2

clear

local dir `c(pwd)'
pwd
use data712.dta

xtset Code Year
cls

ren FinancialAccess FA
ren PerCapitaIncome PCI
ren UrbanPopulationGrowth URB

gen LSDG712 = ln(SDG712)

gen REN=ln(RenewableElectricityGeneration)
drop RenewableElectricityGeneration 

gen PS=ln(PolicyStringency)
drop PolicyStringency 

capture file close fh
file open fh using "Causality_results_SDG712.txt", write replace

xtgcause REN SDG712, lags(4)
file write fh "REN <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause FA SDG712, lags(3)
file write fh "FA <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause PS SDG712, lags(1)
file write fh "PS <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause PCI SDG712, lags(3)
file write fh "PCI <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause URB SDG712, lags(2)
file write fh "URB <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause EV SDG712
file write fh "EV <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause FV SDG712, lags(2)
file write fh "FV <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause HELV LSDG712, lags(5)
file write fh "HELV <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause IV SDG712, lags(5)
file write fh "IV <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause WV SDG712, lag(5)
file write fh "WV <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause CORR SDG712, lags(5)
file write fh "CORR <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause GOVEFF LSDG712, lags(4)
file write fh "GOVEFF <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause POLST SDG712, lags(5)
file write fh "POLST <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause REG LSDG712, lags(3)
file write fh "REG <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause RULE SDG712, lags(5)
file write fh "RULE <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG712.txt", write append
xtgcause VOICE SDG712, lags(5)
file write fh "VOICE <- SDG712: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh

//SDG 7.2.1

clear
 
local dir `c(pwd)'
pwd
use data721.dta

xtset Code Year
cls

ren PolicyStringency PS
ren EnvironmentalInnovation INN
ren FinancialDevelopment FD
ren NetEnergyImport NEI
ren LowCarbonTrade LCT

gen LSDG721 = ln(SDG721)

capture file close fh
file open fh using "Causality_results_SDG721.txt", write replace

xtgcause PS SDG721
file write fh "PS <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause INN SDG721, lags(5)
file write fh "INN <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause FD SDG721, lags(5)
file write fh "FD <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause NEI SDG721
file write fh "NEI <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause LCT SDG721, lags(2)
file write fh "LCT <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause EV SDG721
file write fh "EV <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause FV SDG721
file write fh "FV <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause HELV SDG721, lags(2)
file write fh "HELV <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause IV SDG721
file write fh "IV <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause WV SDG721, lag(5)
file write fh "WV <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause CORR SDG721, lags(3)
file write fh "CORR <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause GOVEFF SDG721, lags(3)
file write fh "GOVEFF <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause POLST SDG721, lags(4)
file write fh "POLST <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause REG LSDG721, lags(2)
file write fh "REG <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause RULE SDG721, lags(5)
file write fh "RULE <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG721.txt", write append
xtgcause VOICE SDG721, lags(4)
file write fh "VOICE <- SDG721: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh

//SDG 7.3.1

clear
 
local dir `c(pwd)'
pwd
use data731.dta

xtset Code Year
cls

ren PolicyStringency PS
ren EnvironmentalInnovation INN
ren ForeignDirectInvestment FDI
ren IndustrialShare IND
ren EnergyDemand ED

gen LSDG731 = ln(SDG731)

capture file close fh
file open fh using "Causality_results_SDG731.txt", write replace

xtgcause PS SDG731
file write fh "PS <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause INN SDG731, lags(5)
file write fh "INN <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause FDI SDG731, lags(3)
file write fh "FDI <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause IND SDG731
file write fh "IND <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause ED SDG731
file write fh "ED <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause EV SDG731
file write fh "EV <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause FV SDG731, lags(2)
file write fh "FV <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause HELV LSDG731, lags(1)
file write fh "HELV <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause IV LSDG731, lags(2)
file write fh "IV <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause WV SDG731, lag(2)
file write fh "WV <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause CORR LSDG731, lags(2)
file write fh "CORR <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause GOVEFF SDG731, lags(5)
file write fh "GOVEFF <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause POLST SDG731, lags(5)
file write fh "POLST <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause REG SDG731, lags(5)
file write fh "REG <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause RULE SDG731, lags(5)
file write fh "RULE <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh
capture file close fh
file open fh using "Causality_results_SDG731.txt", write append
xtgcause VOICE LSDG731, lags(5)
file write fh "VOICE <- SDG731: Z-bar tilde = " %8.4f (r(zbart)) " (p-value = " %6.4f (r(zbart_pv)) ")" _n
file close fh

}