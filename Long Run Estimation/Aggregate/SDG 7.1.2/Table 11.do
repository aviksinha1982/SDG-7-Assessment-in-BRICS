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
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV CORR c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.CORR c.FA#c.CORR c.PS#c.CORR c.LPCI#c.CORR c.URB#c.CORR c.LREN#c.CORR#c.WV c.FA#c.CORR#c.WV c.PS#c.CORR#c.WV c.LPCI#c.CORR#c.WV c.URB#c.CORR#c.WV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV GOVEFF c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.GOVEFF c.FA#c.GOVEFF c.PS#c.GOVEFF c.LPCI#c.GOVEFF c.URB#c.GOVEFF c.LREN#c.GOVEFF#c.WV c.FA#c.GOVEFF#c.WV c.PS#c.GOVEFF#c.WV c.LPCI#c.GOVEFF#c.WV c.URB#c.GOVEFF#c.WV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV POLST c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.POLST c.FA#c.POLST c.PS#c.POLST c.LPCI#c.POLST c.URB#c.POLST c.LREN#c.POLST#c.WV c.FA#c.POLST#c.WV c.PS#c.POLST#c.WV c.LPCI#c.POLST#c.WV c.URB#c.POLST#c.WV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV REG c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.REG c.FA#c.REG c.PS#c.REG c.LPCI#c.REG c.URB#c.REG c.LREN#c.REG#c.WV c.FA#c.REG#c.WV c.PS#c.REG#c.WV c.LPCI#c.REG#c.WV c.URB#c.REG#c.WV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV RULE c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.RULE c.FA#c.RULE c.PS#c.RULE c.LPCI#c.RULE c.URB#c.RULE c.LREN#c.RULE#c.WV c.FA#c.RULE#c.WV c.PS#c.RULE#c.WV c.LPCI#c.RULE#c.WV c.URB#c.RULE#c.WV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m11
quietly: xtgls LSDG712 LREN FA PS LPCI URB WV VOICE c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.VOICE c.FA#c.VOICE c.PS#c.VOICE c.LPCI#c.VOICE c.URB#c.VOICE c.LREN#c.VOICE#c.WV c.FA#c.VOICE#c.WV c.PS#c.VOICE#c.WV c.LPCI#c.VOICE#c.WV c.URB#c.VOICE#c.WV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(LREN FA PS LPCI URB) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG712 LREN FA PS LPCI URB WV CORR c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.LPCI#c.WV c.LREN#c.CORR c.FA#c.CORR c.PS#c.CORR c.LPCI#c.CORR c.LPCI#c.CORR c.LREN#c.CORR#c.WV c.FA#c.CORR#c.WV c.PS#c.CORR#c.WV c.LPCI#c.CORR#c.WV c.LPCI#c.CORR#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_wv_corr.png, as(png) replace
quietly: margins, dydx(FA) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_wv_corr.png, as(png) replace
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_corr.png, as(png) replace
quietly: margins, dydx(LPCI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_wv_corr.png, as(png) replace
quietly: margins, dydx(URB) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_wv_corr.png, as(png) replace
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


quietly: xtgls LSDG712 LREN FA PS LPCI URB WV GOVEFF c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.GOVEFF c.FA#c.GOVEFF c.PS#c.GOVEFF c.LPCI#c.GOVEFF c.URB#c.GOVEFF c.LREN#c.GOVEFF#c.WV c.FA#c.GOVEFF#c.WV c.PS#c.GOVEFF#c.WV c.LPCI#c.GOVEFF#c.WV c.URB#c.GOVEFF#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_wv_goveff.png, as(png) replace
quietly: margins, dydx(FA) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_wv_goveff.png, as(png) replace
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_goveff.png, as(png) replace
quietly: margins, dydx(LPCI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_wv_goveff.png, as(png) replace
quietly: margins, dydx(URB) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_wv_goveff.png, as(png) replace
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

quietly: xtgls LSDG712 LREN FA PS LPCI URB WV POLST c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.POLST c.FA#c.POLST c.PS#c.POLST c.LPCI#c.POLST c.URB#c.POLST c.LREN#c.POLST#c.WV c.FA#c.POLST#c.WV c.PS#c.POLST#c.WV c.LPCI#c.POLST#c.WV c.URB#c.POLST#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_wv_polst.png, as(png) replace
quietly: margins, dydx(FA) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_wv_polst.png, as(png) replace
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_polst.png, as(png) replace
quietly: margins, dydx(LPCI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_wv_polst.png, as(png) replace
quietly: margins, dydx(URB) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_wv_polst.png, as(png) replace
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

quietly: xtgls LSDG712 LREN FA PS LPCI URB WV REG c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.REG c.FA#c.REG c.PS#c.REG c.LPCI#c.REG c.URB#c.REG c.LREN#c.REG#c.WV c.FA#c.REG#c.WV c.PS#c.REG#c.WV c.LPCI#c.REG#c.WV c.URB#c.REG#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_wv_reg.png, as(png) replace
quietly: margins, dydx(FA) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_wv_reg.png, as(png) replace
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_reg.png, as(png) replace
quietly: margins, dydx(LPCI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_wv_reg.png, as(png) replace
quietly: margins, dydx(URB) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_wv_reg.png, as(png) replace
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

quietly: xtgls LSDG712 LREN FA PS LPCI URB WV RULE c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.RULE c.FA#c.RULE c.PS#c.RULE c.LPCI#c.RULE c.URB#c.RULE c.LREN#c.RULE#c.WV c.FA#c.RULE#c.WV c.PS#c.RULE#c.WV c.LPCI#c.RULE#c.WV c.URB#c.RULE#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_wv_rule.png, as(png) replace
quietly: margins, dydx(FA) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_wv_rule.png, as(png) replace
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_rule.png, as(png) replace
quietly: margins, dydx(LPCI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_wv_rule.png, as(png) replace
quietly: margins, dydx(URB) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_wv_rule.png, as(png) replace
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

quietly: xtgls LSDG712 LREN FA PS LPCI URB WV VOICE c.LREN#c.WV c.FA#c.WV c.PS#c.WV c.LPCI#c.WV c.URB#c.WV c.LREN#c.VOICE c.FA#c.VOICE c.PS#c.VOICE c.LPCI#c.VOICE c.URB#c.VOICE c.LREN#c.VOICE#c.WV c.FA#c.VOICE#c.WV c.PS#c.VOICE#c.WV c.LPCI#c.VOICE#c.WV c.URB#c.VOICE#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(LREN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lren_wv_voice.png, as(png) replace
quietly: margins, dydx(FA) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_wv_voice.png, as(png) replace
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_voice.png, as(png) replace
quietly: margins, dydx(LPCI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lpci_wv_voice.png, as(png) replace
quietly: margins, dydx(URB) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_urb_wv_voice.png, as(png) replace
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

