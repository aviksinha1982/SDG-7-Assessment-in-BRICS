clear
 
local dir `c(pwd)'
pwd
use data731.dta

xtset Code Year

gen LSDG731=ln(SDG731)
gen LINN=ln(EnvironmentalInnovation)
gen LIND=ln(IndustrialShare)
gen LED=ln(EnergyDemand)

qui summ ForeignDirectInvestment
gen FDI = (ForeignDirectInvestment - r(min)) / (r(max) - r(min))

rename PolicyStringency PS

cls

// Results for Control of Corruption

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED EV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS EV CORR c.PS#c.EV c.PS#c.CORR c.PS#c.CORR#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN EV CORR c.LINN#c.EV c.LINN#c.CORR c.LINN#c.CORR#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI EV CORR c.FDI#c.EV c.FDI#c.CORR c.FDI#c.CORR#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND EV CORR c.LIND#c.EV c.LIND#c.CORR c.LIND#c.CORR#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED EV CORR c.LED#c.EV c.LED#c.CORR c.LED#c.CORR#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_corr_EV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_corr_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED FV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS FV CORR c.PS#c.FV c.PS#c.CORR c.PS#c.CORR#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN FV CORR c.LINN#c.FV c.LINN#c.CORR c.LINN#c.CORR#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI FV CORR c.FDI#c.FV c.FDI#c.CORR c.FDI#c.CORR#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND FV CORR c.LIND#c.FV c.LIND#c.CORR c.LIND#c.CORR#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED FV CORR c.LED#c.FV c.LED#c.CORR c.LED#c.CORR#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_corr_FV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_corr_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED HELV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS HELV CORR c.PS#c.HELV c.PS#c.CORR c.PS#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN HELV CORR c.LINN#c.HELV c.LINN#c.CORR c.LINN#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI HELV CORR c.FDI#c.HELV c.FDI#c.CORR c.FDI#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND HELV CORR c.LIND#c.HELV c.LIND#c.CORR c.LIND#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED HELV CORR c.LED#c.HELV c.LED#c.CORR c.LED#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_corr_HELV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_corr_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED IV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS IV CORR c.PS#c.IV c.PS#c.CORR c.PS#c.CORR#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN IV CORR c.LINN#c.IV c.LINN#c.CORR c.LINN#c.CORR#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI IV CORR c.FDI#c.IV c.FDI#c.CORR c.FDI#c.CORR#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND IV CORR c.LIND#c.IV c.LIND#c.CORR c.LIND#c.CORR#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED IV CORR c.LED#c.IV c.LED#c.CORR c.LED#c.CORR#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_corr_IV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_corr_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED WV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS WV CORR c.PS#c.WV c.PS#c.CORR c.PS#c.CORR#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN WV CORR c.LINN#c.WV c.LINN#c.CORR c.LINN#c.CORR#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI WV CORR c.FDI#c.WV c.FDI#c.CORR c.FDI#c.CORR#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND WV CORR c.LIND#c.WV c.LIND#c.CORR c.LIND#c.CORR#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED WV CORR c.LED#c.WV c.LED#c.CORR c.LED#c.CORR#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_corr_WV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_corr_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Governance Effectiveness

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED EV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS EV GOVEFF c.PS#c.EV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN EV GOVEFF c.LINN#c.EV c.LINN#c.GOVEFF c.LINN#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI EV GOVEFF c.FDI#c.EV c.FDI#c.GOVEFF c.FDI#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND EV GOVEFF c.LIND#c.EV c.LIND#c.GOVEFF c.LIND#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED EV GOVEFF c.LED#c.EV c.LED#c.GOVEFF c.LED#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_goveff_EV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_goveff_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED FV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS FV GOVEFF c.PS#c.FV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN FV GOVEFF c.LINN#c.FV c.LINN#c.GOVEFF c.LINN#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI FV GOVEFF c.FDI#c.FV c.FDI#c.GOVEFF c.FDI#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND FV GOVEFF c.LIND#c.FV c.LIND#c.GOVEFF c.LIND#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED FV GOVEFF c.LED#c.FV c.LED#c.GOVEFF c.LED#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_goveff_FV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_goveff_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED HELV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS HELV GOVEFF c.PS#c.HELV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN HELV GOVEFF c.LINN#c.HELV c.LINN#c.GOVEFF c.LINN#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI HELV GOVEFF c.FDI#c.HELV c.FDI#c.GOVEFF c.FDI#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND HELV GOVEFF c.LIND#c.HELV c.LIND#c.GOVEFF c.LIND#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED HELV GOVEFF c.LED#c.HELV c.LED#c.GOVEFF c.LED#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_goveff_HELV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_goveff_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED IV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS IV GOVEFF c.PS#c.IV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN IV GOVEFF c.LINN#c.IV c.LINN#c.GOVEFF c.LINN#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI IV GOVEFF c.FDI#c.IV c.FDI#c.GOVEFF c.FDI#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND IV GOVEFF c.LIND#c.IV c.LIND#c.GOVEFF c.LIND#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED IV GOVEFF c.LED#c.IV c.LED#c.GOVEFF c.LED#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_goveff_IV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_goveff_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED WV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS WV GOVEFF c.PS#c.WV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN WV GOVEFF c.LINN#c.WV c.LINN#c.GOVEFF c.LINN#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI WV GOVEFF c.FDI#c.WV c.FDI#c.GOVEFF c.FDI#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND WV GOVEFF c.LIND#c.WV c.LIND#c.GOVEFF c.LIND#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED WV GOVEFF c.LED#c.WV c.LED#c.GOVEFF c.LED#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_goveff_WV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_goveff_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Political Stability

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED EV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS EV POLST c.PS#c.EV c.PS#c.POLST c.PS#c.POLST#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN EV POLST c.LINN#c.EV c.LINN#c.POLST c.LINN#c.POLST#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI EV POLST c.FDI#c.EV c.FDI#c.POLST c.FDI#c.POLST#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND EV POLST c.LIND#c.EV c.LIND#c.POLST c.LIND#c.POLST#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED EV POLST c.LED#c.EV c.LED#c.POLST c.LED#c.POLST#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_polst_EV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_polst_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED FV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS FV POLST c.PS#c.FV c.PS#c.POLST c.PS#c.POLST#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN FV POLST c.LINN#c.FV c.LINN#c.POLST c.LINN#c.POLST#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI FV POLST c.FDI#c.FV c.FDI#c.POLST c.FDI#c.POLST#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND FV POLST c.LIND#c.FV c.LIND#c.POLST c.LIND#c.POLST#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED FV POLST c.LED#c.FV c.LED#c.POLST c.LED#c.POLST#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_polst_FV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_polst_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED HELV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS HELV POLST c.PS#c.HELV c.PS#c.POLST c.PS#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN HELV POLST c.LINN#c.HELV c.LINN#c.POLST c.LINN#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI HELV POLST c.FDI#c.HELV c.FDI#c.POLST c.FDI#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND HELV POLST c.LIND#c.HELV c.LIND#c.POLST c.LIND#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED HELV POLST c.LED#c.HELV c.LED#c.POLST c.LED#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_polst_HELV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_polst_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED IV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS IV POLST c.PS#c.IV c.PS#c.POLST c.PS#c.POLST#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN IV POLST c.LINN#c.IV c.LINN#c.POLST c.LINN#c.POLST#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI IV POLST c.FDI#c.IV c.FDI#c.POLST c.FDI#c.POLST#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND IV POLST c.LIND#c.IV c.LIND#c.POLST c.LIND#c.POLST#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED IV POLST c.LED#c.IV c.LED#c.POLST c.LED#c.POLST#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_polst_IV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_polst_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED WV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS WV POLST c.PS#c.WV c.PS#c.POLST c.PS#c.POLST#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN WV POLST c.LINN#c.WV c.LINN#c.POLST c.LINN#c.POLST#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI WV POLST c.FDI#c.WV c.FDI#c.POLST c.FDI#c.POLST#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND WV POLST c.LIND#c.WV c.LIND#c.POLST c.LIND#c.POLST#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED WV POLST c.LED#c.WV c.LED#c.POLST c.LED#c.POLST#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_polst_WV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_polst_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Regulatory Quality

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED EV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS EV REG c.PS#c.EV c.PS#c.REG c.PS#c.REG#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN EV REG c.LINN#c.EV c.LINN#c.REG c.LINN#c.REG#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI EV REG c.FDI#c.EV c.FDI#c.REG c.FDI#c.REG#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND EV REG c.LIND#c.EV c.LIND#c.REG c.LIND#c.REG#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED EV REG c.LED#c.EV c.LED#c.REG c.LED#c.REG#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_reg_EV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_reg_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED FV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS FV REG c.PS#c.FV c.PS#c.REG c.PS#c.REG#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN FV REG c.LINN#c.FV c.LINN#c.REG c.LINN#c.REG#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI FV REG c.FDI#c.FV c.FDI#c.REG c.FDI#c.REG#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND FV REG c.LIND#c.FV c.LIND#c.REG c.LIND#c.REG#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED FV REG c.LED#c.FV c.LED#c.REG c.LED#c.REG#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_reg_FV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_reg_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED HELV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS HELV REG c.PS#c.HELV c.PS#c.REG c.PS#c.REG#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN HELV REG c.LINN#c.HELV c.LINN#c.REG c.LINN#c.REG#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI HELV REG c.FDI#c.HELV c.FDI#c.REG c.FDI#c.REG#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND HELV REG c.LIND#c.HELV c.LIND#c.REG c.LIND#c.REG#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED HELV REG c.LED#c.HELV c.LED#c.REG c.LED#c.REG#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_reg_HELV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_reg_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED IV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS IV REG c.PS#c.IV c.PS#c.REG c.PS#c.REG#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN IV REG c.LINN#c.IV c.LINN#c.REG c.LINN#c.REG#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI IV REG c.FDI#c.IV c.FDI#c.REG c.FDI#c.REG#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND IV REG c.LIND#c.IV c.LIND#c.REG c.LIND#c.REG#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED IV REG c.LED#c.IV c.LED#c.REG c.LED#c.REG#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_reg_IV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_reg_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED WV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS WV REG c.PS#c.WV c.PS#c.REG c.PS#c.REG#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN WV REG c.LINN#c.WV c.LINN#c.REG c.LINN#c.REG#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI WV REG c.FDI#c.WV c.FDI#c.REG c.FDI#c.REG#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND WV REG c.LIND#c.WV c.LIND#c.REG c.LIND#c.REG#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED WV REG c.LED#c.WV c.LED#c.REG c.LED#c.REG#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_reg_WV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_reg_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Rule of Law

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED EV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS EV RULE c.PS#c.EV c.PS#c.RULE c.PS#c.RULE#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN EV RULE c.LINN#c.EV c.LINN#c.RULE c.LINN#c.RULE#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI EV RULE c.FDI#c.EV c.FDI#c.RULE c.FDI#c.RULE#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND EV RULE c.LIND#c.EV c.LIND#c.RULE c.LIND#c.RULE#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED EV RULE c.LED#c.EV c.LED#c.RULE c.LED#c.RULE#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_rule_EV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_rule_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED FV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS FV RULE c.PS#c.FV c.PS#c.RULE c.PS#c.RULE#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN FV RULE c.LINN#c.FV c.LINN#c.RULE c.LINN#c.RULE#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI FV RULE c.FDI#c.FV c.FDI#c.RULE c.FDI#c.RULE#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND FV RULE c.LIND#c.FV c.LIND#c.RULE c.LIND#c.RULE#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED FV RULE c.LED#c.FV c.LED#c.RULE c.LED#c.RULE#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_rule_FV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_rule_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED HELV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS HELV RULE c.PS#c.HELV c.PS#c.RULE c.PS#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN HELV RULE c.LINN#c.HELV c.LINN#c.RULE c.LINN#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI HELV RULE c.FDI#c.HELV c.FDI#c.RULE c.FDI#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND HELV RULE c.LIND#c.HELV c.LIND#c.RULE c.LIND#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED HELV RULE c.LED#c.HELV c.LED#c.RULE c.LED#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_rule_HELV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_rule_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED IV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS IV RULE c.PS#c.IV c.PS#c.RULE c.PS#c.RULE#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN IV RULE c.LINN#c.IV c.LINN#c.RULE c.LINN#c.RULE#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI IV RULE c.FDI#c.IV c.FDI#c.RULE c.FDI#c.RULE#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND IV RULE c.LIND#c.IV c.LIND#c.RULE c.LIND#c.RULE#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED IV RULE c.LED#c.IV c.LED#c.RULE c.LED#c.RULE#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_rule_IV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_rule_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED WV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS WV RULE c.PS#c.WV c.PS#c.RULE c.PS#c.RULE#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN WV RULE c.LINN#c.WV c.LINN#c.RULE c.LINN#c.RULE#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI WV RULE c.FDI#c.WV c.FDI#c.RULE c.FDI#c.RULE#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND WV RULE c.LIND#c.WV c.LIND#c.RULE c.LIND#c.RULE#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED WV RULE c.LED#c.WV c.LED#c.RULE c.LED#c.RULE#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_rule_WV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_rule_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Voice and Accountability

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED EV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS EV VOICE c.PS#c.EV c.PS#c.VOICE c.PS#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN EV VOICE c.LINN#c.EV c.LINN#c.VOICE c.LINN#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI EV VOICE c.FDI#c.EV c.FDI#c.VOICE c.FDI#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND EV VOICE c.LIND#c.EV c.LIND#c.VOICE c.LIND#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED EV VOICE c.LED#c.EV c.LED#c.VOICE c.LED#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_voice_EV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_voice_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED FV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS FV VOICE c.PS#c.FV c.PS#c.VOICE c.PS#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN FV VOICE c.LINN#c.FV c.LINN#c.VOICE c.LINN#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI FV VOICE c.FDI#c.FV c.FDI#c.VOICE c.FDI#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND FV VOICE c.LIND#c.FV c.LIND#c.VOICE c.LIND#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED FV VOICE c.LED#c.FV c.LED#c.VOICE c.LED#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_voice_FV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_voice_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED HELV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS HELV VOICE c.PS#c.HELV c.PS#c.VOICE c.PS#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN HELV VOICE c.LINN#c.HELV c.LINN#c.VOICE c.LINN#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI HELV VOICE c.FDI#c.HELV c.FDI#c.VOICE c.FDI#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND HELV VOICE c.LIND#c.HELV c.LIND#c.VOICE c.LIND#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED HELV VOICE c.LED#c.HELV c.LED#c.VOICE c.LED#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_voice_HELV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_voice_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED IV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS IV VOICE c.PS#c.IV c.PS#c.VOICE c.PS#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN IV VOICE c.LINN#c.IV c.LINN#c.VOICE c.LINN#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI IV VOICE c.FDI#c.IV c.FDI#c.VOICE c.FDI#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND IV VOICE c.LIND#c.IV c.LIND#c.VOICE c.LIND#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED IV VOICE c.LED#c.IV c.LED#c.VOICE c.LED#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_voice_IV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_voice_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG731 PS LINN FDI LIND LED WV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(PS LINN FDI LIND LED) post
		est sto m`i'1
		quietly: reg LSDG731 PS WV VOICE c.PS#c.WV c.PS#c.VOICE c.PS#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG731 LINN WV VOICE c.LINN#c.WV c.LINN#c.VOICE c.LINN#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG731 FDI WV VOICE c.FDI#c.WV c.FDI#c.VOICE c.FDI#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FDI) post
		est sto m`i'4
		quietly: reg LSDG731 LIND WV VOICE c.LIND#c.WV c.LIND#c.VOICE c.LIND#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(LIND) post
		est sto m`i'5
		quietly: reg LSDG731 LED WV VOICE c.LED#c.WV c.LED#c.VOICE c.LED#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LED) post
		est sto m`i'6
}

outreg2 [eq*] using 731_result_voice_WV, dec(4) e(all) append excel
outreg2 [m*] using 731_result_voice_marginal_WV, dec(4) e(all) append excel
drop _est_*

