-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for laravel
CREATE DATABASE IF NOT EXISTS `laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laravel`;

-- Dumping structure for table laravel.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.categories: ~7 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `url`) VALUES
	(1, 'Mobile', 'mobile'),
	(2, 'Tin ICT', 'tin-ict'),
	(3, 'Internet', 'Internet'),
	(5, 'Xem', NULL),
	(6, 'Khám phá', NULL),
	(7, 'Xem-Mua-Luôn', NULL),
	(26, 'test', NULL);

-- Dumping structure for table laravel.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.comments: ~29 rows (approximately)
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 11, 'Chỉ là 1 người đến sau', NULL, NULL, NULL),
	(2, 2, 4, 'Chúng ta không thuộc về nhau', NULL, NULL, NULL),
	(3, 4, 11, 'Nắng ấm xa dần rồi', NULL, '2022-11-01 19:21:03', NULL),
	(4, 3, 1, 'alo hakkkk', '2022-10-28 01:41:35', '2022-11-08 01:01:09', NULL),
	(5, 3, 1, 'bai viet hay qua', '2022-10-28 01:50:19', '2022-10-28 01:50:19', NULL),
	(6, 4, 1, 'tuyet voi!', '2022-10-28 01:53:03', '2022-10-28 03:58:01', '2022-10-28 03:58:01'),
	(9, 4, 6, 'Biết đi về chốn đâu', '2022-10-28 02:31:25', '2022-10-28 02:31:25', NULL),
	(10, 4, 6, 'khuôn mặt đáng thương', '2022-10-28 02:31:40', '2022-10-28 02:31:40', NULL),
	(11, 2, 2, 'This is just so magical, it makes you feel an undescribable way, it\'s enough to bring me to tears everytime I listen to it, it\'s just so emotional', '2022-10-28 09:01:40', '2022-10-28 09:01:40', NULL),
	(14, 3, 11, 'Hạnh Phúc Đó Em Không Có', '2022-10-28 09:21:41', '2022-10-28 09:21:41', NULL),
	(15, 3, 11, 'Vòng tay anh ấm áp ôm em ngày xưa nay đã dành cho ai kia\r\nMôi hôn ngọt trao em đê mê nhưng khi bên người anh cũng thế\r\nĐừng xin lỗi với những đôi chối em đã mệt rồi\r\nMình không thể tiếp tục lầm lỗi.', '2022-10-28 09:22:03', '2022-10-28 09:22:03', NULL),
	(17, 1, 6, 'Cảm ơn vì ai đó đã mang đến em tiếng cười. Điều mà em luôn thiếu từ khi chúng tôi xa rời', '2022-10-31 03:43:10', '2022-10-31 03:43:10', NULL),
	(19, 2, 11, 'Anh tán linh loạn', '2022-10-31 07:13:25', '2022-10-31 07:13:25', NULL),
	(20, 4, 1, 'Có gì hay ho', '2022-10-31 20:53:04', '2022-10-31 20:53:30', NULL),
	(21, 4, 1, 'Hướng dẫn phân quyền trong Laravel', '2022-10-31 20:53:24', '2022-10-31 20:53:24', NULL),
	(22, 4, 1, 'cái này sinh ra để xóa', '2022-10-31 20:53:42', '2022-10-31 20:53:44', '2022-10-31 20:53:44'),
	(23, 7, 9, 'Bài của ông hay thế', '2022-10-31 22:01:00', '2022-10-31 22:01:00', NULL),
	(25, 4, 2, 'Sầu làn mi khép tình buồn ai ép biết đi về chốn đâu', '2022-11-01 19:22:53', '2022-11-01 19:22:53', NULL),
	(29, 5, 1, 'comment', '2022-11-02 01:55:58', '2022-11-07 21:24:38', '2022-11-07 21:24:38'),
	(30, 11, 27, 'à i à i ái', '2022-11-03 01:46:48', '2022-11-03 01:46:48', NULL),
	(31, 11, 16, 'cảm ơn vì ai đó đã mang đến em tiếng cười', '2022-11-03 01:49:34', '2022-11-03 01:49:34', NULL),
	(32, 10, 1, 'sinh ra là để xóaaa', '2022-11-05 09:47:48', '2022-11-07 21:26:42', '2022-11-07 21:26:42'),
	(33, 10, 1, 'thử phát nữa được khummmmmm', '2022-11-05 09:51:20', '2022-11-05 10:02:28', '2022-11-05 10:02:28'),
	(34, 10, 1, 'thêm 1 comment nữa nào', '2022-11-05 10:12:06', '2022-11-05 10:12:06', NULL),
	(35, 11, 12, 'T1 thua rồi', '2022-11-06 18:21:50', '2022-11-06 18:21:50', NULL),
	(36, 2, 16, 'Naruto shippuden', '2022-11-07 02:53:08', '2022-11-07 02:53:08', NULL),
	(37, 1, 1, 'test', '2022-11-07 20:03:35', '2022-11-07 21:12:45', '2022-11-07 21:12:45'),
	(38, 2, 31, 'thử comment', '2022-11-07 21:31:56', '2022-11-07 21:40:12', '2022-11-07 21:40:12'),
	(39, 2, 31, 'thử comment lại', '2022-11-07 21:40:19', '2022-11-07 21:49:08', '2022-11-07 21:49:08');

-- Dumping structure for table laravel.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table laravel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.migrations: ~17 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_10_25_021653_create_categories_table', 2),
	(6, '2022_10_25_021839_create_posts_table', 2),
	(7, '2022_10_25_022040_creat_table_roles_table', 2),
	(8, '2022_10_25_022102_creat_table_roles_table', 2),
	(9, '2022_10_25_024800_update_table_users_table', 3),
	(10, '2022_10_25_024959_update_table_posts_table', 4),
	(11, '2022_10_25_025044_update_table_user_role_table', 4),
	(12, '2022_10_25_031323_creat_foreign_keys_post_table', 5),
	(13, '2022_10_27_070708_create_comments_table', 6),
	(14, '2022_10_27_072633_add_soft_delete_comments', 7),
	(15, '2022_10_27_104053_add_column_img_url_posts', 8),
	(16, '2022_11_09_040928_timestamp_post', 9),
	(17, '2022_11_09_062550_view_count_post', 10);

-- Dumping structure for table laravel.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.password_resets: ~1 rows (approximately)
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('admin@gmail.com', '$2y$10$CT4ubNT1DErgNDJ1sOl8l.rSLlIdjADpNkXrfpRYXenApvc.hE3GG', '2022-11-08 01:15:25');

-- Dumping structure for table laravel.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table laravel.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cate_id` int unsigned DEFAULT NULL,
  `author_id` bigint unsigned NOT NULL,
  `url_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `view_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_author_id_foreign` (`author_id`),
  KEY `posts_cate_id_foreign` (`cate_id`),
  CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.posts: ~16 rows (approximately)
