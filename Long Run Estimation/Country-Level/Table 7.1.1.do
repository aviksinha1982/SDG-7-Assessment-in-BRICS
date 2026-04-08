clear
 
local dir `c(pwd)'
pwd
use data711.dta

xtset Code Year

gen LSDG711=ln(SDG711)
gen LEL=ln(ElectricityGenerationPerCapit)

rename FinancialAccess FA
rename HealthExpenditure EXP
rename IncomeInequality INEQ

rename RuralPopulationGrowth LVUL

cls

// Results for Control of Corruption

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP EV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL EV CORR c.LEL#c.EV c.LEL#c.CORR c.LEL#c.CORR#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA EV CORR c.FA#c.EV c.FA#c.CORR c.FA#c.CORR#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL EV CORR c.LVUL#c.EV c.LVUL#c.CORR c.LVUL#c.CORR#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ EV CORR c.INEQ#c.EV c.INEQ#c.CORR c.INEQ#c.CORR#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP EV CORR c.EXP#c.EV c.EXP#c.CORR c.EXP#c.CORR#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_corr_EV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_corr_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP FV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL FV CORR c.LEL#c.FV c.LEL#c.CORR c.LEL#c.CORR#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA FV CORR c.FA#c.FV c.FA#c.CORR c.FA#c.CORR#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL FV CORR c.LVUL#c.FV c.LVUL#c.CORR c.LVUL#c.CORR#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ FV CORR c.INEQ#c.FV c.INEQ#c.CORR c.INEQ#c.CORR#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP FV CORR c.EXP#c.FV c.EXP#c.CORR c.EXP#c.CORR#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_corr_FV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_corr_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP HELV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL HELV CORR c.LEL#c.HELV c.LEL#c.CORR c.LEL#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA HELV CORR c.FA#c.HELV c.FA#c.CORR c.FA#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL HELV CORR c.LVUL#c.HELV c.LVUL#c.CORR c.LVUL#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ HELV CORR c.INEQ#c.HELV c.INEQ#c.CORR c.INEQ#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP HELV CORR c.EXP#c.HELV c.EXP#c.CORR c.EXP#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_corr_HELV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_corr_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP IV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL IV CORR c.LEL#c.IV c.LEL#c.CORR c.LEL#c.CORR#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA IV CORR c.FA#c.IV c.FA#c.CORR c.FA#c.CORR#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL IV CORR c.LVUL#c.IV c.LVUL#c.CORR c.LVUL#c.CORR#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ IV CORR c.INEQ#c.IV c.INEQ#c.CORR c.INEQ#c.CORR#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP IV CORR c.EXP#c.IV c.EXP#c.CORR c.EXP#c.CORR#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_corr_IV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_corr_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP WV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL WV CORR c.LEL#c.WV c.LEL#c.CORR c.LEL#c.CORR#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA WV CORR c.FA#c.WV c.FA#c.CORR c.FA#c.CORR#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL WV CORR c.LVUL#c.WV c.LVUL#c.CORR c.LVUL#c.CORR#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ WV CORR c.INEQ#c.WV c.INEQ#c.CORR c.INEQ#c.CORR#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP WV CORR c.EXP#c.WV c.EXP#c.CORR c.EXP#c.CORR#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_corr_WV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_corr_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Governance Effectiveness

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP EV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL EV GOVEFF c.LEL#c.EV c.LEL#c.GOVEFF c.LEL#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA EV GOVEFF c.FA#c.EV c.FA#c.GOVEFF c.FA#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL EV GOVEFF c.LVUL#c.EV c.LVUL#c.GOVEFF c.LVUL#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ EV GOVEFF c.INEQ#c.EV c.INEQ#c.GOVEFF c.INEQ#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP EV GOVEFF c.EXP#c.EV c.EXP#c.GOVEFF c.EXP#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_goveff_EV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_goveff_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP FV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL FV GOVEFF c.LEL#c.FV c.LEL#c.GOVEFF c.LEL#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA FV GOVEFF c.FA#c.FV c.FA#c.GOVEFF c.FA#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL FV GOVEFF c.LVUL#c.FV c.LVUL#c.GOVEFF c.LVUL#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ FV GOVEFF c.INEQ#c.FV c.INEQ#c.GOVEFF c.INEQ#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP FV GOVEFF c.EXP#c.FV c.EXP#c.GOVEFF c.EXP#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_goveff_FV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_goveff_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP HELV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL HELV GOVEFF c.LEL#c.HELV c.LEL#c.GOVEFF c.LEL#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA HELV GOVEFF c.FA#c.HELV c.FA#c.GOVEFF c.FA#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL HELV GOVEFF c.LVUL#c.HELV c.LVUL#c.GOVEFF c.LVUL#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ HELV GOVEFF c.INEQ#c.HELV c.INEQ#c.GOVEFF c.INEQ#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP HELV GOVEFF c.EXP#c.HELV c.EXP#c.GOVEFF c.EXP#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_goveff_HELV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_goveff_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP IV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL IV GOVEFF c.LEL#c.IV c.LEL#c.GOVEFF c.LEL#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA IV GOVEFF c.FA#c.IV c.FA#c.GOVEFF c.FA#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL IV GOVEFF c.LVUL#c.IV c.LVUL#c.GOVEFF c.LVUL#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ IV GOVEFF c.INEQ#c.IV c.INEQ#c.GOVEFF c.INEQ#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP IV GOVEFF c.EXP#c.IV c.EXP#c.GOVEFF c.EXP#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_goveff_IV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_goveff_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP WV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL WV GOVEFF c.LEL#c.WV c.LEL#c.GOVEFF c.LEL#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA WV GOVEFF c.FA#c.WV c.FA#c.GOVEFF c.FA#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL WV GOVEFF c.LVUL#c.WV c.LVUL#c.GOVEFF c.LVUL#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ WV GOVEFF c.INEQ#c.WV c.INEQ#c.GOVEFF c.INEQ#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP WV GOVEFF c.EXP#c.WV c.EXP#c.GOVEFF c.EXP#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_goveff_WV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_goveff_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Political Stability

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP EV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL EV POLST c.LEL#c.EV c.LEL#c.POLST c.LEL#c.POLST#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA EV POLST c.FA#c.EV c.FA#c.POLST c.FA#c.POLST#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL EV POLST c.LVUL#c.EV c.LVUL#c.POLST c.LVUL#c.POLST#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ EV POLST c.INEQ#c.EV c.INEQ#c.POLST c.INEQ#c.POLST#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP EV POLST c.EXP#c.EV c.EXP#c.POLST c.EXP#c.POLST#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_polst_EV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_polst_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP FV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL FV POLST c.LEL#c.FV c.LEL#c.POLST c.LEL#c.POLST#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA FV POLST c.FA#c.FV c.FA#c.POLST c.FA#c.POLST#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL FV POLST c.LVUL#c.FV c.LVUL#c.POLST c.LVUL#c.POLST#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ FV POLST c.INEQ#c.FV c.INEQ#c.POLST c.INEQ#c.POLST#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP FV POLST c.EXP#c.FV c.EXP#c.POLST c.EXP#c.POLST#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_polst_FV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_polst_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP HELV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL HELV POLST c.LEL#c.HELV c.LEL#c.POLST c.LEL#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA HELV POLST c.FA#c.HELV c.FA#c.POLST c.FA#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL HELV POLST c.LVUL#c.HELV c.LVUL#c.POLST c.LVUL#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ HELV POLST c.INEQ#c.HELV c.INEQ#c.POLST c.INEQ#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP HELV POLST c.EXP#c.HELV c.EXP#c.POLST c.EXP#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_polst_HELV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_polst_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP IV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL IV POLST c.LEL#c.IV c.LEL#c.POLST c.LEL#c.POLST#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA IV POLST c.FA#c.IV c.FA#c.POLST c.FA#c.POLST#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL IV POLST c.LVUL#c.IV c.LVUL#c.POLST c.LVUL#c.POLST#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ IV POLST c.INEQ#c.IV c.INEQ#c.POLST c.INEQ#c.POLST#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP IV POLST c.EXP#c.IV c.EXP#c.POLST c.EXP#c.POLST#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_polst_IV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_polst_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP WV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL WV POLST c.LEL#c.WV c.LEL#c.POLST c.LEL#c.POLST#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA WV POLST c.FA#c.WV c.FA#c.POLST c.FA#c.POLST#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL WV POLST c.LVUL#c.WV c.LVUL#c.POLST c.LVUL#c.POLST#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ WV POLST c.INEQ#c.WV c.INEQ#c.POLST c.INEQ#c.POLST#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP WV POLST c.EXP#c.WV c.EXP#c.POLST c.EXP#c.POLST#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_polst_WV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_polst_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Regulatory Quality

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP EV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL EV REG c.LEL#c.EV c.LEL#c.REG c.LEL#c.REG#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA EV REG c.FA#c.EV c.FA#c.REG c.FA#c.REG#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL EV REG c.LVUL#c.EV c.LVUL#c.REG c.LVUL#c.REG#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ EV REG c.INEQ#c.EV c.INEQ#c.REG c.INEQ#c.REG#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP EV REG c.EXP#c.EV c.EXP#c.REG c.EXP#c.REG#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_reg_EV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_reg_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP FV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL FV REG c.LEL#c.FV c.LEL#c.REG c.LEL#c.REG#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA FV REG c.FA#c.FV c.FA#c.REG c.FA#c.REG#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL FV REG c.LVUL#c.FV c.LVUL#c.REG c.LVUL#c.REG#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ FV REG c.INEQ#c.FV c.INEQ#c.REG c.INEQ#c.REG#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP FV REG c.EXP#c.FV c.EXP#c.REG c.EXP#c.REG#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_reg_FV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_reg_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP HELV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL HELV REG c.LEL#c.HELV c.LEL#c.REG c.LEL#c.REG#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA HELV REG c.FA#c.HELV c.FA#c.REG c.FA#c.REG#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL HELV REG c.LVUL#c.HELV c.LVUL#c.REG c.LVUL#c.REG#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ HELV REG c.INEQ#c.HELV c.INEQ#c.REG c.INEQ#c.REG#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP HELV REG c.EXP#c.HELV c.EXP#c.REG c.EXP#c.REG#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_reg_HELV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_reg_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP IV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL IV REG c.LEL#c.IV c.LEL#c.REG c.LEL#c.REG#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA IV REG c.FA#c.IV c.FA#c.REG c.FA#c.REG#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL IV REG c.LVUL#c.IV c.LVUL#c.REG c.LVUL#c.REG#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ IV REG c.INEQ#c.IV c.INEQ#c.REG c.INEQ#c.REG#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP IV REG c.EXP#c.IV c.EXP#c.REG c.EXP#c.REG#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_reg_IV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_reg_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP WV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL WV REG c.LEL#c.WV c.LEL#c.REG c.LEL#c.REG#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA WV REG c.FA#c.WV c.FA#c.REG c.FA#c.REG#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL WV REG c.LVUL#c.WV c.LVUL#c.REG c.LVUL#c.REG#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ WV REG c.INEQ#c.WV c.INEQ#c.REG c.INEQ#c.REG#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP WV REG c.EXP#c.WV c.EXP#c.REG c.EXP#c.REG#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_reg_WV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_reg_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Rule of Law

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP EV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL EV RULE c.LEL#c.EV c.LEL#c.RULE c.LEL#c.RULE#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA EV RULE c.FA#c.EV c.FA#c.RULE c.FA#c.RULE#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL EV RULE c.LVUL#c.EV c.LVUL#c.RULE c.LVUL#c.RULE#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ EV RULE c.INEQ#c.EV c.INEQ#c.RULE c.INEQ#c.RULE#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP EV RULE c.EXP#c.EV c.EXP#c.RULE c.EXP#c.RULE#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_rule_EV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_rule_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP FV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL FV RULE c.LEL#c.FV c.LEL#c.RULE c.LEL#c.RULE#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA FV RULE c.FA#c.FV c.FA#c.RULE c.FA#c.RULE#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL FV RULE c.LVUL#c.FV c.LVUL#c.RULE c.LVUL#c.RULE#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ FV RULE c.INEQ#c.FV c.INEQ#c.RULE c.INEQ#c.RULE#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP FV RULE c.EXP#c.FV c.EXP#c.RULE c.EXP#c.RULE#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_rule_FV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_rule_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP HELV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL HELV RULE c.LEL#c.HELV c.LEL#c.RULE c.LEL#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA HELV RULE c.FA#c.HELV c.FA#c.RULE c.FA#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL HELV RULE c.LVUL#c.HELV c.LVUL#c.RULE c.LVUL#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ HELV RULE c.INEQ#c.HELV c.INEQ#c.RULE c.INEQ#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP HELV RULE c.EXP#c.HELV c.EXP#c.RULE c.EXP#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_rule_HELV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_rule_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP IV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL IV RULE c.LEL#c.IV c.LEL#c.RULE c.LEL#c.RULE#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA IV RULE c.FA#c.IV c.FA#c.RULE c.FA#c.RULE#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL IV RULE c.LVUL#c.IV c.LVUL#c.RULE c.LVUL#c.RULE#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ IV RULE c.INEQ#c.IV c.INEQ#c.RULE c.INEQ#c.RULE#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP IV RULE c.EXP#c.IV c.EXP#c.RULE c.EXP#c.RULE#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_rule_IV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_rule_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP WV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL WV RULE c.LEL#c.WV c.LEL#c.RULE c.LEL#c.RULE#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA WV RULE c.FA#c.WV c.FA#c.RULE c.FA#c.RULE#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL WV RULE c.LVUL#c.WV c.LVUL#c.RULE c.LVUL#c.RULE#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ WV RULE c.INEQ#c.WV c.INEQ#c.RULE c.INEQ#c.RULE#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP WV RULE c.EXP#c.WV c.EXP#c.RULE c.EXP#c.RULE#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_rule_WV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_rule_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Voice and Accountability

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP EV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL EV VOICE c.LEL#c.EV c.LEL#c.VOICE c.LEL#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA EV VOICE c.FA#c.EV c.FA#c.VOICE c.FA#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL EV VOICE c.LVUL#c.EV c.LVUL#c.VOICE c.LVUL#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ EV VOICE c.INEQ#c.EV c.INEQ#c.VOICE c.INEQ#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP EV VOICE c.EXP#c.EV c.EXP#c.VOICE c.EXP#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_voice_EV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_voice_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP FV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL FV VOICE c.LEL#c.FV c.LEL#c.VOICE c.LEL#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA FV VOICE c.FA#c.FV c.FA#c.VOICE c.FA#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL FV VOICE c.LVUL#c.FV c.LVUL#c.VOICE c.LVUL#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ FV VOICE c.INEQ#c.FV c.INEQ#c.VOICE c.INEQ#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP FV VOICE c.EXP#c.FV c.EXP#c.VOICE c.EXP#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_voice_FV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_voice_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP HELV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL HELV VOICE c.LEL#c.HELV c.LEL#c.VOICE c.LEL#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA HELV VOICE c.FA#c.HELV c.FA#c.VOICE c.FA#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL HELV VOICE c.LVUL#c.HELV c.LVUL#c.VOICE c.LVUL#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ HELV VOICE c.INEQ#c.HELV c.INEQ#c.VOICE c.INEQ#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP HELV VOICE c.EXP#c.HELV c.EXP#c.VOICE c.EXP#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_voice_HELV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_voice_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP IV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL IV VOICE c.LEL#c.IV c.LEL#c.VOICE c.LEL#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA IV VOICE c.FA#c.IV c.FA#c.VOICE c.FA#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL IV VOICE c.LVUL#c.IV c.LVUL#c.VOICE c.LVUL#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ IV VOICE c.INEQ#c.IV c.INEQ#c.VOICE c.INEQ#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP IV VOICE c.EXP#c.IV c.EXP#c.VOICE c.EXP#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_voice_IV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_voice_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG711 LEL FA LVUL INEQ EXP WV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LEL FA LVUL INEQ EXP) post
		est sto m`i'1
		quietly: reg LSDG711 LEL WV VOICE c.LEL#c.WV c.LEL#c.VOICE c.LEL#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LEL) post
		est sto m`i'2
		quietly: reg LSDG711 FA WV VOICE c.FA#c.WV c.FA#c.VOICE c.FA#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG711 LVUL WV VOICE c.LVUL#c.WV c.LVUL#c.VOICE c.LVUL#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(LVUL) post
		est sto m`i'4
		quietly: reg LSDG711 INEQ WV VOICE c.INEQ#c.WV c.INEQ#c.VOICE c.INEQ#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(INEQ) post
		est sto m`i'5
		quietly: reg LSDG711 EXP WV VOICE c.EXP#c.WV c.EXP#c.VOICE c.EXP#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(EXP) post
		est sto m`i'6
}

outreg2 [eq*] using 711_result_voice_WV, dec(4) e(all) append excel
outreg2 [m*] using 711_result_voice_marginal_WV, dec(4) e(all) append excel
drop _est_*
