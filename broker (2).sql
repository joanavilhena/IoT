-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 08-Jan-2020 às 21:15
-- Versão do servidor: 5.7.27-0ubuntu0.18.04.1
-- versão do PHP: 7.2.22-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `broker`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(155, '2014_10_12_000000_create_users_table', 1),
(156, '2014_10_12_100000_create_password_resets_table', 1),
(157, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(158, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(159, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(160, '2016_06_01_000004_create_oauth_clients_table', 1),
(161, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(162, '2019_08_19_000000_create_failed_jobs_table', 1),
(163, '2019_11_25_190738_create_sensor_data_table', 1),
(164, '2019_12_02_185110_create_todos_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('31f4a2395d4450a15162db892fd3f732c3bb23bebd849a12c05e78c14c13590facaa793c971329f6', 1, 2, NULL, '[]', 0, '2020-01-05 02:02:10', '2020-01-05 02:02:10', '2021-01-05 02:02:10'),
('3508b5bc4bff96e809d8bacead38876654158de9753b9c30d64ce63721a4aa14ace781fa040117ee', 1, 2, NULL, '[]', 0, '2020-01-05 01:54:43', '2020-01-05 01:54:43', '2021-01-05 01:54:43'),
('7926a97882dad3e50ed1aa4db916337dfa65f6a621fef844a6a8294a312d01397af3ed165217b720', 2, 2, NULL, '[]', 0, '2020-01-08 21:02:23', '2020-01-08 21:02:23', '2021-01-08 21:02:23'),
('f14134a8952ca7edfba59cdca248b4668f5fdb0d69435a2c7e50535d0c103050b1e7be262b9cd01d', 1, 2, NULL, '[]', 0, '2020-01-05 01:48:55', '2020-01-05 01:48:55', '2021-01-05 01:48:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '2Dbm5iLdpCHUkoRZWRZeqKWJMW5CjikEexYAWaqm', 'http://localhost', 1, 0, 0, '2020-01-08 21:01:47', '2020-01-08 21:01:47'),
(2, NULL, 'Laravel Password Grant Client', 'Q07PWdvwcGeSRC3ANJVK4U8uRs4JwsoKSwLZCkTt', 'http://localhost', 0, 1, 0, '2020-01-08 21:01:47', '2020-01-08 21:01:47');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-01-05 01:48:15', '2020-01-05 01:48:15'),
(2, 1, '2020-01-08 21:01:47', '2020-01-08 21:01:47');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('34dc68f8fe40f11e5211c70a6cefbe2c6c87f6e2eea59e12604698b59df2adbdd6c9609c8545cfb1', 'f14134a8952ca7edfba59cdca248b4668f5fdb0d69435a2c7e50535d0c103050b1e7be262b9cd01d', 0, '2021-01-05 01:48:55'),
('4d6dfbd7ed8cd126b7577d6155a669184c97e9e249792e3df33a75538cce38703651517d643bc68a', '31f4a2395d4450a15162db892fd3f732c3bb23bebd849a12c05e78c14c13590facaa793c971329f6', 0, '2021-01-05 02:02:10'),
('5aea289c0f0ab6e9073bb44b8b7d23204a63c34c40d25efd33cd4ff0f58695c8a4273bf9ea1dedaa', '7926a97882dad3e50ed1aa4db916337dfa65f6a621fef844a6a8294a312d01397af3ed165217b720', 0, '2021-01-08 21:02:23'),
('e3408e888f0fd42968dd9aeb0f6c563d0e08dc9267968aa78508aea27ceea12fc6dc6cc480be1084', '3508b5bc4bff96e809d8bacead38876654158de9753b9c30d64ce63721a4aa14ace781fa040117ee', 0, '2021-01-05 01:54:43');

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sensor_data`
--

CREATE TABLE `sensor_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `solution_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double(8,2) NOT NULL,
  `threshold` double(8,2) NOT NULL,
  `most_recent` int(11) NOT NULL,
  `min_value` double(8,2) NOT NULL,
  `max_value` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sensor_data`
--

INSERT INTO `sensor_data` (`id`, `solution_id`, `name`, `value`, `threshold`, `most_recent`, `min_value`, `max_value`, `created_at`, `updated_at`) VALUES
(1, 1, 'luz', 30.00, 0.00, 0, 0.00, 50.00, '2020-01-05 01:08:44', '2020-01-08 21:13:39'),
(2, 1, 'ambtemp', 30.00, 0.00, 0, 10.00, 1000.00, '2020-01-05 01:08:44', '2020-01-08 21:13:39'),
(3, 1, 'ambhum', 30.00, 0.00, 0, 10.00, 50.00, '2020-01-05 01:08:44', '2020-01-08 21:13:39'),
(4, 1, 'solotemp', 30.00, 0.00, 0, 10.00, 50.00, '2020-01-05 01:08:44', '2020-01-08 21:13:39'),
(5, 1, 'solohum', 30.00, 0.00, 0, 10.00, 50.00, '2020-01-05 01:08:44', '2020-01-08 21:13:39'),
(6, 1, 'ambco', 30.00, 0.00, 0, 10.00, 50.00, '2020-01-05 01:08:44', '2020-01-08 21:13:39'),
(7, 1, 'luz', 30.00, 1000.00, 0, 0.00, 50.00, '2020-01-05 01:09:03', '2020-01-08 21:13:39'),
(8, 1, 'ambtemp', 30.00, 1000.00, 0, 10.00, 1000.00, '2020-01-05 01:09:03', '2020-01-08 21:13:39'),
(9, 1, 'ambhum', 30.00, 1000.00, 0, 10.00, 50.00, '2020-01-05 01:09:03', '2020-01-08 21:13:39'),
(10, 1, 'solotemp', 30.00, 1000.00, 0, 10.00, 50.00, '2020-01-05 01:09:03', '2020-01-08 21:13:39'),
(11, 1, 'solohum', 30.00, 1000.00, 0, 10.00, 50.00, '2020-01-05 01:09:03', '2020-01-08 21:13:39'),
(12, 1, 'ambco', 30.00, 1000.00, 0, 10.00, 50.00, '2020-01-05 01:09:03', '2020-01-08 21:13:39'),
(13, 1, 'luz', 30.00, 40.00, 1, 0.00, 50.00, '2020-01-08 21:13:39', '2020-01-08 21:13:39'),
(14, 1, 'ambtemp', 30.00, 40.00, 1, 10.00, 50.00, '2020-01-08 21:13:39', '2020-01-08 21:13:39'),
(15, 1, 'ambhum', 30.00, 40.00, 1, 10.00, 50.00, '2020-01-08 21:13:39', '2020-01-08 21:13:39'),
(16, 1, 'solotemp', 30.00, 40.00, 1, 10.00, 50.00, '2020-01-08 21:13:39', '2020-01-08 21:13:39'),
(17, 1, 'solohum', 30.00, 40.00, 1, 10.00, 50.00, '2020-01-08 21:13:39', '2020-01-08 21:13:39'),
(18, 1, 'ambco', 30.00, 40.00, 1, 10.00, 50.00, '2020-01-08 21:13:39', '2020-01-08 21:13:39');

-- --------------------------------------------------------

--
-- Estrutura da tabela `solutions`
--

CREATE TABLE `solutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terra` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vip` int(11) NOT NULL,
  `sensor_number` int(11) NOT NULL,
  `fan_force` int(11) NOT NULL,
  `water_force` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `solutions`
--

INSERT INTO `solutions` (`id`, `user_id`, `token`, `terra`, `vip`, `sensor_number`, `fan_force`, `water_force`, `created_at`, `updated_at`) VALUES
(1, 1, '4567890', 'Umido', 1, 6, 0, 0, '2020-01-05 01:07:22', '2020-01-08 21:13:39');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tomas Oliveira', 'ml@sapo.pt', NULL, '$2y$10$BGN7hvUoooBhh6C2PY..7uEdJl4l2ZZhqYm7HnzW7/AvoRltqDv8q', NULL, '2020-01-05 01:47:24', '2020-01-05 01:47:24'),
(2, 'Tomas Oliveira', '3333@sapo.pt', NULL, '$2y$10$O3C.jaKfr.H/5mwc1z8vPe7wA/oMZQ9NWzZG/ZxoTNEQRQw6Xlrli', NULL, '2020-01-08 21:02:15', '2020-01-08 21:02:15');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Índices para tabela `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Índices para tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Índices para tabela `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `solutions`
--
ALTER TABLE `solutions`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT de tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `solutions`
--
ALTER TABLE `solutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
