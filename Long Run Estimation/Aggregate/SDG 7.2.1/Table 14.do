clear
 
local dir `c(pwd)'
pwd
use data.dta

xtset Code Year

gen LSDG721=ln(SDG721)
gen LINN=ln(EnvironmentalInnovation)

rename PolicyStringency PS
rename FinancialDevelopment FD
rename LowCarbonTrade LCT

qui summ NetEnergyImport
gen NEI = (NetEnergyImport - r(min)) / (r(max) - r(min))

cls

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV CORR c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.CORR c.LINN#c.CORR c.FD#c.CORR c.NEI#c.CORR c.LCT#c.CORR c.PS#c.CORR#c.HELV c.LINN#c.CORR#c.HELV c.FD#c.CORR#c.HELV c.NEI#c.CORR#c.HELV c.LCT#c.CORR#c.HELV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV GOVEFF c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FD#c.GOVEFF c.NEI#c.GOVEFF c.LCT#c.GOVEFF c.PS#c.GOVEFF#c.HELV c.LINN#c.GOVEFF#c.HELV c.FD#c.GOVEFF#c.HELV c.NEI#c.GOVEFF#c.HELV c.LCT#c.GOVEFF#c.HELV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV POLST c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.POLST c.LINN#c.POLST c.FD#c.POLST c.NEI#c.POLST c.LCT#c.POLST c.PS#c.POLST#c.HELV c.LINN#c.POLST#c.HELV c.FD#c.POLST#c.HELV c.NEI#c.POLST#c.HELV c.LCT#c.POLST#c.HELV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV REG c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.REG c.LINN#c.REG c.FD#c.REG c.NEI#c.REG c.LCT#c.REG c.PS#c.REG#c.HELV c.LINN#c.REG#c.HELV c.FD#c.REG#c.HELV c.NEI#c.REG#c.HELV c.LCT#c.REG#c.HELV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV RULE c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.RULE c.LINN#c.RULE c.FD#c.RULE c.NEI#c.RULE c.LCT#c.RULE c.PS#c.RULE#c.HELV c.LINN#c.RULE#c.HELV c.FD#c.RULE#c.HELV c.NEI#c.RULE#c.HELV c.LCT#c.RULE#c.HELV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV VOICE c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.VOICE c.LINN#c.VOICE c.FD#c.VOICE c.NEI#c.VOICE c.LCT#c.VOICE c.PS#c.VOICE#c.HELV c.LINN#c.VOICE#c.HELV c.FD#c.VOICE#c.HELV c.NEI#c.VOICE#c.HELV c.LCT#c.VOICE#c.HELV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV CORR c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.CORR c.LINN#c.CORR c.FD#c.CORR c.NEI#c.CORR c.LCT#c.CORR c.PS#c.CORR#c.HELV c.LINN#c.CORR#c.HELV c.FD#c.CORR#c.HELV c.NEI#c.CORR#c.HELV c.LCT#c.CORR#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_corr.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_corr.png, as(png) replace
quietly: margins, dydx(FD) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_helv_corr.png, as(png) replace
quietly: margins, dydx(NEI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_helv_corr.png, as(png) replace
quietly: margins, dydx(LCT) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_helv_corr.png, as(png) replace
quietly: margins, dydx(PS) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_corr.png, as(png) replace
quietly: margins, dydx(LINN) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_corr.png, as(png) replace
quietly: margins, dydx(FD) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_fd_corr.png, as(png) replace
quietly: margins, dydx(NEI) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_nei_corr.png, as(png) replace
quietly: margins, dydx(LCT) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_lct_corr.png, as(png) replace


quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV GOVEFF c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FD#c.GOVEFF c.NEI#c.GOVEFF c.LCT#c.GOVEFF c.PS#c.GOVEFF#c.HELV c.LINN#c.GOVEFF#c.HELV c.FD#c.GOVEFF#c.HELV c.NEI#c.GOVEFF#c.HELV c.LCT#c.GOVEFF#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_goveff.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_goveff.png, as(png) replace
quietly: margins, dydx(FD) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_helv_goveff.png, as(png) replace
quietly: margins, dydx(NEI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_helv_goveff.png, as(png) replace
quietly: margins, dydx(LCT) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_helv_goveff.png, as(png) replace
quietly: margins, dydx(PS) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_goveff.png, as(png) replace
quietly: margins, dydx(LINN) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_goveff.png, as(png) replace
quietly: margins, dydx(FD) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_fd_goveff.png, as(png) replace
quietly: margins, dydx(NEI) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_nei_goveff.png, as(png) replace
quietly: margins, dydx(LCT) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_lct_goveff.png, as(png) replace

quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV POLST c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.POLST c.LINN#c.POLST c.FD#c.POLST c.NEI#c.POLST c.LCT#c.POLST c.PS#c.POLST#c.HELV c.LINN#c.POLST#c.HELV c.FD#c.POLST#c.HELV c.NEI#c.POLST#c.HELV c.LCT#c.POLST#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_polst.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_polst.png, as(png) replace
quietly: margins, dydx(FD) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_helv_polst.png, as(png) replace
quietly: margins, dydx(NEI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_helv_polst.png, as(png) replace
quietly: margins, dydx(LCT) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_helv_polst.png, as(png) replace
quietly: margins, dydx(PS) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_polst.png, as(png) replace
quietly: margins, dydx(LINN) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_polst.png, as(png) replace
quietly: margins, dydx(FD) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_fd_polst.png, as(png) replace
quietly: margins, dydx(NEI) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_nei_polst.png, as(png) replace
quietly: margins, dydx(LCT) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_lct_polst.png, as(png) replace

quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV REG c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.REG c.LINN#c.REG c.FD#c.REG c.NEI#c.REG c.LCT#c.REG c.PS#c.REG#c.HELV c.LINN#c.REG#c.HELV c.FD#c.REG#c.HELV c.NEI#c.REG#c.HELV c.LCT#c.REG#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_reg.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_reg.png, as(png) replace
quietly: margins, dydx(FD) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_helv_reg.png, as(png) replace
quietly: margins, dydx(NEI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_helv_reg.png, as(png) replace
quietly: margins, dydx(LCT) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_helv_reg.png, as(png) replace
quietly: margins, dydx(PS) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_reg.png, as(png) replace
quietly: margins, dydx(LINN) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_reg.png, as(png) replace
quietly: margins, dydx(FD) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_fd_reg.png, as(png) replace
quietly: margins, dydx(NEI) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_nei_reg.png, as(png) replace
quietly: margins, dydx(LCT) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_lct_reg.png, as(png) replace

quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV RULE c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.RULE c.LINN#c.RULE c.FD#c.RULE c.NEI#c.RULE c.LCT#c.RULE c.PS#c.RULE#c.HELV c.LINN#c.RULE#c.HELV c.FD#c.RULE#c.HELV c.NEI#c.RULE#c.HELV c.LCT#c.RULE#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_rule.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_rule.png, as(png) replace
quietly: margins, dydx(FD) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_helv_rule.png, as(png) replace
quietly: margins, dydx(NEI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_helv_rule.png, as(png) replace
quietly: margins, dydx(LCT) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_helv_rule.png, as(png) replace
quietly: margins, dydx(PS) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_rule.png, as(png) replace
quietly: margins, dydx(LINN) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_rule.png, as(png) replace
quietly: margins, dydx(FD) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_fd_rule.png, as(png) replace
quietly: margins, dydx(NEI) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_nei_rule.png, as(png) replace
quietly: margins, dydx(LCT) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lct_rule.png, as(png) replace

quietly: xtgls LSDG721 PS LINN FD NEI LCT HELV VOICE c.PS#c.HELV c.LINN#c.HELV c.FD#c.HELV c.NEI#c.HELV c.LCT#c.HELV c.PS#c.VOICE c.LINN#c.VOICE c.FD#c.VOICE c.NEI#c.VOICE c.LCT#c.VOICE c.PS#c.VOICE#c.HELV c.LINN#c.VOICE#c.HELV c.FD#c.VOICE#c.HELV c.NEI#c.VOICE#c.HELV c.LCT#c.VOICE#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_voice.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_voice.png, as(png) replace
quietly: margins, dydx(FD) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_helv_voice.png, as(png) replace
quietly: margins, dydx(NEI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_helv_voice.png, as(png) replace
quietly: margins, dydx(LCT) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_helv_voice.png, as(png) replace
quietly: margins, dydx(PS) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_voice.png, as(png) replace
quietly: margins, dydx(LINN) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_voice.png, as(png) replace
quietly: margins, dydx(FD) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_fd_voice.png, as(png) replace
quietly: margins, dydx(NEI) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_nei_voice.png, as(png) replace
quietly: margins, dydx(LCT) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lct_voice.png, as(png) replace

