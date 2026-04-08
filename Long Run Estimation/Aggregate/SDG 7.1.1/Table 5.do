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
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV CORR c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.CORR c.FA#c.CORR c.LVUL#c.CORR c.INEQ#c.CORR c.EXP#c.CORR c.LEL#c.CORR#c.IV c.FA#c.CORR#c.IV c.LVUL#c.CORR#c.IV c.INEQ#c.CORR#c.IV c.EXP#c.CORR#c.IV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV GOVEFF c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.GOVEFF c.FA#c.GOVEFF c.LVUL#c.GOVEFF c.INEQ#c.GOVEFF c.EXP#c.GOVEFF c.LEL#c.GOVEFF#c.IV c.FA#c.GOVEFF#c.IV c.LVUL#c.GOVEFF#c.IV c.INEQ#c.GOVEFF#c.IV c.EXP#c.GOVEFF#c.IV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV POLST c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.POLST c.FA#c.POLST c.LVUL#c.POLST c.INEQ#c.POLST c.EXP#c.POLST c.LEL#c.POLST#c.IV c.FA#c.POLST#c.IV c.LVUL#c.POLST#c.IV c.INEQ#c.POLST#c.IV c.EXP#c.POLST#c.IV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV REG c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.REG c.FA#c.REG c.LVUL#c.REG c.INEQ#c.REG c.EXP#c.REG c.LEL#c.REG#c.IV c.FA#c.REG#c.IV c.LVUL#c.REG#c.IV c.INEQ#c.REG#c.IV c.EXP#c.REG#c.IV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV RULE c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.RULE c.FA#c.RULE c.LVUL#c.RULE c.INEQ#c.RULE c.EXP#c.RULE c.LEL#c.RULE#c.IV c.FA#c.RULE#c.IV c.LVUL#c.RULE#c.IV c.INEQ#c.RULE#c.IV c.EXP#c.RULE#c.IV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV VOICE c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.VOICE c.FA#c.VOICE c.LVUL#c.VOICE c.INEQ#c.VOICE c.EXP#c.VOICE c.LEL#c.VOICE#c.IV c.FA#c.VOICE#c.IV c.LVUL#c.VOICE#c.IV c.INEQ#c.VOICE#c.IV c.EXP#c.VOICE#c.IV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV CORR c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.CORR c.FA#c.CORR c.LVUL#c.CORR c.INEQ#c.CORR c.EXP#c.CORR c.LEL#c.CORR#c.IV c.FA#c.CORR#c.IV c.LVUL#c.CORR#c.IV c.INEQ#c.CORR#c.IV c.EXP#c.CORR#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_iv_corr.png, as(png) replace
quietly: margins, dydx(FA) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_iv_corr.png, as(png) replace
quietly: margins, dydx(LVUL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_iv_corr.png, as(png) replace
quietly: margins, dydx(INEQ) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_iv_corr.png, as(png) replace
quietly: margins, dydx(EXP) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_iv_corr.png, as(png) replace
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


quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV GOVEFF c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.GOVEFF c.FA#c.GOVEFF c.LVUL#c.GOVEFF c.INEQ#c.GOVEFF c.EXP#c.GOVEFF c.LEL#c.GOVEFF#c.IV c.FA#c.GOVEFF#c.IV c.LVUL#c.GOVEFF#c.IV c.INEQ#c.GOVEFF#c.IV c.EXP#c.GOVEFF#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_iv_goveff.png, as(png) replace
quietly: margins, dydx(FA) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_iv_goveff.png, as(png) replace
quietly: margins, dydx(LVUL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_iv_goveff.png, as(png) replace
quietly: margins, dydx(INEQ) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_iv_goveff.png, as(png) replace
quietly: margins, dydx(EXP) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_iv_goveff.png, as(png) replace
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

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV POLST c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.POLST c.FA#c.POLST c.LVUL#c.POLST c.INEQ#c.POLST c.EXP#c.POLST c.LEL#c.POLST#c.IV c.FA#c.POLST#c.IV c.LVUL#c.POLST#c.IV c.INEQ#c.POLST#c.IV c.EXP#c.POLST#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_iv_polst.png, as(png) replace
quietly: margins, dydx(FA) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_iv_polst.png, as(png) replace
quietly: margins, dydx(LVUL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_iv_polst.png, as(png) replace
quietly: margins, dydx(INEQ) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_iv_polst.png, as(png) replace
quietly: margins, dydx(EXP) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_iv_polst.png, as(png) replace
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

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV REG c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.REG c.FA#c.REG c.LVUL#c.REG c.INEQ#c.REG c.EXP#c.REG c.LEL#c.REG#c.IV c.FA#c.REG#c.IV c.LVUL#c.REG#c.IV c.INEQ#c.REG#c.IV c.EXP#c.REG#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_iv_reg.png, as(png) replace
quietly: margins, dydx(FA) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_iv_reg.png, as(png) replace
quietly: margins, dydx(LVUL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_iv_reg.png, as(png) replace
quietly: margins, dydx(INEQ) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_iv_reg.png, as(png) replace
quietly: margins, dydx(EXP) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_iv_reg.png, as(png) replace
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

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV RULE c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.RULE c.FA#c.RULE c.LVUL#c.RULE c.INEQ#c.RULE c.EXP#c.RULE c.LEL#c.RULE#c.IV c.FA#c.RULE#c.IV c.LVUL#c.RULE#c.IV c.INEQ#c.RULE#c.IV c.EXP#c.RULE#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_iv_rule.png, as(png) replace
quietly: margins, dydx(FA) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_iv_rule.png, as(png) replace
quietly: margins, dydx(LVUL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_iv_rule.png, as(png) replace
quietly: margins, dydx(INEQ) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_iv_rule.png, as(png) replace
quietly: margins, dydx(EXP) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_iv_rule.png, as(png) replace
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

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP IV VOICE c.LEL#c.IV c.FA#c.IV c.LVUL#c.IV c.INEQ#c.IV c.EXP#c.IV c.LEL#c.VOICE c.FA#c.VOICE c.LVUL#c.VOICE c.INEQ#c.VOICE c.EXP#c.VOICE c.LEL#c.VOICE#c.IV c.FA#c.VOICE#c.IV c.LVUL#c.VOICE#c.IV c.INEQ#c.VOICE#c.IV c.EXP#c.VOICE#c.IV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_iv_voice.png, as(png) replace
quietly: margins, dydx(FA) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_iv_voice.png, as(png) replace
quietly: margins, dydx(LVUL) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_iv_voice.png, as(png) replace
quietly: margins, dydx(INEQ) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_iv_voice.png, as(png) replace
quietly: margins, dydx(EXP) at(IV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_iv_voice.png, as(png) replace
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

