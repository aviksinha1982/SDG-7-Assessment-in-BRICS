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
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV CORR, panels(correlated) c(psar1)
est store eq11
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV CORR c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.CORR c.FA#c.CORR c.LVUL#c.CORR c.INEQ#c.CORR c.EXP#c.CORR c.LEL#c.CORR#c.FV c.FA#c.CORR#c.FV c.LVUL#c.CORR#c.FV c.INEQ#c.CORR#c.FV c.EXP#c.CORR#c.FV, panels(correlated) c(psar1) 
est store eq12
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile1, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV GOVEFF, panels(correlated) c(psar1) 
est store eq21
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV GOVEFF c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.GOVEFF c.FA#c.GOVEFF c.LVUL#c.GOVEFF c.INEQ#c.GOVEFF c.EXP#c.GOVEFF c.LEL#c.GOVEFF#c.FV c.FA#c.GOVEFF#c.FV c.LVUL#c.GOVEFF#c.FV c.INEQ#c.GOVEFF#c.FV c.EXP#c.GOVEFF#c.FV, panels(correlated) c(psar1) 
est store eq22
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile2, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV POLST, panels(correlated) c(psar1)
est store eq31
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV POLST c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.POLST c.FA#c.POLST c.LVUL#c.POLST c.INEQ#c.POLST c.EXP#c.POLST c.LEL#c.POLST#c.FV c.FA#c.POLST#c.FV c.LVUL#c.POLST#c.FV c.INEQ#c.POLST#c.FV c.EXP#c.POLST#c.FV, panels(correlated) c(psar1) 
est store eq32
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile3, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV REG, panels(correlated) c(psar1) 
est store eq41
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV REG c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.REG c.FA#c.REG c.LVUL#c.REG c.INEQ#c.REG c.EXP#c.REG c.LEL#c.REG#c.FV c.FA#c.REG#c.FV c.LVUL#c.REG#c.FV c.INEQ#c.REG#c.FV c.EXP#c.REG#c.FV, panels(correlated) c(psar1) 
est store eq42
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile4, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV RULE, panels(correlated) c(psar1) 
est store eq51
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV RULE c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.RULE c.FA#c.RULE c.LVUL#c.RULE c.INEQ#c.RULE c.EXP#c.RULE c.LEL#c.RULE#c.FV c.FA#c.RULE#c.FV c.LVUL#c.RULE#c.FV c.INEQ#c.RULE#c.FV c.EXP#c.RULE#c.FV, panels(correlated) c(psar1) 
est store eq52
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile5, dec(4) e(all) replace word
drop _est_*

set more off
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV VOICE, panels(correlated) c(psar1) 
est store eq61
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m11
quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV VOICE c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.VOICE c.FA#c.VOICE c.LVUL#c.VOICE c.INEQ#c.VOICE c.EXP#c.VOICE c.LEL#c.VOICE#c.FV c.FA#c.VOICE#c.FV c.LVUL#c.VOICE#c.FV c.INEQ#c.VOICE#c.FV c.EXP#c.VOICE#c.FV, panels(correlated) c(psar1) 
est store eq62
quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
est sto m12
outreg2 [eq* m1*] using myfile6, dec(4) e(all) replace word
drop _est_*


//-----------------------------------------------------------------------//
//plot of dynamic marginal impacts


quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV CORR c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.CORR c.FA#c.CORR c.LVUL#c.CORR c.INEQ#c.CORR c.EXP#c.CORR c.LEL#c.CORR#c.FV c.FA#c.CORR#c.FV c.LVUL#c.CORR#c.FV c.INEQ#c.CORR#c.FV c.EXP#c.CORR#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_fv_corr.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_corr.png, as(png) replace
quietly: margins, dydx(LVUL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_fv_corr.png, as(png) replace
quietly: margins, dydx(INEQ) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_fv_corr.png, as(png) replace
quietly: margins, dydx(EXP) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_fv_corr.png, as(png) replace
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


quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV GOVEFF c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.GOVEFF c.FA#c.GOVEFF c.LVUL#c.GOVEFF c.INEQ#c.GOVEFF c.EXP#c.GOVEFF c.LEL#c.GOVEFF#c.FV c.FA#c.GOVEFF#c.FV c.LVUL#c.GOVEFF#c.FV c.INEQ#c.GOVEFF#c.FV c.EXP#c.GOVEFF#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_fv_goveff.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_goveff.png, as(png) replace
quietly: margins, dydx(LVUL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_fv_goveff.png, as(png) replace
quietly: margins, dydx(INEQ) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_fv_goveff.png, as(png) replace
quietly: margins, dydx(EXP) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_fv_goveff.png, as(png) replace
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

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV POLST c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.POLST c.FA#c.POLST c.LVUL#c.POLST c.INEQ#c.POLST c.EXP#c.POLST c.LEL#c.POLST#c.FV c.FA#c.POLST#c.FV c.LVUL#c.POLST#c.FV c.INEQ#c.POLST#c.FV c.EXP#c.POLST#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_fv_polst.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_polst.png, as(png) replace
quietly: margins, dydx(LVUL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_fv_polst.png, as(png) replace
quietly: margins, dydx(INEQ) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_fv_polst.png, as(png) replace
quietly: margins, dydx(EXP) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_fv_polst.png, as(png) replace
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

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV REG c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.REG c.FA#c.REG c.LVUL#c.REG c.INEQ#c.REG c.EXP#c.REG c.LEL#c.REG#c.FV c.FA#c.REG#c.FV c.LVUL#c.REG#c.FV c.INEQ#c.REG#c.FV c.EXP#c.REG#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_fv_reg.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_reg.png, as(png) replace
quietly: margins, dydx(LVUL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_fv_reg.png, as(png) replace
quietly: margins, dydx(INEQ) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_fv_reg.png, as(png) replace
quietly: margins, dydx(EXP) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_fv_reg.png, as(png) replace
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

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV RULE c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.RULE c.FA#c.RULE c.LVUL#c.RULE c.INEQ#c.RULE c.EXP#c.RULE c.LEL#c.RULE#c.FV c.FA#c.RULE#c.FV c.LVUL#c.RULE#c.FV c.INEQ#c.RULE#c.FV c.EXP#c.RULE#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_fv_rule.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_rule.png, as(png) replace
quietly: margins, dydx(LVUL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_fv_rule.png, as(png) replace
quietly: margins, dydx(INEQ) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_fv_rule.png, as(png) replace
quietly: margins, dydx(EXP) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_fv_rule.png, as(png) replace
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

quietly: xtgls LSDG711 LEL FA LVUL INEQ EXP FV VOICE c.LEL#c.FV c.FA#c.FV c.LVUL#c.FV c.INEQ#c.FV c.EXP#c.FV c.LEL#c.VOICE c.FA#c.VOICE c.LVUL#c.VOICE c.INEQ#c.VOICE c.EXP#c.VOICE c.LEL#c.VOICE#c.FV c.FA#c.VOICE#c.FV c.LVUL#c.VOICE#c.FV c.INEQ#c.VOICE#c.FV c.EXP#c.VOICE#c.FV, panels(correlated) c(psar1) 
quietly: margins, dydx(LEL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lel_fv_voice.png, as(png) replace
quietly: margins, dydx(FA) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_fa_fv_voice.png, as(png) replace
quietly: margins, dydx(LVUL) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_lvul_fv_voice.png, as(png) replace
quietly: margins, dydx(INEQ) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_ineq_fv_voice.png, as(png) replace
quietly: margins, dydx(EXP) at(FV==(0.1(.01)1.0))
marginsplot
graph export myfile_exp_fv_voice.png, as(png) replace
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

