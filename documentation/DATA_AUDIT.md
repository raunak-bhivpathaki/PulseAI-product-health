# PulseAI Data Audit

## Dataset Overview

PulseAI uses a synthetic multi-table SaaS dataset containing customer-account, subscription, product-usage, support, and churn-event records.

The fictional company and analytical story used in this portfolio project are independently developed under the LaunchGrid brand.

## Dataset Tables

| Table | Rows | Grain |
|---|---:|---|
| ravenstack_accounts.csv | 500 | One row per customer account |
| ravenstack_subscriptions.csv | 5,000 | One row per subscription record |
| ravenstack_feature_usage.csv | 25,000 | One row per feature-usage event |
| ravenstack_support_tickets.csv | 2,000 | One row per support ticket |
| ravenstack_churn_events.csv | 600 | One row per churn or reactivation event |

## Date Coverage

The dataset contains records from January 2023 through December 2024.

This supports:

- Monthly usage analysis
- Product-adoption trends
- Cohort analysis
- Period-over-period engagement comparisons
- Product Momentum Index development
- Support and churn-event analysis

## Table Relationships

```text
accounts
   │
   ├── subscriptions
   │       └── feature_usage
   │
   ├── support_tickets
   └── churn_events
