/* =========================================================
Business Question:
Which product features create the strongest customer retention?

Purpose:
Analyze feature engagement among retained, auto-renewing
subscriptions to identify features associated with stronger
customer retention.
========================================================= */

SELECT
    f.feature_name,
    COUNT(DISTINCT s.subscription_id) AS retained_subscriptions,
    SUM(f.usage_count) AS total_feature_uses,
    ROUND(AVG(f.usage_duration_secs), 2) AS avg_usage_duration_secs,
    SUM(f.usage_duration_secs) AS total_usage_duration_secs
FROM ravenstack_subscriptions s
INNER JOIN ravenstack_feature_usage f
    ON f.subscription_id = s.subscription_id
WHERE s.churn_flag = 'False'
  AND s.auto_renew_flag = 'True'
GROUP BY f.feature_name
ORDER BY total_usage_duration_secs DESC;
