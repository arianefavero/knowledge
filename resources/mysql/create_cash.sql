CREATE TABLE `cash_user` (
  `id` varchar(256) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `wallet` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cash_user_1_idx` (`user_id`),
  CONSTRAINT `fk_cash_user_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