INSERT INTO `posts` (`id`, `title`, `description`, `body`, `cate_id`, `author_id`, `url_img`, `created_at`, `updated_at`, `view_count`) VALUES
	(1, 'Giới đầu cơ thu gom iPhone 14 Pro Max màu Tím khiến giá máy tăng mạnh', 'iPhone 14 Pro và Pro Max phiên bản màu Tím cháy hàng trên tất cả các kênh phân phối, giá máy tăng mạnh khiến nhiều người khó mua được', '<p>Ng&agrave;y 14/10, c&aacute;c hệ thống b&aacute;n lẻ v&agrave; k&ecirc;nh ph&acirc;n phối ch&iacute;nh thức của Apple mở b&aacute;n bộ bốn sản phẩm iPhone 14 series, gồm iPhone 14, iPhone 14 Plus, iPhone 14 Pro v&agrave; iPhone 14 Pro Max. Năm nay Apple giới thiệu phi&ecirc;n bản m&agrave;u T&iacute;m (Deep Purple) cho 2 phi&ecirc;n bản Pro. Mặc d&ugrave; m&agrave;u T&iacute;m năm nay c&oacute; t&ocirc;ng m&agrave;u hơi tối, tuy nhi&ecirc;n do l&agrave; tuỳ chọn m&agrave;u mới n&ecirc;n đợt đầu mở b&aacute;n, c&aacute;c đại l&yacute; đều th&ocirc;ng b&aacute;o ch&aacute;y h&agrave;ng phi&ecirc;n bản m&agrave;u n&agrave;y. Tại c&aacute;c k&ecirc;nh ph&acirc;n phối của Apple tr&ecirc;n c&aacute;c s&agrave;n thương mại điện tử, tuỳ chọn m&agrave;u T&iacute;m thậm ch&iacute; c&ograve;n c&oacute; gi&aacute; đắt hơn so với c&aacute;c tuỳ chọn m&agrave;u kh&aacute;c từ 500,000 tới 1 triệu đồng, nhưng cũng phi&ecirc;n bản m&agrave;u n&agrave;y cũng nhanh ch&oacute;ng ch&aacute;y h&agrave;ng chỉ sau v&agrave;i ph&uacute;t mở b&aacute;n. Giới đầu cơ thu gom iPhone 14 Pro Max m&agrave;u T&iacute;m Với sức hấp dẫn của tuỳ chọn m&agrave;u T&iacute;m, đặc biệt l&agrave; của phi&ecirc;n bản iPhone 14 Pro Max, vốn l&agrave; chiếc iPhone được người d&ugrave;ng Việt quan t&acirc;m nhất mỗi m&ugrave;a iPhone mở b&aacute;n, đ&acirc;y l&agrave; sản phẩm được giới đầu cơ quan t&acirc;m bởi gi&aacute; nhập v&agrave;o nếu biết c&aacute;ch &quot;săn&quot; th&igrave; sẽ rẻ hơn thị trường nhiều, trong khi gi&aacute; b&aacute;n đầu ra th&igrave; c&oacute; thể ch&ecirc;nh lệch từ 3 tới 4 triệu đồng, thậm ch&iacute; cao hơn cả gi&aacute; ni&ecirc;m yết v&agrave; lu&ocirc;n c&oacute; người cần mua.</p>', 1, 1, 'img/anh1.webp', '2022-06-09 04:24:26', '2022-11-09 01:28:03', 1),
	(2, 'Cánh hoa úa tàn', 'Bức tranh vén màn', '<p>B&oacute;ng ai xa ng&uacute;t ng&agrave;n.</p>', 2, 6, 'img/anh2.webp', '2022-10-09 04:24:29', '2022-11-08 21:23:51', 0),
	(4, 'Bài viết này của Admin', 'TAYLOR SWIFT LÀM NÊN LỊCH SỬ NGÀNH ÂM NHẠC KHI QUÉT SẠCH TOP 10 BILLBOARD HOT 100', '<p>Ngay trong ng&agrave;y đầu nhậm chức, Elon Musk đ&atilde; đưa ra y&ecirc;u cầu đ&ocirc;i phần qu&aacute;i gở cho c&aacute;c lập tr&igrave;nh vi&ecirc;n tại Twitter. Theo lời ph&oacute;ng vi&ecirc;n Casey Newton - c&acirc;y b&uacute;t cộng t&aacute;c với The New York Times v&agrave; hiện đang viết cho The Platform, &ocirc;ng Musk buộc c&aacute;c lập tr&igrave;nh vi&ecirc;n in ra giấy những g&igrave; m&igrave;nh đ&atilde; l&agrave;m, hay cụ thể hơn l&agrave; to&agrave;n bộ số ng&ocirc;n ngữ lập tr&igrave;nh họ đ&atilde; nhập v&agrave;o m&aacute;y t&iacute;nh trong 30 tới 60 ng&agrave;y qua. Số code n&agrave;y sẽ được tr&igrave;nh l&ecirc;n Elon Musk v&agrave; kỹ sư cấp cao tại Tesla xem qua. Một số lập tr&igrave;nh vi&ecirc;n kh&aacute;c được dặn l&agrave; sẽ sớm phải &ldquo;so s&aacute;nh code&rdquo; với Elon Musk, tức l&agrave; ngồi đối mặt với vị tỷ ph&uacute; v&agrave; c&ugrave;ng nhau xem r&agrave; so&aacute;t lại những nội dung m&agrave; lập tr&igrave;nh vi&ecirc;n Twitter nhập v&agrave;o m&aacute;y. Một thư k&yacute; của Twitter đ&atilde; y&ecirc;u cầu c&aacute;c lập tr&igrave;nh vi&ecirc;n &ldquo;in 50 trang code đ&atilde; nhập trong 30 ng&agrave;y qua (nếu 30 ng&agrave;y qua m&agrave; nh&acirc;n vi&ecirc;n kh&ocirc;ng thực hiện viết code, c&oacute; thể t&igrave;m lại số code được nhập trong v&ograve;ng 60 ng&agrave;y qua&rdquo;.</p>', 3, 2, 'img/anh4.webp', '2022-06-09 04:24:31', '2022-11-08 21:24:08', 0),
	(6, 'bức tranh vén màn', 'bóng ai xa ngút ngàn', 'sầu làn mi khép tình buồn ai ép', 1, 1, 'img/anh1.webp', '2022-08-09 04:24:31', NULL, 0),
	(9, 'Cổ phiếu Meta chạm đáy, bị loại khỏi top 20 công ty lớn nhất thế giới, đà giảm chưa có dấu hiệu dừng', 'Đầu năm vốn hóa của Meta là 1.000 tỷ USD, hiện giờ con số này chỉ còn 258 tỷ USD.', 'Các cổ đông của Meta Platforms đang phải trả giá đắt cho kế hoạch tham chiến mảng metaverse (vũ trụ ảo) của Mark Zuckerberg: Giá trị thị trường của công ty mẹ Facebook đã bị bốc hơi ở con số kỷ lục tới 677 tỷ USD trong năm nay, khiến họ bị loại khỏi hàng ngũ 20 công ty lớn nhất thế giới.\r\n\r\nĐiều đáng nói là đà giảm này không có dấu hiệu dừng lại trong tương lai gần. Cổ phiếu của Meta đã giảm tới 25% sau khi khiến các nhà đầu tư kinh ngạc với báo cáo kết quả kinh doanh chịu chi phí tăng cao phần nhiều do chi đậm vào mảng thực tế ảo và sự sụt giảm doanh thu.\r\n\r\nMeta là công ty lớn thứ sáu của Mỹ tính theo vốn hóa thị trường vào đầu năm, với giá trị thị trường 1 nghìn tỷ USD. Tuy nhiên, chỉ qua 10 tháng và giá trị công ty này chỉ còn trị giá khoảng 258 tỷ USD, xếp thứ 26. Giá trị thị trường của họ hiện nhỏ hơn loạt công ty bao gồm Chevron Corp., Eli Lilly & Co. và Procter & Gamble Co.', 1, 6, 'img/anh3.webp', '2022-08-09 04:24:32', '2022-11-09 02:43:20', 1),
	(11, 'Thị trường smartphone lao dốc: Samsung, Xiaomi, Oppo ‘mất ăn mất ngủ’, chỉ một cái tên cười thầm', 'Đây là nhà sản xuất duy nhất trong top 5 tăng trưởng dương về doanh số trong quý III/2022. Bên cạnh đó, khoảng cách của nhà sản xuất này với người đứng đầu cũng đang ngày càng thu hẹp.', 'Thị trường smartphone toàn cầu đã có một quý nghèo nàn về doanh số, theo dữ liệu từ hãng nghiên cứu thị trường Canalys. Theo đó, nhu cầu thấp của người dùng đã dẫn việc doanh số smartphone toàn cầu sụt giảm đến 9% so với cùng kỳ năm 2021. Nhờ iPhone 13 và 14 series, Apple là nhà sản xuất duy nhất trong top 5 ghi nhận doanh số tăng trưởng dương trong quý III.\r\n\r\nApple nhà sản xuất duy nhất tăng trưởng\r\n\r\nMặc dù sụt giảm đến 8% doanh số so với cùng kỳ năm ngoái, Samsung vẫn vững vàng ở ngôi vị số một thị trường với 64,1 triệu smartphone bán ra trong khoảng thời gian từ tháng 7 đến tháng 9. Thị phần của hãng được ghi nhận là 22%.\r\n\r\nApple chính là nhà sản xuất lớn thứ 2 thế giới với 53 triệu iPhone bán ra, tăng 8% so với cùng kỳ. Apple hiện chiếm giữ 18% thị phần smartphone toàn cầu.\r\nỞ vị trí thứ 3, Xiaomi cũng ghi nhận tăng trưởng âm 8 % với 40,5 triệu smartphone bán ra. Chiếm 14% thị phần. Oppo kết thúc quý III ở vị trí thứ 4 nhưng chứng kiến doanh số giảm đến 22%. Hãng này bán được 28,5 triệu smartphone, chiếm 10% thị phần.\r\n\r\nCái tên cuối cùng trong top 5 là Vivo. Trong quý này, nhà sản xuất Trung Quốc bán được 27,4 triệu chiếc di động, giảm 20% so với cùng kỳ, chiếm 9% thị phần. Tổng cộng, toàn bộ ngành công nghiệp smarrphone đã bán được 297,8 triệu thiết bị, giảm 9% so với mức 325,6 triệu máy trong quý III/2021.', 1, 5, 'img/anh8.webp', '2022-08-09 04:24:32', '2022-11-09 01:16:53', 1),
	(12, 'Sau 1 tuần dùng thử AirPods Pro 2, đây là 3 tính năng tôi thích nhất', 'Là một người chưa dùng qua bất cứ phiên bản AirPods nào, tôi đã có chút ngỡ ngàng ban đầu nhưng nhanh chóng nhận thấy những điểm rất sáng giá của nó mà chỉ khi sử dụng hàng ngày mới hiểu được.', '<p>I just wanna kiss I never wanna miss 더 짜릿하게 one more time 내 숨을 가져가</p>\r\n\r\n<p>Bản th&acirc;n người viết b&agrave;i n&agrave;y cũng l&agrave; người d&ugrave;ng iPhone v&agrave; MacBook trong nhiều năm, tuy nhi&ecirc;n AirPods vẫn l&agrave; thứ g&igrave; đ&oacute; kh&aacute; lạ lẫm với t&ocirc;i. D&ugrave; Apple đ&atilde; ra đời tới 4 chiếc tai nghe dạng nh&eacute;t tai (3 d&ograve;ng AirPods thường v&agrave; d&ograve;ng AirPods Pro thế hệ đầu ti&ecirc;n), t&ocirc;i vẫn chưa muốn d&ugrave;ng v&igrave; cho rằng những sản phẩm kh&aacute;c bản th&acirc;n đang sử dụng c&oacute; phần nhỉnh hơn so với thiết bị &acirc;m thanh nh&agrave; T&aacute;o.</p>', 1, 1, 'img/anh5.webp', '2022-08-09 04:24:33', '2022-11-09 02:41:20', 2),
	(15, 'Naruto', 'May thay, Laravel có một cách khác để tải dữ liệu lên Model gọi là eager load', '<p>Đoạn code tr&ecirc;n hoạt động như sau, đầu ti&ecirc;n n&oacute; sẽ thực hiện một truy vấn lấy ra tất cả c&aacute;c cuốn s&aacute;ch, tiếp theo n&oacute; thực hiện một v&ograve;ng lặp với mỗi cuốn s&aacute;ch n&oacute; sẽ truy xuất đến t&aacute;c giả của cuốn s&aacute;ch. Với lazy load, nếu c&oacute; 10 cuốn s&aacute;ch, đoạn code tr&ecirc;n sẽ thực hiện 11 truy vấn bao gồm 1 truy vấn lấy tất cả th&ocirc;ng tin về s&aacute;ch v&agrave; 10 truy vấn lấy th&ocirc;ng tin về t&aacute;c giả.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>And all I gave you is gone Tumbled like it was stone Thought we built a dynasty that heaven couldn&#39;t shake Thought we built a dynasty like nothing ever made Thought we built a dynasty forever couldn&#39;t break up</p>', 1, 5, 'img/anh7.webp', '2022-10-09 04:24:33', NULL, 0),
	(16, 'Top các nhẫn thuật mạnh nhất của Uzumaki Naruto', 'Là nhân vật chính của series Naruto, danh sách các nhẫn thuật của Naruto cũng được rất nhiều khán giả quan tâm tìm hiểu.', '4. Trạng thái Tiên nhân\r\nTrạng thái Tiên nhân của Naruto là một dạng đặc biệt với sự kết hợp giữa Hiền Nhân thuật và chakra của Cửu Vĩ. Trạng thái Hiền Nhân yêu cầu người dùng phải nằm yên tuyệt đối để kết hợp chakra của mình với năng lượng của tự nhiên, tạo ra sự hòa hợp và cân bằng. \r\n\r\nKhi Naruto ở trạng thái Tiên nhân, cơ thể Naruto biến thành hình chữ thập và hoa văn trên áo choàng cũng bị thay đổi. Các nhẫn thuật của Naruto khi được triển khai ở trạng thái này đều mang sức mạnh cực kỳ khủng khiếp. \r\n\r\n5. Tiên Pháp: Dung Độn Loa Toàn Thủ Lý Kiếm\r\nSau khi có được sức mạnh của Vĩ thú và nhận được chakra Lục đạo, Naruto đã trở nên mạnh hơn gấp nhiều lần, đến mức có thể sánh ngang với Lục đạo Madara Uchiha ở dạng cơ bản. Đây cũng là lần đầu tiên Naruto sử dụng Dung Độn Loa Toàn Thủ Lý Kiếm bằng cách sử dụng chakra của Tứ Vĩ Songoku và trộn huyết kế giới hạn Dung Độn với Rasenshuriken.\r\n\r\nNhẫn thuật này của Naruto tạo ra một Rasenshuriken khổng lồ với nhân bên trong là dung nham. Sức nóng của dung nham khiến các lưỡi kiếm bốc hơi nước dày đặc. Khi được truyền đi, quả cầu này và các lưỡi dao có thể mở rộng và xé toạc mục tiêu một cách nhanh chóng. Nhẫn thuật này đủ mạnh để cắt hoàn toàn dạng cây của Thập Vĩ.\r\n\r\n6. Bom Vĩ Thú\r\nBom Vĩ thú là một kỹ thuật tối thượng của một vĩ thú, cũng có thể được sử dụng bởi một Jinchuuriki khi biến hình. Người dùng nhẫn thuật này phải thu thập và cân bằng chakra trong miệng, biến nó thành một quả cầu rồi bắn vào mục tiêu. Không chỉ giới hạn ở phạm vi một người dùng, các vĩ thú cũng có thể kết hợp các bom vĩ thú lại với nhau để tạo nên một quả bom khổng lồ có sức công phá khủng khiếp.', 2, 5, 'img/anh6.webp', '2022-11-03 04:24:34', NULL, 0),
	(26, 'Kage Bushin no jutsu', 'Hokage De that', '<p>Chạnh l&ograve;ng m&agrave; nh&igrave;n vội em quay đi Muộn phiền người để lại tr&ecirc;n đ&ocirc;i mi Giọt lệ sầu mừng ng&agrave;y em vu quy Em qu&ecirc;n đi t&ocirc;i, em nỡ đi rồi Em bỏ theo chồng Hỏi trời xanh kia &ocirc;i sao em kh&oacute;c Theo người ta nhưng &ocirc;i sao em kh&oacute;c Tr&ocirc;i b&igrave;nh y&ecirc;n tr&ecirc;n k&ecirc;nh nước kia Chẳng c&ograve;n n&agrave;ng thơ, chỉ c&ograve;n l&agrave; mơ Em đi về nơi khu&ecirc; ph&ograve;ng T&ocirc;i &ocirc;m khoảng trống nhớ mong Rồi từng đ&ecirc;m b&ecirc;n hi&ecirc;n ng&oacute;ng tr&ocirc;ng Chờ đợi ng&agrave;y mai c&oacute; em về kh&ocirc;ng Đợi m&atilde;i cũng chẳng thấy b&oacute;ng em đ&acirc;u Chờ m&atilde;i cũng chẳng thấy D&aacute;ng em đ&acirc;u D&ograve;ng thư tay viết nhanh tr&aacute;i ngang Gửi trao em người sang đ&ograve; Chạnh l&ograve;ng m&agrave; nh&igrave;n vội em quay đi Muộn phiền người để lại tr&ecirc;n đ&ocirc;i mi Giọt lệ sầu mừng ng&agrave;y em vu quy Em qu&ecirc;n đi t&ocirc;i, em nỡ đi rồi Em bỏ theo chồng Hỏi trời xanh kia &ocirc;i sao em kh&oacute;c Theo người ta nhưng &ocirc;i sao em kh&oacute;c Tr&ocirc;i b&igrave;nh y&ecirc;n tr&ecirc;n k&ecirc;nh nước kia Chẳng c&ograve;n n&agrave;ng thơ, chỉ c&ograve;n l&agrave; mơ</p>', 5, 7, 'img/anh7.webp', '2022-11-05 04:24:34', NULL, 0),
	(27, 'Cuộc săn tìm \'nhà\' trên sao Hỏa đã bắt đầu', 'các nhà nghiên cứu đã công bố 9 hang động hàng đầu trên sao Hỏa đáng để các phi hành gia trú ngụ trong tương lai.', '<p>Tất cả những hang động n&agrave;y k&eacute;o d&agrave;i dưới l&ograve;ng đất v&agrave; ch&uacute;ng gần với c&aacute;c địa điểm hạ c&aacute;nh an to&agrave;n cho một m&aacute;y bay hạng nhẹ, theo tờ<em>&nbsp;New York Times</em>.</p>\r\n\r\n<p>B&agrave; Nicole Bardabelias, một nh&agrave; địa chất học tại Đại học Arizona (Mỹ), cho biết những cấu tr&uacute;c n&agrave;y sẽ mang lại thời gian nghỉ ngơi cho c&aacute;c phi h&agrave;nh gia trong m&ocirc;i trường sao Hỏa đầy thử th&aacute;ch.</p>\r\n\r\n<p>Mọi thứ tr&ecirc;n bề mặt sao Hỏa đều phải chịu bức xạ khắc nghiệt, c&oacute; thể bị thi&ecirc;n thạch hoặc vi thi&ecirc;n thạch bắn ph&aacute; v&agrave; sự thay đổi nhiệt độ thực sự lớn giữa ng&agrave;y v&agrave; đ&ecirc;m.</p>\r\n\r\n<p>Để sở hữu &quot;bất động sản&quot; được săn l&ugrave;ng nhiều nhất tr&ecirc;n sao Hỏa, b&agrave; Bardabelias v&agrave; c&aacute;c đồng nghiệp phải tham khảo Danh mục ứng cử vi&ecirc;n hang động to&agrave;n cầu của sao Hỏa.</p>\r\n\r\n<p>Bản danh mục n&agrave;y dựa tr&ecirc;n h&igrave;nh ảnh được t&agrave;u vũ trụ Mars Odyssey v&agrave; Mars Reconnaissance Orbiter thu thập được. C&aacute;c nh&agrave; nghi&ecirc;n cứu kiểm k&ecirc; hơn 1.000 hang động ứng cử vi&ecirc;n v&agrave; c&aacute;c đặc điểm tr&ocirc;ng kỳ lạ kh&aacute;c tr&ecirc;n sao Hỏa.</p>\r\n\r\n<p>Cũng giống như bất kỳ người mua nh&agrave; s&agrave;nh điệu n&agrave;o sẽ lọc kết quả t&igrave;m kiếm tr&ecirc;n c&aacute;c trang mua b&aacute;n bất động sản, c&aacute;c nh&agrave; nghi&ecirc;n cứu đ&atilde; thu hẹp danh mục bằng c&aacute;ch &aacute;p đặt hai ti&ecirc;u ch&iacute;.</p>\r\n\r\n<h2>Đầu ti&ecirc;n, họ y&ecirc;u cầu một hang động nằm trong khoảng 96km t&iacute;nh từ địa điểm hạ c&aacute;nh của t&agrave;u vũ trụ. Thứ hai, họ quy định khu vực đ&oacute; phải c&oacute; h&igrave;nh ảnh độ ph&acirc;n giải cao khi quay video, chụp h&igrave;nh.<br />\r\n<strong>Test ph&aacute;t n&egrave;ooo</strong></h2>', 6, 6, 'img/fJG4mHic7Zsr0FO8znIOzCVOcdBYCBguzbikWrOl.jpg', '2022-11-06 04:24:35', '2022-11-09 01:15:55', 1),
	(28, 'admin', 'aaaa', '<p>aaaaaaaaa</p>', 1, 2, 'img/gGnpkTWI2GE0qr6HPNIVbbitD15icjNKAB7sJqwR.jpg', '2022-11-07 04:24:35', NULL, 0),
	(29, 'Trên tay máy nghe nhạc A&K SP3000 và tai nghe Odyssey: Bộ chơi nhạc di động trị giá tới 200 triệu', 'Chỉ phục vụ vấn đề nghe nhạc một cách nhỏ gọn thôi nhưng cũng "tốn" bằng 2 chiếc SH150i rồi!', '<p>Để nghe nhạc ở bất cứ đ&acirc;u th&igrave; rất đơn giản, chỉ cần một cặp tai nghe v&agrave; smartphone l&agrave; xong. Nhưng với những người kỹ t&iacute;nh, cần phải c&oacute; chất lượng nhạc vượt trội chứ kh&ocirc;ng chỉ dừng lại ở mức &quot;nghe được nhạc&quot; th&igrave; sẽ phải sẵn s&agrave;ng chi số tiền m&agrave; những người kh&aacute;c kh&ocirc;ng d&aacute;m chi.</p>\r\n\r\n<p>Điển h&igrave;nh như bộ m&aacute;y nghe nhạc v&agrave; tai nghe từ h&atilde;ng Astell &amp; Kern n&agrave;y, chỉ để phục vụ mục đ&iacute;ch duy nhất l&agrave; đưa nhạc đến tai người d&ugrave;ng th&ocirc;i m&agrave; cũng c&oacute; gi&aacute; b&aacute;n l&ecirc;n tới 200 triệu Đồng. Ch&uacute;ng c&oacute; g&igrave; đặc biệt để xứng đ&aacute;ng với mức gi&aacute; &quot;ng&uacute;t trời&quot; n&agrave;y?</p>\r\n\r\n<p>Nguồn ph&aacute;t nhạc l&agrave; chiếc m&aacute;y&nbsp;<strong><em>A&amp;K A&amp;Ultima SP3000</em></strong>&nbsp;- d&ograve;ng m&aacute;y nghe nhạc (DAP) đầu bảng vừa được ra mắt của Astell &amp; Kern. M&aacute;y c&oacute; thiết kế si&ecirc;u vu&ocirc;ng vức v&agrave; cũng si&ecirc;u nặng đặc trưng của m&aacute;y nghe nhạc từ h&atilde;ng.</p>\r\n\r\n<p>M&aacute;y c&oacute; khả năng giải m&atilde; nhạc PCM 768Hz/32-bit v&agrave; DSD512 v&agrave; ph&aacute;t nhạc Bluetooth với chuẩn apt-X, LDAC v&agrave; Bluetooth Sink cho ph&eacute;p chơi nhạc kh&ocirc;ng d&acirc;y từ m&aacute;y kh&aacute;c th&ocirc;ng qua SP3000. Ngo&agrave;i việc nghe nhạc offline th&igrave; ta cũng c&oacute; thể stream nhạc từ Tidal, Spotify, Apple Music, Amazon Music, Qubuz, Deezer hay Yendex.</p>', 7, 6, 'img/GJZ0htXYLbYBc0P2jdh2qh9nMzWgtRux5JRRbZKG.webp', '2022-11-08 04:24:28', NULL, 0),
	(30, 'Ngược dòng thời gian: từ một trang bị “cho có”, camera trên smartphone đã trở nên thông minh ntn', 'Trải qua hơn chục năm, giờ đây camera trên smartphone đã đủ sức mang lại những bức ảnh và video cực kỳ ấn tượng.', '<p>Trước thời đại smartphone, rất nhiều h&atilde;ng điện thoại đ&atilde; tập trung v&agrave;o camera tr&ecirc;n thiết bị của m&igrave;nh. Tuy nhi&ecirc;n, cuộc đua cải tiến camera tr&ecirc;n điện thoại đ&atilde; đ&igrave;nh trệ trong những năm đầu của smartphone, khi iPhone ra mắt v&agrave; chứng minh rằng c&oacute; nhiều t&iacute;nh năng quan trọng hơn m&aacute;y ảnh.</p>\r\n\r\n<p>Ng&agrave;y nay, ch&uacute;ng ta đ&atilde; c&oacute; những chiếc smartphone với khả năng chụp ảnh ấn tượng, nhờ v&agrave;o c&aacute;c cảm biến cao cấp. Sony Xperia Pro-I đ&atilde; vay mượn cảm biến 1 inch từ &ldquo;người anh em&rdquo; RX100, d&ugrave; Pro-I chỉ sử dụng cảm biến 12MP, thay v&igrave; 20MP như RX100.</p>\r\n\r\n<p>Cảm biến của Pro-I c&oacute; điểm ảnh lớn đến 2.4&micro;m rất ấn tượng. Ngay cả cảm biến ISOCELL HP3 200MP cũng chỉ l&ecirc;n đến 2.24&micro;m pixel với t&iacute;nh năng gh&eacute;p ảnh 16 trong 1. Tất nhi&ecirc;n, hai cảm biến n&agrave;y được thiết kế cho hai camera kh&aacute;c nhau với hai trường hợp sử dụng kh&aacute;c nhau.</p>\r\n\r\n<p>Pro-I kh&ocirc;ng phải l&agrave; smartphone đầu ti&ecirc;n c&oacute; cảm biến 1 inch v&agrave; chắc chắn sẽ kh&ocirc;ng phải l&agrave; chiếc cuối c&ugrave;ng. Năm 2023 hứa hẹn sẽ l&agrave; năm m&agrave; loại cảm biến n&agrave;y trở th&agrave;nh ti&ecirc;u chuẩn cho những chiếc flagship.</p>\r\n\r\n<p>Một số bạn c&oacute; thể nhớ&nbsp; Panasonic Lumix Smart Camera CM1 năm 2014. Kiểu d&aacute;ng m&aacute;y cho thấy đ&acirc;y r&otilde; r&agrave;ng l&agrave; một chiếc smartphone chuy&ecirc;n chụp ảnh v&agrave; n&oacute; c&oacute; phần cứng camera h&agrave;ng đầu: cảm biến 20MP 1 inch, ống k&iacute;nh Leica f/2.8 v&agrave; &ldquo;Venus engine&rdquo;c&oacute; thể quay video 1080p ở tốc độ 30 khung h&igrave;nh/gi&acirc;y (v&agrave; 4K ở 15 khung h&igrave;nh/gi&acirc;y).</p>\r\n\r\n<p>Đ&oacute; l&agrave; một chiếc điện to lớn, d&agrave;y 21mm v&agrave; nặng 204g. CM1 chạy Android 4.4 v&agrave; ứng dụng camera độc quyền cung cấp c&aacute;c điều khiển thủ c&ocirc;ng đầy đủ.</p>\r\n\r\n<p>Một t&iacute;nh năng thực sự th&uacute; vị l&agrave; v&ograve;ng bạc xung quanh ống k&iacute;nh ch&iacute;nh l&agrave; v&ograve;ng xoay c&oacute; thể được sử dụng để thay đổi c&agrave;i đặt của m&aacute;y ảnh. Lumix CM1 c&oacute; gi&aacute; l&ecirc;n đến 1.000 USD, v&agrave;o thời điểm đ&oacute; được coi l&agrave; đắt tiền, nhưng kh&ocirc;ng qu&aacute; cao đối với một thiết bị chuy&ecirc;n dụng như vậy.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>00:03:21</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 6, 5, 'img/LHtwGCq3U3qScwgk6tR0AfifORmbzx2rQdXheyns.webp', '2022-11-09 04:24:29', '2022-11-09 01:18:23', 2),
	(31, 'Công ty mẹ của Facebook chuẩn bị sa thải hàng loạt nhân sự', 'Meta, công ty mẹ của mạng xã hội Facebook, có kế hoạch sa thải hàng loạt nhân sự trong tuần này, ảnh hưởng đến hàng ngàn nhân viên, Wall Street Journal dẫn nguồn tin nắm được tình hình đưa tin ngày 6/11.', '<p>Tổng gi&aacute;m đốc điều h&agrave;nh Mark Zuckerberg cho biết &ocirc;ng đ&aacute;nh gi&aacute; những khoản đầu tư v&agrave;o vũ trụ ảo phải mất cả thập kỷ mới mang lại th&agrave;nh quả. Trong qu&aacute; tr&igrave;nh chờ đợi đ&oacute;, &ocirc;ng phải dừng tuyển th&ecirc;m người, dừng một số dự &aacute;n v&agrave; tổ chức lại c&aacute;c nh&oacute;m để giảm chi ph&iacute;.</p>\r\n\r\n<p>&ldquo;<em>Trong năm 2023, ch&uacute;ng t&ocirc;i sẽ tập trung đầu tư v&agrave;o một số lĩnh vực tăng trưởng ưu ti&ecirc;n. Điều đ&oacute; nghĩa l&agrave; một số nh&oacute;m sẽ tăng trưởng mạnh, nhưng một số nh&oacute;m kh&aacute;c sẽ đi ngang hoặc đi xuống trong năm tới. Nh&igrave;n chung, ch&uacute;ng t&ocirc;i kỳ vọng năm 2023 kết th&uacute;c với quy m&ocirc; tương đương, hoặc tổ chức nhỏ gọn hơn một ch&uacute;t so với hiện nay</em>&rdquo;, Zuckerberg n&oacute;i trong ph&aacute;t biểu hồi th&aacute;ng 10.</p>\r\n\r\n<p>Th&aacute;ng 6 năm nay, c&ocirc;ng ty mạng x&atilde; hội n&agrave;y giảm kế hoạch tuyển dụng kỹ sư xuống &iacute;t nhất 30%. Zuckerberg cảnh b&aacute;o c&aacute;c nh&acirc;n vi&ecirc;n c&oacute; thể sẽ phải chuẩn bị cho suy tho&aacute;i kinh tế.</p>\r\n\r\n<p>Gần đ&acirc;y, quỹ quản l&yacute; vốn Altimeter, một cổ đ&ocirc;ng của Meta, viết trong một bức thư ngỏ rằng c&ocirc;ng ty cần tinh giản bằng c&aacute;ch giảm bớt vị tr&iacute; v&agrave; chi ti&ecirc;u, cho rằng Meta đ&atilde; đ&aacute;nh mất niềm tin của nh&agrave; đầu tư khi tăng chi ti&ecirc;u v&agrave; chuyển hướng sang vũ trụ ảo.</p>\r\n\r\n<p>Nhiều c&ocirc;ng ty kh&aacute;c như Microsoft, Twitter v&agrave; Snap cũng đ&atilde; cắt giảm việc l&agrave;m v&agrave; dừng tuyển dụng nh&acirc;n sự mới trong những th&aacute;ng gần đ&acirc;y, khi tăng trưởng kinh tế to&agrave;n cầu chậm lại v&igrave;&nbsp;<a href="https://tienphong.vn/do-la-my-tang-gia-khi-fed-bao-hieu-manh-tay-tang-lai-suat-post1483346.tpo" target="_blank">l&atilde;i suất tăng</a>, lạm ph&aacute;t tăng v&agrave; khủng hoảng năng lượng ở ch&acirc;u &Acirc;u.</p>', 5, 7, 'img/hhWaVzhJpPBLZwhE3TYk6uqHYGVf3gmQF1mYhg7w.webp', '2022-11-09 04:24:37', '2022-11-09 01:20:56', 1),
	(32, 'AMD \'cố tình\' giảm xung để GPU ít ngốn điện, hiệu năng thực sự của RX 7900 XTX có thể mạnh hơn?', 'Với TDP thấp hơn, giá rẻ hơn so với đối thủ của NVIDIA, \'át chủ bài\' của AMD liệu có thể còn mạnh hơn so với con số đã công bố?', '<p>Trước m&agrave;n ra mắt của c&aacute;c mẫu GPU đầu bảng thuộc kiến tr&uacute;c RDNA 3, đ&atilde; c&oacute; một số đồn đo&aacute;n về mức xung nhịp tr&ecirc;n c&aacute;c GPU RX 7000. Một số nguồn tin khẳng định, GPU mạnh nhất của d&ograve;ng RX 7000 c&oacute; thể đạt ngưỡng xung nhịp cao&nbsp; ngất ngưởng - 3GHz. Thậm ch&iacute;, một số nguồn tin c&ograve;n cho rằng những mẫu GPU n&agrave;y c&oacute; thể đạt tới ngưỡng 4GHz, mặc d&ugrave; mức độ tin cậy của những nguồn tin n&agrave;y chỉ ở mức thấp.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, qua những g&igrave; ch&uacute;ng ta biết về RX 7900 XT / RX 7900 XTX &ndash; 2 mẫu card mạnh nhất hiện nay của Đội Đỏ th&ocirc;ng qua sự kiện v&agrave;o h&ocirc;m 4/11 vừa qua, ch&uacute;ng kh&oacute; c&oacute; thể đạt ngưỡng xung 3GHz. Đ&acirc;y l&agrave; điều ch&uacute;ng ta c&oacute; thể chắc chắn v&agrave;o l&uacute;c n&agrave;y. Song cũng cần phải n&oacute;i th&ecirc;m, việc 2 mẫu GPU n&agrave;y c&oacute; thể đạt được hiệu năng cao hơn nữa kh&ocirc;ng phải l&agrave; kh&ocirc;ng c&oacute; khả năng.</p>\r\n\r\n<p>Với ri&ecirc;ng thế hệ RX 7000, AMD đang tập trung nhiều hơn v&agrave;o ti&ecirc;u ch&iacute;&nbsp;<strong>hiệu năng tr&ecirc;n mỗi watt</strong>. Thực tế, đ&acirc;y cũng l&agrave; một ti&ecirc;u ch&iacute; m&agrave; nhiều người d&ugrave;ng lưu t&acirc;m, trong bối cảnh c&aacute;c mẫu GPU cao cấp của d&ograve;ng RTX 4000 từ NVIDIA &#39;ngốn điện&#39; hơn đ&aacute;ng kể so với c&aacute;c thế hệ RTX trước đ&oacute;. Theo khuyến c&aacute;o của NVIDIA, người d&ugrave;ng d&ograve;ng RTX thế hệ mới được cho l&agrave; n&ecirc;n d&ugrave;ng nguồn tối thiểu 850W hoặc thậm ch&iacute; 1000W mới c&oacute; thể &quot;g&aacute;nh&quot; tốt</p>\r\n\r\n<p>Nếu AMD ra mắt được c&aacute;c mẫu GPU m&aacute;t hơn, ti&ecirc;u thụ &iacute;t điện năng hơn so với Đội Xanh, đ&acirc;y c&oacute; coi l&agrave; một lợi thế đ&aacute;ng kể. Thực tế cho thấy, AMD đ&atilde; th&agrave;nh c&ocirc;ng. RX 7900 XT v&agrave; 7900 XTX c&oacute; TDP đều ở mức kh&aacute; dễ chịu với một mẫu GPU đầu bảng, lần lượt đạt 335W v&agrave; 355W.</p>\r\n\r\n<p>Tại sự kiện diễn ra ở Las Vegas, tiến sĩ Lisa Su, cũng l&agrave; CEO của AMD cho biết phần cứng mới n&agrave;y của h&atilde;ng c&oacute; hiệu năng tr&ecirc;n mỗi watt tăng 54% so với c&aacute;c đời trước. B&agrave; cũng nhấn mạnh rằng sản phẩm mới của AMD sẽ đem đến đa hiệu năng với mức sử dụng điện hợp l&yacute; hơn, c&oacute; vẻ nhằm &aacute;m chỉ đến việc ngốn điện khủng khiếp của Nvidia RTX 4090.</p>\r\n\r\n<p>Thực tế, nếu so s&aacute;nh với RTX 4070, TDP của RX 7900 XTX thấp hơn khoảng 95W, mang đến lợi thế cho Đội Đỏ. Chưa kể đến việc, mẫu card đầu bảng mới nhất của AMD lại rẻ hơn đ&aacute;ng kể so với đối thủ cạnh tranh từ Nvidia. Mặc d&ugrave; vậy, ở kh&iacute;a cạnh hiệu năng thuần, RX 7900 XTX được cho l&agrave; thua k&eacute;m hơn so với đối thủ từ Nvidia.&nbsp;</p>\r\n\r\n<p>Một c&acirc;u hỏi được đặt ra: RX 7900 XTX liệu c&oacute; c&ograve;n mạnh hơn nữa được kh&ocirc;ng nếu ch&uacute;ng ta thực hiện việc &eacute;p xung?</p>\r\n\r\n<p><strong>RX 7900 XTX c&oacute; thể &eacute;p xung mạnh hơn được kh&ocirc;ng?</strong></p>\r\n\r\n<p>Theo số liệu được AMD c&ocirc;ng bố, RX 7900 XTX c&oacute; xung nhịp 2,3GHz mặc định, v&agrave; xung boost c&oacute; thể đạt 2,5 Ghz. Trong khi RTX 4090 của NVIDIA c&oacute; xung boost ở mức tương tự (2,52GHz), mẫu GPU n&agrave;y vẫn c&oacute; thể đạt được th&ecirc;m nhiều hiệu năng hơn nữa nhờ &eacute;p xung. Điều n&agrave;y lại tr&aacute;i ngược với RX 7900 XTX, khi c&aacute;c th&ocirc;ng tin li&ecirc;n quan tới khả năng &eacute;p xung của mẫu GPU n&agrave;y đang kh&aacute; nhiễu loạn.</p>\r\n\r\n<p>Theo những g&igrave; AMD đ&atilde; chia sẻ tại sự kiện, mẫu GPU sử dụng kiến tr&uacute;c Navi 31 được thiết kế để c&oacute; đạt xung nhịp khoảng 3GHz. Như vậy, AMD nhiều khả năng đ&atilde; &#39;cố t&igrave;nh&#39; hạn chế bớt sức mạnh của RX 7900 XTX tr&ecirc;n phi&ecirc;n bản tham chiếu, nhằm mục đ&iacute;ch đạt được lợi thế về chỉ số hiệu năng tr&ecirc;n mỗi watt.</p>\r\n\r\n<p>Điều n&agrave;y đồng nghĩa với việc, phi&ecirc;n bản AIB từ c&aacute;c đối t&aacute;c của AMD c&oacute; thể sẽ đạt được hiệu năng cao hơn, khi c&oacute; thể đẩy mức xung nhịp mặc đinh/xung boost cao hơn so với phi&ecirc;n bản tham chiếu nhờ t&iacute;ch hợp hệ thống tản nhiệt tốt hơn.</p>\r\n\r\n<p>Tuy nhi&ecirc;n ở mặt kh&aacute;c, theo nguồn tin của Coreteks - một Youtuber c&ocirc;ng nghệ nổi tiếng, c&aacute;c đối t&aacute;c của AMD cho rằng tiềm năng &eacute;p xung của RX 7900 XTX kh&ocirc;ng qu&aacute; cao, chỉ tăng th&ecirc;m được 3% so với xung nhịp gốc. Tỷ lệ phần trăm n&agrave;y vẫn c&oacute; thể tăng th&ecirc;m khi AMD tung ra driver hỗ trợ 2 mẫu card mới nhất của m&igrave;nh.</p>\r\n\r\n<p>Ch&uacute;ng ta cũng biết được rằng, sẽ c&oacute; c&aacute;c phi&ecirc;n bản kh&aacute;c nhau của RX 7900 XTX sử dụng 3 cổng kết nối 8 pin. Điều n&agrave;y sẽ tăng TDP, cho ph&eacute;p GPU đạt mức xung nhịp cao hơn.</p>\r\n\r\n<p>Nh&igrave;n chung, c&aacute;c phi&ecirc;n bản t&ugrave;y chỉnh của RX 7900 XTX v&agrave; RX 7900 XT nhiều khả năng sẽ đạt tốc độ xung nhịp cao hơn. Thật kh&oacute; để n&oacute;i liệu mức xung 3GHz c&oacute; đạt được hay kh&ocirc;ng, nhưng chắc chắn ch&uacute;ng sẽ kh&ocirc;ng dừng ở ngưỡng xung nhịp 2,5GHz như tr&ecirc;n mẫu card tham chiếu của AMD. Đ&acirc;y đương nhi&ecirc;n l&agrave; điều sẽ xảy ra ở th&igrave; tương lai. &nbsp;C&ograve;n ở hiện tại, về hiệu suất chơi game của RX 7900 XTX vẫn ở mức rất tốt.</p>\r\n\r\n<p>AMD cho biết RX 7900 XTX đạt tới 295 khung h&igrave;nh/gi&acirc;y khi chơi Apex Legends ở 4K v&agrave; l&ecirc;n đến 704 khung h&igrave;nh/gi&acirc;y trong Valorant. AMD thậm ch&iacute; c&ograve;n đẩy giới hạn đi xa hơn khi tuy&ecirc;n bố hỗ trợ chuẩn DisplayPort 2.1 (sẽ c&oacute; trong năm 2023) v&agrave; hứa hẹn mang lại hiệu suất 8K 165Hz hoặc 4K 480Hz. Như vậy, với tương lai kh&ocirc;ng xa, ch&uacute;ng ta sẽ thấy một cuộc đổ bộ gaming với độ ph&acirc;n giải si&ecirc;u cao 8K, v&agrave; năm 2023 sẽ l&agrave; năm khởi đầu.</p>', 2, 7, 'img/TWBQxi4Ok16BLqY8DncFVaeQEAfCJ7UGhYxDBviY.webp', '2022-11-09 04:24:40', '2022-11-09 01:25:15', 2);

-- Dumping structure for table laravel.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.roles: ~4 rows (approximately)
INSERT INTO `roles` (`id`, `name`) VALUES
	(1, 'superadmin'),
	(2, 'admin'),
	(3, 'author'),
	(4, 'user');

-- Dumping structure for table laravel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.users: ~11 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `url_avatar`) VALUES
	(1, 'Nguyễn Xuân Mạnh Hùng', 'nguyenxuanmanhhung@gmail.com', NULL, '$2y$10$7v.CuDoGwve1ni0kP7rg.OmAPYAfSqFH3QEn1ulqfwgsnWBMueXsC', 'gUXYwFG7K4yLpHMBe4sBAKOBhPpTZfdMncm8mX7DtQdFJ9gqLKleHh4vdh9Z', '2022-10-22 03:29:35', '2022-10-24 21:11:36', NULL),
	(2, 'Admin', 'admin@gmail.com', NULL, '$2y$10$7C5M4UkgtZ8eoA8vSze1w.ijhX52EdUGRNthiwdpmLELkuQkynUd6', NULL, '2022-10-24 23:35:30', '2022-10-24 23:35:30', NULL),
	(3, 'user', 'user@gmail.com', NULL, '$2y$10$gdsUrHvCGp0h1WskGVyV.eutjCDVaXg2KU22U02Py/oHMpuvgqFv.', NULL, '2022-10-27 00:44:46', '2022-10-27 00:44:46', NULL),
	(4, 'user2', 'user2@gmail.com', NULL, '$2y$10$AH4.cB8YB.GSTWqjwailIO99hy5xakCg.WMU4Lb1SA2pc14qHQqTW', NULL, '2022-10-27 01:08:06', '2022-10-27 01:08:06', NULL),
	(5, 'author', 'author@gmail.com', NULL, '$2y$10$rpTGOHLoao1dZGKIkfFNduOxNaMI9BfWu2Vk5Rb8wA7jdufOpbVcS', NULL, '2022-10-31 04:20:33', '2022-10-31 04:20:33', NULL),
	(6, 'author2', 'author2@gmail.com', NULL, '$2y$10$/qdendHXuixyIPeopkNxPu0gzGxGTk95MejZ3m6h6hBP3.mARmO9O', NULL, '2022-10-31 09:18:16', '2022-10-31 09:18:16', NULL),
	(7, 'author3', 'author3@gmail.com', NULL, '$2y$10$uNhphG41wUvVIGmgz6AJeOnMusxhDuEMBOMaxqh4ROPM5678AwH3O', 'E8ttU8cJKpYvXNgQRKklQZ2kuQX5FCZKKtWZT75vwx1TMrSKzWqfOmIAdyBS', '2022-10-31 09:18:42', '2022-10-31 09:24:27', NULL),
	(10, 'user3', 'user3@gmail.com', NULL, '$2y$10$NN2qdahXyWDg6cQXvLoUpu2.RNl72RGM3sn5KvUSyyifFyl19dmMW', NULL, '2022-10-31 21:45:00', '2022-10-31 21:45:00', NULL),
	(11, 'user4', 'user4@gmail.com', NULL, '$2y$10$WfyNKoySgLkyRYiR0OvT3eekioYc5Y6TEfgYffflUqf6fCv/6nZrK', NULL, '2022-10-31 21:48:45', '2022-10-31 21:48:45', NULL),
	(16, 'subscribertest', 'subscribertest@gmail.com', NULL, '$2y$10$ofSb/1uvXdCjxG8bLV6txe0GbXLhqtP/DfCYVPkuAqBfnmiiXbjbu', NULL, '2022-11-07 02:26:02', '2022-11-09 02:42:51', NULL),
	(17, 'subscriber', 'subscriber@gmail.com', NULL, '$2y$10$lDnNbA3WZgE1DGMYJ55rkOX4N1en2yZIIeEToXcgcUkdRidLH09Cu', NULL, '2022-11-09 02:44:09', '2022-11-09 02:44:09', NULL);

-- Dumping structure for table laravel.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  KEY `user_role_role_id_foreign` (`role_id`),
  KEY `user_role_user_id_foreign` (`user_id`),
  CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.user_role: ~11 rows (approximately)
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 2),
	(5, 3),
	(3, 4),
	(4, 4),
	(6, 3),
	(7, 3),
	(10, 4),
	(11, 4),
	(16, 4),
	(17, 4);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
