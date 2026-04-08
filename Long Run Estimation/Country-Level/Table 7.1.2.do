clear
 
local dir `c(pwd)'
pwd
use data712.dta

xtset Code Year

gen LSDG712=ln(SDG712)
gen LREN=ln(RenewableElectricityGeneration)
gen LPCI=ln(PerCapitaIncome)

rename FinancialAccess FA
rename PolicyStringency PS
rename UrbanPopulationGrowth URB

cls

// Results for Control of Corruption

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB EV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN EV CORR c.LREN#c.EV c.LREN#c.CORR c.LREN#c.CORR#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA EV CORR c.FA#c.EV c.FA#c.CORR c.FA#c.CORR#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS EV CORR c.PS#c.EV c.PS#c.CORR c.PS#c.CORR#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI EV CORR c.LPCI#c.EV c.LPCI#c.CORR c.LPCI#c.CORR#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB EV CORR c.URB#c.EV c.URB#c.CORR c.URB#c.CORR#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_corr_EV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_corr_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB FV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN FV CORR c.LREN#c.FV c.LREN#c.CORR c.LREN#c.CORR#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA FV CORR c.FA#c.FV c.FA#c.CORR c.FA#c.CORR#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS FV CORR c.PS#c.FV c.PS#c.CORR c.PS#c.CORR#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI FV CORR c.LPCI#c.FV c.LPCI#c.CORR c.LPCI#c.CORR#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB FV CORR c.URB#c.FV c.URB#c.CORR c.URB#c.CORR#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_corr_FV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_corr_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB HELV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN HELV CORR c.LREN#c.HELV c.LREN#c.CORR c.LREN#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA HELV CORR c.FA#c.HELV c.FA#c.CORR c.FA#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS HELV CORR c.PS#c.HELV c.PS#c.CORR c.PS#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI HELV CORR c.LPCI#c.HELV c.LPCI#c.CORR c.LPCI#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB HELV CORR c.URB#c.HELV c.URB#c.CORR c.URB#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_corr_HELV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_corr_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB IV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN IV CORR c.LREN#c.IV c.LREN#c.CORR c.LREN#c.CORR#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA IV CORR c.FA#c.IV c.FA#c.CORR c.FA#c.CORR#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS IV CORR c.PS#c.IV c.PS#c.CORR c.PS#c.CORR#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI IV CORR c.LPCI#c.IV c.LPCI#c.CORR c.LPCI#c.CORR#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB IV CORR c.URB#c.IV c.URB#c.CORR c.URB#c.CORR#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_corr_IV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_corr_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB WV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN WV CORR c.LREN#c.WV c.LREN#c.CORR c.LREN#c.CORR#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA WV CORR c.FA#c.WV c.FA#c.CORR c.FA#c.CORR#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS WV CORR c.PS#c.WV c.PS#c.CORR c.PS#c.CORR#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI WV CORR c.LPCI#c.WV c.LPCI#c.CORR c.LPCI#c.CORR#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB WV CORR c.URB#c.WV c.URB#c.CORR c.URB#c.CORR#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_corr_WV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_corr_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Governance Effectiveness

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB EV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN EV GOVEFF c.LREN#c.EV c.LREN#c.GOVEFF c.LREN#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA EV GOVEFF c.FA#c.EV c.FA#c.GOVEFF c.FA#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS EV GOVEFF c.PS#c.EV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI EV GOVEFF c.LPCI#c.EV c.LPCI#c.GOVEFF c.LPCI#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB EV GOVEFF c.URB#c.EV c.URB#c.GOVEFF c.URB#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_goveff_EV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_goveff_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB FV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN FV GOVEFF c.LREN#c.FV c.LREN#c.GOVEFF c.LREN#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA FV GOVEFF c.FA#c.FV c.FA#c.GOVEFF c.FA#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS FV GOVEFF c.PS#c.FV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI FV GOVEFF c.LPCI#c.FV c.LPCI#c.GOVEFF c.LPCI#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB FV GOVEFF c.URB#c.FV c.URB#c.GOVEFF c.URB#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_goveff_FV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_goveff_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB HELV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN HELV GOVEFF c.LREN#c.HELV c.LREN#c.GOVEFF c.LREN#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA HELV GOVEFF c.FA#c.HELV c.FA#c.GOVEFF c.FA#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS HELV GOVEFF c.PS#c.HELV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI HELV GOVEFF c.LPCI#c.HELV c.LPCI#c.GOVEFF c.LPCI#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB HELV GOVEFF c.URB#c.HELV c.URB#c.GOVEFF c.URB#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_goveff_HELV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_goveff_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB IV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN IV GOVEFF c.LREN#c.IV c.LREN#c.GOVEFF c.LREN#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA IV GOVEFF c.FA#c.IV c.FA#c.GOVEFF c.FA#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS IV GOVEFF c.PS#c.IV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI IV GOVEFF c.LPCI#c.IV c.LPCI#c.GOVEFF c.LPCI#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB IV GOVEFF c.URB#c.IV c.URB#c.GOVEFF c.URB#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_goveff_IV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_goveff_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB WV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN WV GOVEFF c.LREN#c.WV c.LREN#c.GOVEFF c.LREN#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA WV GOVEFF c.FA#c.WV c.FA#c.GOVEFF c.FA#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS WV GOVEFF c.PS#c.WV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI WV GOVEFF c.LPCI#c.WV c.LPCI#c.GOVEFF c.LPCI#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB WV GOVEFF c.URB#c.WV c.URB#c.GOVEFF c.URB#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_goveff_WV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_goveff_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Political Stability

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB EV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN EV POLST c.LREN#c.EV c.LREN#c.POLST c.LREN#c.POLST#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA EV POLST c.FA#c.EV c.FA#c.POLST c.FA#c.POLST#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS EV POLST c.PS#c.EV c.PS#c.POLST c.PS#c.POLST#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI EV POLST c.LPCI#c.EV c.LPCI#c.POLST c.LPCI#c.POLST#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB EV POLST c.URB#c.EV c.URB#c.POLST c.URB#c.POLST#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_polst_EV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_polst_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB FV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN FV POLST c.LREN#c.FV c.LREN#c.POLST c.LREN#c.POLST#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA FV POLST c.FA#c.FV c.FA#c.POLST c.FA#c.POLST#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS FV POLST c.PS#c.FV c.PS#c.POLST c.PS#c.POLST#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI FV POLST c.LPCI#c.FV c.LPCI#c.POLST c.LPCI#c.POLST#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB FV POLST c.URB#c.FV c.URB#c.POLST c.URB#c.POLST#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_polst_FV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_polst_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB HELV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN HELV POLST c.LREN#c.HELV c.LREN#c.POLST c.LREN#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA HELV POLST c.FA#c.HELV c.FA#c.POLST c.FA#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS HELV POLST c.PS#c.HELV c.PS#c.POLST c.PS#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI HELV POLST c.LPCI#c.HELV c.LPCI#c.POLST c.LPCI#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB HELV POLST c.URB#c.HELV c.URB#c.POLST c.URB#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_polst_HELV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_polst_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB IV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN IV POLST c.LREN#c.IV c.LREN#c.POLST c.LREN#c.POLST#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA IV POLST c.FA#c.IV c.FA#c.POLST c.FA#c.POLST#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS IV POLST c.PS#c.IV c.PS#c.POLST c.PS#c.POLST#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI IV POLST c.LPCI#c.IV c.LPCI#c.POLST c.LPCI#c.POLST#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB IV POLST c.URB#c.IV c.URB#c.POLST c.URB#c.POLST#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_polst_IV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_polst_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB WV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN WV POLST c.LREN#c.WV c.LREN#c.POLST c.LREN#c.POLST#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA WV POLST c.FA#c.WV c.FA#c.POLST c.FA#c.POLST#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS WV POLST c.PS#c.WV c.PS#c.POLST c.PS#c.POLST#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI WV POLST c.LPCI#c.WV c.LPCI#c.POLST c.LPCI#c.POLST#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB WV POLST c.URB#c.WV c.URB#c.POLST c.URB#c.POLST#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_polst_WV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_polst_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Regulatory Quality

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB EV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN EV REG c.LREN#c.EV c.LREN#c.REG c.LREN#c.REG#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA EV REG c.FA#c.EV c.FA#c.REG c.FA#c.REG#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS EV REG c.PS#c.EV c.PS#c.REG c.PS#c.REG#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI EV REG c.LPCI#c.EV c.LPCI#c.REG c.LPCI#c.REG#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB EV REG c.URB#c.EV c.URB#c.REG c.URB#c.REG#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_reg_EV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_reg_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB FV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN FV REG c.LREN#c.FV c.LREN#c.REG c.LREN#c.REG#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA FV REG c.FA#c.FV c.FA#c.REG c.FA#c.REG#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS FV REG c.PS#c.FV c.PS#c.REG c.PS#c.REG#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI FV REG c.LPCI#c.FV c.LPCI#c.REG c.LPCI#c.REG#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB FV REG c.URB#c.FV c.URB#c.REG c.URB#c.REG#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_reg_FV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_reg_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB HELV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN HELV REG c.LREN#c.HELV c.LREN#c.REG c.LREN#c.REG#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA HELV REG c.FA#c.HELV c.FA#c.REG c.FA#c.REG#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS HELV REG c.PS#c.HELV c.PS#c.REG c.PS#c.REG#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI HELV REG c.LPCI#c.HELV c.LPCI#c.REG c.LPCI#c.REG#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB HELV REG c.URB#c.HELV c.URB#c.REG c.URB#c.REG#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_reg_HELV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_reg_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB IV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN IV REG c.LREN#c.IV c.LREN#c.REG c.LREN#c.REG#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA IV REG c.FA#c.IV c.FA#c.REG c.FA#c.REG#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS IV REG c.PS#c.IV c.PS#c.REG c.PS#c.REG#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI IV REG c.LPCI#c.IV c.LPCI#c.REG c.LPCI#c.REG#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB IV REG c.URB#c.IV c.URB#c.REG c.URB#c.REG#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_reg_IV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_reg_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB WV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN WV REG c.LREN#c.WV c.LREN#c.REG c.LREN#c.REG#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA WV REG c.FA#c.WV c.FA#c.REG c.FA#c.REG#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS WV REG c.PS#c.WV c.PS#c.REG c.PS#c.REG#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI WV REG c.LPCI#c.WV c.LPCI#c.REG c.LPCI#c.REG#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB WV REG c.URB#c.WV c.URB#c.REG c.URB#c.REG#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_reg_WV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_reg_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Rule of Law

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB EV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN EV RULE c.LREN#c.EV c.LREN#c.RULE c.LREN#c.RULE#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA EV RULE c.FA#c.EV c.FA#c.RULE c.FA#c.RULE#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS EV RULE c.PS#c.EV c.PS#c.RULE c.PS#c.RULE#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI EV RULE c.LPCI#c.EV c.LPCI#c.RULE c.LPCI#c.RULE#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB EV RULE c.URB#c.EV c.URB#c.RULE c.URB#c.RULE#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_rule_EV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_rule_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB FV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN FV RULE c.LREN#c.FV c.LREN#c.RULE c.LREN#c.RULE#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA FV RULE c.FA#c.FV c.FA#c.RULE c.FA#c.RULE#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS FV RULE c.PS#c.FV c.PS#c.RULE c.PS#c.RULE#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI FV RULE c.LPCI#c.FV c.LPCI#c.RULE c.LPCI#c.RULE#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB FV RULE c.URB#c.FV c.URB#c.RULE c.URB#c.RULE#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_rule_FV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_rule_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB HELV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN HELV RULE c.LREN#c.HELV c.LREN#c.RULE c.LREN#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA HELV RULE c.FA#c.HELV c.FA#c.RULE c.FA#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS HELV RULE c.PS#c.HELV c.PS#c.RULE c.PS#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI HELV RULE c.LPCI#c.HELV c.LPCI#c.RULE c.LPCI#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB HELV RULE c.URB#c.HELV c.URB#c.RULE c.URB#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_rule_HELV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_rule_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB IV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN IV RULE c.LREN#c.IV c.LREN#c.RULE c.LREN#c.RULE#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA IV RULE c.FA#c.IV c.FA#c.RULE c.FA#c.RULE#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS IV RULE c.PS#c.IV c.PS#c.RULE c.PS#c.RULE#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI IV RULE c.LPCI#c.IV c.LPCI#c.RULE c.LPCI#c.RULE#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB IV RULE c.URB#c.IV c.URB#c.RULE c.URB#c.RULE#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_rule_IV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_rule_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB WV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN WV RULE c.LREN#c.WV c.LREN#c.RULE c.LREN#c.RULE#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA WV RULE c.FA#c.WV c.FA#c.RULE c.FA#c.RULE#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS WV RULE c.PS#c.WV c.PS#c.RULE c.PS#c.RULE#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI WV RULE c.LPCI#c.WV c.LPCI#c.RULE c.LPCI#c.RULE#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB WV RULE c.URB#c.WV c.URB#c.RULE c.URB#c.RULE#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_rule_WV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_rule_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Voice and Accountability

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB EV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN EV VOICE c.LREN#c.EV c.LREN#c.VOICE c.LREN#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA EV VOICE c.FA#c.EV c.FA#c.VOICE c.FA#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS EV VOICE c.PS#c.EV c.PS#c.VOICE c.PS#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI EV VOICE c.LPCI#c.EV c.LPCI#c.VOICE c.LPCI#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB EV VOICE c.URB#c.EV c.URB#c.VOICE c.URB#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_voice_EV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_voice_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB FV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN FV VOICE c.LREN#c.FV c.LREN#c.VOICE c.LREN#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA FV VOICE c.FA#c.FV c.FA#c.VOICE c.FA#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS FV VOICE c.PS#c.FV c.PS#c.VOICE c.PS#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI FV VOICE c.LPCI#c.FV c.LPCI#c.VOICE c.LPCI#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB FV VOICE c.URB#c.FV c.URB#c.VOICE c.URB#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_voice_FV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_voice_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB HELV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN HELV VOICE c.LREN#c.HELV c.LREN#c.VOICE c.LREN#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA HELV VOICE c.FA#c.HELV c.FA#c.VOICE c.FA#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS HELV VOICE c.PS#c.HELV c.PS#c.VOICE c.PS#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI HELV VOICE c.LPCI#c.HELV c.LPCI#c.VOICE c.LPCI#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB HELV VOICE c.URB#c.HELV c.URB#c.VOICE c.URB#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_voice_HELV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_voice_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB IV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN IV VOICE c.LREN#c.IV c.LREN#c.VOICE c.LREN#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA IV VOICE c.FA#c.IV c.FA#c.VOICE c.FA#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS IV VOICE c.PS#c.IV c.PS#c.VOICE c.PS#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI IV VOICE c.LPCI#c.IV c.LPCI#c.VOICE c.LPCI#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB IV VOICE c.URB#c.IV c.URB#c.VOICE c.URB#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_voice_IV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_voice_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG712 LREN FA PS LPCI URB WV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LREN FA PS LPCI URB) post
		est sto m`i'1
		quietly: reg LSDG712 LREN WV VOICE c.LREN#c.WV c.LREN#c.VOICE c.LREN#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(LREN) post
		est sto m`i'2
		quietly: reg LSDG712 FA WV VOICE c.FA#c.WV c.FA#c.VOICE c.FA#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(FA) post
		est sto m`i'3
		quietly: reg LSDG712 PS WV VOICE c.PS#c.WV c.PS#c.VOICE c.PS#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(PS) post
		est sto m`i'4
		quietly: reg LSDG712 LPCI WV VOICE c.LPCI#c.WV c.LPCI#c.VOICE c.LPCI#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LPCI) post
		est sto m`i'5
		quietly: reg LSDG712 URB WV VOICE c.URB#c.WV c.URB#c.VOICE c.URB#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(URB) post
		est sto m`i'6
}

outreg2 [eq*] using 712_result_voice_WV, dec(4) e(all) append excel
outreg2 [m*] using 712_result_voice_marginal_WV, dec(4) e(all) append excel
drop _est_*
