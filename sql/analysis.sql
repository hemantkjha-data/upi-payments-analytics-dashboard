-- UPI/Digital Payments Analytics & Anomaly Monitoring
-- Table: transactions(txn_id, txn_timestamp, date, hour, amount_inr, merchant_category, payer_bank, payee_bank, channel, status, failure_reason, flag_suspected)

-- 1) Overall KPIs
SELECT COUNT(*) AS total_txns,
  SUM(CASE WHEN status='Success' THEN 1 ELSE 0 END) AS success_txns,
  ROUND(SUM(CASE WHEN status='Success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS success_rate_pct,
  SUM(amount_inr) AS total_volume_inr,
  ROUND(AVG(amount_inr), 2) AS avg_ticket_inr,
  SUM(CASE WHEN flag_suspected='Yes' THEN 1 ELSE 0 END) AS suspected_anomalies
FROM transactions;

-- 2) Daily volume and success rate trend
SELECT date, COUNT(*) AS txns, SUM(amount_inr) AS volume_inr,
  ROUND(SUM(CASE WHEN status='Success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS success_rate_pct
FROM transactions GROUP BY date ORDER BY date;

-- 3) Hourly pattern (volume & success rate)
SELECT hour, COUNT(*) AS txns,
  ROUND(SUM(CASE WHEN status='Success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS success_rate_pct
FROM transactions GROUP BY hour ORDER BY hour;

-- 4) Merchant category performance
SELECT merchant_category, COUNT(*) AS txns, SUM(amount_inr) AS volume_inr,
  ROUND(SUM(CASE WHEN status='Success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS success_rate_pct
FROM transactions GROUP BY merchant_category ORDER BY txns DESC;

-- 5) Failure reason breakdown & anomaly flags
SELECT failure_reason, COUNT(*) AS failed_txns FROM transactions
WHERE status='Failed' AND failure_reason <> '' GROUP BY failure_reason ORDER BY failed_txns DESC;
