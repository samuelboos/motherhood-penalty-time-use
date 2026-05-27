# The Effect of Having Children in the Household on Time Spent at Paid Work

**Samuel Boos** | Economics | University of Massachusetts Dartmouth | 2026

---

## Abstract

This paper examines how having children in the household affects daily time 
spent in paid work and whether this effect differs by gender. Using 78,093 
observations from the American Time Use Survey (ATUS, 2010–2018), I estimate 
OLS regression models of daily paid work minutes on a female indicator, a 
children indicator, and a female-by-children interaction term, controlling for 
age, age squared, educational attainment, and marital status.

The interaction term is negative and statistically significant across all 
specifications. In the full sample, mothers work approximately 71 fewer minutes 
per day than fathers. When stratified by employment type, the within-group 
penalty compresses to approximately 18–20 minutes, suggesting roughly 70% of 
the overall gap operates through maternal selection into part-time employment 
rather than within-group hours reductions.

---

## Key Findings

- **Full sample motherhood penalty:** ~71 minutes per day
- **Full-time workers penalty:** ~18 minutes per day  
- **Part-time workers penalty:** ~20 minutes per day
- **Fatherhood premium:** ~20 minutes per day in full sample, disappears 
  among full-time workers
- **Employment type sorting:** accounts for approximately 70% of the 
  overall daily gap between mothers and fathers

---

## Data

**Source:** American Time Use Survey (ATUS), U.S. Bureau of Labor Statistics  
**Years:** 2010–2018  
**Sample:** 78,093 working-age adults (ages 18–64) in the labor force  
**Dependent variable:** Total minutes spent in paid work on the diary day  

Key variables:
- `act_work` — total daily paid work minutes
- `female` — binary indicator for female respondents
- `children` — binary indicator for presence of child under 18 in household
- `fem_kids` — interaction term (female × children)
- Controls: age, age squared, education, marital status, employment type

---

## Methods

1. OLS regression with heteroskedasticity-robust standard errors
2. Heteroskedasticity confirmed via Breusch-Pagan and White tests
3. Ramsey RESET test for model specification
4. Sample stratification by employment type (full-time vs part-time)
5. Interaction term decomposition to identify within-group vs sorting effects

---

## Repository Structure
