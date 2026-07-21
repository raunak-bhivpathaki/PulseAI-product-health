-- ==========================================
-- PulseAI
-- Database Validation
-- Author: Raunak Bhivpathaki
-- ==========================================

-- Listing all the tables

SELECT name
FROM sqlite_master
WHERE type = 'table';

-- Validate row counts

SELECT COUNT(*) AS total_accounts
FROM ravenstack_accounts;

SELECT COUNT(*) AS total_subscriptions
FROM ravenstack_subscriptions;

SELECT COUNT(*) AS total_usage_events
FROM ravenstack_feature_usage;

SELECT COUNT(*) AS total_support_tickets
FROM ravenstack_support_tickets;

SELECT COUNT(*) AS total_churn_events
FROM ravenstack_churn_events;
