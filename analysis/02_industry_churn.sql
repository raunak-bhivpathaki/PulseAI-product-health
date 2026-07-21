/* Which industries have the highest churn rate? */

SELECT 
   industry,
   COUNT(*) AS total_accounts,
  
   SUM(
       CASE
	       WHEN churn_flag = 'True' THEN 1
		   ELSE 0
		 END
	) AS churned_accounts,
	
ROUND(
     100.0 *
	 SUM(
         CASE
	         WHEN churn_flag = 'True' THEN 1
		     ELSE 0
		 END
	) / COUNT(*), 
	2
	) AS churn_rate

FROM ravenstack_accounts
GROUP BY industry
ORDER BY churn_rate DESC;


/* Which industries struggle on which subscription tiers? */

SELECT 
   industry,
   plan_tier,
   
   COUNT(*) AS total_accounts,
  
   SUM(
       CASE
	       WHEN churn_flag = 'True' 
		   THEN 1
		   ELSE 0
		 END
	) AS churned_accounts,
	
ROUND(
     100.0 *
	 SUM(
         CASE
	         WHEN churn_flag = 'True' 
			 THEN 1
		     ELSE 0
		 END
	) / COUNT(*), 
	2
	) AS churn_rate

FROM ravenstack_accounts
GROUP BY 
        industry,
		plan_tier
ORDER BY churn_rate DESC;
