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
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV CORR c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.CORR c.LINN#c.CORR c.FDI#c.CORR c.LIND#c.CORR c.LED#c.CORR c.PS#c.CORR#c.EV c.LINN#c.CORR#c.EV c.FDI#c.CORR#c.EV c.LIND#c.CORR#c.EV c.LED#c.CORR#c.EV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV GOVEFF c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FDI#c.GOVEFF c.LIND#c.GOVEFF c.LED#c.GOVEFF c.PS#c.GOVEFF#c.EV c.LINN#c.GOVEFF#c.EV c.FDI#c.GOVEFF#c.EV c.LIND#c.GOVEFF#c.EV c.LED#c.GOVEFF#c.EV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV POLST c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.POLST c.LINN#c.POLST c.FDI#c.POLST c.LIND#c.POLST c.LED#c.POLST c.PS#c.POLST#c.EV c.LINN#c.POLST#c.EV c.FDI#c.POLST#c.EV c.LIND#c.POLST#c.EV c.LED#c.POLST#c.EV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV REG c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.REG c.LINN#c.REG c.FDI#c.REG c.LIND#c.REG c.LED#c.REG c.PS#c.REG#c.EV c.LINN#c.REG#c.EV c.FDI#c.REG#c.EV c.LIND#c.REG#c.EV c.LED#c.REG#c.EV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV RULE c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.RULE c.LINN#c.RULE c.FDI#c.RULE c.LIND#c.RULE c.LED#c.RULE c.PS#c.RULE#c.EV c.LINN#c.RULE#c.EV c.FDI#c.RULE#c.EV c.LIND#c.RULE#c.EV c.LED#c.RULE#c.EV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m11
quietly: xtgls LSDG731 PS LINN FDI LIND LED EV VOICE c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.VOICE c.LINN#c.VOICE c.FDI#c.VOICE c.LIND#c.VOICE c.LED#c.VOICE c.PS#c.VOICE#c.EV c.LINN#c.VOICE#c.EV c.FDI#c.VOICE#c.EV c.LIND#c.VOICE#c.EV c.LED#c.VOICE#c.EV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(PS LINN FDI LIND LED) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG731 PS LINN FDI LIND LED EV CORR c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.CORR c.LINN#c.CORR c.FDI#c.CORR c.LIND#c.CORR c.LED#c.CORR c.PS#c.CORR#c.EV c.LINN#c.CORR#c.EV c.FDI#c.CORR#c.EV c.LIND#c.CORR#c.EV c.LED#c.CORR#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_corr.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_corr.png, as(png) replace
quietly: margins, dydx(FDI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_ev_corr.png, as(png) replace
quietly: margins, dydx(LIND) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_ev_corr.png, as(png) replace
quietly: margins, dydx(LED) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_ev_corr.png, as(png) replace
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


quietly: xtgls LSDG731 PS LINN FDI LIND LED EV GOVEFF c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.GOVEFF c.LINN#c.GOVEFF c.FDI#c.GOVEFF c.LIND#c.GOVEFF c.LED#c.GOVEFF c.PS#c.GOVEFF#c.EV c.LINN#c.GOVEFF#c.EV c.FDI#c.GOVEFF#c.EV c.LIND#c.GOVEFF#c.EV c.LED#c.GOVEFF#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_goveff.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_goveff.png, as(png) replace
quietly: margins, dydx(FDI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_ev_goveff.png, as(png) replace
quietly: margins, dydx(LIND) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_ev_goveff.png, as(png) replace
quietly: margins, dydx(LED) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_ev_goveff.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED EV POLST c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.POLST c.LINN#c.POLST c.FDI#c.POLST c.LIND#c.POLST c.LED#c.POLST c.PS#c.POLST#c.EV c.LINN#c.POLST#c.EV c.FDI#c.POLST#c.EV c.LIND#c.POLST#c.EV c.LED#c.POLST#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_polst.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_polst.png, as(png) replace
quietly: margins, dydx(FDI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_ev_polst.png, as(png) replace
quietly: margins, dydx(LIND) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_ev_polst.png, as(png) replace
quietly: margins, dydx(LED) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_ev_polst.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED EV REG c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.REG c.LINN#c.REG c.FDI#c.REG c.LIND#c.REG c.LED#c.REG c.PS#c.REG#c.EV c.LINN#c.REG#c.EV c.FDI#c.REG#c.EV c.LIND#c.REG#c.EV c.LED#c.REG#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_reg.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_reg.png, as(png) replace
quietly: margins, dydx(FDI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_ev_reg.png, as(png) replace
quietly: margins, dydx(LIND) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_ev_reg.png, as(png) replace
quietly: margins, dydx(LED) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_ev_reg.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED EV RULE c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.RULE c.LINN#c.RULE c.FDI#c.RULE c.LIND#c.RULE c.LED#c.RULE c.PS#c.RULE#c.EV c.LINN#c.RULE#c.EV c.FDI#c.RULE#c.EV c.LIND#c.RULE#c.EV c.LED#c.RULE#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_rule.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_rule.png, as(png) replace
quietly: margins, dydx(FDI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_ev_rule.png, as(png) replace
quietly: margins, dydx(LIND) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_ev_rule.png, as(png) replace
quietly: margins, dydx(LED) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_ev_rule.png, as(png) replace
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

quietly: xtgls LSDG731 PS LINN FDI LIND LED EV VOICE c.PS#c.EV c.LINN#c.EV c.FDI#c.EV c.LIND#c.EV c.LED#c.EV c.PS#c.VOICE c.LINN#c.VOICE c.FDI#c.VOICE c.LIND#c.VOICE c.LED#c.VOICE c.PS#c.VOICE#c.EV c.LINN#c.VOICE#c.EV c.FDI#c.VOICE#c.EV c.LIND#c.VOICE#c.EV c.LED#c.VOICE#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(PS) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ps_ev_voice.png, as(png) replace
quietly: margins, dydx(LINN) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_linn_ev_voice.png, as(png) replace
quietly: margins, dydx(FDI) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fdi_ev_voice.png, as(png) replace
quietly: margins, dydx(LIND) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lind_ev_voice.png, as(png) replace
quietly: margins, dydx(LED) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_led_ev_voice.png, as(png) replace
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

