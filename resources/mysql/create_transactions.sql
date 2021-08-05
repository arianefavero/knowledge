CREATE TABLE `transactions_cash` (
  `id` varchar(256) NOT NULL,
  `cash_origin` varchar(256) NOT NULL,
  `cash_destiny` varchar(256) NOT NULL,
  `description` text,
  `type_id` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_transactions_cash_1_idx` (`cash_destiny`),
  KEY `fk_transactions_cash_2_idx` (`cash_origin`),
  KEY `fk_transactions_cash_3_idx` (`type_id`),
  CONSTRAINT `fk_transactions_cash_1` FOREIGN KEY (`cash_destiny`) REFERENCES `cash_user` (`id`),
  CONSTRAINT `fk_transactions_cash_2` FOREIGN KEY (`cash_origin`) REFERENCES `cash_user` (`id`),
  CONSTRAINT `fk_transactions_cash_3` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
