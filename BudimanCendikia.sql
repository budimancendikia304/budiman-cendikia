-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for budimanc_sekolah
DROP DATABASE IF EXISTS `budimanc_sekolah`;
CREATE DATABASE IF NOT EXISTS `budimanc_sekolah` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `budimanc_sekolah`;

-- Dumping structure for table budimanc_sekolah.agendas
DROP TABLE IF EXISTS `agendas`;
CREATE TABLE IF NOT EXISTS `agendas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.agendas: ~0 rows (approximately)
REPLACE INTO `agendas` (`id`, `unit`, `judul`, `konten`, `tanggal`, `lokasi`, `image`, `created_at`, `updated_at`) VALUES
	(2, 'smp', 'Bukber Tahun Depan', 'jadi kegiatan ini sekalian kita mabit, dan sebelum libur aman aja', '2027-02-10', 'Di Sekolah', NULL, '2026-06-08 22:57:56', '2026-06-08 22:57:56');

-- Dumping structure for table budimanc_sekolah.artikels
DROP TABLE IF EXISTS `artikels`;
CREATE TABLE IF NOT EXISTS `artikels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'umum',
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `artikels_slug_unique` (`slug`),
  KEY `artikels_unit_index` (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.artikels: ~0 rows (approximately)

-- Dumping structure for table budimanc_sekolah.berita
DROP TABLE IF EXISTS `berita`;
CREATE TABLE IF NOT EXISTS `berita` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date DEFAULT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'umum',
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `berita_slug_unique` (`slug`),
  KEY `berita_unit_index` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.berita: ~1 rows (approximately)
REPLACE INTO `berita` (`id`, `unit`, `tanggal`, `judul`, `slug`, `konten`, `thumbnail`, `kategori`, `is_published`, `created_at`, `updated_at`) VALUES
	(1, 'sd', NULL, 'testing', 'testing-K57Is', 'tes doang', NULL, 'umum', 1, '2026-06-02 23:10:48', '2026-06-02 23:10:48'),
	(6, 'smp', '2026-06-23', 'Sholat Berjamaah', 'sholat-berjamaah-YNn4R', 'Sholat itu Wajib', 'http://localhost:8000/storage/berita/smp/1782206559_13.jpeg', 'umum', 1, '2026-06-23 02:22:41', '2026-06-23 02:22:41');

-- Dumping structure for table budimanc_sekolah.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.cache: ~0 rows (approximately)

-- Dumping structure for table budimanc_sekolah.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.cache_locks: ~0 rows (approximately)

-- Dumping structure for table budimanc_sekolah.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table budimanc_sekolah.galeri
DROP TABLE IF EXISTS `galeri`;
CREATE TABLE IF NOT EXISTS `galeri` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galeri_unit_index` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.galeri: ~8 rows (approximately)
REPLACE INTO `galeri` (`id`, `unit`, `judul`, `image`, `deskripsi`, `created_at`, `updated_at`) VALUES
	(5, 'sd', '....', 'http://localhost:8000/storage/galeri/sd/1782180399_7.jpeg', NULL, '2026-06-22 00:46:54', '2026-06-22 19:06:41'),
	(6, 'sd', '...', 'http://localhost:8000/storage/galeri/sd/1782177672_16.jpeg', 'isi sendiri', '2026-06-22 18:21:14', '2026-06-22 18:21:14'),
	(7, 'sd', 'main', 'http://localhost:8000/storage/galeri/sd/1782181906_11.jpeg', NULL, '2026-06-22 19:31:47', '2026-06-22 19:31:47'),
	(8, 'sd', 'ramadhan', 'http://localhost:8000/storage/galeri/sd/1782183387_3.jpeg', NULL, '2026-06-22 19:56:29', '2026-06-22 19:56:29'),
	(9, 'smp', 'ke masjid', 'http://localhost:8000/storage/galeri/smp/1782185721_2.jpeg', NULL, '2026-06-22 20:35:23', '2026-06-22 20:35:23'),
	(10, 'smp', 'ramadhan', 'http://localhost:8000/storage/galeri/smp/1782185750_3.jpeg', NULL, '2026-06-22 20:35:52', '2026-06-22 20:35:52'),
	(11, 'smp', 'outing class', 'http://localhost:8000/storage/galeri/smp/1782185790_6.jpeg', NULL, '2026-06-22 20:36:31', '2026-06-22 20:36:31'),
	(12, 'smp', 'foto bareng', 'http://localhost:8000/storage/galeri/smp/1782185889_15.jpeg', NULL, '2026-06-22 20:38:10', '2026-06-22 20:38:10');

-- Dumping structure for table budimanc_sekolah.guru
DROP TABLE IF EXISTS `guru`;
CREATE TABLE IF NOT EXISTS `guru` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mata_pelajaran` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_aktif` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guru_unit_index` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.guru: ~5 rows (approximately)
REPLACE INTO `guru` (`id`, `unit`, `nama`, `nip`, `jabatan`, `mata_pelajaran`, `foto`, `email`, `gmail`, `whatsapp`, `is_aktif`, `created_at`, `updated_at`) VALUES
	(4, 'smp', 'Bu Kepsek', NULL, 'Kepala Sekolah', 'matematika', 'http://localhost:8000/storage/guru/smp/1780990051_bu kepsek.jpeg', NULL, NULL, '62 815-3464-8183', 1, '2026-06-09 00:27:34', '2026-06-09 00:27:34'),
	(6, 'smp', 'bu .....', NULL, 'wali kelas 6', NULL, NULL, NULL, NULL, NULL, 1, '2026-06-21 00:40:25', '2026-06-21 00:40:25'),
	(7, 'smp', '.....', NULL, 'wali kelas', NULL, NULL, NULL, NULL, NULL, 1, '2026-06-21 00:40:38', '2026-06-21 00:40:38'),
	(8, 'smp', '....', NULL, '....', NULL, NULL, NULL, NULL, NULL, 1, '2026-06-21 00:40:53', '2026-06-21 00:40:53'),
	(9, 'smp', '....', NULL, '....', NULL, NULL, NULL, NULL, NULL, 1, '2026-06-21 00:41:00', '2026-06-21 00:41:00'),
	(10, 'smp', '.....', NULL, '.....', NULL, NULL, NULL, NULL, NULL, 1, '2026-06-21 00:41:09', '2026-06-21 00:41:09');

-- Dumping structure for table budimanc_sekolah.headmaster_profiles
DROP TABLE IF EXISTS `headmaster_profiles`;
CREATE TABLE IF NOT EXISTS `headmaster_profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `greeting` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `headmaster_profiles_unit_unique` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.headmaster_profiles: ~1 rows (approximately)
REPLACE INTO `headmaster_profiles` (`id`, `unit`, `name`, `greeting`, `photo`, `created_at`, `updated_at`) VALUES
	(1, 'smp', 'Hemi Nurul Afifah, S.Pd.I, Gr', 'Assalamu’alaikum warahmatullahi wabarakatuh\r\n\r\nAlhamdulillahirabbil ‘alamin, segala puji bagi Allah Subhanahu wa Ta’ala yang telah melimpahkan rahmat, taufik, dan hidayah-Nya kepada kita semua. Shalawat serta salam semoga senantiasa tercurah kepada junjungan kita Nabi Muhammad Shallallahu ‘alaihi wasallam, keluarga, sahabat, dan seluruh umatnya hingga akhir zaman.\r\n\r\nSelamat datang di website resmi sekolah kami. Kehadiran website ini merupakan salah satu bentuk ikhtiar dalam meningkatkan kualitas pelayanan informasi dan komunikasi kepada seluruh peserta didik, orang tua, guru, serta masyarakat luas.\r\n\r\nSebagai lembaga pendidikan Islam, kami berkomitmen untuk menghadirkan pendidikan yang tidak hanya unggul dalam ilmu pengetahuan dan teknologi, tetapi juga kuat dalam pembinaan akhlakul karimah, keimanan, dan ketakwaan kepada Allah Subhanahu wa Ta’ala. Kami berharap sekolah ini mampu mencetak generasi yang cerdas, berkarakter, disiplin, serta berlandaskan nilai-nilai Islami.\r\n\r\nMelalui website ini, kami ingin memberikan informasi mengenai program sekolah, kegiatan peserta didik, prestasi, serta berbagai layanan pendidikan yang dapat diakses dengan mudah oleh seluruh masyarakat. Semoga media ini menjadi sarana yang bermanfaat dalam mempererat silaturahmi dan kerja sama antara sekolah dengan semua pihak.\r\n\r\nKami menyadari bahwa kemajuan pendidikan tidak dapat dicapai tanpa dukungan dan doa dari berbagai pihak. Oleh karena itu, kami mengucapkan terima kasih kepada seluruh guru, tenaga kependidikan, orang tua, dan masyarakat yang telah memberikan kepercayaan serta dukungannya kepada sekolah kami.\r\n\r\nAkhir kata, semoga Allah Subhanahu wa Ta’ala senantiasa memberikan keberkahan dan kemudahan dalam setiap langkah kita untuk mencerdaskan generasi bangsa yang beriman, berilmu, dan berakhlak mulia.\r\n\r\nWassalamu’alaikum warahmatullahi wabarakatuh\r\n\r\nKepala Sekolah\r\nHemi Nurul Afifah, S.Pd.I, Gr', '1781426344_smp.jpeg', '2026-06-13 23:53:45', '2026-06-15 23:24:00'),
	(2, 'sd', 'Hemi Nurul Afifah, S.Pd.I, Gr', 'Assalamu’alaikum warahmatullahi wabarakatuh\r\n\r\n\r\nAlhamdulillahirabbil ‘alamin, segala puji bagi Allah Subhanahu wa Ta’ala yang telah melimpahkan rahmat, taufik, dan hidayah-Nya kepada kita semua. Shalawat serta salam semoga senantiasa tercurah kepada junjungan kita Nabi Muhammad Shallallahu ‘alaihi wasallam, keluarga, sahabat, dan seluruh umatnya hingga akhir zaman.\r\n\r\n\r\nSelamat datang di website resmi sekolah kami. Kehadiran website ini merupakan salah satu bentuk ikhtiar dalam meningkatkan kualitas pelayanan informasi dan komunikasi kepada seluruh peserta didik, orang tua, guru, serta masyarakat luas.\r\n\r\n\r\nSebagai lembaga pendidikan Islam, kami berkomitmen untuk menghadirkan pendidikan yang tidak hanya unggul dalam ilmu pengetahuan dan teknologi, tetapi juga kuat dalam pembinaan akhlakul karimah, keimanan, dan ketakwaan kepada Allah Subhanahu wa Ta’ala. Kami berharap sekolah ini mampu mencetak generasi yang cerdas, berkarakter, disiplin, serta berlandaskan nilai-nilai Islami.\r\n\r\n\r\nMelalui website ini, kami ingin memberikan informasi mengenai program sekolah, kegiatan peserta didik, prestasi, serta berbagai layanan pendidikan yang dapat diakses dengan mudah oleh seluruh masyarakat. Semoga media ini menjadi sarana yang bermanfaat dalam mempererat silaturahmi dan kerja sama antara sekolah dengan semua pihak.\r\n\r\n\r\nKami menyadari bahwa kemajuan pendidikan tidak dapat dicapai tanpa dukungan dan doa dari berbagai pihak. Oleh karena itu, kami mengucapkan terima kasih kepada seluruh guru, tenaga kependidikan, orang tua, dan masyarakat yang telah memberikan kepercayaan serta dukungannya kepada sekolah kami.\r\n\r\n\r\nAkhir kata, semoga Allah Subhanahu wa Ta’ala senantiasa memberikan keberkahan dan kemudahan dalam setiap langkah kita untuk mencerdaskan generasi bangsa yang beriman, berilmu, dan berakhlak mulia.\r\n\r\n\r\nWassalamu’alaikum warahmatullahi wabarakatuh\r\n\r\n\r\nKepala Sekolah\r\n\r\nHemi Nurul Afifah, S.Pd.I, Gr', '1781677681_sd.jpeg', '2026-06-16 23:28:01', '2026-06-16 23:28:01');

-- Dumping structure for table budimanc_sekolah.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.jobs: ~0 rows (approximately)

-- Dumping structure for table budimanc_sekolah.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.job_batches: ~0 rows (approximately)

-- Dumping structure for table budimanc_sekolah.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.migrations: ~20 rows (approximately)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_06_01_065303_create_personal_access_tokens_table', 1),
	(5, '2026_06_01_071224_create_berita_table', 1),
	(6, '2026_06_01_071231_create_guru_table', 1),
	(7, '2026_06_01_071237_create_galeri_table', 1),
	(8, '2026_06_01_071243_create_pengumuman_table', 1),
	(9, '2026_06_01_071250_create_ppdb_table', 1),
	(10, '2026_06_02_111115_add_unit_to_tables', 2),
	(11, '2026_06_02_125337_add_unit_to_users_table', 2),
	(12, '2026_06_03_055155_create_agendas_table', 3),
	(13, '2026_06_03_055155_create_prestasis_table', 3),
	(14, '2026_06_03_062302_add_image_to_pengumuman_and_agenda', 4),
	(15, '2026_06_03_102614_fix_galeri_table', 5),
	(16, '2026_06_05_034042_add_tanggal_to_content_tables', 6),
	(17, '2026_06_06_060835_add_target_pages_to_pengumuman_table', 7),
	(18, '2026_06_08_061332_add_tingkat_to_prestasis_table', 8),
	(19, '2026_06_08_080908_create_program_fasilitas_table', 9),
	(20, '2026_06_08_091058_add_slug_to_program_fasilitas_table', 10),
	(21, '2026_06_08_094207_add_contacts_to_guru_table', 11),
	(22, '2026_06_10_094354_create_artikels_table', 12),
	(23, '2026_06_14_000000_create_headmaster_profiles_table', 13),
	(24, '2026_06_15_080615_create_settings_table', 14),
	(25, '2026_06_15_090156_create_site_settings_table', 15);

-- Dumping structure for table budimanc_sekolah.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table budimanc_sekolah.pengumuman
DROP TABLE IF EXISTS `pengumuman`;
CREATE TABLE IF NOT EXISTS `pengumuman` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_pages` json DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `is_aktif` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pengumuman_unit_index` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.pengumuman: ~1 rows (approximately)
REPLACE INTO `pengumuman` (`id`, `unit`, `judul`, `isi`, `image`, `target_pages`, `tanggal_mulai`, `tanggal_selesai`, `is_aktif`, `created_at`, `updated_at`) VALUES
	(1, 'sd', 'Test', 'Test Content', NULL, NULL, '2026-06-04', NULL, 1, '2026-06-04 04:50:14', '2026-06-04 04:50:14'),
	(3, 'smp', 'selmat 30 juz', 'aminn', NULL, '["al-quran"]', '2026-06-06', NULL, 1, '2026-06-06 01:05:31', '2026-06-06 01:05:31'),
	(4, 'smp', 'Jadwal Perpisahan', 'di lapangan ya...', NULL, NULL, '2026-06-09', NULL, 1, '2026-06-08 22:56:05', '2026-06-08 22:56:05');

-- Dumping structure for table budimanc_sekolah.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.personal_access_tokens: ~129 rows (approximately)
REPLACE INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 1, 'api-token', 'faa79f4e3c36d297effceeb6cef52b372bb7e7a75c63b00351dae08be1fd3a32', '["*"]', '2026-06-02 23:10:48', NULL, '2026-06-02 23:09:44', '2026-06-02 23:10:48'),
	(2, 'App\\Models\\User', 1, 'api-token', 'c61b3775749295eba3e65a3cbd73524aa9f678703a7be86b0904b186e8d3d6f2', '["*"]', '2026-06-02 23:41:52', NULL, '2026-06-02 23:18:20', '2026-06-02 23:41:52'),
	(3, 'App\\Models\\User', 1, 'api-token', '5861b68e151a368c9e5e0e667c4cb6bd300f57c3af7bc1a208d56f86ae143e95', '["*"]', '2026-06-03 03:04:45', NULL, '2026-06-03 03:02:15', '2026-06-03 03:04:45'),
	(4, 'App\\Models\\User', 1, 'api-token', 'a95a6aa9492f8e4bf5934a971823b0ac2e1e00b6c82a24db305f1c5cf8c1f8ee', '["*"]', '2026-06-03 03:23:51', NULL, '2026-06-03 03:22:47', '2026-06-03 03:23:51'),
	(5, 'App\\Models\\User', 1, 'api-token', '1c7d20234534b990a90f55c3a0db13026834d2371a336618f570436f8ecf5e1f', '["*"]', NULL, NULL, '2026-06-03 05:08:19', '2026-06-03 05:08:19'),
	(6, 'App\\Models\\User', 1, 'api-token', '96d6c0ccab5b5df06feec4d2a3d0bb75dae74eb2e2e4f04d7019bf4afb35515b', '["*"]', NULL, NULL, '2026-06-03 05:13:45', '2026-06-03 05:13:45'),
	(7, 'App\\Models\\User', 2, 'api-token', '6e1c973dba99284b34ccf8544efbefc40865f51e700d05660357ea863cd8cbab', '["*"]', '2026-06-03 05:14:58', NULL, '2026-06-03 05:14:14', '2026-06-03 05:14:58'),
	(8, 'App\\Models\\User', 1, 'api-token', '273e4b45e21c3c73ec181bc570eeed96186d6a7f46ec230eda1ad81f50c9c8a4', '["*"]', '2026-06-03 06:01:42', NULL, '2026-06-03 06:01:16', '2026-06-03 06:01:42'),
	(9, 'App\\Models\\User', 1, 'api-token', '04b22262b4198a6e189d84231590b431dc6a3fd8f7cac551fad714cf1d9fe41c', '["*"]', '2026-06-03 06:16:26', NULL, '2026-06-03 06:14:17', '2026-06-03 06:16:26'),
	(10, 'App\\Models\\User', 1, 'api-token', '16a17ee1ac44644942a762a41891b717ee3a7c0cd6e9005518b8f2a51a890a0f', '["*"]', NULL, NULL, '2026-06-03 23:45:51', '2026-06-03 23:45:51'),
	(11, 'App\\Models\\User', 2, 'api-token', 'e58035e9689f96e86c33dae1ac6fd22a4c91d3915bfd9aed7de9c1ce0ae17d2a', '["*"]', '2026-06-04 01:42:25', NULL, '2026-06-04 01:40:47', '2026-06-04 01:42:25'),
	(12, 'App\\Models\\User', 1, 'api-token', 'e34e8095affa130675f7e001639d1f955e3ea317f046ca4697563fa92c21418f', '["*"]', NULL, NULL, '2026-06-04 04:15:30', '2026-06-04 04:15:30'),
	(13, 'App\\Models\\User', 1, 'api-token', 'e49f03024d212379f795c1e045517239cf438c833673043a2117691be131f682', '["*"]', NULL, NULL, '2026-06-04 04:27:17', '2026-06-04 04:27:17'),
	(14, 'App\\Models\\User', 1, 'api-token', '255e918295ee451883da2c5d0a835827916e67a11506179b54b9263bfb4c0686', '["*"]', '2026-06-04 04:54:51', NULL, '2026-06-04 04:45:13', '2026-06-04 04:54:51'),
	(15, 'App\\Models\\User', 1, 'api-token', '53761a1097ba936bae3e6ddac65e790233a7a59067ddd4b5f5b1a274941b8bbe', '["*"]', '2026-06-04 21:09:08', NULL, '2026-06-04 20:43:01', '2026-06-04 21:09:08'),
	(16, 'App\\Models\\User', 1, 'api-token', '605004226b8e3a0f52bcb31c0c01caf24cbfdbf6319f8782f18c86d1b8d0f84a', '["*"]', NULL, NULL, '2026-06-04 23:35:00', '2026-06-04 23:35:00'),
	(17, 'App\\Models\\User', 1, 'api-token', '0404676978e5ea7f336560c07b92381a13c50305eb7834e6aee5b3e5511ebe12', '["*"]', NULL, NULL, '2026-06-04 23:35:48', '2026-06-04 23:35:48'),
	(18, 'App\\Models\\User', 1, 'api-token', 'f10b21c3b132e13d8254e13c09635495b1c88235330db14064792c00bb4ef340', '["*"]', '2026-06-05 03:30:20', NULL, '2026-06-05 03:28:38', '2026-06-05 03:30:20'),
	(19, 'App\\Models\\User', 1, 'api-token', 'c1b889fac1dfd239fab753ecf75adb71276522a4544ef88b8ae4c3cd006793aa', '["*"]', '2026-06-05 05:25:37', NULL, '2026-06-05 04:35:37', '2026-06-05 05:25:37'),
	(20, 'App\\Models\\User', 1, 'api-token', 'be2de5926493fd8774467237844441a827c0897171cff7d4b663446889a3e7d8', '["*"]', NULL, NULL, '2026-06-05 06:25:41', '2026-06-05 06:25:41'),
	(21, 'App\\Models\\User', 1, 'api-token', '2e22b4d47be47923037ad6b32f70c60ba78d1454bc8fd1587ca1147f45663942', '["*"]', NULL, NULL, '2026-06-05 06:42:18', '2026-06-05 06:42:18'),
	(22, 'App\\Models\\User', 1, 'api-token', 'b1e29d36db90c6136848a139f63c4be1c8c7376003063585f6062fb9d90be20b', '["*"]', NULL, NULL, '2026-06-05 07:16:21', '2026-06-05 07:16:21'),
	(23, 'App\\Models\\User', 1, 'api-token', '9f21304f29c3f4b38a6bcc22879a9b1922bf6af25a8d3e5307efd2db02fbb4c7', '["*"]', NULL, NULL, '2026-06-05 07:39:04', '2026-06-05 07:39:04'),
	(24, 'App\\Models\\User', 1, 'api-token', '2a15e071b990b73ce94368b90b85ba0f90a060e91ccd4333403fff09ca9083b1', '["*"]', '2026-06-05 21:48:52', NULL, '2026-06-05 21:48:10', '2026-06-05 21:48:52'),
	(25, 'App\\Models\\User', 2, 'api-token', '7e6c7243b960979551cd3cee00f809e032a98bfa6f1986c9a3bd2623496ebfa8', '["*"]', '2026-06-05 23:31:59', NULL, '2026-06-05 22:59:40', '2026-06-05 23:31:59'),
	(26, 'App\\Models\\User', 2, 'api-token', 'e8c9db14cf2898b2e6696cf573bc04a7fb06f44593b399f769565db688dd4e34', '["*"]', '2026-06-06 01:05:31', NULL, '2026-06-06 01:04:56', '2026-06-06 01:05:31'),
	(27, 'App\\Models\\User', 1, 'api-token', 'ace469fd30f8cb60e8ad1dd2b4ed5d329df489ca03b90f35ad9853f3b79dadda', '["*"]', NULL, NULL, '2026-06-06 01:07:12', '2026-06-06 01:07:12'),
	(28, 'App\\Models\\User', 2, 'api-token', '03454738c2a749ddc23749e994f172d329357aa6b2215666172405ef8d3d37ed', '["*"]', NULL, NULL, '2026-06-06 01:17:06', '2026-06-06 01:17:06'),
	(29, 'App\\Models\\User', 1, 'api-token', '94d7db95e72e33735d3862962159b7b525e9bd58aab1bb6bd40acd7f4dbd554b', '["*"]', NULL, NULL, '2026-06-07 17:46:54', '2026-06-07 17:46:54'),
	(30, 'App\\Models\\User', 1, 'api-token', 'f9cab33d09b6d8909f3e4bfab6acd0c99e1cbed34b084eae3607cf8e4624cfc7', '["*"]', NULL, NULL, '2026-06-07 19:34:49', '2026-06-07 19:34:49'),
	(31, 'App\\Models\\User', 2, 'api-token', '11d4bfeb0d6d50839a0f2de64bcd1fac1b2527a20c0b1db60552f718fcdd17d6', '["*"]', NULL, NULL, '2026-06-07 21:02:55', '2026-06-07 21:02:55'),
	(32, 'App\\Models\\User', 2, 'api-token', '76292ca3924238ea5d74120326ff566eefaa23326426562f152f9cb4902a9f73', '["*"]', NULL, NULL, '2026-06-07 22:28:41', '2026-06-07 22:28:41'),
	(33, 'App\\Models\\User', 2, 'api-token', '058b15512a3445ce1497fac1592ff138fe20472226c5b6eb213df774cd78cb9a', '["*"]', NULL, NULL, '2026-06-07 22:57:59', '2026-06-07 22:57:59'),
	(34, 'App\\Models\\User', 2, 'api-token', '2a7bb9d990e5685513bdbfdd2fd9d8eb40d43c9cb8e750845e4e57004283b839', '["*"]', NULL, NULL, '2026-06-08 00:53:47', '2026-06-08 00:53:47'),
	(35, 'App\\Models\\User', 2, 'api-token', '423a71a3f141d5416323a2634ef72113bb0a5494472d8f8eafe4f5300ebc588d', '["*"]', '2026-06-08 01:53:57', NULL, '2026-06-08 01:52:37', '2026-06-08 01:53:57'),
	(36, 'App\\Models\\User', 2, 'api-token', '9815ec4968e4092f22f7074df2663e983ebd8637c95221264a7e801df0d65d64', '["*"]', '2026-06-08 03:30:22', NULL, '2026-06-08 01:54:28', '2026-06-08 03:30:22'),
	(37, 'App\\Models\\User', 2, 'api-token', '40dbb0fcf77b89c56bbaa324c0692a296943a7e73ed4eb60d77c71f51ddf234b', '["*"]', '2026-06-08 03:33:19', NULL, '2026-06-08 03:33:00', '2026-06-08 03:33:19'),
	(38, 'App\\Models\\User', 2, 'api-token', '12a9167fe3705805f7b913b7641b6a65d3d86718bfb852451fe235fc2e73036a', '["*"]', '2026-06-08 22:56:05', NULL, '2026-06-08 22:54:28', '2026-06-08 22:56:05'),
	(39, 'App\\Models\\User', 2, 'api-token', '03d2108675d3f27d25cdcb1a9d47c6f357b9fbd624d0ef5548da00bb7371453c', '["*"]', '2026-06-08 22:57:56', NULL, '2026-06-08 22:56:30', '2026-06-08 22:57:56'),
	(40, 'App\\Models\\User', 2, 'api-token', '3acafbbd3237ca1aef5dc408d395244898e1bbaa40c0acf2b7c17d17d0e4f238', '["*"]', '2026-06-09 00:26:03', NULL, '2026-06-09 00:25:00', '2026-06-09 00:26:03'),
	(41, 'App\\Models\\User', 2, 'api-token', '592898c7892fc41e46045b40d510b0060e75af8e4cda50a9a44c506d22669717', '["*"]', '2026-06-09 00:27:34', NULL, '2026-06-09 00:26:31', '2026-06-09 00:27:34'),
	(42, 'App\\Models\\User', 2, 'api-token', 'b99b39b217872ab068f7dcdc020b9b93ae756284ef3d503c8a5e47c067a7b413', '["*"]', '2026-06-09 22:46:31', NULL, '2026-06-09 22:44:35', '2026-06-09 22:46:31'),
	(43, 'App\\Models\\User', 1, 'api-token', 'db77b794bb7171bdefe46d6ba72013cfbcee02585a18632bc16267136040cf52', '["*"]', '2026-06-10 02:10:32', NULL, '2026-06-10 01:50:43', '2026-06-10 02:10:32'),
	(44, 'App\\Models\\User', 2, 'api-token', 'b52bd241edf795a83388384b0a920735d3a1518f81625279f8af2d2db8e23453', '["*"]', NULL, NULL, '2026-06-10 02:21:17', '2026-06-10 02:21:17'),
	(45, 'App\\Models\\User', 2, 'api-token', 'e142308b92d541b8f9304d035e31b38e62c322fb2f0f744a8bb28f9673192ac1', '["*"]', NULL, NULL, '2026-06-10 02:25:00', '2026-06-10 02:25:00'),
	(46, 'App\\Models\\User', 2, 'api-token', 'c99d45f3cadc27a6f9d57cdc0111859f6a04f0e479d2903a6185bbb4ffa4442d', '["*"]', NULL, NULL, '2026-06-10 02:55:00', '2026-06-10 02:55:00'),
	(47, 'App\\Models\\User', 2, 'api-token', 'a4580bf09ddd20537e1a2eeebe52c1d0668b9046fa2f51a8b4a5e0c5b4041824', '["*"]', '2026-06-11 20:53:28', NULL, '2026-06-11 20:35:55', '2026-06-11 20:53:28'),
	(48, 'App\\Models\\User', 2, 'api-token', '903745c7fb8478a450f0d7dfe436416bf1a787f39d5938637406c5a6ff46be59', '["*"]', NULL, NULL, '2026-06-12 21:08:22', '2026-06-12 21:08:22'),
	(49, 'App\\Models\\User', 1, 'api-token', 'c2d4b0bde25dad37f76cc94a1c4aa20be8749ba6b6301ccaa235d0c567d94d09', '["*"]', NULL, NULL, '2026-06-12 21:18:30', '2026-06-12 21:18:30'),
	(50, 'App\\Models\\User', 2, 'api-token', '9becb1161bdc427a38353ed1ef7e0249844f0c9a3f1ca2153228472ad445ba35', '["*"]', '2026-06-13 00:43:45', NULL, '2026-06-13 00:43:26', '2026-06-13 00:43:45'),
	(51, 'App\\Models\\User', 2, 'api-token', 'ec7359418ac9187adcab84f248c2234d9f34d477d615f14ad41a2a42b2dcef1b', '["*"]', NULL, NULL, '2026-06-13 01:05:22', '2026-06-13 01:05:22'),
	(52, 'App\\Models\\User', 2, 'api-token', '245c028e121619218a776f13e66a4795e1fa960cc43ea0d6f88ce265c24e99d8', '["*"]', NULL, NULL, '2026-06-13 22:24:39', '2026-06-13 22:24:39'),
	(53, 'App\\Models\\User', 2, 'api-token', '8c466644eeda139f1c3acaca468e4e1ff159392a753e94d66966b2cf2fe24573', '["*"]', '2026-06-13 22:55:57', NULL, '2026-06-13 22:52:36', '2026-06-13 22:55:57'),
	(54, 'App\\Models\\User', 2, 'api-token', 'deef056a71e0574b6f58c4acb5fd9f1093a479eb7d6c5188b7a086a8ea0ce4fc', '["*"]', '2026-06-13 22:57:21', NULL, '2026-06-13 22:57:17', '2026-06-13 22:57:21'),
	(55, 'App\\Models\\User', 2, 'api-token', 'b08363359c2116236daca82f7c0bc958362056c9f8cf0f1d2d488e5f05113c12', '["*"]', '2026-06-13 22:58:27', NULL, '2026-06-13 22:58:23', '2026-06-13 22:58:27'),
	(56, 'App\\Models\\User', 2, 'api-token', 'fffddef226e182c05cdc9997b9a81269322c753719efbd0a9241833c5603468b', '["*"]', '2026-06-13 22:59:23', NULL, '2026-06-13 22:59:19', '2026-06-13 22:59:23'),
	(57, 'App\\Models\\User', 2, 'api-token', 'b4ef3d9ac5b64e6d38a2d3d43e7846c8a22f78e687a89a1d6d5da83c3565537a', '["*"]', '2026-06-13 23:42:52', NULL, '2026-06-13 23:42:47', '2026-06-13 23:42:52'),
	(58, 'App\\Models\\User', 2, 'api-token', 'c61cd3cbaaaadc53cd6f44db616b47219579a71d96bba05c04ab0f96fb913e60', '["*"]', '2026-06-13 23:53:44', NULL, '2026-06-13 23:51:34', '2026-06-13 23:53:44'),
	(59, 'App\\Models\\User', 2, 'api-token', '9ec36ccf3fe1b23ee5c38acfb5ce77dbbba54f688d50046bdd33c094eccfd299', '["*"]', '2026-06-13 23:57:03', NULL, '2026-06-13 23:56:22', '2026-06-13 23:57:03'),
	(60, 'App\\Models\\User', 1, 'api-token', '7882efc002716cb6792590e502e5627f9549d1dc42315772bfff0e92a201270f', '["*"]', '2026-06-14 00:13:30', NULL, '2026-06-14 00:13:26', '2026-06-14 00:13:30'),
	(61, 'App\\Models\\User', 2, 'api-token', '8cf8ba1f0830fc90702a55a3a900c28a9998e8d01916b86ecdde7fb644c9d689', '["*"]', '2026-06-14 00:18:20', NULL, '2026-06-14 00:18:14', '2026-06-14 00:18:20'),
	(62, 'App\\Models\\User', 2, 'api-token', '35451729d5191ebae3bfd936961a33dfabc364e9fa1aa8804c68875408f7cc02', '["*"]', '2026-06-14 00:22:42', NULL, '2026-06-14 00:19:02', '2026-06-14 00:22:42'),
	(63, 'App\\Models\\User', 2, 'api-token', '0ae83f137f09444ded67334f71d812fcc19d0d12083842d618de8d3cb7192f23', '["*"]', '2026-06-14 01:39:12', NULL, '2026-06-14 00:25:17', '2026-06-14 01:39:12'),
	(64, 'App\\Models\\User', 2, 'api-token', '2b34127d46e4e064d269279c85608e60d313caedc3fb1753c2a12eb1155529a9', '["*"]', '2026-06-14 02:09:20', NULL, '2026-06-14 01:49:31', '2026-06-14 02:09:20'),
	(65, 'App\\Models\\User', 2, 'api-token', 'c4e2b3e6d491a7da1f7bfa2e65969b94a212e4f72e31fac75e6076a6e379c6eb', '["*"]', '2026-06-14 23:22:57', NULL, '2026-06-14 23:22:51', '2026-06-14 23:22:57'),
	(66, 'App\\Models\\User', 2, 'api-token', '503282ee1318d007ca00f67c5d55b0af29f4b7ddaa397f52bc20476a8c03eff6', '["*"]', '2026-06-15 00:54:40', NULL, '2026-06-15 00:47:34', '2026-06-15 00:54:40'),
	(67, 'App\\Models\\User', 2, 'api-token', 'fccc1e8e02bc742e4ecb87ebee38feb5b286bbe97461fc0dd5dc7d24bf514729', '["*"]', '2026-06-15 01:19:06', NULL, '2026-06-15 01:07:59', '2026-06-15 01:19:06'),
	(68, 'App\\Models\\User', 2, 'api-token', 'e7c496964682962982956635a613016113cbe79daacbf1b138ff1f8f3f2d59d4', '["*"]', '2026-06-15 02:31:35', NULL, '2026-06-15 01:34:44', '2026-06-15 02:31:35'),
	(69, 'App\\Models\\User', 2, 'api-token', '88ec4d73ef57a4b362390865f53ca7a98dc543bf24b1b64cec82fcd7982f3cc1', '["*"]', '2026-06-15 02:33:46', NULL, '2026-06-15 02:33:41', '2026-06-15 02:33:46'),
	(70, 'App\\Models\\User', 2, 'api-token', 'c1275a4600142b4b8ccc662247c05aea3642045e5577eb4693f93583e94c1d89', '["*"]', '2026-06-15 23:24:00', NULL, '2026-06-15 23:23:34', '2026-06-15 23:24:00'),
	(71, 'App\\Models\\User', 2, 'api-token', '5b58d275192df58009fdefcbcb623d87c1739de377cff320935584c351f3a916', '["*"]', '2026-06-16 01:42:19', NULL, '2026-06-16 01:03:06', '2026-06-16 01:42:19'),
	(72, 'App\\Models\\User', 2, 'api-token', '982d9242038376d9341f40f7ef669a0d39f56a6828cb1b985f91a36e429cda80', '["*"]', '2026-06-16 03:43:04', NULL, '2026-06-16 03:37:10', '2026-06-16 03:43:04'),
	(73, 'App\\Models\\User', 1, 'api-token', '6bf1383649641daded772dd2f6166d288b13b811c5077b9d53fccd54a22061f8', '["*"]', '2026-06-16 23:28:01', NULL, '2026-06-16 23:26:30', '2026-06-16 23:28:01'),
	(74, 'App\\Models\\User', 1, 'api-token', '390ff95ef39dd3d48892d082a605802975e2fda0f75cf91ee155092c329147fb', '["*"]', '2026-06-16 23:56:30', NULL, '2026-06-16 23:56:25', '2026-06-16 23:56:30'),
	(75, 'App\\Models\\User', 1, 'api-token', 'c8adf4a234cf5d06d64c56fa6cd0e53b2158062c6c8cb113627547b0bd7ee08a', '["*"]', '2026-06-17 23:17:21', NULL, '2026-06-17 23:09:37', '2026-06-17 23:17:21'),
	(76, 'App\\Models\\User', 2, 'api-token', '7c84ef07fd482c17bfd213cc4bc61f94e76358f58264d9b96a6620e132d39e90', '["*"]', '2026-06-17 23:28:43', NULL, '2026-06-17 23:22:04', '2026-06-17 23:28:43'),
	(77, 'App\\Models\\User', 2, 'api-token', 'f9be59ae879b7f6a324a950d576b8ac44486513f7c01574f8764a676c6650340', '["*"]', '2026-06-17 23:53:28', NULL, '2026-06-17 23:53:22', '2026-06-17 23:53:28'),
	(78, 'App\\Models\\User', 2, 'api-token', 'ccf24bb81d52fca38453856c33b7332e14b82f511e6bec4aa4559112121511c5', '["*"]', '2026-06-18 02:40:02', NULL, '2026-06-18 02:33:56', '2026-06-18 02:40:02'),
	(79, 'App\\Models\\User', 2, 'api-token', '3612d24e2d8458d2920103133aef46dbf71dfb674e420711a7c7d9e06e54b979', '["*"]', NULL, NULL, '2026-06-18 02:39:56', '2026-06-18 02:39:56'),
	(80, 'App\\Models\\User', 2, 'api-token', '876629ec2e1156d05739db345eb20bdb976bd8c2ec7177a113ad4d8ca7308a08', '["*"]', NULL, NULL, '2026-06-18 02:40:24', '2026-06-18 02:40:24'),
	(81, 'App\\Models\\User', 2, 'api-token', '226e0068743c32b66170cdc524961f19198334d38ea673189c0e08cf4e5a3cb4', '["*"]', NULL, NULL, '2026-06-18 02:40:30', '2026-06-18 02:40:30'),
	(82, 'App\\Models\\User', 2, 'api-token', 'b21925a9db1295a3c1e8d87a448721c59fc797f38d3971730bd08c5101b74c28', '["*"]', '2026-06-18 02:41:05', NULL, '2026-06-18 02:40:57', '2026-06-18 02:41:05'),
	(83, 'App\\Models\\User', 2, 'api-token', '0829f98604bffc3398a201fd58dc966cefd4c0f1f86a4cb032327864266ccdb4', '["*"]', '2026-06-18 02:56:43', NULL, '2026-06-18 02:56:36', '2026-06-18 02:56:43'),
	(84, 'App\\Models\\User', 2, 'api-token', 'ae61e057c3fe239470bb9a9665065c9d9d738af4ff25c616e028b39b0cfeeb9c', '["*"]', '2026-06-18 03:03:07', NULL, '2026-06-18 02:57:55', '2026-06-18 03:03:07'),
	(85, 'App\\Models\\User', 2, 'api-token', '6db53194391d2dff2b1b2e609c958987b5329e6adeebdeccda39287d95d10c01', '["*"]', NULL, NULL, '2026-06-18 03:00:05', '2026-06-18 03:00:05'),
	(86, 'App\\Models\\User', 2, 'api-token', '525398ebf4db7e85e25d638d2a75ab664f7f7d306c3433b82b22d7ea09db1d0b', '["*"]', '2026-06-18 03:04:31', NULL, '2026-06-18 03:04:23', '2026-06-18 03:04:31'),
	(87, 'App\\Models\\User', 2, 'api-token', '2cbf64e22c04b9ae3f4e88c7c59069fb2ba9357a965a635c8ea4cd8bb8e93161', '["*"]', '2026-06-18 03:16:00', NULL, '2026-06-18 03:07:09', '2026-06-18 03:16:00'),
	(88, 'App\\Models\\User', 2, 'api-token', 'bc17c6dfe05ad2f25f79e038c09337df5e7b3882bdaa64cfb50166a9e88eb735', '["*"]', '2026-06-18 03:19:40', NULL, '2026-06-18 03:19:33', '2026-06-18 03:19:40'),
	(89, 'App\\Models\\User', 2, 'api-token', '20857e579ab7d6fae8a19fbb11cae7a6762f008487fa25b8eec5fd17a6f233de', '["*"]', '2026-06-18 03:37:05', NULL, '2026-06-18 03:34:54', '2026-06-18 03:37:05'),
	(90, 'App\\Models\\User', 2, 'api-token', 'f625b984d56ee0b0806af5604e5950d9f8ace0066ea887b82e3b86abeeb5b325', '["*"]', '2026-06-18 03:37:39', NULL, '2026-06-18 03:37:34', '2026-06-18 03:37:39'),
	(91, 'App\\Models\\User', 2, 'api-token', '17f810973b5fdedc0a3ce7b90bec83f75e0f1cf1d7c34f089a0088d0c5e7ffce', '["*"]', NULL, NULL, '2026-06-18 03:42:06', '2026-06-18 03:42:06'),
	(92, 'App\\Models\\User', 2, 'api-token', 'f5b43ddc0a07de89656c7c9e7c9ec6e2e6893492ad5bc6b0f97d7227e19a2c40', '["*"]', NULL, NULL, '2026-06-18 03:42:12', '2026-06-18 03:42:12'),
	(93, 'App\\Models\\User', 2, 'api-token', '21a0b6638c7775190d5d8e3f5f66d5ea77de9a0103adc4e7af6ff9019762363d', '["*"]', NULL, NULL, '2026-06-18 03:42:19', '2026-06-18 03:42:19'),
	(94, 'App\\Models\\User', 2, 'api-token', 'e9815860a036ee957947cfc61d32893aff55347f1bd41684f1b1832ea5bd0bff', '["*"]', NULL, NULL, '2026-06-18 03:43:36', '2026-06-18 03:43:36'),
	(95, 'App\\Models\\User', 2, 'api-token', 'eb9736a1be296600692e862790ff37d570dd2cc4771d1a775952c43151ea8247', '["*"]', '2026-06-18 03:44:44', NULL, '2026-06-18 03:44:06', '2026-06-18 03:44:44'),
	(96, 'App\\Models\\User', 2, 'api-token', 'c43b9f9bf9d38d56d19e16ec5efb31c48f0370dbfd485f8a35612d51851558d9', '["*"]', NULL, NULL, '2026-06-18 19:04:36', '2026-06-18 19:04:36'),
	(97, 'App\\Models\\User', 2, 'api-token', '2ffcad5e992f338cc6f818bb8552eb1e7a3fa5c04df37513cde2d2f3d335af6a', '["*"]', '2026-06-18 19:06:58', NULL, '2026-06-18 19:05:03', '2026-06-18 19:06:58'),
	(98, 'App\\Models\\User', 2, 'api-token', 'b34adcc124f4c6983ffd233cd707cf64a5ad2d00312451bf32a8fb387504f8ca', '["*"]', NULL, NULL, '2026-06-18 19:13:41', '2026-06-18 19:13:41'),
	(99, 'App\\Models\\User', 2, 'api-token', 'ed4b45e848c8e2974dffe9f2b0de17dbe33dcac82488f2184e02ea14a26d5758', '["*"]', '2026-06-18 19:14:17', NULL, '2026-06-18 19:13:48', '2026-06-18 19:14:17'),
	(100, 'App\\Models\\User', 2, 'api-token', '85213ca3beaa94f4ba8e4875e7dbf2e0a82a34900185205f621f1064f2c47c40', '["*"]', '2026-06-18 19:38:35', NULL, '2026-06-18 19:29:50', '2026-06-18 19:38:35'),
	(101, 'App\\Models\\User', 2, 'api-token', '5cd606e3061c4ad7e94a05678f80077fac54ed88803c2c9fdcb20e1b12be0bb3', '["*"]', NULL, NULL, '2026-06-18 21:19:18', '2026-06-18 21:19:18'),
	(102, 'App\\Models\\User', 2, 'api-token', '29d767af38ba447d3ea4ccec0c2c7f0d394b7c3c0bb77ea44f898ec37fcaee4f', '["*"]', '2026-06-18 21:22:01', NULL, '2026-06-18 21:21:46', '2026-06-18 21:22:01'),
	(103, 'App\\Models\\User', 2, 'api-token', '786bb8fdd48653a8c7541aab93223600b133cf1432e4d45458ffcd994d1b1502', '["*"]', '2026-06-19 03:43:53', NULL, '2026-06-19 03:40:23', '2026-06-19 03:43:53'),
	(104, 'App\\Models\\User', 2, 'api-token', '748413d924d69ae6ab10fda61208fdcaedce29eeaf85e6539203d2586aee35df', '["*"]', '2026-06-21 00:41:09', NULL, '2026-06-21 00:39:38', '2026-06-21 00:41:09'),
	(105, 'App\\Models\\User', 2, 'api-token', 'b62c63764dac72c77eb434eed9f7fe1141dac97e506e47ff1e22f91fba379823', '["*"]', '2026-06-21 02:44:12', NULL, '2026-06-21 02:44:02', '2026-06-21 02:44:12'),
	(106, 'App\\Models\\User', 2, 'api-token', '469e7bd73b5c34df11c3286ab7357844b828024f6d0f5a89bb342572c75104f2', '["*"]', '2026-06-21 22:38:29', NULL, '2026-06-21 22:38:22', '2026-06-21 22:38:29'),
	(107, 'App\\Models\\User', 2, 'api-token', '6b16cc6df86a617d8e1a3d53cd94e93bf42c663e22ce83be79f2bb85200feed1', '["*"]', '2026-06-21 23:10:01', NULL, '2026-06-21 23:09:37', '2026-06-21 23:10:01'),
	(108, 'App\\Models\\User', 2, 'api-token', '0e8beeafabee4e865a80ad1bb4bfb48973afd04f228fc79824973278448d6503', '["*"]', '2026-06-21 23:56:14', NULL, '2026-06-21 23:56:08', '2026-06-21 23:56:14'),
	(109, 'App\\Models\\User', 2, 'api-token', 'd775895e66f2d40450ffa63c00109485e0ad2ad4c4306b6a47d3f404750c24ba', '["*"]', '2026-06-22 00:46:54', NULL, '2026-06-22 00:45:00', '2026-06-22 00:46:54'),
	(110, 'App\\Models\\User', 2, 'api-token', '5fc1ddd07fae618c6fb6c329406856c196ee6d812dac829b9e1c1fcaeb4ed7a3', '["*"]', '2026-06-22 00:54:47', NULL, '2026-06-22 00:54:42', '2026-06-22 00:54:47'),
	(111, 'App\\Models\\User', 2, 'api-token', 'a788999a7893e224a9d6f670a88439d2f28022961643396cb7472f3939d777ba', '["*"]', NULL, NULL, '2026-06-22 01:06:59', '2026-06-22 01:06:59'),
	(112, 'App\\Models\\User', 2, 'api-token', '0c34d8b81ca8670eb72e3f78d9d6a5e37b6f47017e41a8095a4efe3ea7c17b6d', '["*"]', NULL, NULL, '2026-06-22 03:29:32', '2026-06-22 03:29:32'),
	(113, 'App\\Models\\User', 2, 'api-token', 'fff2965f991aa4b780fc44d5469cb8fb39222e094f870cc671c6d60fc706fd4d', '["*"]', '2026-06-22 03:32:52', NULL, '2026-06-22 03:32:38', '2026-06-22 03:32:52'),
	(114, 'App\\Models\\User', 2, 'api-token', 'bc1edc4a56a0ffada37a16650bd781f81df1236f90a402b5cbe223e6b8b78d80', '["*"]', '2026-06-22 17:29:41', NULL, '2026-06-22 17:29:33', '2026-06-22 17:29:41'),
	(115, 'App\\Models\\User', 2, 'api-token', 'f493c99abebf7651b3928548a3cf1aa21984902b445401efc1302fd888189159', '["*"]', '2026-06-22 17:32:55', NULL, '2026-06-22 17:32:28', '2026-06-22 17:32:55'),
	(116, 'App\\Models\\User', 2, 'api-token', 'c0000cdec102af87b4e2c32a589e6267276801c804341c7d0cdcbf31237a9205', '["*"]', '2026-06-22 17:42:29', NULL, '2026-06-22 17:42:20', '2026-06-22 17:42:29'),
	(117, 'App\\Models\\User', 2, 'api-token', 'ca6c20d3093088e56324652d3ba97ce1e62dd49f025a691e7874cda0886ce32a', '["*"]', '2026-06-22 17:52:35', NULL, '2026-06-22 17:52:28', '2026-06-22 17:52:35'),
	(118, 'App\\Models\\User', 2, 'api-token', '98272ead7118432f73bfe5f71d030be25571a38ad3ebe67429c1bd11a46ea0a0', '["*"]', '2026-06-22 18:05:17', NULL, '2026-06-22 17:58:32', '2026-06-22 18:05:17'),
	(119, 'App\\Models\\User', 1, 'api-token', '9837383bb0545c6720aa8d6d4092dd81cd1933efe7fd9234c1c123fb985c21f1', '["*"]', '2026-06-22 18:15:42', NULL, '2026-06-22 18:14:58', '2026-06-22 18:15:42'),
	(120, 'App\\Models\\User', 1, 'api-token', 'a06c4278ae205b60b7b636def6016d809cce0b6399c485a15deb9c4217393ca4', '["*"]', NULL, NULL, '2026-06-22 18:18:10', '2026-06-22 18:18:10'),
	(121, 'App\\Models\\User', 1, 'api-token', 'f343c161b5e28810387e46fa2ed997c1abc363145646d225f30ebbf540537f87', '["*"]', '2026-06-22 19:56:28', NULL, '2026-06-22 18:18:51', '2026-06-22 19:56:28'),
	(122, 'App\\Models\\User', 2, 'api-token', '2d915e596e137f10d59c35fb96731a69259b84775049e92ff9f6a31db9da56ab', '["*"]', '2026-06-22 21:28:28', NULL, '2026-06-22 20:03:06', '2026-06-22 21:28:28'),
	(123, 'App\\Models\\User', 2, 'api-token', '9a94ac9a7d0c93c1d63a5cc73f4d17f1eb23c2f34f4a084519a176513e2b99f0', '["*"]', '2026-06-23 01:05:32', NULL, '2026-06-23 01:05:22', '2026-06-23 01:05:32'),
	(124, 'App\\Models\\User', 2, 'api-token', '77891657f2803c070f1944f518a7e2eef125298669b28f421b06a3c1de4f7543', '["*"]', '2026-06-23 01:47:01', NULL, '2026-06-23 01:40:39', '2026-06-23 01:47:01'),
	(125, 'App\\Models\\User', 2, 'api-token', '73dc31db351871f0bbc6952583ce3f06a45a838b0d89f29bda46a50fab90e0cf', '["*"]', '2026-06-23 02:22:41', NULL, '2026-06-23 02:17:40', '2026-06-23 02:22:41'),
	(126, 'App\\Models\\User', 2, 'api-token', '06b50bb8a2d54fd2780bf408667fea03eedeee3937052642a40ac9e961af98bd', '["*"]', '2026-06-23 02:32:28', NULL, '2026-06-23 02:31:50', '2026-06-23 02:32:28'),
	(127, 'App\\Models\\User', 2, 'api-token', 'add3ab996877c57b8132fe261ef92de61016353d5c7ce0a06ca633c84ae68df9', '["*"]', NULL, NULL, '2026-06-23 23:46:09', '2026-06-23 23:46:09'),
	(128, 'App\\Models\\User', 2, 'api-token', '257fede976b214ef0af87ddcefd45071ee7724e7e5cbbe5aed4b37f58f033a6b', '["*"]', '2026-06-23 23:51:45', NULL, '2026-06-23 23:51:36', '2026-06-23 23:51:45'),
	(129, 'App\\Models\\User', 2, 'api-token', '94dca43fbf36d3cb1f10faf67d79470bf3c91a4cb5b986eb1d4f6650a6b26467', '["*"]', '2026-06-23 23:51:57', NULL, '2026-06-23 23:51:51', '2026-06-23 23:51:57'),
	(130, 'App\\Models\\User', 2, 'api-token', '370e583810e2fb9278b5efccd02e626ce94db485816e28b6c1affadcb53b8416', '["*"]', '2026-06-23 23:54:36', NULL, '2026-06-23 23:54:06', '2026-06-23 23:54:36'),
	(131, 'App\\Models\\User', 2, 'api-token', '0ab6f76d29b6488fa5a12cad82bcf6d81168ecd3c2c52348e134db8dc74df5ec', '["*"]', '2026-06-24 01:33:43', NULL, '2026-06-24 01:33:36', '2026-06-24 01:33:43');

-- Dumping structure for table budimanc_sekolah.ppdb
DROP TABLE IF EXISTS `ppdb`;
CREATE TABLE IF NOT EXISTS `ppdb` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nisn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `asal_sekolah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_ortu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','diterima','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ppdb_unit_index` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.ppdb: ~0 rows (approximately)

-- Dumping structure for table budimanc_sekolah.prestasis
DROP TABLE IF EXISTS `prestasis`;
CREATE TABLE IF NOT EXISTS `prestasis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori` enum('siswa','guru','sekolah') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'siswa',
  `tingkat` enum('Lokal','Nasional','Internasional') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Nasional',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.prestasis: ~1 rows (approximately)
REPLACE INTO `prestasis` (`id`, `unit`, `judul`, `konten`, `tanggal`, `image`, `kategori`, `tingkat`, `created_at`, `updated_at`) VALUES
	(2, 'smp', 'Juara Bikin Donat', '....', '2026-06-23', 'http://localhost:8000/storage/prestasi/smp/1782188384_7.jpeg', 'siswa', 'Lokal', '2026-06-22 21:19:45', '2026-06-22 21:19:45');

-- Dumping structure for table budimanc_sekolah.program_fasilitas
DROP TABLE IF EXISTS `program_fasilitas`;
CREATE TABLE IF NOT EXISTS `program_fasilitas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `ikon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `program_fasilitas_slug_unique` (`slug`),
  KEY `program_fasilitas_unit_index` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.program_fasilitas: ~1 rows (approximately)
REPLACE INTO `program_fasilitas` (`id`, `unit`, `nama`, `slug`, `deskripsi`, `ikon`, `url`, `created_at`, `updated_at`) VALUES
	(2, 'smp', 'Outing Class', 'outing-class-eMSSx', 'jadi kemaren we, kita abis outing class... anjai', 'http://localhost:8000/storage/program-fasilitas/smp/1781070389_teesss.jpeg', NULL, '2026-06-09 22:46:31', '2026-06-09 22:46:31');

-- Dumping structure for table budimanc_sekolah.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.sessions: ~0 rows (approximately)
REPLACE INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('bXsapKu7HPY8n0yTfwQi0iVVVRu7coaaAeRWS0Ob', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.122.1 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', 'eyJfdG9rZW4iOiJpRUJITVJ0c1ZFTGttMGlSS1N5U2M2WVZpZ0dSV1ZiT1dGa2syU3l6IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1780468860),
	('if8J2LOF8Skln5qokpXntgnqQhwPGnZhWTxZuEpw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJDN0dlSzNGdjJRc0pEVlM0bHF6SU53OXhiTWhqamx3ZlRNRUx6NkJLIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1780389853),
	('k2POcjtjJvchOqJiFWwjPTAsRV9bD1BgsMDBkkmu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJxdzZ0RkxrYmpYR1lsT2dBMnlUNHpPd2o2ZEVLazlac244cUZuNm5LIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1782296758),
	('odmhl2r8EwOV35HhRI7DfGyEfNXQVye1OIRnXFLA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJrZ1Z1VEJtTmNmRElQS1VhOE1lODFmT2g2QXZLSWIyYUtEdk92dUtaIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1780404074),
	('SKDuC5FvKVTQ5a13dscpxUvUZPP0tekaEUf6hY35', NULL, NULL, '', 'eyJfdG9rZW4iOiI1WDRxZXNPUGxDam1hN2JSWjNnbUtHZ1N2OGV6STA3NUM3aEFySXhRIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzoiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1781515468);

-- Dumping structure for table budimanc_sekolah.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.settings: ~17 rows (approximately)
REPLACE INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
	(2, 'headmaster_title', 'Gelar Baru Test', '2026-06-15 02:25:48', '2026-06-15 02:25:48'),
	(3, 'instagram_title', 'Yuk, Kepoin Keseruan Kami di Instagram', '2026-06-16 01:42:19', '2026-06-16 01:42:19'),
	(4, 'instagram_description', 'Mulai dari keseruan belajar di kelas, tawa ceria saat bermain, hingga momen-momen penuh prestasi. Semuanya kami bagikan lewat cerita harian dan galeri foto aesthetic di Instagram. Yuk, follow biar nggak ketinggalan keseruannya!', '2026-06-16 01:42:19', '2026-06-16 01:42:19'),
	(5, 'instagram_url', 'https://www.instagram.com/sat_almanshurah/', '2026-06-16 01:42:19', '2026-06-16 01:42:19'),
	(6, 'instagram_username', 'budimanc_sekolah', '2026-06-16 01:42:19', '2026-06-16 01:42:19'),
	(7, 'tiktok_url', 'https://www.tiktok.com/', '2026-06-17 23:17:21', '2026-06-17 23:17:21'),
	(8, 'whatsapp_number', '6281534648183', '2026-06-17 23:17:21', '2026-06-17 23:17:21'),
	(9, 'site_logo', 'logo.png', '2026-06-19 03:42:41', '2026-06-19 03:42:41'),
	(10, 'unit', 'smp', '2026-06-23 01:45:40', '2026-06-23 01:45:40'),
	(11, 'profil_tahun_berdiri_smp', '2020', '2026-06-23 01:45:40', '2026-06-23 01:46:29'),
	(12, 'profil_akreditasi_smp', 'A', '2026-06-23 01:45:41', '2026-06-23 01:45:41'),
	(13, 'profil_telp_smp', '081534648183', '2026-06-23 01:45:41', '2026-06-23 01:45:41'),
	(14, 'profil_misi_smp', '[]', '2026-06-23 01:45:41', '2026-06-23 01:45:41'),
	(15, 'profil_cta_title_smp', 'Jadilah Bagian Dari Kami', '2026-06-23 01:45:41', '2026-06-23 01:45:41'),
	(16, 'profil_cta_telp_smp', '081534648183', '2026-06-23 01:45:41', '2026-06-23 01:45:41'),
	(17, 'profil_cta_email_smp', 'budimanc_sekolah304@gmail.com', '2026-06-23 01:45:41', '2026-06-23 01:45:41'),
	(18, 'profil_sejarah_foto_smp', 'sejarah_smp_1782204421.jpeg', '2026-06-23 01:45:41', '2026-06-23 01:47:01');

-- Dumping structure for table budimanc_sekolah.site_settings
DROP TABLE IF EXISTS `site_settings`;
CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.site_settings: ~0 rows (approximately)

-- Dumping structure for table budimanc_sekolah.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `unit` enum('sd','smp') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table budimanc_sekolah.users: ~2 rows (approximately)
REPLACE INTO `users` (`id`, `name`, `email`, `unit`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin SD', 'admin_sd@budimanc_sekolah.com', 'sd', NULL, '$2y$12$FU3i6oq06Vtq9FCxLwxuFuwtBcYmKJnzX/Y32CBi9fBUvG8qtRdLq', NULL, '2026-06-02 23:05:35', '2026-06-22 18:15:43'),
	(2, 'Admin SMP', 'admin_smp@budimanc_sekolah.com', 'smp', NULL, '$2y$12$VOW8OJ6rfbneG6badrOQZ.2KfqbwXVP8PYtcgdozYwqXF.3fRH6.e', NULL, '2026-06-02 23:06:40', '2026-06-18 19:06:59');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
