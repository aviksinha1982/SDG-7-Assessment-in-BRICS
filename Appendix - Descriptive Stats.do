clear
 
local dir `c(pwd)'
pwd
use data.dta

xtset Code Year

cls

tabstat SDG711 SDG712 SDG721 SDG731 ElectricityGenerationPerCapit FinancialAccess RuralPopulationGrowth IncomeInequality HealthExpenditure RenewableElectricityGeneration PolicyStringency PerCapitaIncome UrbanPopulationGrowth EnvironmentalInnovation FinancialDevelopment NetEnergyImport LowCarbonTrade ForeignDirectInvestment IndustrialShare EnergyDemand EV FV HELV IV WV CORR GOVEFF POLST REG RULE VOICE, stat(N mean var sd skewness kurtosis p10 p90) column(statistics) format(%15.4f)
