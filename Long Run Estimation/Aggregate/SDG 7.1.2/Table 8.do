clear
 
local dir `c(pwd)'
pwd
use data.dta

xtset Code Year

gen LSDG712=ln(SDG712)
gen LREN=ln(RenewableElectricityGeneration)
gen LPCI=ln(PerCapitaIncome)

rename FinancialAccess FA
rename PolicyStringency PS
rename UrbanPopulationGrowth URB

cls

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV CORR c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.CORR c.FA#c.CORR c.PS#c.CORR c.LPCI#c.CORR c.URB#c.CORR c.LREN#c.CORR#c.FV c.FA#c.CORR#c.FV c.PS#c.CORR#c.FV c.LPCI#c.CORR#c.FV c.URB#c.CORR#c.FV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV GOVEFF c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.GOVEFF c.FA#c.GOVEFF c.PS#c.GOVEFF c.LPCI#c.GOVEFF c.URB#c.GOVEFF c.LREN#c.GOVEFF#c.FV c.FA#c.GOVEFF#c.FV c.PS#c.GOVEFF#c.FV c.LPCI#c.GOVEFF#c.FV c.URB#c.GOVEFF#c.FV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV POLST c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.POLST c.FA#c.POLST c.PS#c.POLST c.LPCI#c.POLST c.URB#c.POLST c.LREN#c.POLST#c.FV c.FA#c.POLST#c.FV c.PS#c.POLST#c.FV c.LPCI#c.POLST#c.FV c.URB#c.POLST#c.FV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV REG c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.REG c.FA#c.REG c.PS#c.REG c.LPCI#c.REG c.URB#c.REG c.LREN#c.REG#c.FV c.FA#c.REG#c.FV c.PS#c.REG#c.FV c.LPCI#c.REG#c.FV c.URB#c.REG#c.FV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV RULE c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.RULE c.FA#c.RULE c.PS#c.RULE c.LPCI#c.RULE c.URB#c.RULE c.LREN#c.RULE#c.FV c.FA#c.RULE#c.FV c.PS#c.RULE#c.FV c.LPCI#c.RULE#c.FV c.URB#c.RULE#c.FV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB FV VOICE c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.VOICE c.FA#c.VOICE c.PS#c.VOICE c.LPCI#c.VOICE c.URB#c.VOICE c.LREN#c.VOICE#c.FV c.FA#c.VOICE#c.FV c.PS#c.VOICE#c.FV c.LPCI#c.VOICE#c.FV c.URB#c.VOICE#c.FV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG712 LREN FA PS LPCI URB FV CORR c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.LPCI#c.FV c.LREN#c.CORR c.FA#c.CORR c.PS#c.CORR c.LPCI#c.CORR c.LPCI#c.CORR c.LREN#c.CORR#c.FV c.FA#c.CORR#c.FV c.PS#c.CORR#c.FV c.LPCI#c.CORR#c.FV c.LPCI#c.CORR#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_fv_corr.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_corr.png, as(png) replace
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_corr.png, as(png) replace
quietly: margins, dydx(LPCI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_fv_corr.png, as(png) replace
quietly: margins, dydx(URB) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_fv_corr.png, as(png) replace
quietly: margins, dydx(LREN) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_lren_corr.png, as(png) replace
quietly: margins, dydx(FA) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_corr.png, as(png) replace
quietly: margins, dydx(PS) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_corr.png, as(png) replace
quietly: margins, dydx(LPCI) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_lpci_corr.png, as(png) replace
quietly: margins, dydx(URB) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_urb_corr.png, as(png) replace


quietly: xtgls LSDG712 LREN FA PS LPCI URB FV GOVEFF c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.GOVEFF c.FA#c.GOVEFF c.PS#c.GOVEFF c.LPCI#c.GOVEFF c.URB#c.GOVEFF c.LREN#c.GOVEFF#c.FV c.FA#c.GOVEFF#c.FV c.PS#c.GOVEFF#c.FV c.LPCI#c.GOVEFF#c.FV c.URB#c.GOVEFF#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_fv_goveff.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_goveff.png, as(png) replace
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_goveff.png, as(png) replace
quietly: margins, dydx(LPCI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_fv_goveff.png, as(png) replace
quietly: margins, dydx(URB) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_fv_goveff.png, as(png) replace
quietly: margins, dydx(LREN) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_lren_goveff.png, as(png) replace
quietly: margins, dydx(FA) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_goveff.png, as(png) replace
quietly: margins, dydx(PS) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_goveff.png, as(png) replace
quietly: margins, dydx(LPCI) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_lpci_goveff.png, as(png) replace
quietly: margins, dydx(URB) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_urb_goveff.png, as(png) replace

quietly: xtgls LSDG712 LREN FA PS LPCI URB FV POLST c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.POLST c.FA#c.POLST c.PS#c.POLST c.LPCI#c.POLST c.URB#c.POLST c.LREN#c.POLST#c.FV c.FA#c.POLST#c.FV c.PS#c.POLST#c.FV c.LPCI#c.POLST#c.FV c.URB#c.POLST#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_fv_polst.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_polst.png, as(png) replace
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_polst.png, as(png) replace
quietly: margins, dydx(LPCI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_fv_polst.png, as(png) replace
quietly: margins, dydx(URB) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_fv_polst.png, as(png) replace
quietly: margins, dydx(LREN) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_lren_polst.png, as(png) replace
quietly: margins, dydx(FA) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_polst.png, as(png) replace
quietly: margins, dydx(PS) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_polst.png, as(png) replace
quietly: margins, dydx(LPCI) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_lpci_polst.png, as(png) replace
quietly: margins, dydx(URB) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_urb_polst.png, as(png) replace

quietly: xtgls LSDG712 LREN FA PS LPCI URB FV REG c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.REG c.FA#c.REG c.PS#c.REG c.LPCI#c.REG c.URB#c.REG c.LREN#c.REG#c.FV c.FA#c.REG#c.FV c.PS#c.REG#c.FV c.LPCI#c.REG#c.FV c.URB#c.REG#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_fv_reg.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_reg.png, as(png) replace
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_reg.png, as(png) replace
quietly: margins, dydx(LPCI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_fv_reg.png, as(png) replace
quietly: margins, dydx(URB) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_fv_reg.png, as(png) replace
quietly: margins, dydx(LREN) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_lren_reg.png, as(png) replace
quietly: margins, dydx(FA) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_reg.png, as(png) replace
quietly: margins, dydx(PS) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_reg.png, as(png) replace
quietly: margins, dydx(LPCI) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_lpci_reg.png, as(png) replace
quietly: margins, dydx(URB) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_urb_reg.png, as(png) replace

quietly: xtgls LSDG712 LREN FA PS LPCI URB FV RULE c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.RULE c.FA#c.RULE c.PS#c.RULE c.LPCI#c.RULE c.URB#c.RULE c.LREN#c.RULE#c.FV c.FA#c.RULE#c.FV c.PS#c.RULE#c.FV c.LPCI#c.RULE#c.FV c.URB#c.RULE#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_fv_rule.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_rule.png, as(png) replace
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_rule.png, as(png) replace
quietly: margins, dydx(LPCI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_fv_rule.png, as(png) replace
quietly: margins, dydx(URB) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_fv_rule.png, as(png) replace
quietly: margins, dydx(LREN) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lren_rule.png, as(png) replace
quietly: margins, dydx(FA) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_rule.png, as(png) replace
quietly: margins, dydx(PS) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_rule.png, as(png) replace
quietly: margins, dydx(LPCI) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lpci_rule.png, as(png) replace
quietly: margins, dydx(URB) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_urb_rule.png, as(png) replace

quietly: xtgls LSDG712 LREN FA PS LPCI URB FV VOICE c.LREN#c.FV c.FA#c.FV c.PS#c.FV c.LPCI#c.FV c.URB#c.FV c.LREN#c.VOICE c.FA#c.VOICE c.PS#c.VOICE c.LPCI#c.VOICE c.URB#c.VOICE c.LREN#c.VOICE#c.FV c.FA#c.VOICE#c.FV c.PS#c.VOICE#c.FV c.LPCI#c.VOICE#c.FV c.URB#c.VOICE#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_fv_voice.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_voice.png, as(png) replace
quietly: margins, dydx(PS) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_fv_voice.png, as(png) replace
quietly: margins, dydx(LPCI) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_fv_voice.png, as(png) replace
quietly: margins, dydx(URB) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_fv_voice.png, as(png) replace
quietly: margins, dydx(LREN) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lren_voice.png, as(png) replace
quietly: margins, dydx(FA) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_voice.png, as(png) replace
quietly: margins, dydx(PS) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_voice.png, as(png) replace
quietly: margins, dydx(LPCI) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lpci_voice.png, as(png) replace
quietly: margins, dydx(URB) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_urb_voice.png, as(png) replace

