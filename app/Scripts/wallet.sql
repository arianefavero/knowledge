CREATE TABLE `wallet` (
  `id` varchar(256) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `value` float DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cash_user_1_idx` (`user_id`),
  CONSTRAINT `fk_cash_user_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
