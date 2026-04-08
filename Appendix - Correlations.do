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

pwcorr SDG711 EG FA RUR INEQ EXP EV FV HELV IV WV CORR GOVEFF POLST REG RULE VOICE, sig
matrix sdg711matrix = r(C)
matrix sdg711matrixsig = r(sig)
heatplot sdg711matrix, values(label(sdg711matrixsig) format(%4.3f) size(tiny)) lower colors(mono) xlabel(, labsize(tiny)) ylabel(, labsize(tiny)) legend(off)
graph export sdg711.png, width(1200) height(800) replace

clear
 
local dir `c(pwd)'
pwd
use data712.dta

xtset Code Year
cls

ren PolicyStringency PS
ren RenewableElectricityGeneration REN
ren FinancialAccess FA
ren PerCapitaIncome PCI
ren UrbanPopulationGrowth URB

pwcorr SDG712 PS REN FA PCI URB CORR GOVEFF POLST REG RULE VOICE EV FV HELV IV WV, sig
matrix sdg712matrix = r(C)
matrix sdg712matrixsig = r(sig)
heatplot sdg712matrix, values(label(sdg712matrixsig) format(%4.3f) size(tiny)) lower colors(mono) xlabel(, labsize(tiny)) ylabel(, labsize(tiny)) legend(off)
graph export sdg712.png, width(1200) height(800) replace

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

pwcorr SDG721 PS INN FD NEI LCT CORR GOVEFF POLST REG RULE VOICE EV FV HELV IV WV, sig
matrix sdg721matrix = r(C)
matrix sdg721matrixsig = r(sig)
heatplot sdg721matrix, values(label(sdg721matrixsig) format(%4.3f) size(tiny)) lower colors(mono) xlabel(, labsize(tiny)) ylabel(, labsize(tiny)) legend(off)
graph export sdg721.png, width(1200) height(800) replace

graph close _all

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

pwcorr SDG731 PS INN FDI IND ED CORR GOVEFF POLST REG RULE VOICE EV FV HELV IV WV, sig
matrix sdg731matrix = r(C)
matrix sdg731matrixsig = r(sig)
heatplot sdg731matrix, values(label(sdg731matrixsig) format(%4.3f) size(tiny)) lower colors(mono) xlabel(, labsize(tiny)) ylabel(, labsize(tiny)) legend(off)
graph export sdg731.png, width(1200) height(800) replace

graph close _all

