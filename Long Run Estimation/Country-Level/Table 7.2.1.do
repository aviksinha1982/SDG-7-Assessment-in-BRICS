clear
 
local dir `c(pwd)'
pwd
use data721.dta

xtset Code Year

gen LSDG721=ln(SDG721)
gen LINN=ln(EnvironmentalInnovation)

rename PolicyStringency PS
rename FinancialDevelopment FD
rename LowCarbonTrade LCT

qui summ NetEnergyImport
gen NEI = (NetEnergyImport - r(min)) / (r(max) - r(min))

cls

// Results for Control of Corruption

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT EV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS EV CORR c.PS#c.EV c.PS#c.CORR c.PS#c.CORR#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN EV CORR c.LINN#c.EV c.LINN#c.CORR c.LINN#c.CORR#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD EV CORR c.FD#c.EV c.FD#c.CORR c.FD#c.CORR#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI EV CORR c.NEI#c.EV c.NEI#c.CORR c.NEI#c.CORR#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT EV CORR c.LCT#c.EV c.LCT#c.CORR c.LCT#c.CORR#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_corr_EV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_corr_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT FV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS FV CORR c.PS#c.FV c.PS#c.CORR c.PS#c.CORR#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN FV CORR c.LINN#c.FV c.LINN#c.CORR c.LINN#c.CORR#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD FV CORR c.FD#c.FV c.FD#c.CORR c.FD#c.CORR#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI FV CORR c.NEI#c.FV c.NEI#c.CORR c.NEI#c.CORR#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT FV CORR c.LCT#c.FV c.LCT#c.CORR c.LCT#c.CORR#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_corr_FV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_corr_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT HELV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS HELV CORR c.PS#c.HELV c.PS#c.CORR c.PS#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN HELV CORR c.LINN#c.HELV c.LINN#c.CORR c.LINN#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD HELV CORR c.FD#c.HELV c.FD#c.CORR c.FD#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI HELV CORR c.NEI#c.HELV c.NEI#c.CORR c.NEI#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT HELV CORR c.LCT#c.HELV c.LCT#c.CORR c.LCT#c.CORR#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_corr_HELV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_corr_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT IV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS IV CORR c.PS#c.IV c.PS#c.CORR c.PS#c.CORR#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN IV CORR c.LINN#c.IV c.LINN#c.CORR c.LINN#c.CORR#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD IV CORR c.FD#c.IV c.FD#c.CORR c.FD#c.CORR#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI IV CORR c.NEI#c.IV c.NEI#c.CORR c.NEI#c.CORR#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT IV CORR c.LCT#c.IV c.LCT#c.CORR c.LCT#c.CORR#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_corr_IV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_corr_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT WV CORR if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS WV CORR c.PS#c.WV c.PS#c.CORR c.PS#c.CORR#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN WV CORR c.LINN#c.WV c.LINN#c.CORR c.LINN#c.CORR#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD WV CORR c.FD#c.WV c.FD#c.CORR c.FD#c.CORR#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI WV CORR c.NEI#c.WV c.NEI#c.CORR c.NEI#c.CORR#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT WV CORR c.LCT#c.WV c.LCT#c.CORR c.LCT#c.CORR#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_corr_WV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_corr_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Governance Effectiveness

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT EV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS EV GOVEFF c.PS#c.EV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN EV GOVEFF c.LINN#c.EV c.LINN#c.GOVEFF c.LINN#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD EV GOVEFF c.FD#c.EV c.FD#c.GOVEFF c.FD#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI EV GOVEFF c.NEI#c.EV c.NEI#c.GOVEFF c.NEI#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT EV GOVEFF c.LCT#c.EV c.LCT#c.GOVEFF c.LCT#c.GOVEFF#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_goveff_EV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_goveff_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT FV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS FV GOVEFF c.PS#c.FV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN FV GOVEFF c.LINN#c.FV c.LINN#c.GOVEFF c.LINN#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD FV GOVEFF c.FD#c.FV c.FD#c.GOVEFF c.FD#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI FV GOVEFF c.NEI#c.FV c.NEI#c.GOVEFF c.NEI#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT FV GOVEFF c.LCT#c.FV c.LCT#c.GOVEFF c.LCT#c.GOVEFF#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_goveff_FV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_goveff_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT HELV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS HELV GOVEFF c.PS#c.HELV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN HELV GOVEFF c.LINN#c.HELV c.LINN#c.GOVEFF c.LINN#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD HELV GOVEFF c.FD#c.HELV c.FD#c.GOVEFF c.FD#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI HELV GOVEFF c.NEI#c.HELV c.NEI#c.GOVEFF c.NEI#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT HELV GOVEFF c.LCT#c.HELV c.LCT#c.GOVEFF c.LCT#c.GOVEFF#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_goveff_HELV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_goveff_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT IV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS IV GOVEFF c.PS#c.IV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN IV GOVEFF c.LINN#c.IV c.LINN#c.GOVEFF c.LINN#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD IV GOVEFF c.FD#c.IV c.FD#c.GOVEFF c.FD#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI IV GOVEFF c.NEI#c.IV c.NEI#c.GOVEFF c.NEI#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT IV GOVEFF c.LCT#c.IV c.LCT#c.GOVEFF c.LCT#c.GOVEFF#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_goveff_IV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_goveff_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT WV GOVEFF if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS WV GOVEFF c.PS#c.WV c.PS#c.GOVEFF c.PS#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN WV GOVEFF c.LINN#c.WV c.LINN#c.GOVEFF c.LINN#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD WV GOVEFF c.FD#c.WV c.FD#c.GOVEFF c.FD#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI WV GOVEFF c.NEI#c.WV c.NEI#c.GOVEFF c.NEI#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT WV GOVEFF c.LCT#c.WV c.LCT#c.GOVEFF c.LCT#c.GOVEFF#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_goveff_WV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_goveff_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Political Stability

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT EV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS EV POLST c.PS#c.EV c.PS#c.POLST c.PS#c.POLST#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN EV POLST c.LINN#c.EV c.LINN#c.POLST c.LINN#c.POLST#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD EV POLST c.FD#c.EV c.FD#c.POLST c.FD#c.POLST#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI EV POLST c.NEI#c.EV c.NEI#c.POLST c.NEI#c.POLST#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT EV POLST c.LCT#c.EV c.LCT#c.POLST c.LCT#c.POLST#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_polst_EV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_polst_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT FV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS FV POLST c.PS#c.FV c.PS#c.POLST c.PS#c.POLST#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN FV POLST c.LINN#c.FV c.LINN#c.POLST c.LINN#c.POLST#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD FV POLST c.FD#c.FV c.FD#c.POLST c.FD#c.POLST#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI FV POLST c.NEI#c.FV c.NEI#c.POLST c.NEI#c.POLST#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT FV POLST c.LCT#c.FV c.LCT#c.POLST c.LCT#c.POLST#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_polst_FV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_polst_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT HELV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS HELV POLST c.PS#c.HELV c.PS#c.POLST c.PS#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN HELV POLST c.LINN#c.HELV c.LINN#c.POLST c.LINN#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD HELV POLST c.FD#c.HELV c.FD#c.POLST c.FD#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI HELV POLST c.NEI#c.HELV c.NEI#c.POLST c.NEI#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT HELV POLST c.LCT#c.HELV c.LCT#c.POLST c.LCT#c.POLST#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_polst_HELV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_polst_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT IV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS IV POLST c.PS#c.IV c.PS#c.POLST c.PS#c.POLST#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN IV POLST c.LINN#c.IV c.LINN#c.POLST c.LINN#c.POLST#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD IV POLST c.FD#c.IV c.FD#c.POLST c.FD#c.POLST#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI IV POLST c.NEI#c.IV c.NEI#c.POLST c.NEI#c.POLST#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT IV POLST c.LCT#c.IV c.LCT#c.POLST c.LCT#c.POLST#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_polst_IV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_polst_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT WV POLST if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS WV POLST c.PS#c.WV c.PS#c.POLST c.PS#c.POLST#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN WV POLST c.LINN#c.WV c.LINN#c.POLST c.LINN#c.POLST#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD WV POLST c.FD#c.WV c.FD#c.POLST c.FD#c.POLST#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI WV POLST c.NEI#c.WV c.NEI#c.POLST c.NEI#c.POLST#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT WV POLST c.LCT#c.WV c.LCT#c.POLST c.LCT#c.POLST#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_polst_WV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_polst_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Regulatory Quality

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT EV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS EV REG c.PS#c.EV c.PS#c.REG c.PS#c.REG#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN EV REG c.LINN#c.EV c.LINN#c.REG c.LINN#c.REG#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD EV REG c.FD#c.EV c.FD#c.REG c.FD#c.REG#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI EV REG c.NEI#c.EV c.NEI#c.REG c.NEI#c.REG#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT EV REG c.LCT#c.EV c.LCT#c.REG c.LCT#c.REG#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_reg_EV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_reg_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT FV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS FV REG c.PS#c.FV c.PS#c.REG c.PS#c.REG#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN FV REG c.LINN#c.FV c.LINN#c.REG c.LINN#c.REG#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD FV REG c.FD#c.FV c.FD#c.REG c.FD#c.REG#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI FV REG c.NEI#c.FV c.NEI#c.REG c.NEI#c.REG#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT FV REG c.LCT#c.FV c.LCT#c.REG c.LCT#c.REG#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_reg_FV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_reg_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT HELV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS HELV REG c.PS#c.HELV c.PS#c.REG c.PS#c.REG#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN HELV REG c.LINN#c.HELV c.LINN#c.REG c.LINN#c.REG#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD HELV REG c.FD#c.HELV c.FD#c.REG c.FD#c.REG#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI HELV REG c.NEI#c.HELV c.NEI#c.REG c.NEI#c.REG#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT HELV REG c.LCT#c.HELV c.LCT#c.REG c.LCT#c.REG#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_reg_HELV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_reg_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT IV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS IV REG c.PS#c.IV c.PS#c.REG c.PS#c.REG#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN IV REG c.LINN#c.IV c.LINN#c.REG c.LINN#c.REG#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD IV REG c.FD#c.IV c.FD#c.REG c.FD#c.REG#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI IV REG c.NEI#c.IV c.NEI#c.REG c.NEI#c.REG#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT IV REG c.LCT#c.IV c.LCT#c.REG c.LCT#c.REG#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_reg_IV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_reg_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT WV REG if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS WV REG c.PS#c.WV c.PS#c.REG c.PS#c.REG#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN WV REG c.LINN#c.WV c.LINN#c.REG c.LINN#c.REG#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD WV REG c.FD#c.WV c.FD#c.REG c.FD#c.REG#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI WV REG c.NEI#c.WV c.NEI#c.REG c.NEI#c.REG#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT WV REG c.LCT#c.WV c.LCT#c.REG c.LCT#c.REG#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_reg_WV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_reg_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Rule of Law

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT EV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS EV RULE c.PS#c.EV c.PS#c.RULE c.PS#c.RULE#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN EV RULE c.LINN#c.EV c.LINN#c.RULE c.LINN#c.RULE#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD EV RULE c.FD#c.EV c.FD#c.RULE c.FD#c.RULE#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI EV RULE c.NEI#c.EV c.NEI#c.RULE c.NEI#c.RULE#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT EV RULE c.LCT#c.EV c.LCT#c.RULE c.LCT#c.RULE#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_rule_EV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_rule_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT FV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS FV RULE c.PS#c.FV c.PS#c.RULE c.PS#c.RULE#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN FV RULE c.LINN#c.FV c.LINN#c.RULE c.LINN#c.RULE#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD FV RULE c.FD#c.FV c.FD#c.RULE c.FD#c.RULE#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI FV RULE c.NEI#c.FV c.NEI#c.RULE c.NEI#c.RULE#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT FV RULE c.LCT#c.FV c.LCT#c.RULE c.LCT#c.RULE#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_rule_FV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_rule_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT HELV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS HELV RULE c.PS#c.HELV c.PS#c.RULE c.PS#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN HELV RULE c.LINN#c.HELV c.LINN#c.RULE c.LINN#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD HELV RULE c.FD#c.HELV c.FD#c.RULE c.FD#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI HELV RULE c.NEI#c.HELV c.NEI#c.RULE c.NEI#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT HELV RULE c.LCT#c.HELV c.LCT#c.RULE c.LCT#c.RULE#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_rule_HELV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_rule_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT IV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS IV RULE c.PS#c.IV c.PS#c.RULE c.PS#c.RULE#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN IV RULE c.LINN#c.IV c.LINN#c.RULE c.LINN#c.RULE#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD IV RULE c.FD#c.IV c.FD#c.RULE c.FD#c.RULE#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI IV RULE c.NEI#c.IV c.NEI#c.RULE c.NEI#c.RULE#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT IV RULE c.LCT#c.IV c.LCT#c.RULE c.LCT#c.RULE#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_rule_IV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_rule_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT WV RULE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS WV RULE c.PS#c.WV c.PS#c.RULE c.PS#c.RULE#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN WV RULE c.LINN#c.WV c.LINN#c.RULE c.LINN#c.RULE#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD WV RULE c.FD#c.WV c.FD#c.RULE c.FD#c.RULE#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI WV RULE c.NEI#c.WV c.NEI#c.RULE c.NEI#c.RULE#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT WV RULE c.LCT#c.WV c.LCT#c.RULE c.LCT#c.RULE#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_rule_WV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_rule_marginal_WV, dec(4) e(all) append excel
drop _est_*

// Results for Voice and Accountability

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT EV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS EV VOICE c.PS#c.EV c.PS#c.VOICE c.PS#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN EV VOICE c.LINN#c.EV c.LINN#c.VOICE c.LINN#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD EV VOICE c.FD#c.EV c.FD#c.VOICE c.FD#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI EV VOICE c.NEI#c.EV c.NEI#c.VOICE c.NEI#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT EV VOICE c.LCT#c.EV c.LCT#c.VOICE c.LCT#c.VOICE#c.EV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_voice_EV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_voice_marginal_EV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT FV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS FV VOICE c.PS#c.FV c.PS#c.VOICE c.PS#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN FV VOICE c.LINN#c.FV c.LINN#c.VOICE c.LINN#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD FV VOICE c.FD#c.FV c.FD#c.VOICE c.FD#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI FV VOICE c.NEI#c.FV c.NEI#c.VOICE c.NEI#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT FV VOICE c.LCT#c.FV c.LCT#c.VOICE c.LCT#c.VOICE#c.FV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_voice_FV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_voice_marginal_FV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT HELV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS HELV VOICE c.PS#c.HELV c.PS#c.VOICE c.PS#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN HELV VOICE c.LINN#c.HELV c.LINN#c.VOICE c.LINN#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD HELV VOICE c.FD#c.HELV c.FD#c.VOICE c.FD#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI HELV VOICE c.NEI#c.HELV c.NEI#c.VOICE c.NEI#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT HELV VOICE c.LCT#c.HELV c.LCT#c.VOICE c.LCT#c.VOICE#c.HELV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_voice_HELV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_voice_marginal_HELV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT IV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS IV VOICE c.PS#c.IV c.PS#c.VOICE c.PS#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN IV VOICE c.LINN#c.IV c.LINN#c.VOICE c.LINN#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD IV VOICE c.FD#c.IV c.FD#c.VOICE c.FD#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI IV VOICE c.NEI#c.IV c.NEI#c.VOICE c.NEI#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT IV VOICE c.LCT#c.IV c.LCT#c.VOICE c.LCT#c.VOICE#c.IV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_voice_IV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_voice_marginal_IV, dec(4) e(all) append excel
drop _est_*

forvalues i = 1(1)5 {
		set more off
		quietly: reg LSDG721 LINN PS FD NEI LCT WV VOICE if Code==`i', robust
		est sto eq`i'1
		quietly: margins, dydx(LINN PS FD NEI LCT) post
		est sto m`i'1
		quietly: reg LSDG721 PS WV VOICE c.PS#c.WV c.PS#c.VOICE c.PS#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'2
		quietly: margins, dydx(PS) post
		est sto m`i'2
		quietly: reg LSDG721 LINN WV VOICE c.LINN#c.WV c.LINN#c.VOICE c.LINN#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'3
		quietly: margins, dydx(LINN) post
		est sto m`i'3
		quietly: reg LSDG721 FD WV VOICE c.FD#c.WV c.FD#c.VOICE c.FD#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'4
		quietly: margins, dydx(FD) post
		est sto m`i'4
		quietly: reg LSDG721 NEI WV VOICE c.NEI#c.WV c.NEI#c.VOICE c.NEI#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'5
		quietly: margins, dydx(NEI) post
		est sto m`i'5
		quietly: reg LSDG721 LCT WV VOICE c.LCT#c.WV c.LCT#c.VOICE c.LCT#c.VOICE#c.WV if Code==`i', robust
		est store eq`i'6
		quietly: margins, dydx(LCT) post
		est sto m`i'6
}

outreg2 [eq*] using 721_result_voice_WV, dec(4) e(all) append excel
outreg2 [m*] using 721_result_voice_marginal_WV, dec(4) e(all) append excel
drop _est_*
