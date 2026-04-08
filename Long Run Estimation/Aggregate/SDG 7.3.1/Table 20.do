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
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV CORR c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.CORR c.LINN#c.CORR c.FDI#c.CORR c.LIND#c.CORR c.LED#c.CORR c.PS#c.CORR#c.IV c.LINN#c.CORR#c.IV c.FDI#c.CORR#c.IV c.LIND#c.CORR#c.IV c.LED#c.CORR#c.IV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV GOVEFF c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FDI#c.GOVEFF c.LIND#c.GOVEFF c.LED#c.GOVEFF c.PS#c.GOVEFF#c.IV c.LINN#c.GOVEFF#c.IV c.FDI#c.GOVEFF#c.IV c.LIND#c.GOVEFF#c.IV c.LED#c.GOVEFF#c.IV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV POLST c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.POLST c.LINN#c.POLST c.FDI#c.POLST c.LIND#c.POLST c.LED#c.POLST c.PS#c.POLST#c.IV c.LINN#c.POLST#c.IV c.FDI#c.POLST#c.IV c.LIND#c.POLST#c.IV c.LED#c.POLST#c.IV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV REG c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.REG c.LINN#c.REG c.FDI#c.REG c.LIND#c.REG c.LED#c.REG c.PS#c.REG#c.IV c.LINN#c.REG#c.IV c.FDI#c.REG#c.IV c.LIND#c.REG#c.IV c.LED#c.REG#c.IV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV RULE c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.RULE c.LINN#c.RULE c.FDI#c.RULE c.LIND#c.RULE c.LED#c.RULE c.PS#c.RULE#c.IV c.LINN#c.RULE#c.IV c.FDI#c.RULE#c.IV c.LIND#c.RULE#c.IV c.LED#c.RULE#c.IV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED IV VOICE c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.VOICE c.LINN#c.VOICE c.FDI#c.VOICE c.LIND#c.VOICE c.LED#c.VOICE c.PS#c.VOICE#c.IV c.LINN#c.VOICE#c.IV c.FDI#c.VOICE#c.IV c.LIND#c.VOICE#c.IV c.LED#c.VOICE#c.IV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG731 PS LINN FDI LIND LED IV CORR c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.CORR c.LINN#c.CORR c.FDI#c.CORR c.LIND#c.CORR c.LED#c.CORR c.PS#c.CORR#c.IV c.LINN#c.CORR#c.IV c.FDI#c.CORR#c.IV c.LIND#c.CORR#c.IV c.LED#c.CORR#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_iv_corr.png, as(png) replace
quietly: margins, dydx(LINN) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_iv_corr.png, as(png) replace
quietly: margins, dydx(FDI) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_iv_corr.png, as(png) replace
quietly: margins, dydx(LIND) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_iv_corr.png, as(png) replace
quietly: margins, dydx(LED) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_iv_corr.png, as(png) replace
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


quietly: xtgls LSDG731 PS LINN FDI LIND LED IV GOVEFF c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FDI#c.GOVEFF c.LIND#c.GOVEFF c.LED#c.GOVEFF c.PS#c.GOVEFF#c.IV c.LINN#c.GOVEFF#c.IV c.FDI#c.GOVEFF#c.IV c.LIND#c.GOVEFF#c.IV c.LED#c.GOVEFF#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_iv_goveff.png, as(png) replace
quietly: margins, dydx(LINN) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_iv_goveff.png, as(png) replace
quietly: margins, dydx(FDI) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_iv_goveff.png, as(png) replace
quietly: margins, dydx(LIND) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_iv_goveff.png, as(png) replace
quietly: margins, dydx(LED) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_iv_goveff.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED IV POLST c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.POLST c.LINN#c.POLST c.FDI#c.POLST c.LIND#c.POLST c.LED#c.POLST c.PS#c.POLST#c.IV c.LINN#c.POLST#c.IV c.FDI#c.POLST#c.IV c.LIND#c.POLST#c.IV c.LED#c.POLST#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_iv_polst.png, as(png) replace
quietly: margins, dydx(LINN) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_iv_polst.png, as(png) replace
quietly: margins, dydx(FDI) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_iv_polst.png, as(png) replace
quietly: margins, dydx(LIND) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_iv_polst.png, as(png) replace
quietly: margins, dydx(LED) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_iv_polst.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED IV REG c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.REG c.LINN#c.REG c.FDI#c.REG c.LIND#c.REG c.LED#c.REG c.PS#c.REG#c.IV c.LINN#c.REG#c.IV c.FDI#c.REG#c.IV c.LIND#c.REG#c.IV c.LED#c.REG#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_iv_reg.png, as(png) replace
quietly: margins, dydx(LINN) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_iv_reg.png, as(png) replace
quietly: margins, dydx(FDI) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_iv_reg.png, as(png) replace
quietly: margins, dydx(LIND) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_iv_reg.png, as(png) replace
quietly: margins, dydx(LED) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_iv_reg.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED IV RULE c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.RULE c.LINN#c.RULE c.FDI#c.RULE c.LIND#c.RULE c.LED#c.RULE c.PS#c.RULE#c.IV c.LINN#c.RULE#c.IV c.FDI#c.RULE#c.IV c.LIND#c.RULE#c.IV c.LED#c.RULE#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_iv_rule.png, as(png) replace
quietly: margins, dydx(LINN) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_iv_rule.png, as(png) replace
quietly: margins, dydx(FDI) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_iv_rule.png, as(png) replace
quietly: margins, dydx(LIND) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_iv_rule.png, as(png) replace
quietly: margins, dydx(LED) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_iv_rule.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED IV VOICE c.PS#c.IV c.LINN#c.IV c.FDI#c.IV c.LIND#c.IV c.LED#c.IV c.PS#c.VOICE c.LINN#c.VOICE c.FDI#c.VOICE c.LIND#c.VOICE c.LED#c.VOICE c.PS#c.VOICE#c.IV c.LINN#c.VOICE#c.IV c.FDI#c.VOICE#c.IV c.LIND#c.VOICE#c.IV c.LED#c.VOICE#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_iv_voice.png, as(png) replace
quietly: margins, dydx(LINN) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_iv_voice.png, as(png) replace
quietly: margins, dydx(FDI) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_iv_voice.png, as(png) replace
quietly: margins, dydx(LIND) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_iv_voice.png, as(png) replace
quietly: margins, dydx(LED) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_iv_voice.png, as(png) replace
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

