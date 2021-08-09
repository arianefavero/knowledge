CREATE TABLE `users` (
  `id` varchar(256) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `document` varchar(14) NOT NULL,
  `document_type` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `document_UNIQUE` (`document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
