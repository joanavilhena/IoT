-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 10-Jan-2020 às 10:57
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
-- Estrutura da tabela `hubs`
--

CREATE TABLE `hubs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token_hub` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `hubs`
--

INSERT INTO `hubs` (`id`, `user_id`, `token_hub`, `created_at`, `updated_at`) VALUES
(1, 1, 123455, '2020-01-08 22:48:52', '2020-01-08 22:48:52'),
(2, 1, 1111, '2020-01-09 00:46:26', '2020-01-09 00:46:26'),
(3, 1, 4567890, '2020-01-09 00:46:53', '2020-01-09 00:46:53');

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
(197, '2014_10_12_000000_create_users_table', 1),
(198, '2014_10_12_100000_create_password_resets_table', 1),
(199, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(200, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(201, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(202, '2016_06_01_000004_create_oauth_clients_table', 1),
(203, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(204, '2019_08_19_000000_create_failed_jobs_table', 1),
(205, '2019_11_25_190738_create_sensor_data_table', 1),
(206, '2019_12_02_185110_create_todos_table', 1),
(207, '2020_01_08_221714_create_token_hub_table', 1);

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
('0d577761d897625d90917212eab27c4fd605100d31c1fe90db80c26e64bdf78b3df201884fa1350c', 1, 2, NULL, '[]', 0, '2020-01-09 00:52:49', '2020-01-09 00:52:49', '2021-01-09 00:52:49'),
('b702f3f6bf9f905ac83e1ff3d1c9d6db40a3042f2af928006742e55e63eb0a4351550e4626522518', 1, 2, NULL, '[]', 0, '2020-01-08 23:56:07', '2020-01-08 23:56:07', '2021-01-08 23:56:07');

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
(1, NULL, 'Laravel Personal Access Client', 'Tlm4oppa9NXAtaXKILEiSoVk4iDBRrBezwXGPM5e', 'http://localhost', 1, 0, 0, '2020-01-08 23:55:24', '2020-01-08 23:55:24'),
(2, NULL, 'Laravel Password Grant Client', '45lDFPb6sBzwO2DepeBICEPaSz0uWM7ogPah2ZWk', 'http://localhost', 0, 1, 0, '2020-01-08 23:55:24', '2020-01-08 23:55:24');

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
(1, 1, '2020-01-08 23:55:24', '2020-01-08 23:55:24');

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
('68a28ea8edd4c4e3ce8e04b01ecd1ec89da33a4291308dac84d8c42c33b64d5e2346de94b37b2cb7', '0d577761d897625d90917212eab27c4fd605100d31c1fe90db80c26e64bdf78b3df201884fa1350c', 0, '2021-01-09 00:52:49'),
('d65a9f135f2e5dfde741b4143d5bf3f201b456a6efcf3dc1cf4af674551d0e4353aee720cf0dd969', 'b702f3f6bf9f905ac83e1ff3d1c9d6db40a3042f2af928006742e55e63eb0a4351550e4626522518', 0, '2021-01-08 23:56:07');

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
(1, 1, 'luz', 30.00, 40.00, 0, 0.00, 50.00, '2020-01-08 22:51:55', '2020-01-09 00:00:32'),
(2, 1, 'ambtemp', 30.00, 40.00, 0, 10.00, 50.00, '2020-01-08 22:51:55', '2020-01-09 00:00:32'),
(3, 1, 'ambhum', 30.00, 40.00, 0, 10.00, 50.00, '2020-01-08 22:51:55', '2020-01-09 00:00:32'),
(4, 1, 'solotemp', 30.00, 40.00, 0, 10.00, 50.00, '2020-01-08 22:51:55', '2020-01-09 00:00:32'),
(5, 1, 'solohum', 30.00, 40.00, 0, 10.00, 50.00, '2020-01-08 22:51:55', '2020-01-09 00:00:32'),
(6, 1, 'ambco', 30.00, 40.00, 0, 10.00, 50.00, '2020-01-08 22:51:55', '2020-01-09 00:00:32'),
(7, 1, 'luz', 30.00, 1000.00, 0, 0.00, 1000.00, '2020-01-08 23:24:50', '2020-01-09 00:00:32'),
(8, 1, 'luz', 30.00, 40.00, 0, 0.00, 50.00, '2020-01-08 23:45:21', '2020-01-09 00:00:32'),
(9, 1, 'luz', 50.00, 40.00, 0, 0.00, 50.00, '2020-01-08 23:45:28', '2020-01-09 00:00:32'),
(10, 1, 'luz', 30.00, 40.00, 1, 0.00, 50.00, '2020-01-09 00:00:32', '2020-01-09 00:00:32'),
(11, 1, 'ambtemp', 30.00, 40.00, 1, 10.00, 50.00, '2020-01-09 00:00:32', '2020-01-09 00:00:32'),
(12, 1, 'ambhum', 30.00, 40.00, 1, 10.00, 50.00, '2020-01-09 00:00:32', '2020-01-09 00:00:32'),
(13, 1, 'solotemp', 30.00, 40.00, 1, 10.00, 50.00, '2020-01-09 00:00:32', '2020-01-09 00:00:32'),
(14, 1, 'solohum', 30.00, 40.00, 1, 10.00, 50.00, '2020-01-09 00:00:32', '2020-01-09 00:00:32'),
(15, 1, 'ambco', 30.00, 40.00, 1, 10.00, 50.00, '2020-01-09 00:00:32', '2020-01-09 00:00:32'),
(16, 2, 'luz', 30.00, 1000.00, 0, 0.00, 50.00, '2020-01-09 00:58:43', '2020-01-09 00:58:48'),
(17, 2, 'ambtemp', 30.00, 1000.00, 0, 10.00, 1000.00, '2020-01-09 00:58:43', '2020-01-09 00:58:48'),
(18, 2, 'ambhum', 30.00, 1000.00, 0, 10.00, 50.00, '2020-01-09 00:58:43', '2020-01-09 00:58:48'),
(19, 2, 'solotemp', 30.00, 1000.00, 0, 10.00, 50.00, '2020-01-09 00:58:43', '2020-01-09 00:58:48'),
(20, 2, 'solohum', 30.00, 1000.00, 0, 10.00, 50.00, '2020-01-09 00:58:43', '2020-01-09 00:58:48'),
(21, 2, 'ambco', 30.00, 1000.00, 0, 10.00, 50.00, '2020-01-09 00:58:43', '2020-01-09 00:58:48'),
(22, 2, 'luz', 30.00, 1000.00, 1, 0.00, 50.00, '2020-01-09 00:58:48', '2020-01-09 00:58:48'),
(23, 2, 'ambtemp', 30.00, 1000.00, 1, 10.00, 1000.00, '2020-01-09 00:58:48', '2020-01-09 00:58:48'),
(24, 2, 'ambhum', 30.00, 1000.00, 1, 10.00, 50.00, '2020-01-09 00:58:48', '2020-01-09 00:58:48'),
(25, 2, 'solotemp', 30.00, 1000.00, 1, 10.00, 50.00, '2020-01-09 00:58:48', '2020-01-09 00:58:48'),
(26, 2, 'solohum', 30.00, 1000.00, 1, 10.00, 50.00, '2020-01-09 00:58:48', '2020-01-09 00:58:48'),
(27, 2, 'ambco', 30.00, 1000.00, 1, 10.00, 50.00, '2020-01-09 00:58:48', '2020-01-09 00:58:48');

-- --------------------------------------------------------

--
-- Estrutura da tabela `solutions`
--

CREATE TABLE `solutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_hub` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terra` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `water_percentage` double(8,2) NOT NULL,
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

INSERT INTO `solutions` (`id`, `user_id`, `token`, `token_hub`, `terra`, `water_percentage`, `vip`, `sensor_number`, `fan_force`, `water_force`, `created_at`, `updated_at`) VALUES
(1, 2, '4567890', '4567890', 'Umido', 1.00, 1, 6, 0, 1, '2020-01-08 22:51:55', '2020-01-09 01:32:29'),
(2, -1, '4567890d', '4567890', 'Humida', 1.00, 1, 6, 0, 0, '2020-01-09 00:58:43', '2020-01-09 01:01:20');

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
(1, 'tom', '333@sapo.pt', NULL, '$2y$10$MxmaF3bP5Xg59vDvYL8lgOFxST2tTu2liQ23Kv/TMzOEEK93Mm/R.', NULL, '2020-01-08 23:55:54', '2020-01-08 23:55:54');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `hubs`
--
ALTER TABLE `hubs`
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
-- AUTO_INCREMENT de tabela `hubs`
--
ALTER TABLE `hubs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT de tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `solutions`
--
ALTER TABLE `solutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
