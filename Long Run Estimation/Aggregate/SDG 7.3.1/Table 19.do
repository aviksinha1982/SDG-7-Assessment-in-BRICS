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
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV CORR c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.CORR c.LINN#c.CORR c.FDI#c.CORR c.LIND#c.CORR c.LED#c.CORR c.PS#c.CORR#c.HELV c.LINN#c.CORR#c.HELV c.FDI#c.CORR#c.HELV c.LIND#c.CORR#c.HELV c.LED#c.CORR#c.HELV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV GOVEFF c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FDI#c.GOVEFF c.LIND#c.GOVEFF c.LED#c.GOVEFF c.PS#c.GOVEFF#c.HELV c.LINN#c.GOVEFF#c.HELV c.FDI#c.GOVEFF#c.HELV c.LIND#c.GOVEFF#c.HELV c.LED#c.GOVEFF#c.HELV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV POLST c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.POLST c.LINN#c.POLST c.FDI#c.POLST c.LIND#c.POLST c.LED#c.POLST c.PS#c.POLST#c.HELV c.LINN#c.POLST#c.HELV c.FDI#c.POLST#c.HELV c.LIND#c.POLST#c.HELV c.LED#c.POLST#c.HELV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV REG c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.REG c.LINN#c.REG c.FDI#c.REG c.LIND#c.REG c.LED#c.REG c.PS#c.REG#c.HELV c.LINN#c.REG#c.HELV c.FDI#c.REG#c.HELV c.LIND#c.REG#c.HELV c.LED#c.REG#c.HELV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV RULE c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.RULE c.LINN#c.RULE c.FDI#c.RULE c.LIND#c.RULE c.LED#c.RULE c.PS#c.RULE#c.HELV c.LINN#c.RULE#c.HELV c.FDI#c.RULE#c.HELV c.LIND#c.RULE#c.HELV c.LED#c.RULE#c.HELV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV VOICE c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.VOICE c.LINN#c.VOICE c.FDI#c.VOICE c.LIND#c.VOICE c.LED#c.VOICE c.PS#c.VOICE#c.HELV c.LINN#c.VOICE#c.HELV c.FDI#c.VOICE#c.HELV c.LIND#c.VOICE#c.HELV c.LED#c.VOICE#c.HELV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV CORR c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.CORR c.LINN#c.CORR c.FDI#c.CORR c.LIND#c.CORR c.LED#c.CORR c.PS#c.CORR#c.HELV c.LINN#c.CORR#c.HELV c.FDI#c.CORR#c.HELV c.LIND#c.CORR#c.HELV c.LED#c.CORR#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_corr.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_corr.png, as(png) replace
quietly: margins, dydx(FDI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_helv_corr.png, as(png) replace
quietly: margins, dydx(LIND) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_helv_corr.png, as(png) replace
quietly: margins, dydx(LED) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_helv_corr.png, as(png) replace
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


quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV GOVEFF c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FDI#c.GOVEFF c.LIND#c.GOVEFF c.LED#c.GOVEFF c.PS#c.GOVEFF#c.HELV c.LINN#c.GOVEFF#c.HELV c.FDI#c.GOVEFF#c.HELV c.LIND#c.GOVEFF#c.HELV c.LED#c.GOVEFF#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_goveff.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_goveff.png, as(png) replace
quietly: margins, dydx(FDI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_helv_goveff.png, as(png) replace
quietly: margins, dydx(LIND) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_helv_goveff.png, as(png) replace
quietly: margins, dydx(LED) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_helv_goveff.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV POLST c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.POLST c.LINN#c.POLST c.FDI#c.POLST c.LIND#c.POLST c.LED#c.POLST c.PS#c.POLST#c.HELV c.LINN#c.POLST#c.HELV c.FDI#c.POLST#c.HELV c.LIND#c.POLST#c.HELV c.LED#c.POLST#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_polst.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_polst.png, as(png) replace
quietly: margins, dydx(FDI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_helv_polst.png, as(png) replace
quietly: margins, dydx(LIND) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_helv_polst.png, as(png) replace
quietly: margins, dydx(LED) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_helv_polst.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV REG c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.REG c.LINN#c.REG c.FDI#c.REG c.LIND#c.REG c.LED#c.REG c.PS#c.REG#c.HELV c.LINN#c.REG#c.HELV c.FDI#c.REG#c.HELV c.LIND#c.REG#c.HELV c.LED#c.REG#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_reg.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_reg.png, as(png) replace
quietly: margins, dydx(FDI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_helv_reg.png, as(png) replace
quietly: margins, dydx(LIND) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_helv_reg.png, as(png) replace
quietly: margins, dydx(LED) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_helv_reg.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV RULE c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.RULE c.LINN#c.RULE c.FDI#c.RULE c.LIND#c.RULE c.LED#c.RULE c.PS#c.RULE#c.HELV c.LINN#c.RULE#c.HELV c.FDI#c.RULE#c.HELV c.LIND#c.RULE#c.HELV c.LED#c.RULE#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_rule.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_rule.png, as(png) replace
quietly: margins, dydx(FDI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_helv_rule.png, as(png) replace
quietly: margins, dydx(LIND) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_helv_rule.png, as(png) replace
quietly: margins, dydx(LED) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_helv_rule.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED HELV VOICE c.PS#c.HELV c.LINN#c.HELV c.FDI#c.HELV c.LIND#c.HELV c.LED#c.HELV c.PS#c.VOICE c.LINN#c.VOICE c.FDI#c.VOICE c.LIND#c.VOICE c.LED#c.VOICE c.PS#c.VOICE#c.HELV c.LINN#c.VOICE#c.HELV c.FDI#c.VOICE#c.HELV c.LIND#c.VOICE#c.HELV c.LED#c.VOICE#c.HELV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_helv_voice.png, as(png) replace
quietly: margins, dydx(LINN) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_helv_voice.png, as(png) replace
quietly: margins, dydx(FDI) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_helv_voice.png, as(png) replace
quietly: margins, dydx(LIND) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_helv_voice.png, as(png) replace
quietly: margins, dydx(LED) at(HELV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_helv_voice.png, as(png) replace
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

