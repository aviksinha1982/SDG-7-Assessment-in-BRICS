clear
 
local dir `c(pwd)'
pwd
use data.dta

xtset Code Year

gen LSDG731=ln(SDG731)
gen LINN=ln(EnvironmentalInnovation)
gen LIND=ln(IndustrialShare)
gen LED=ln(EnergyDemand)

qui summ ForeignDirectInvestment
gen FDI = (ForeignDirectInvestment - r(min)) / (r(max) - r(min))

rename PolicyStringency PS

cls

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV CORR c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.CORR c.LINN#c.CORR c.FDI#c.CORR c.LIND#c.CORR c.LED#c.CORR c.PS#c.CORR#c.WV c.LINN#c.CORR#c.WV c.FDI#c.CORR#c.WV c.LIND#c.CORR#c.WV c.LED#c.CORR#c.WV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV GOVEFF c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FDI#c.GOVEFF c.LIND#c.GOVEFF c.LED#c.GOVEFF c.PS#c.GOVEFF#c.WV c.LINN#c.GOVEFF#c.WV c.FDI#c.GOVEFF#c.WV c.LIND#c.GOVEFF#c.WV c.LED#c.GOVEFF#c.WV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV POLST c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.POLST c.LINN#c.POLST c.FDI#c.POLST c.LIND#c.POLST c.LED#c.POLST c.PS#c.POLST#c.WV c.LINN#c.POLST#c.WV c.FDI#c.POLST#c.WV c.LIND#c.POLST#c.WV c.LED#c.POLST#c.WV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV REG c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.REG c.LINN#c.REG c.FDI#c.REG c.LIND#c.REG c.LED#c.REG c.PS#c.REG#c.WV c.LINN#c.REG#c.WV c.FDI#c.REG#c.WV c.LIND#c.REG#c.WV c.LED#c.REG#c.WV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV RULE c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.RULE c.LINN#c.RULE c.FDI#c.RULE c.LIND#c.RULE c.LED#c.RULE c.PS#c.RULE#c.WV c.LINN#c.RULE#c.WV c.FDI#c.RULE#c.WV c.LIND#c.RULE#c.WV c.LED#c.RULE#c.WV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED WV VOICE c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.VOICE c.LINN#c.VOICE c.FDI#c.VOICE c.LIND#c.VOICE c.LED#c.VOICE c.PS#c.VOICE#c.WV c.LINN#c.VOICE#c.WV c.FDI#c.VOICE#c.WV c.LIND#c.VOICE#c.WV c.LED#c.VOICE#c.WV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG731 PS LINN FDI LIND LED WV CORR c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.CORR c.LINN#c.CORR c.FDI#c.CORR c.LIND#c.CORR c.LED#c.CORR c.PS#c.CORR#c.WV c.LINN#c.CORR#c.WV c.FDI#c.CORR#c.WV c.LIND#c.CORR#c.WV c.LED#c.CORR#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_corr.png, as(png) replace
quietly: margins, dydx(LINN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_wv_corr.png, as(png) replace
quietly: margins, dydx(FDI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_wv_corr.png, as(png) replace
quietly: margins, dydx(LIND) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_wv_corr.png, as(png) replace
quietly: margins, dydx(LED) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_wv_corr.png, as(png) replace
quietly: margins, dydx(PS) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_corr.png, as(png) replace
quietly: margins, dydx(LINN) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_corr.png, as(png) replace
quietly: margins, dydx(FDI) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_fdi_corr.png, as(png) replace
quietly: margins, dydx(LIND) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_lind_corr.png, as(png) replace
quietly: margins, dydx(LED) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_led_corr.png, as(png) replace


quietly: xtgls LSDG731 PS LINN FDI LIND LED WV GOVEFF c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FDI#c.GOVEFF c.LIND#c.GOVEFF c.LED#c.GOVEFF c.PS#c.GOVEFF#c.WV c.LINN#c.GOVEFF#c.WV c.FDI#c.GOVEFF#c.WV c.LIND#c.GOVEFF#c.WV c.LED#c.GOVEFF#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_goveff.png, as(png) replace
quietly: margins, dydx(LINN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_wv_goveff.png, as(png) replace
quietly: margins, dydx(FDI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_wv_goveff.png, as(png) replace
quietly: margins, dydx(LIND) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_wv_goveff.png, as(png) replace
quietly: margins, dydx(LED) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_wv_goveff.png, as(png) replace
quietly: margins, dydx(PS) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_goveff.png, as(png) replace
quietly: margins, dydx(LINN) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_goveff.png, as(png) replace
quietly: margins, dydx(FDI) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_fdi_goveff.png, as(png) replace
quietly: margins, dydx(LIND) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_lind_goveff.png, as(png) replace
quietly: margins, dydx(LED) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_led_goveff.png, as(png) replace

quietly: xtgls LSDG731 PS LINN FDI LIND LED WV POLST c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.POLST c.LINN#c.POLST c.FDI#c.POLST c.LIND#c.POLST c.LED#c.POLST c.PS#c.POLST#c.WV c.LINN#c.POLST#c.WV c.FDI#c.POLST#c.WV c.LIND#c.POLST#c.WV c.LED#c.POLST#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_polst.png, as(png) replace
quietly: margins, dydx(LINN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_wv_polst.png, as(png) replace
quietly: margins, dydx(FDI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_wv_polst.png, as(png) replace
quietly: margins, dydx(LIND) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_wv_polst.png, as(png) replace
quietly: margins, dydx(LED) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_wv_polst.png, as(png) replace
quietly: margins, dydx(PS) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_polst.png, as(png) replace
quietly: margins, dydx(LINN) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_polst.png, as(png) replace
quietly: margins, dydx(FDI) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_fdi_polst.png, as(png) replace
quietly: margins, dydx(LIND) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_lind_polst.png, as(png) replace
quietly: margins, dydx(LED) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_led_polst.png, as(png) replace

quietly: xtgls LSDG731 PS LINN FDI LIND LED WV REG c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.REG c.LINN#c.REG c.FDI#c.REG c.LIND#c.REG c.LED#c.REG c.PS#c.REG#c.WV c.LINN#c.REG#c.WV c.FDI#c.REG#c.WV c.LIND#c.REG#c.WV c.LED#c.REG#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_reg.png, as(png) replace
quietly: margins, dydx(LINN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_wv_reg.png, as(png) replace
quietly: margins, dydx(FDI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_wv_reg.png, as(png) replace
quietly: margins, dydx(LIND) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_wv_reg.png, as(png) replace
quietly: margins, dydx(LED) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_wv_reg.png, as(png) replace
quietly: margins, dydx(PS) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_reg.png, as(png) replace
quietly: margins, dydx(LINN) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_reg.png, as(png) replace
quietly: margins, dydx(FDI) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_fdi_reg.png, as(png) replace
quietly: margins, dydx(LIND) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_lind_reg.png, as(png) replace
quietly: margins, dydx(LED) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_led_reg.png, as(png) replace

quietly: xtgls LSDG731 PS LINN FDI LIND LED WV RULE c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.RULE c.LINN#c.RULE c.FDI#c.RULE c.LIND#c.RULE c.LED#c.RULE c.PS#c.RULE#c.WV c.LINN#c.RULE#c.WV c.FDI#c.RULE#c.WV c.LIND#c.RULE#c.WV c.LED#c.RULE#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_rule.png, as(png) replace
quietly: margins, dydx(LINN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_wv_rule.png, as(png) replace
quietly: margins, dydx(FDI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_wv_rule.png, as(png) replace
quietly: margins, dydx(LIND) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_wv_rule.png, as(png) replace
quietly: margins, dydx(LED) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_wv_rule.png, as(png) replace
quietly: margins, dydx(PS) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_rule.png, as(png) replace
quietly: margins, dydx(LINN) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_rule.png, as(png) replace
quietly: margins, dydx(FDI) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_fdi_rule.png, as(png) replace
quietly: margins, dydx(LIND) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lind_rule.png, as(png) replace
quietly: margins, dydx(LED) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_led_rule.png, as(png) replace

quietly: xtgls LSDG731 PS LINN FDI LIND LED WV VOICE c.PS#c.WV c.LINN#c.WV c.FDI#c.WV c.LIND#c.WV c.LED#c.WV c.PS#c.VOICE c.LINN#c.VOICE c.FDI#c.VOICE c.LIND#c.VOICE c.LED#c.VOICE c.PS#c.VOICE#c.WV c.LINN#c.VOICE#c.WV c.FDI#c.VOICE#c.WV c.LIND#c.VOICE#c.WV c.LED#c.VOICE#c.WV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_wv_voice.png, as(png) replace
quietly: margins, dydx(LINN) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_wv_voice.png, as(png) replace
quietly: margins, dydx(FDI) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_wv_voice.png, as(png) replace
quietly: margins, dydx(LIND) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_wv_voice.png, as(png) replace
quietly: margins, dydx(LED) at(WV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_wv_voice.png, as(png) replace
quietly: margins, dydx(PS) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_ps_voice.png, as(png) replace
quietly: margins, dydx(LINN) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_linn_voice.png, as(png) replace
quietly: margins, dydx(FDI) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_fdi_voice.png, as(png) replace
quietly: margins, dydx(LIND) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lind_voice.png, as(png) replace
quietly: margins, dydx(LED) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_led_voice.png, as(png) replace

