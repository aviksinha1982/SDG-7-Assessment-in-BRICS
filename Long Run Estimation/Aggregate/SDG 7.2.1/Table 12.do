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
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV CORR c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.CORR c.LINN#c.CORR c.FD#c.CORR c.NEI#c.CORR c.LCT#c.CORR c.PS#c.CORR#c.EV c.LINN#c.CORR#c.EV c.FD#c.CORR#c.EV c.NEI#c.CORR#c.EV c.LCT#c.CORR#c.EV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV GOVEFF c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FD#c.GOVEFF c.NEI#c.GOVEFF c.LCT#c.GOVEFF c.PS#c.GOVEFF#c.EV c.LINN#c.GOVEFF#c.EV c.FD#c.GOVEFF#c.EV c.NEI#c.GOVEFF#c.EV c.LCT#c.GOVEFF#c.EV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV POLST c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.POLST c.LINN#c.POLST c.FD#c.POLST c.NEI#c.POLST c.LCT#c.POLST c.PS#c.POLST#c.EV c.LINN#c.POLST#c.EV c.FD#c.POLST#c.EV c.NEI#c.POLST#c.EV c.LCT#c.POLST#c.EV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV REG c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.REG c.LINN#c.REG c.FD#c.REG c.NEI#c.REG c.LCT#c.REG c.PS#c.REG#c.EV c.LINN#c.REG#c.EV c.FD#c.REG#c.EV c.NEI#c.REG#c.EV c.LCT#c.REG#c.EV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV RULE c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.RULE c.LINN#c.RULE c.FD#c.RULE c.NEI#c.RULE c.LCT#c.RULE c.PS#c.RULE#c.EV c.LINN#c.RULE#c.EV c.FD#c.RULE#c.EV c.NEI#c.RULE#c.EV c.LCT#c.RULE#c.EV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m11
quietly: xtgls LSDG721 PS LINN FD NEI LCT EV VOICE c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.VOICE c.LINN#c.VOICE c.FD#c.VOICE c.NEI#c.VOICE c.LCT#c.VOICE c.PS#c.VOICE#c.EV c.LINN#c.VOICE#c.EV c.FD#c.VOICE#c.EV c.NEI#c.VOICE#c.EV c.LCT#c.VOICE#c.EV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(PS LINN FD NEI LCT) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG721 PS LINN FD NEI LCT EV CORR c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.CORR c.LINN#c.CORR c.FD#c.CORR c.NEI#c.CORR c.LCT#c.CORR c.PS#c.CORR#c.EV c.LINN#c.CORR#c.EV c.FD#c.CORR#c.EV c.NEI#c.CORR#c.EV c.LCT#c.CORR#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_corr.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_corr.png, as(png) replace
quietly: margins, dydx(FD) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_ev_corr.png, as(png) replace
quietly: margins, dydx(NEI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_ev_corr.png, as(png) replace
quietly: margins, dydx(LCT) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_ev_corr.png, as(png) replace
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


quietly: xtgls LSDG721 PS LINN FD NEI LCT EV GOVEFF c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FD#c.GOVEFF c.NEI#c.GOVEFF c.LCT#c.GOVEFF c.PS#c.GOVEFF#c.EV c.LINN#c.GOVEFF#c.EV c.FD#c.GOVEFF#c.EV c.NEI#c.GOVEFF#c.EV c.LCT#c.GOVEFF#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_goveff.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_goveff.png, as(png) replace
quietly: margins, dydx(FD) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_ev_goveff.png, as(png) replace
quietly: margins, dydx(NEI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_ev_goveff.png, as(png) replace
quietly: margins, dydx(LCT) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_ev_goveff.png, as(png) replace
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

quietly: xtgls LSDG721 PS LINN FD NEI LCT EV POLST c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.POLST c.LINN#c.POLST c.FD#c.POLST c.NEI#c.POLST c.LCT#c.POLST c.PS#c.POLST#c.EV c.LINN#c.POLST#c.EV c.FD#c.POLST#c.EV c.NEI#c.POLST#c.EV c.LCT#c.POLST#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_polst.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_polst.png, as(png) replace
quietly: margins, dydx(FD) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_ev_polst.png, as(png) replace
quietly: margins, dydx(NEI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_ev_polst.png, as(png) replace
quietly: margins, dydx(LCT) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_ev_polst.png, as(png) replace
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

quietly: xtgls LSDG721 PS LINN FD NEI LCT EV REG c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.REG c.LINN#c.REG c.FD#c.REG c.NEI#c.REG c.LCT#c.REG c.PS#c.REG#c.EV c.LINN#c.REG#c.EV c.FD#c.REG#c.EV c.NEI#c.REG#c.EV c.LCT#c.REG#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_reg.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_reg.png, as(png) replace
quietly: margins, dydx(FD) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_ev_reg.png, as(png) replace
quietly: margins, dydx(NEI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_ev_reg.png, as(png) replace
quietly: margins, dydx(LCT) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_ev_reg.png, as(png) replace
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

quietly: xtgls LSDG721 PS LINN FD NEI LCT EV RULE c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.RULE c.LINN#c.RULE c.FD#c.RULE c.NEI#c.RULE c.LCT#c.RULE c.PS#c.RULE#c.EV c.LINN#c.RULE#c.EV c.FD#c.RULE#c.EV c.NEI#c.RULE#c.EV c.LCT#c.RULE#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_rule.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_rule.png, as(png) replace
quietly: margins, dydx(FD) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_ev_rule.png, as(png) replace
quietly: margins, dydx(NEI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_ev_rule.png, as(png) replace
quietly: margins, dydx(LCT) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_ev_rule.png, as(png) replace
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

quietly: xtgls LSDG721 PS LINN FD NEI LCT EV VOICE c.PS#c.EV c.LINN#c.EV c.FD#c.EV c.NEI#c.EV c.LCT#c.EV c.PS#c.VOICE c.LINN#c.VOICE c.FD#c.VOICE c.NEI#c.VOICE c.LCT#c.VOICE c.PS#c.VOICE#c.EV c.LINN#c.VOICE#c.EV c.FD#c.VOICE#c.EV c.NEI#c.VOICE#c.EV c.LCT#c.VOICE#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_voice.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_voice.png, as(png) replace
quietly: margins, dydx(FD) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fd_ev_voice.png, as(png) replace
quietly: margins, dydx(NEI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_nei_ev_voice.png, as(png) replace
quietly: margins, dydx(LCT) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lct_ev_voice.png, as(png) replace
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

