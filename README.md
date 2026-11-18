# UPI / Digital Payments Analytics & Anomaly Monitoring

SQL + dashboard project for **digital payments analytics** — transaction volume, success rates, hourly/merchant patterns, failure reasons, and rule-based anomaly flags.

## Business Problem
Payments platforms need visibility into **throughput and reliability** and quick detection of **anomalies** (unusual high-value bursts, failure spikes) to protect customers and operations.

## Dataset
Synthetic UPI-like transaction data (`data/transactions.csv`, 30,000 rows over 60 days).
- Fields: `txn_id, txn_timestamp, date, hour, amount_inr, merchant_category, payer_bank, payee_bank, channel, status, failure_reason, flag_suspected`

## Key Insights
- **Reliability:** overall/daily success rate and failure-reason breakdown.
- **Usage patterns:** hourly volume/success profile and merchant-category mix.
- **Anomaly monitoring:** suspected high-value/irregular transactions flagged for review.

## Analysis & Dashboard
- `sql/analysis.sql` — KPIs, daily/hourly trends, merchant performance, failure reasons, anomaly summary.
- `dashboard/index.html` — interactive dashboard (Chart.js): KPIs, daily volume & success rate, hourly pattern, category mix, failure reasons.

Open `dashboard/index.html` in a browser to view the dashboard.

## Tools
- SQL (transaction analytics)
- HTML/CSS/JavaScript + Chart.js

## Repo Structure
```
upi-payments-analytics-dashboard/
├── data/transactions.csv
├── sql/analysis.sql
├── dashboard/index.html
└── README.md
```
