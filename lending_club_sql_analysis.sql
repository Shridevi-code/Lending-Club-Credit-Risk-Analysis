-- =========================================
-- LENDING CLUB CREDIT RISK ANALYSIS
-- PostgreSQL SQL Queries
-- =========================================

-- Query 1: Total Loans

SELECT COUNT(*) AS total_loans
FROM lending_club_analysis;

-- Query 2: Loan Status Distribution

SELECT loan_status,
COUNT(*) AS loan_count
FROM lending_club_analysis
GROUP BY loan_status;

-- Query 3: Loan Status Percentage

SELECT loan_status,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*) FROM lending_club_analysis),2) AS percentage
FROM lending_club_analysis
GROUP BY loan_status;

-- Query 4: Average Loan Amount by Status

SELECT loan_status,
ROUND(AVG(loan_amnt),2) AS avg_loan_amount
FROM lending_club_analysis
GROUP BY loan_status;

-- Query 5: Average Interest Rate by Status

SELECT loan_status,
ROUND(AVG(int_rate),2) AS avg_interest_rate
FROM lending_club_analysis
GROUP BY loan_status;

-- Query 6: Grade Distribution

SELECT grade,
COUNT(*) AS loans
FROM lending_club_analysis
GROUP BY grade
ORDER BY grade;

-- Query 7: Purpose Distribution

SELECT purpose,
COUNT(*) AS loans
FROM lending_club_analysis
GROUP BY purpose
ORDER BY loans DESC;

-- Query 8: Average Income by Loan Status

SELECT loan_status,
ROUND(AVG(annual_inc),2) AS avg_income
FROM lending_club_analysis
GROUP BY loan_status;

-- Query 9: Average DTI by Loan Status

SELECT loan_status,
ROUND(AVG(dti),2) AS avg_dti
FROM lending_club_analysis
GROUP BY loan_status;

-- Query 10: Top 5 States by Loan Count

SELECT addr_state,
COUNT(*) AS loan_count
FROM lending_club_analysis
GROUP BY addr_state
ORDER BY loan_count DESC
LIMIT 5;

-- Query 11: Home Ownership Distribution

SELECT home_ownership,
COUNT(*) AS borrowers
FROM lending_club_analysis
GROUP BY home_ownership
ORDER BY borrowers DESC;

-- Query 12: Charged Off Loans by Grade

SELECT grade,
COUNT(*) AS charged_off_loans
FROM lending_club_analysis
WHERE loan_status = 'Charged Off'
GROUP BY grade
ORDER BY charged_off_loans DESC;

-- Query 13: Average Loan Amount by Grade

SELECT grade,
ROUND(AVG(loan_amnt),2) AS avg_loan_amount
FROM lending_club_analysis
GROUP BY grade
ORDER BY grade;

-- Query 14: Purposees Having More Than 1000 Loans

SELECT purpose,
COUNT(*) AS loan_count
FROM lending_club_analysis
GROUP BY purpose
HAVING COUNT(*) > 1000
ORDER BY loan_count DESC;

-- Query 15: Income Segmentation

SELECT
CASE
WHEN annual_inc < 50000 THEN 'Low Income'
WHEN annual_inc < 100000 THEN 'Medium Income'
ELSE 'High Income'
END AS income_group,
COUNT(*) AS borrowers
FROM lending_club_analysis
GROUP BY income_group;

-- Query 16: Income Group vs Loan Status

SELECT
CASE
WHEN annual_inc < 50000 THEN 'Low Income'
WHEN annual_inc < 100000 THEN 'Medium Income'
ELSE 'High Income'
END AS income_group,
loan_status,
COUNT(*) AS loans
FROM lending_club_analysis
GROUP BY income_group, loan_status
ORDER BY income_group;

-- Query 17: ROW_NUMBER()

SELECT annual_inc,
ROW_NUMBER() OVER(
ORDER BY annual_inc DESC
) AS row_num
FROM lending_club_analysis
LIMIT 10;

-- Query 18: RANK()

SELECT annual_inc,
RANK() OVER(
ORDER BY annual_inc DESC
) AS income_rank
FROM lending_club_analysis
LIMIT 10;
