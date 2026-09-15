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

orthog EG FA RUR INEQ EXP EV FV HELV IV WV CORR GOVEFF POLST REG RULE VOICE, gen(oEG oFA oRUR oINEQ oEXP oEV oFV oHELV oIV oWV oCORR oGOVEFF oPOLST oREG oRULE oVOICE)
gen sIV=sqrt(oIV)
gen sREG=sqrt(oREG)
gen sVOICE=sqrt(oVOICE)
gen sRULE=sqrt(oRULE)
gen sCORR=sqrt(oCORR)
gen sPOLST=sqrt(oPOLST)

collin EG FA RUR INEQ oEXP oEV sCORR
collin EG FA RUR INEQ oEXP oEV GOVEFF
collin EG FA RUR INEQ oEXP oEV POLST
collin EG FA RUR INEQ oEXP oEV sREG
collin EG FA RUR INEQ oEXP oEV sRULE
collin EG FA RUR INEQ oEXP oEV sVOICE

collin EG FA RUR INEQ oEXP oFV sCORR
collin EG FA RUR INEQ oEXP oFV GOVEFF
collin EG FA RUR INEQ oEXP oFV POLST
collin EG FA RUR INEQ oEXP oFV sREG
collin EG FA RUR INEQ oEXP oFV RULE
collin EG FA RUR INEQ oEXP oFV sVOICE

collin EG FA RUR INEQ oEXP oHELV sCORR
collin EG FA RUR INEQ oEXP oHELV GOVEFF
collin EG FA RUR INEQ oEXP oHELV sPOLST
collin EG FA RUR INEQ oEXP oHELV sREG
collin EG FA RUR INEQ oEXP oHELV RULE
collin EG FA RUR INEQ oEXP oHELV sVOICE

collin EG oFA RUR INEQ oEXP sIV CORR
collin EG oFA RUR INEQ oEXP sIV GOVEFF
collin EG oFA oRUR oINEQ oEXP sIV oPOLST
collin EG FA RUR oINEQ oEXP sIV oREG
collin EG FA RUR INEQ oEXP oIV RULE
collin EG FA RUR INEQ oEXP oIV sVOICE

collin EG FA RUR INEQ oEXP oWV sCORR
collin EG FA RUR INEQ oEXP oWV GOVEFF
collin EG FA RUR INEQ oEXP oWV POLST
collin EG FA RUR INEQ oEXP oWV sREG
collin EG FA RUR INEQ oEXP oWV RULE
collin EG FA RUR INEQ oEXP oWV sVOICE

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

orthog PS REN FA PCI URB EV FV HELV IV WV CORR GOVEFF POLST REG RULE VOICE, gen(oPS oREN oFA oPCI oURB oEV oFV oHELV oIV oWV oCORR oGOVEFF oPOLST oREG oRULE oVOICE)

collin PS REN FA oPCI oURB oEV CORR
collin PS REN FA oPCI oURB oEV GOVEFF
collin PS REN FA oPCI oURB oEV POLST
collin PS REN FA oPCI oURB oEV REG
collin PS REN FA oPCI oURB oEV RULE
collin PS REN FA oPCI oURB oEV VOICE

collin PS REN FA oPCI oURB oFV CORR
collin PS REN FA oPCI oURB oFV GOVEFF
collin PS REN FA oPCI oURB oFV POLST
collin PS REN FA oPCI oURB oFV REG
collin PS REN FA oPCI oURB oFV RULE
collin PS REN FA oPCI oURB oFV VOICE

collin PS REN FA oPCI oURB oHELV CORR
collin PS REN FA oPCI oURB oHELV GOVEFF
collin PS REN FA oPCI oURB oHELV POLST
collin PS REN FA oPCI oURB oHELV REG
collin PS REN FA oPCI oURB oHELV RULE
collin PS REN FA oPCI oURB oHELV VOICE

collin PS REN FA oPCI oURB oIV CORR
collin PS REN FA oPCI oURB oIV GOVEFF
collin PS REN FA oPCI oURB oIV POLST
collin PS REN FA oPCI oURB oIV REG
collin PS REN FA oPCI oURB oIV RULE
collin PS REN FA oPCI oURB oIV VOICE

