clear
 
local dir `c(pwd)'
pwd
use data.dta

xtset Code Year

gen LSDG711=ln(SDG711)
gen LEL=ln(ElectricityGenerationPerCapit)

rename FinancialAccess FA
rename HealthExpenditure EXP
rename IncomeInequality INEQ

rename RuralPopulationGrowth LVUL


cls

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV CORR c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.CORR c.FA#c.CORR c.LVUL#c.CORR c.INEQ#c.CORR c.EXP#c.CORR c.LEL#c.CORR#c.EV c.FA#c.CORR#c.EV c.LVUL#c.CORR#c.EV c.INEQ#c.CORR#c.EV c.EXP#c.CORR#c.EV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV GOVEFF c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.GOVEFF c.FA#c.GOVEFF c.LVUL#c.GOVEFF c.INEQ#c.GOVEFF c.EXP#c.GOVEFF c.LEL#c.GOVEFF#c.EV c.FA#c.GOVEFF#c.EV c.LVUL#c.GOVEFF#c.EV c.INEQ#c.GOVEFF#c.EV c.EXP#c.GOVEFF#c.EV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV POLST c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.POLST c.FA#c.POLST c.LVUL#c.POLST c.INEQ#c.POLST c.EXP#c.POLST c.LEL#c.POLST#c.EV c.FA#c.POLST#c.EV c.LVUL#c.POLST#c.EV c.INEQ#c.POLST#c.EV c.EXP#c.POLST#c.EV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV REG c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.REG c.FA#c.REG c.LVUL#c.REG c.INEQ#c.REG c.EXP#c.REG c.LEL#c.REG#c.EV c.FA#c.REG#c.EV c.LVUL#c.REG#c.EV c.INEQ#c.REG#c.EV c.EXP#c.REG#c.EV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV RULE c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.RULE c.FA#c.RULE c.LVUL#c.RULE c.INEQ#c.RULE c.EXP#c.RULE c.LEL#c.RULE#c.EV c.FA#c.RULE#c.EV c.LVUL#c.RULE#c.EV c.INEQ#c.RULE#c.EV c.EXP#c.RULE#c.EV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV VOICE c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.VOICE c.FA#c.VOICE c.LVUL#c.VOICE c.INEQ#c.VOICE c.EXP#c.VOICE c.LEL#c.VOICE#c.EV c.FA#c.VOICE#c.EV c.LVUL#c.VOICE#c.EV c.INEQ#c.VOICE#c.EV c.EXP#c.VOICE#c.EV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV CORR c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.CORR c.FA#c.CORR c.LVUL#c.CORR c.INEQ#c.CORR c.EXP#c.CORR c.LEL#c.CORR#c.EV c.FA#c.CORR#c.EV c.LVUL#c.CORR#c.EV c.INEQ#c.CORR#c.EV c.EXP#c.CORR#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_ev_corr.png, as(png) replace
quietly: margins, dydx(FA) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_ev_corr.png, as(png) replace
quietly: margins, dydx(LVUL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_ev_corr.png, as(png) replace
quietly: margins, dydx(INEQ) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_ev_corr.png, as(png) replace
quietly: margins, dydx(EXP) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_ev_corr.png, as(png) replace
quietly: margins, dydx(LEL) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_lel_corr.png, as(png) replace
quietly: margins, dydx(FA) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_corr.png, as(png) replace
quietly: margins, dydx(LVUL) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_lvul_corr.png, as(png) replace
quietly: margins, dydx(INEQ) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_ineq_corr.png, as(png) replace
quietly: margins, dydx(EXP) at(CORR==(-2.5(.05)2.5))
marginsplot
graph export myfile_exp_corr.png, as(png) replace


quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV GOVEFF c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.GOVEFF c.FA#c.GOVEFF c.LVUL#c.GOVEFF c.INEQ#c.GOVEFF c.EXP#c.GOVEFF c.LEL#c.GOVEFF#c.EV c.FA#c.GOVEFF#c.EV c.LVUL#c.GOVEFF#c.EV c.INEQ#c.GOVEFF#c.EV c.EXP#c.GOVEFF#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_ev_goveff.png, as(png) replace
quietly: margins, dydx(FA) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_ev_goveff.png, as(png) replace
quietly: margins, dydx(LVUL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_ev_goveff.png, as(png) replace
quietly: margins, dydx(INEQ) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_ev_goveff.png, as(png) replace
quietly: margins, dydx(EXP) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_ev_goveff.png, as(png) replace
quietly: margins, dydx(LEL) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_lel_goveff.png, as(png) replace
quietly: margins, dydx(FA) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_goveff.png, as(png) replace
quietly: margins, dydx(LVUL) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_lvul_goveff.png, as(png) replace
quietly: margins, dydx(INEQ) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_ineq_goveff.png, as(png) replace
quietly: margins, dydx(EXP) at(GOVEFF==(-2.5(.05)2.5))
marginsplot
graph export myfile_exp_goveff.png, as(png) replace

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV POLST c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.POLST c.FA#c.POLST c.LVUL#c.POLST c.INEQ#c.POLST c.EXP#c.POLST c.LEL#c.POLST#c.EV c.FA#c.POLST#c.EV c.LVUL#c.POLST#c.EV c.INEQ#c.POLST#c.EV c.EXP#c.POLST#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_ev_polst.png, as(png) replace
quietly: margins, dydx(FA) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_ev_polst.png, as(png) replace
quietly: margins, dydx(LVUL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_ev_polst.png, as(png) replace
quietly: margins, dydx(INEQ) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_ev_polst.png, as(png) replace
quietly: margins, dydx(EXP) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_ev_polst.png, as(png) replace
quietly: margins, dydx(LEL) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_lel_polst.png, as(png) replace
quietly: margins, dydx(FA) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_polst.png, as(png) replace
quietly: margins, dydx(LVUL) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_lvul_polst.png, as(png) replace
quietly: margins, dydx(INEQ) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_ineq_polst.png, as(png) replace
quietly: margins, dydx(EXP) at(POLST==(-2.5(.05)2.5))
marginsplot
graph export myfile_exp_polst.png, as(png) replace

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV REG c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.REG c.FA#c.REG c.LVUL#c.REG c.INEQ#c.REG c.EXP#c.REG c.LEL#c.REG#c.EV c.FA#c.REG#c.EV c.LVUL#c.REG#c.EV c.INEQ#c.REG#c.EV c.EXP#c.REG#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_ev_reg.png, as(png) replace
quietly: margins, dydx(FA) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_ev_reg.png, as(png) replace
quietly: margins, dydx(LVUL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_ev_reg.png, as(png) replace
quietly: margins, dydx(INEQ) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_ev_reg.png, as(png) replace
quietly: margins, dydx(EXP) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_ev_reg.png, as(png) replace
quietly: margins, dydx(LEL) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_lel_reg.png, as(png) replace
quietly: margins, dydx(FA) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_reg.png, as(png) replace
quietly: margins, dydx(LVUL) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_lvul_reg.png, as(png) replace
quietly: margins, dydx(INEQ) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_ineq_reg.png, as(png) replace
quietly: margins, dydx(EXP) at(REG==(-2.5(.05)2.5))
marginsplot
graph export myfile_exp_reg.png, as(png) replace

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV RULE c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.RULE c.FA#c.RULE c.LVUL#c.RULE c.INEQ#c.RULE c.EXP#c.RULE c.LEL#c.RULE#c.EV c.FA#c.RULE#c.EV c.LVUL#c.RULE#c.EV c.INEQ#c.RULE#c.EV c.EXP#c.RULE#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_ev_rule.png, as(png) replace
quietly: margins, dydx(FA) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_ev_rule.png, as(png) replace
quietly: margins, dydx(LVUL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_ev_rule.png, as(png) replace
quietly: margins, dydx(INEQ) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_ev_rule.png, as(png) replace
quietly: margins, dydx(EXP) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_ev_rule.png, as(png) replace
quietly: margins, dydx(LEL) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lel_rule.png, as(png) replace
quietly: margins, dydx(FA) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_rule.png, as(png) replace
quietly: margins, dydx(LVUL) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lvul_rule.png, as(png) replace
quietly: margins, dydx(INEQ) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_ineq_rule.png, as(png) replace
quietly: margins, dydx(EXP) at(RULE==(-2.5(.05)2.5))
marginsplot
graph export myfile_exp_rule.png, as(png) replace

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP EV VOICE c.LEL#c.EV c.FA#c.EV c.LVUL#c.EV c.INEQ#c.EV c.EXP#c.EV c.LEL#c.VOICE c.FA#c.VOICE c.LVUL#c.VOICE c.INEQ#c.VOICE c.EXP#c.VOICE c.LEL#c.VOICE#c.EV c.FA#c.VOICE#c.EV c.LVUL#c.VOICE#c.EV c.INEQ#c.VOICE#c.EV c.EXP#c.VOICE#c.EV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_ev_voice.png, as(png) replace
quietly: margins, dydx(FA) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_ev_voice.png, as(png) replace
quietly: margins, dydx(LVUL) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_ev_voice.png, as(png) replace
quietly: margins, dydx(INEQ) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_ev_voice.png, as(png) replace
quietly: margins, dydx(EXP) at(EV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_ev_voice.png, as(png) replace
quietly: margins, dydx(LEL) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lel_voice.png, as(png) replace
quietly: margins, dydx(FA) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_fa_voice.png, as(png) replace
quietly: margins, dydx(LVUL) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_lvul_voice.png, as(png) replace
quietly: margins, dydx(INEQ) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_ineq_voice.png, as(png) replace
quietly: margins, dydx(EXP) at(VOICE==(-2.5(.05)2.5))
marginsplot
graph export myfile_exp_voice.png, as(png) replace

