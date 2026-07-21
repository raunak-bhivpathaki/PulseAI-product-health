/* Which features may be candidates for redesign, improved onboarding, or retirement? */

SELECT
    f.feature_name,

    COUNT(DISTINCT f.subscription_id) AS subscriptions_using_feature,

    SUM(f.usage_count) AS total_feature_uses,

    ROUND(
        AVG(f.usage_duration_secs),
        2
    ) AS avg_usage_duration_secs,

    SUM(f.usage_duration_secs) AS total_usage_duration_secs,

    SUM(f.error_count) AS total_errors,

    ROUND(
        100.0 * SUM(f.error_count)
        / NULLIF(SUM(f.usage_count), 0),
        2
    ) AS errors_per_100_uses,

    COUNT(
        DISTINCT CASE
            WHEN s.churn_flag = 'False'
            THEN s.subscription_id
        END
    ) AS retained_subscriptions,

    COUNT(
        DISTINCT CASE
            WHEN s.churn_flag = 'True'
            THEN s.subscription_id
        END
    ) AS churned_subscriptions,

    ROUND(
        100.0 *
        COUNT(
            DISTINCT CASE
                WHEN s.churn_flag = 'False'
                THEN s.subscription_id
            END
        )
        / NULLIF(COUNT(DISTINCT f.subscription_id), 0),
        2
    ) AS retention_rate_pct,

    ROUND(
        100.0 *
        COUNT(
            DISTINCT CASE
                WHEN s.churn_flag = 'True'
                THEN s.subscription_id
            END
        )
        / NULLIF(COUNT(DISTINCT f.subscription_id), 0),
        2
    ) AS churn_rate_pct

FROM ravenstack_feature_usage AS f

INNER JOIN ravenstack_subscriptions AS s
    ON s.subscription_id = f.subscription_id

GROUP BY f.feature_name

ORDER BY total_feature_uses ASC;
