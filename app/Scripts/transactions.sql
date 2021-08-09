CREATE TABLE `transactions` (
  `id` varchar(256) NOT NULL,
  `wallet_origin` varchar(256) NOT NULL,
  `wallet_destiny` varchar(256) NOT NULL,
  `transaction_value` float NOT NULL,
  `description` text,
  `type_id` varchar(256) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_transactions_cash_1_idx` (`wallet_destiny`),
  KEY `fk_transactions_cash_2_idx` (`wallet_origin`),
  KEY `fk_transactions_cash_3_idx` (`type_id`),
  CONSTRAINT `fk_transactions_cash_3` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
