select * into loan_copy
from Cleanloan

select * from loan_copy

ALTER TABLE loan_copy
ADD ews_score INT,
    ews_bucket VARCHAR(10)

UPDATE loan_copy
SET ews_score =
    (CASE WHEN Credit_score IS NULL THEN 10
          WHEN credit_score < 580 THEN 25
          WHEN credit_score between 580 and  670 THEN 15
          WHEN credit_score between 671 and 740 THEN 5
          ELSE 0 END
    + CASE WHEN debt_income_ratio IS NULL THEN 10
           WHEN debt_income_ratio >= 0.50 THEN 20
           WHEN debt_income_ratio between 0.35 and 0.50 THEN 10
           ELSE 0 END
    + CASE WHEN income IS NULL OR income=0 THEN 10
           WHEN loan_amount/income > 0.60 THEN 10
           WHEN loan_amount/income between 0.4 and 0.6 THEN 5
           ELSE 0 END
    + CASE WHEN months_employed IS NULL THEN 10
           WHEN months_employed < 12 THEN 10
           WHEN months_employed between 12 and 36 THEN 5
           ELSE 0 END
    + CASE WHEN num_credit_lines >= 3 THEN 10
           WHEN num_credit_lines =2 THEN 5
           ELSE 0 END
    + CASE WHEN interest_rate > 20 THEN 10
           WHEN interest_rate between 12 and 20 THEN 5
           ELSE 0 END
    + CASE WHEN defaulted=1 THEN 30 ELSE 0 END)

UPDATE loan_copy
SET ews_bucket =
    CASE
      WHEN ews_score > 65 THEN 'Red'
      WHEN ews_score between 40 and 65 THEN 'Amber'
      ELSE 'Green'
    END;

    -- Distribution of buckets
SELECT ews_bucket, COUNT(*) AS customers,
       AVG(CAST(defaulted AS FLOAT)) AS default_rate
FROM loan_copy
GROUP BY ews_bucket



-- By segment
SELECT top 12 education, ews_bucket,
       COUNT(*) AS customers,
       AVG(CAST(defaulted AS FLOAT)) AS default_rate
FROM loan_copy
GROUP BY education, ews_bucket
ORDER BY education, ews_bucket

-- Top risky borrowers
SELECT TOP 50 income, loan_amount, credit_score,
       debt_income_ratio, ews_score, ews_bucket
FROM loan_copy
WHERE ews_bucket='Red'
ORDER BY ews_score DESC


