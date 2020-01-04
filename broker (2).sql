-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 04-Jan-2020 às 01:27
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
(87, '2014_10_12_000000_create_users_table', 1),
(88, '2014_10_12_100000_create_password_resets_table', 1),
(89, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(90, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(91, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(92, '2016_06_01_000004_create_oauth_clients_table', 1),
(93, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(94, '2019_08_19_000000_create_failed_jobs_table', 1),
(95, '2019_11_25_190738_create_sensor_data_table', 1),
(96, '2019_12_02_185110_create_todos_table', 1);

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
  `most_recent` int(11) NOT NULL,
  `min_value` double(8,2) NOT NULL,
  `max_value` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sensor_data`
--

INSERT INTO `sensor_data` (`id`, `solution_id`, `name`, `value`, `most_recent`, `min_value`, `max_value`, `created_at`, `updated_at`) VALUES
(2, 1, 'Wather Level', 30.00, 0, 10.00, 50.00, '2020-01-03 21:01:06', '2020-01-03 21:50:33'),
(3, 1, 'Wather Levels', 30.00, 0, 10.00, 50.00, '2020-01-03 21:01:06', '2020-01-03 21:49:48'),
(4, 2, 'Oxigenio', 30.00, 0, 15.00, 50.00, '2020-01-03 21:01:24', '2020-01-03 21:54:59'),
(5, 2, 'Wather Level', 30.00, 0, 10.00, 50.00, '2020-01-03 21:01:24', '2020-01-03 21:55:58'),
(6, 2, 'Wather Levels', 30.00, 0, 10.00, 50.00, '2020-01-03 21:01:24', '2020-01-03 21:51:47'),
(7, 2, 'Wather Levels', 300.00, 0, 10.00, 50.00, '2020-01-03 21:07:31', '2020-01-03 21:51:47'),
(8, 1, 'Wather Level', 30.00, 0, 10.00, 500.00, '2020-01-03 21:19:32', '2020-01-03 21:50:33'),
(9, 2, 'Wather Levels', 300.00, 0, 10.00, 500.00, '2020-01-03 21:19:39', '2020-01-03 21:51:47'),
(10, 1, 'Wather Level', 30.00, 0, 10.00, 5.00, '2020-01-03 21:22:39', '2020-01-03 21:50:33'),
(11, 1, 'Wather Levels', 30.00, 0, 10.00, 500.00, '2020-01-03 21:30:53', '2020-01-03 21:49:48'),
(12, 1, 'Wather Level', 30.00, 0, 10.00, 7.00, '2020-01-03 21:30:58', '2020-01-03 21:50:33'),
(13, 1, 'Wather Levels', 30.00, 0, 10.00, 6.00, '2020-01-03 21:33:48', '2020-01-03 21:49:48'),
(14, 2, 'Oxigenio', 30.00, 0, 15.00, 70.00, '2020-01-03 21:34:51', '2020-01-03 21:54:59'),
(15, 2, 'Wather Levels', 300.00, 0, 10.00, 15.00, '2020-01-03 21:35:27', '2020-01-03 21:51:47'),
(16, 2, 'Wather Level', 30.00, 0, 10.00, 75.00, '2020-01-03 21:35:59', '2020-01-03 21:55:58'),
(17, 1, 'Wather Levels', 30.00, 0, 10.00, 11.00, '2020-01-03 21:37:38', '2020-01-03 21:49:48'),
(18, 1, 'Wather Level', 30.00, 0, 10.00, 9.00, '2020-01-03 21:41:50', '2020-01-03 21:50:33'),
(19, 2, 'Oxigenio', 30.00, 0, 15.00, 80.00, '2020-01-03 21:42:36', '2020-01-03 21:54:59'),
(20, 2, 'Wather Levels', 300.00, 0, 10.00, 11.00, '2020-01-03 21:42:51', '2020-01-03 21:51:47'),
(21, 2, 'Wather Level', 30.00, 0, 10.00, 99.00, '2020-01-03 21:48:20', '2020-01-03 21:55:58'),
(22, 2, 'Wather Level', 30.00, 0, 10.00, 150.00, '2020-01-03 21:49:19', '2020-01-03 21:55:58'),
(23, 1, 'Wather Levels', 30.00, 1, 10.00, 25.00, '2020-01-03 21:49:48', '2020-01-03 21:49:48'),
(24, 1, 'Wather Level', 30.00, 1, 10.00, 33.00, '2020-01-03 21:50:33', '2020-01-03 21:50:33'),
(25, 2, 'Wather Levels', 300.00, 1, 10.00, 44.00, '2020-01-03 21:51:47', '2020-01-03 21:51:47'),
(26, 2, 'Oxigenio', 30.00, 1, 15.00, 66.00, '2020-01-03 21:54:59', '2020-01-03 21:54:59'),
(27, 2, 'Wather Level', 30.00, 0, 10.00, 160.00, '2020-01-03 21:55:40', '2020-01-03 21:55:58'),
(28, 2, 'Wather Level', 30.00, 0, 10.00, 170.00, '2020-01-03 21:55:51', '2020-01-03 21:55:58'),
(29, 2, 'Wather Level', 30.00, 1, 10.00, 180.00, '2020-01-03 21:55:58', '2020-01-03 21:55:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `solutions`
--

CREATE TABLE `solutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vip` int(11) NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `sensor_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `solutions`
--

INSERT INTO `solutions` (`id`, `vip`, `ip`, `token`, `state`, `sensor_number`, `created_at`, `updated_at`) VALUES
(2, 1, '10.10.10.10', '45678904', 1, 3, '2020-01-03 21:01:24', '2020-01-03 21:01:24');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `solutions`
--
ALTER TABLE `solutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
