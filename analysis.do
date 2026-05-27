* ============================================================
* The Effect of Having Children in the Household on 
* Time Spent at Paid Work
* Author: Samuel Boos
* University of Massachusetts Dartmouth
* Data: American Time Use Survey (ATUS), 2010-2018
* ============================================================

* ---- Load data ----
* Update this path to match your local directory
use "(update this path for your local directory)/atus_s20-1.dta"

* ---- Inspect variables ----
describe act_work female children married age educ
summarize act_work female children married age educ

* ---- Generate age squared ----
gen age2 = age^2

* ---- Summary statistics ----
sum female children married age educ fullpart

* ---- Check employment type distribution ----
tab fullpart

* ---- Basic model (no controls) ----
reg act_work female children fem_kids
reg act_work female fem_kids children

* ---- Full sample OLS with robust standard errors ----
reg act_work female fem_kids children married age educ age2, robust

* ---- Check multicollinearity ----
estat vif

* ---- Joint significance test ----
test female fem_kids children

* ---- Heteroskedasticity tests — Breusch-Pagan ----
* Run without robust SE first to get valid test statistic
reg act_work female fem_kids children married age educ age2
estat hettest

* Full-time subsample
reg act_work female fem_kids children married age educ age2 if fullpart == 1
estat hettest

* Part-time subsample
reg act_work female fem_kids children married age educ age2 if fullpart == 2
estat hettest

* ---- White test for heteroskedasticity ----
reg act_work female fem_kids children married age educ age2
estat imtest, white

reg act_work female fem_kids children married age educ age2 if fullpart == 1
estat imtest, white

reg act_work female fem_kids children married age educ age2 if fullpart == 2
estat imtest, white

* ---- VIF check for part-time subsample ----
reg act_work female children fem_kids married age educ age2 if fullpart == 2
estat vif

* ---- Store estimates for all four specifications ----
* Basic model
reg act_work female fem_kids children, robust
estimates store basic

* Full sample with controls
reg act_work female fem_kids children married age educ age2, robust
estimates store fullsample

* Full-time workers only
reg act_work female fem_kids children married age educ age2 if fullpart == 1, robust
estimates store fulltime

* Part-time workers only
reg act_work female fem_kids children married age educ age2 if fullpart == 2, robust
estimates store parttime

* ---- Export results table ----
esttab basic fullsample fulltime parttime, ///
    b(3) se(3) ///
    star(* 0.10 ** 0.05 *** 0.01) ///
    title("Table 1. OLS Regression Results") ///
    mtitles("Basic" "Full Sample" "Full-Time" "Part-Time") ///
    scalars(N r2 F) sfmt(0 3 2) nogaps