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
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV CORR c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.CORR c.LINN#c.CORR c.FD#c.CORR c.NEI#c.CORR c.LCT#c.CORR c.PS#c.CORR#c.FV c.LINN#c.CORR#c.FV c.FD#c.CORR#c.FV c.NEI#c.CORR#c.FV c.LCT#c.CORR#c.FV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV GOVEFF c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FD#c.GOVEFF c.NEI#c.GOVEFF c.LCT#c.GOVEFF c.PS#c.GOVEFF#c.FV c.LINN#c.GOVEFF#c.FV c.FD#c.GOVEFF#c.FV c.NEI#c.GOVEFF#c.FV c.LCT#c.GOVEFF#c.FV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV POLST c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.POLST c.LINN#c.POLST c.FD#c.POLST c.NEI#c.POLST c.LCT#c.POLST c.PS#c.POLST#c.FV c.LINN#c.POLST#c.FV c.FD#c.POLST#c.FV c.NEI#c.POLST#c.FV c.LCT#c.POLST#c.FV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV REG c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.REG c.LINN#c.REG c.FD#c.REG c.NEI#c.REG c.LCT#c.REG c.PS#c.REG#c.FV c.LINN#c.REG#c.FV c.FD#c.REG#c.FV c.NEI#c.REG#c.FV c.LCT#c.REG#c.FV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV RULE c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.RULE c.LINN#c.RULE c.FD#c.RULE c.NEI#c.RULE c.LCT#c.RULE c.PS#c.RULE#c.FV c.LINN#c.RULE#c.FV c.FD#c.RULE#c.FV c.NEI#c.RULE#c.FV c.LCT#c.RULE#c.FV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT FV VOICE c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.VOICE c.LINN#c.VOICE c.FD#c.VOICE c.NEI#c.VOICE c.LCT#c.VOICE c.PS#c.VOICE#c.FV c.LINN#c.VOICE#c.FV c.FD#c.VOICE#c.FV c.NEI#c.VOICE#c.FV c.LCT#c.VOICE#c.FV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG721 PS LINN FD NEI LCT FV CORR c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.CORR c.LINN#c.CORR c.FD#c.CORR c.NEI#c.CORR c.LCT#c.CORR c.PS#c.CORR#c.FV c.LINN#c.CORR#c.FV c.FD#c.CORR#c.FV c.NEI#c.CORR#c.FV c.LCT#c.CORR#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_corr.png, as(png) replace
quietly: margins, dydx(LINN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_fv_corr.png, as(png) replace
quietly: margins, dydx(FD) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_fv_corr.png, as(png) replace
quietly: margins, dydx(NEI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_fv_corr.png, as(png) replace
quietly: margins, dydx(LCT) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_fv_corr.png, as(png) replace
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


quietly: xtgls LSDG721 PS LINN FD NEI LCT FV GOVEFF c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FD#c.GOVEFF c.NEI#c.GOVEFF c.LCT#c.GOVEFF c.PS#c.GOVEFF#c.FV c.LINN#c.GOVEFF#c.FV c.FD#c.GOVEFF#c.FV c.NEI#c.GOVEFF#c.FV c.LCT#c.GOVEFF#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_goveff.png, as(png) replace
quietly: margins, dydx(LINN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_fv_goveff.png, as(png) replace
quietly: margins, dydx(FD) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_fv_goveff.png, as(png) replace
quietly: margins, dydx(NEI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_fv_goveff.png, as(png) replace
quietly: margins, dydx(LCT) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_fv_goveff.png, as(png) replace
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

quietly: xtgls LSDG721 PS LINN FD NEI LCT FV POLST c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.POLST c.LINN#c.POLST c.FD#c.POLST c.NEI#c.POLST c.LCT#c.POLST c.PS#c.POLST#c.FV c.LINN#c.POLST#c.FV c.FD#c.POLST#c.FV c.NEI#c.POLST#c.FV c.LCT#c.POLST#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_polst.png, as(png) replace
quietly: margins, dydx(LINN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_fv_polst.png, as(png) replace
quietly: margins, dydx(FD) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_fv_polst.png, as(png) replace
quietly: margins, dydx(NEI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_fv_polst.png, as(png) replace
quietly: margins, dydx(LCT) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_fv_polst.png, as(png) replace
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

quietly: xtgls LSDG721 PS LINN FD NEI LCT FV REG c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.REG c.LINN#c.REG c.FD#c.REG c.NEI#c.REG c.LCT#c.REG c.PS#c.REG#c.FV c.LINN#c.REG#c.FV c.FD#c.REG#c.FV c.NEI#c.REG#c.FV c.LCT#c.REG#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_reg.png, as(png) replace
quietly: margins, dydx(LINN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_fv_reg.png, as(png) replace
quietly: margins, dydx(FD) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_fv_reg.png, as(png) replace
quietly: margins, dydx(NEI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_fv_reg.png, as(png) replace
quietly: margins, dydx(LCT) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_fv_reg.png, as(png) replace
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

quietly: xtgls LSDG721 PS LINN FD NEI LCT FV RULE c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.RULE c.LINN#c.RULE c.FD#c.RULE c.NEI#c.RULE c.LCT#c.RULE c.PS#c.RULE#c.FV c.LINN#c.RULE#c.FV c.FD#c.RULE#c.FV c.NEI#c.RULE#c.FV c.LCT#c.RULE#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_rule.png, as(png) replace
quietly: margins, dydx(LINN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_fv_rule.png, as(png) replace
quietly: margins, dydx(FD) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_fv_rule.png, as(png) replace
quietly: margins, dydx(NEI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_fv_rule.png, as(png) replace
quietly: margins, dydx(LCT) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_fv_rule.png, as(png) replace
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

quietly: xtgls LSDG721 PS LINN FD NEI LCT FV VOICE c.PS#c.FV c.LINN#c.FV c.FD#c.FV c.NEI#c.FV c.LCT#c.FV c.PS#c.VOICE c.LINN#c.VOICE c.FD#c.VOICE c.NEI#c.VOICE c.LCT#c.VOICE c.PS#c.VOICE#c.FV c.LINN#c.VOICE#c.FV c.FD#c.VOICE#c.FV c.NEI#c.VOICE#c.FV c.LCT#c.VOICE#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_voice.png, as(png) replace
quietly: margins, dydx(LINN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_fv_voice.png, as(png) replace
quietly: margins, dydx(FD) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_fv_voice.png, as(png) replace
quietly: margins, dydx(NEI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_fv_voice.png, as(png) replace
quietly: margins, dydx(LCT) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_fv_voice.png, as(png) replace
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