collin PS REN FA oPCI oURB oWV CORR
collin PS REN FA oPCI oURB oWV GOVEFF
collin PS REN FA oPCI oURB oWV POLST
collin PS REN FA oPCI oURB oWV REG
collin PS REN FA oPCI oURB oWV RULE
collin PS oREN FA oPCI oURB oWV VOICE

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

orthog PS INN FD NEI LCT EV FV HELV IV WV CORR GOVEFF POLST REG RULE VOICE, gen(oPS oINN oFD oNEI oLCT oEV oFV oHELV oIV oWV oCORR oGOVEFF oPOLST oREG oRULE oVOICE)
gen sVOICE=sqrt(oVOICE)
gen sRULE=sqrt(oRULE)

collin PS INN FD oNEI LCT oEV CORR
collin PS INN FD oNEI LCT oEV GOVEFF
collin PS INN FD oNEI LCT oEV POLST
collin PS INN FD oNEI LCT oEV REG
collin PS INN FD oNEI LCT oEV sRULE
collin PS oINN FD oNEI LCT oEV sVOICE

collin PS INN FD oNEI LCT oFV CORR
collin PS INN FD oNEI LCT oFV GOVEFF
collin PS INN FD oNEI LCT oFV POLST
collin PS INN FD oNEI LCT oFV REG
collin PS INN FD oNEI LCT oFV sRULE
collin PS oINN FD oNEI LCT oFV sVOICE

collin PS INN FD oNEI LCT oHELV CORR
collin PS INN FD oNEI LCT oHELV GOVEFF
collin PS INN FD oNEI LCT oHELV POLST
collin PS INN FD oNEI LCT oHELV REG
collin PS INN FD oNEI LCT oHELV RULE
collin PS oINN FD oNEI LCT oHELV sVOICE

collin PS INN FD oNEI LCT oIV CORR
collin PS INN FD oNEI LCT oIV GOVEFF
collin PS INN FD oNEI LCT oIV POLST
collin PS INN FD oNEI LCT oIV REG
collin PS INN FD oNEI LCT oIV RULE
collin PS oINN FD oNEI LCT oIV sVOICE

collin PS INN FD oNEI LCT oWV CORR
collin PS INN FD oNEI LCT oWV GOVEFF
collin PS INN FD oNEI LCT oWV POLST
collin PS INN FD oNEI LCT oWV REG
collin PS INN FD oNEI LCT oWV sRULE
collin PS oINN FD oNEI LCT oWV sVOICE

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

orthog PS INN FDI IND ED EV FV HELV IV WV CORR GOVEFF POLST REG RULE VOICE, gen(oPS oINN oFDI oIND oED oEV oFV oHELV oIV oWV oCORR oGOVEFF oPOLST oREG oRULE oVOICE)
gen sRULE=sqrt(oRULE)
gen sVOICE=sqrt(oVOICE)

collin PS oINN FDI IND oED EV CORR
collin PS oINN FDI IND oED EV GOVEFF
collin PS oINN FDI IND oED EV POLST
collin PS oINN FDI IND oED EV REG
collin PS oINN FDI IND oED EV sRULE
collin PS oINN FDI IND oED EV sVOICE

collin PS oINN FDI IND oED FV CORR
collin PS oINN FDI IND oED FV GOVEFF
collin PS oINN FDI IND oED FV POLST
collin PS oINN FDI IND oED FV REG
collin PS oINN FDI IND oED FV sRULE
collin PS oINN FDI IND oED FV sVOICE

collin PS oINN FDI IND oED HELV CORR
collin PS oINN FDI IND oED HELV GOVEFF
collin PS oINN FDI IND oED HELV POLST
collin PS oINN FDI IND oED HELV REG
collin PS oINN FDI IND oED HELV sRULE
collin PS oINN FDI IND oED HELV sVOICE

collin PS oINN FDI IND oED IV CORR
collin PS oINN FDI IND oED IV GOVEFF
collin PS oINN FDI IND oED IV POLST
collin PS oINN FDI IND oED IV REG
collin PS oINN FDI IND oED IV sRULE
collin PS oINN FDI IND oED IV sVOICE

collin PS oINN FDI IND oED WV CORR
collin PS oINN FDI IND oED WV GOVEFF
collin PS oINN FDI IND oED WV POLST
collin PS oINN FDI IND oED WV REG
collin PS oINN FDI IND oED WV sRULE
collin PS oINN FDI IND oED WV sVOICE
