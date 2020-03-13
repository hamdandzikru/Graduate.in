-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2019 at 06:46 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_access_tokens`
--

CREATE TABLE `db_access_tokens` (
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_activity_at` datetime NOT NULL,
  `lifetime_seconds` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_api_keys`
--

CREATE TABLE `db_api_keys` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `allowed_ips` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_discussions`
--

CREATE TABLE `db_discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `participant_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `post_number_index` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `first_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_number` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0',
  `view_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_discussions`
--

INSERT INTO `db_discussions` (`id`, `title`, `comment_count`, `participant_count`, `post_number_index`, `created_at`, `user_id`, `first_post_id`, `last_posted_at`, `last_posted_user_id`, `last_post_id`, `last_post_number`, `hidden_at`, `hidden_user_id`, `slug`, `is_private`, `is_approved`, `is_locked`, `is_sticky`, `view_count`) VALUES
(1, 'Testing', 5, 2, 6, '2019-11-22 09:26:39', 1, 1, '2019-11-28 12:25:50', 6, 6, 6, NULL, NULL, 'testing', 0, 1, 0, 0, 2),
(2, 'Bagaimana cara menyelesaikan KP ?', 3, 1, 4, '2019-11-28 19:06:56', 7, 7, '2019-11-29 09:27:53', 7, 11, 3, NULL, NULL, 'bagaimana-cara-menyelesaikan-kp', 0, 1, 0, 0, 2),
(9, 'jfdskljv', 1, 1, 1, '2019-12-02 07:21:52', 1, 22, '2019-12-02 07:21:52', 1, 22, 1, NULL, NULL, 'jfdskljv', 0, 1, 0, 0, 0),
(10, ' fd', 1, 1, 1, '2019-12-10 15:47:44', 1, 23, '2019-12-10 15:47:44', 1, 23, 1, NULL, NULL, 'fd', 0, 1, 0, 0, 3),
(11, 'Tips & trick Kerja Praktik', 1, 1, 1, '2019-12-10 16:14:20', 6, 24, '2019-12-10 16:14:20', 6, 24, 1, NULL, NULL, 'tips-trick-kerja-praktik', 0, 1, 0, 0, 2),
(12, 'Rekomendasi tempat Kerja Praktik', 1, 1, 1, '2019-12-10 16:17:09', 8, 25, '2019-12-10 16:17:09', 8, 25, 1, NULL, NULL, 'rekomendasi-tempat-kerja-praktik', 0, 1, 0, 0, 1),
(13, 'Rekomendasi Judul Tugas Akhir', 1, 1, 1, '2019-12-10 16:18:44', 7, 26, '2019-12-10 16:18:44', 7, 26, 1, NULL, NULL, 'rekomendasi-judul-tugas-akhir', 0, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_discussion_tag`
--

CREATE TABLE `db_discussion_tag` (
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_discussion_tag`
--

INSERT INTO `db_discussion_tag` (`discussion_id`, `tag_id`) VALUES
(1, 1),
(2, 1),
(9, 2),
(9, 3),
(10, 2),
(11, 3),
(12, 3),
(13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `db_discussion_user`
--

CREATE TABLE `db_discussion_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int(10) UNSIGNED DEFAULT NULL,
  `subscription` enum('follow','ignore') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_discussion_user`
--

INSERT INTO `db_discussion_user` (`user_id`, `discussion_id`, `last_read_at`, `last_read_post_number`, `subscription`) VALUES
(1, 1, '2019-12-10 16:21:25', 6, NULL),
(1, 2, '2019-12-10 15:14:43', 4, NULL),
(1, 9, '2019-12-02 07:21:52', 1, NULL),
(1, 10, '2019-12-10 15:47:45', 1, NULL),
(6, 1, '2019-11-28 12:25:51', 6, NULL),
(6, 2, '2019-12-10 16:11:36', 4, NULL),
(6, 11, '2019-12-10 16:14:20', 1, NULL),
(7, 1, '2019-11-28 18:46:40', 6, 'follow'),
(7, 2, '2019-11-29 09:27:54', 3, NULL),
(7, 9, '2019-12-10 15:10:14', 1, NULL),
(7, 11, '2019-12-10 16:20:34', 1, NULL),
(7, 13, '2019-12-10 16:18:44', 1, NULL),
(8, 1, '2019-12-10 15:11:51', 3, NULL),
(8, 2, '2019-12-02 07:17:19', 3, NULL),
(8, 9, '2019-12-10 15:11:55', 1, NULL),
(8, 12, '2019-12-10 16:17:10', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_email_tokens`
--

CREATE TABLE `db_email_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_flags`
--

CREATE TABLE `db_flags` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_flags`
--

INSERT INTO `db_flags` (`id`, `post_id`, `type`, `user_id`, `reason`, `reason_detail`, `created_at`) VALUES
(1, 6, 'user', 7, 'inappropriate', '', '2019-12-10 16:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `db_groups`
--

CREATE TABLE `db_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_singular` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_plural` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_groups`
--

INSERT INTO `db_groups` (`id`, `name_singular`, `name_plural`, `color`, `icon`) VALUES
(1, 'Admin', 'Admins', '#B72A2A', 'fas fa-wrench'),
(2, 'Guest', 'Guests', NULL, NULL),
(3, 'Member', 'Members', NULL, NULL),
(4, 'Mod', 'Mods', '#80349E', 'fas fa-bolt');

-- --------------------------------------------------------

--
-- Table structure for table `db_group_permission`
--

CREATE TABLE `db_group_permission` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_group_permission`
--

INSERT INTO `db_group_permission` (`group_id`, `permission`) VALUES
(2, 'viewDiscussions'),
(3, 'discussion.flagPosts'),
(3, 'discussion.likePosts'),
(3, 'discussion.reply'),
(3, 'discussion.replyWithoutApproval'),
(3, 'discussion.startWithoutApproval'),
(3, 'startDiscussion'),
(3, 'user.edit'),
(3, 'viewUserList'),
(4, 'discussion.approvePosts'),
(4, 'discussion.editPosts'),
(4, 'discussion.hide'),
(4, 'discussion.hidePosts'),
(4, 'discussion.lock'),
(4, 'discussion.rename'),
(4, 'discussion.sticky'),
(4, 'discussion.tag'),
(4, 'discussion.viewFlags'),
(4, 'discussion.viewIpsPosts'),
(4, 'user.suspend'),
(4, 'user.viewLastSeenAt');

-- --------------------------------------------------------

--
-- Table structure for table `db_group_user`
--

CREATE TABLE `db_group_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_group_user`
--

INSERT INTO `db_group_user` (`user_id`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_login_providers`
--

CREATE TABLE `db_login_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_migrations`
--

CREATE TABLE `db_migrations` (
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_migrations`
--

INSERT INTO `db_migrations` (`migration`, `extension`) VALUES
('2015_02_24_000000_create_access_tokens_table', NULL),
('2015_02_24_000000_create_api_keys_table', NULL),
('2015_02_24_000000_create_config_table', NULL),
('2015_02_24_000000_create_discussions_table', NULL),
('2015_02_24_000000_create_email_tokens_table', NULL),
('2015_02_24_000000_create_groups_table', NULL),
('2015_02_24_000000_create_notifications_table', NULL),
('2015_02_24_000000_create_password_tokens_table', NULL),
('2015_02_24_000000_create_permissions_table', NULL),
('2015_02_24_000000_create_posts_table', NULL),
('2015_02_24_000000_create_users_discussions_table', NULL),
('2015_02_24_000000_create_users_groups_table', NULL),
('2015_02_24_000000_create_users_table', NULL),
('2015_09_15_000000_create_auth_tokens_table', NULL),
('2015_09_20_224327_add_hide_to_discussions', NULL),
('2015_09_22_030432_rename_notification_read_time', NULL),
('2015_10_07_130531_rename_config_to_settings', NULL),
('2015_10_24_194000_add_ip_address_to_posts', NULL),
('2015_12_05_042721_change_access_tokens_columns', NULL),
('2015_12_17_194247_change_settings_value_column_to_text', NULL),
('2016_02_04_095452_add_slug_to_discussions', NULL),
('2017_04_07_114138_add_is_private_to_discussions', NULL),
('2017_04_07_114138_add_is_private_to_posts', NULL),
('2018_01_11_093900_change_access_tokens_columns', NULL),
('2018_01_11_094000_change_access_tokens_add_foreign_keys', NULL),
('2018_01_11_095000_change_api_keys_columns', NULL),
('2018_01_11_101800_rename_auth_tokens_to_registration_tokens', NULL),
('2018_01_11_102000_change_registration_tokens_rename_id_to_token', NULL),
('2018_01_11_102100_change_registration_tokens_created_at_to_datetime', NULL),
('2018_01_11_120604_change_posts_table_to_innodb', NULL),
('2018_01_11_155200_change_discussions_rename_columns', NULL),
('2018_01_11_155300_change_discussions_add_foreign_keys', NULL),
('2018_01_15_071700_rename_users_discussions_to_discussion_user', NULL),
('2018_01_15_071800_change_discussion_user_rename_columns', NULL),
('2018_01_15_071900_change_discussion_user_add_foreign_keys', NULL),
('2018_01_15_072600_change_email_tokens_rename_id_to_token', NULL),
('2018_01_15_072700_change_email_tokens_add_foreign_keys', NULL),
('2018_01_15_072800_change_email_tokens_created_at_to_datetime', NULL),
('2018_01_18_130400_rename_permissions_to_group_permission', NULL),
('2018_01_18_130500_change_group_permission_add_foreign_keys', NULL),
('2018_01_18_130600_rename_users_groups_to_group_user', NULL),
('2018_01_18_130700_change_group_user_add_foreign_keys', NULL),
('2018_01_18_133000_change_notifications_columns', NULL),
('2018_01_18_133100_change_notifications_add_foreign_keys', NULL),
('2018_01_18_134400_change_password_tokens_rename_id_to_token', NULL),
('2018_01_18_134500_change_password_tokens_add_foreign_keys', NULL),
('2018_01_18_134600_change_password_tokens_created_at_to_datetime', NULL),
('2018_01_18_135000_change_posts_rename_columns', NULL),
('2018_01_18_135100_change_posts_add_foreign_keys', NULL),
('2018_01_30_112238_add_fulltext_index_to_discussions_title', NULL),
('2018_01_30_220100_create_post_user_table', NULL),
('2018_01_30_222900_change_users_rename_columns', NULL),
('2018_07_21_000000_seed_default_groups', NULL),
('2018_07_21_000100_seed_default_group_permissions', NULL),
('2018_09_15_041340_add_users_indicies', NULL),
('2018_09_15_041828_add_discussions_indicies', NULL),
('2018_09_15_043337_add_notifications_indices', NULL),
('2018_09_15_043621_add_posts_indices', NULL),
('2018_09_22_004100_change_registration_tokens_columns', NULL),
('2018_09_22_004200_create_login_providers_table', NULL),
('2018_10_08_144700_add_shim_prefix_to_group_icons', NULL),
('2019_06_24_145100_change_posts_content_column_to_mediumtext', NULL),
('2015_09_21_011527_add_is_approved_to_discussions', 'flarum-approval'),
('2015_09_21_011706_add_is_approved_to_posts', 'flarum-approval'),
('2017_07_22_000000_add_default_permissions', 'flarum-approval'),
('2018_09_29_060444_replace_emoji_shorcuts_with_unicode', 'flarum-emoji'),
('2015_09_02_000000_add_flags_read_time_to_users_table', 'flarum-flags'),
('2015_09_02_000000_create_flags_table', 'flarum-flags'),
('2017_07_22_000000_add_default_permissions', 'flarum-flags'),
('2018_06_27_101500_change_flags_rename_time_to_created_at', 'flarum-flags'),
('2018_06_27_101600_change_flags_add_foreign_keys', 'flarum-flags'),
('2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at', 'flarum-flags'),
('2018_09_15_043621_add_flags_indices', 'flarum-flags'),
('2015_05_11_000000_create_posts_likes_table', 'flarum-likes'),
('2015_09_04_000000_add_default_like_permissions', 'flarum-likes'),
('2018_06_27_100600_rename_posts_likes_to_post_likes', 'flarum-likes'),
('2018_06_27_100700_change_post_likes_add_foreign_keys', 'flarum-likes'),
('2015_02_24_000000_add_locked_to_discussions', 'flarum-lock'),
('2017_07_22_000000_add_default_permissions', 'flarum-lock'),
('2018_09_15_043621_add_discussions_indices', 'flarum-lock'),
('2015_05_11_000000_create_mentions_posts_table', 'flarum-mentions'),
('2015_05_11_000000_create_mentions_users_table', 'flarum-mentions'),
('2018_06_27_102000_rename_mentions_posts_to_post_mentions_post', 'flarum-mentions'),
('2018_06_27_102100_rename_mentions_users_to_post_mentions_user', 'flarum-mentions'),
('2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id', 'flarum-mentions'),
('2018_06_27_102300_change_post_mentions_post_add_foreign_keys', 'flarum-mentions'),
('2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id', 'flarum-mentions'),
('2018_06_27_102500_change_post_mentions_user_add_foreign_keys', 'flarum-mentions'),
('2015_02_24_000000_add_sticky_to_discussions', 'flarum-sticky'),
('2017_07_22_000000_add_default_permissions', 'flarum-sticky'),
('2018_09_15_043621_add_discussions_indices', 'flarum-sticky'),
('2015_05_11_000000_add_subscription_to_users_discussions_table', 'flarum-subscriptions'),
('2015_05_11_000000_add_suspended_until_to_users_table', 'flarum-suspend'),
('2015_09_14_000000_rename_suspended_until_column', 'flarum-suspend'),
('2017_07_22_000000_add_default_permissions', 'flarum-suspend'),
('2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until', 'flarum-suspend'),
('2015_02_24_000000_create_discussions_tags_table', 'flarum-tags'),
('2015_02_24_000000_create_tags_table', 'flarum-tags'),
('2015_02_24_000000_create_users_tags_table', 'flarum-tags'),
('2015_02_24_000000_set_default_settings', 'flarum-tags'),
('2015_10_19_061223_make_slug_unique', 'flarum-tags'),
('2017_07_22_000000_add_default_permissions', 'flarum-tags'),
('2018_06_27_085200_change_tags_columns', 'flarum-tags'),
('2018_06_27_085300_change_tags_add_foreign_keys', 'flarum-tags'),
('2018_06_27_090400_rename_users_tags_to_tag_user', 'flarum-tags'),
('2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at', 'flarum-tags'),
('2018_06_27_100200_change_tag_user_add_foreign_keys', 'flarum-tags'),
('2018_06_27_103000_rename_discussions_tags_to_discussion_tag', 'flarum-tags'),
('2018_06_27_103100_add_discussion_tag_foreign_keys', 'flarum-tags'),
('2019_04_21_000000_add_icon_to_tags_table', 'flarum-tags'),
('2017_11_07_223624_discussions_add_views', 'michaelbelgium-discussion-views'),
('2018_11_30_141817_discussions_rename_views', 'michaelbelgium-discussion-views'),
('2017_11_29_204708_users_add_views', 'michaelbelgium-profile-views'),
('2017_12_28_091742_add_unique', 'michaelbelgium-profile-views'),
('2018_12_01_095958_rename_table_profile_views', 'michaelbelgium-profile-views'),
('2018_12_01_100540_rename_remove_columns', 'michaelbelgium-profile-views'),
('2018_12_01_103657_add_viewer_id', 'michaelbelgium-profile-views'),
('2019_01_12_103741_drop_ip_views', 'michaelbelgium-profile-views'),
('2019_01_12_104853_add_visited_at_views', 'michaelbelgium-profile-views');

-- --------------------------------------------------------

--
-- Table structure for table `db_notifications`
--

CREATE TABLE `db_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `from_user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(10) UNSIGNED DEFAULT NULL,
  `data` blob,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_notifications`
--

INSERT INTO `db_notifications` (`id`, `user_id`, `from_user_id`, `type`, `subject_id`, `data`, `created_at`, `is_deleted`, `read_at`) VALUES
(2, 7, 8, 'postLiked', 7, NULL, '2019-12-02 07:17:40', 1, NULL),
(3, 7, 1, 'discussionRenamed', 2, 0x7b22706f73744e756d626572223a347d, '2019-12-02 07:19:33', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_password_tokens`
--

CREATE TABLE `db_password_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_posts`
--

CREATE TABLE `db_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `number` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_posts`
--

INSERT INTO `db_posts` (`id`, `discussion_id`, `number`, `created_at`, `user_id`, `type`, `content`, `edited_at`, `edited_user_id`, `hidden_at`, `hidden_user_id`, `ip_address`, `is_private`, `is_approved`) VALUES
(1, 1, 1, '2019-11-22 09:26:39', 1, 'comment', '<t><p>tes</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(2, 1, 2, '2019-11-22 09:26:53', 1, 'comment', '<t><p>wah</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(3, 1, 3, '2019-11-22 09:39:13', 1, 'comment', '<r><p><POSTMENTION discussionid=\"1\" displayname=\"admin\" id=\"1\" number=\"1\" username=\"admin\">@admin#1</POSTMENTION> balas</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(4, 1, 4, '2019-11-27 10:04:10', 1, 'comment', '<r><p><POSTMENTION discussionid=\"1\" displayname=\"admin\" id=\"3\" number=\"3\" username=\"admin\">@admin#3</POSTMENTION> bclaskl</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(6, 1, 6, '2019-11-28 12:25:50', 6, 'comment', '<t><p>bgjhgj</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(7, 2, 1, '2019-11-28 19:06:56', 7, 'comment', '<t><p>Permisi, tolong isi apa2 saja requirement yang harus dilakukan dalam melakukan pendaftaran KP ?</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(8, 3, 1, '2019-11-29 03:44:52', 7, 'comment', '<t><p>hfsduhfks</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(9, 3, 2, '2019-11-29 03:45:04', 7, 'comment', '<t><p>dhasjgas</p></t>', NULL, NULL, '2019-11-29 05:30:01', 7, '::1', 0, 1),
(10, 2, 2, '2019-11-29 09:27:39', 7, 'comment', '<t><p>fvgf</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(11, 2, 3, '2019-11-29 09:27:53', 7, 'comment', '<r><p><POSTMENTION discussionid=\"2\" displayname=\"hamdan_dz\" id=\"7\" number=\"1\" username=\"hamdan_dz\">@hamdan_dz#7</POSTMENTION> rfrf</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(13, 4, 1, '2019-12-01 12:48:05', 7, 'comment', '<t><p>bfd</p></t>', NULL, NULL, '2019-12-01 12:48:14', 7, '::1', 0, 1),
(14, 5, 1, '2019-12-01 12:49:03', 7, 'comment', '<t><p>Saya hanya coba2</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(15, 5, 2, '2019-12-01 12:51:47', 7, 'comment', '<r><p><USERMENTION displayname=\"afina\" id=\"8\" username=\"afina\">@afina</USERMENTION> liat nih</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(16, 6, 1, '2019-12-02 06:12:22', 7, 'comment', '<t><p>fbddgf</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(17, 7, 1, '2019-12-02 06:15:53', 7, 'comment', '<t><p>gsd</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(18, 8, 1, '2019-12-02 07:13:25', 7, 'comment', '<t><p>hfuskdjfhskdj</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(19, 8, 2, '2019-12-02 07:13:49', 7, 'comment', '<t><p>gfbj</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(21, 2, 4, '2019-12-02 07:19:33', 1, 'discussionRenamed', '[\"Bagaimana cara mendaftar KP ?\",\"Bagaimana cara menyelesaikan KP ?\"]', NULL, NULL, NULL, NULL, NULL, 0, 1),
(22, 9, 1, '2019-12-02 07:21:52', 1, 'comment', '<t><p>fjesil</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(23, 10, 1, '2019-12-10 15:47:44', 1, 'comment', '<r><p><URL url=\"https://i.imgur.com/KrfaXMO.png\"><s>[URL=https://i.imgur.com/KrfaXMO.png]</s><IMG src=\"https://i.imgur.com/KrfaXMO.png\"><s>[IMG]</s>https://i.imgur.com/KrfaXMO.png<e>[/IMG]</e></IMG><e>[/URL]</e></URL><br/>\nbfd</p></r>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(24, 11, 1, '2019-12-10 16:14:20', 6, 'comment', '<r><p>Tolong dong yg tau tips2 akan kerja praktik agar bisa lancar dan maksimal. Thanks <E>:)</E><br/>\n<URL url=\"https://i.imgur.com/vsKvOo7.png\"><s>[URL=https://i.imgur.com/vsKvOo7.png]</s><IMG src=\"https://i.imgur.com/vsKvOo7.png\"><s>[IMG]</s>https://i.imgur.com/vsKvOo7.png<e>[/IMG]</e></IMG><e>[/URL]</e></URL></p>\n</r>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(25, 12, 1, '2019-12-10 16:17:09', 8, 'comment', '<r><p>Tolong dong untuk yg tau tempat2 rekomendasi KP yg bagus. Kalo menurut saya sih :</p> \n<LIST type=\"decimal\"><LI><s>1. </s>Telkom Indonesia</LI>\n<LI><s>2. </s>Pertamina</LI></LIST></r>', NULL, NULL, NULL, NULL, '::1', 0, 1),
(26, 13, 1, '2019-12-10 16:18:44', 7, 'comment', '<t><p>Tolong bagi kakak2 tingkat untuk membantu menyumbangkan idenya untuk judul TA saya &#128516;</p> \n\n<p>Comment ya..</p></t>', NULL, NULL, NULL, NULL, '::1', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_post_likes`
--

CREATE TABLE `db_post_likes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_post_mentions_post`
--

CREATE TABLE `db_post_mentions_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_post_mentions_post`
--

INSERT INTO `db_post_mentions_post` (`post_id`, `mentions_post_id`) VALUES
(3, 1),
(4, 3),
(11, 7);

-- --------------------------------------------------------

--
-- Table structure for table `db_post_mentions_user`
--

CREATE TABLE `db_post_mentions_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_post_mentions_user`
--

INSERT INTO `db_post_mentions_user` (`post_id`, `mentions_user_id`) VALUES
(15, 8);

-- --------------------------------------------------------

--
-- Table structure for table `db_post_user`
--

CREATE TABLE `db_post_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_registration_tokens`
--

CREATE TABLE `db_registration_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_attributes` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_settings`
--

CREATE TABLE `db_settings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_settings`
--

INSERT INTO `db_settings` (`key`, `value`) VALUES
('allow_post_editing', 'reply'),
('allow_renaming', '10'),
('allow_sign_up', '1'),
('antoinefr-online.displaymax', '5'),
('antoinefr-online.titleoflist', 'Online Users'),
('custom_footer', '<center><div class=\"secondary-footer brand-bg darken-2\">\n                <div class=\"container\">\n                    <span class=\"copy-text\">Copyright &copy; 2019 <a href=\"#\">Kelompok Gatau Berapa</a> &nbsp;  | &nbsp;  All Rights Reserved &nbsp;  | &nbsp;  Designed By <a href=\"#\">DZI</a></span>\n                </div>\n            </div></center>'),
('custom_header', ''),
('custom_less', ''),
('default_locale', 'id'),
('default_route', '/all'),
('extensions_enabled', '[\"flarum-bbcode\",\"flarum-emoji\",\"flarum-lang-english\",\"flarum-flags\",\"flarum-likes\",\"flarum-lock\",\"flarum-markdown\",\"flarum-mentions\",\"flarum-statistics\",\"flarum-sticky\",\"flarum-subscriptions\",\"flarum-tags\",\"realodix-indonesian\",\"michaelbelgium-discussion-views\",\"michaelbelgium-profile-views\",\"matteocontrini-imgur-upload\",\"zerosonesfun-announce\",\"jordanjay29-summaries\",\"flarum-suspend\",\"antoinefr-online\"]'),
('flarum-ext-summaries.excerpt_length', '150'),
('flarum-tags.max_primary_tags', '5'),
('flarum-tags.max_secondary_tags', '3'),
('flarum-tags.min_primary_tags', '1'),
('flarum-tags.min_secondary_tags', '0'),
('forum_description', ''),
('forum_title', 'Graduate.in'),
('imgur-upload.client-id', 'b302658741265ec'),
('logo_path', NULL),
('mail_driver', 'smtp'),
('mail_encryption', 'SSL'),
('mail_from', 'noreply@graduatein.com'),
('mail_host', 'smtp.gmail.com'),
('mail_password', 'semestertua'),
('mail_port', '465'),
('mail_username', 'gradute.in@gmail.com'),
('show_language_selector', '1'),
('theme_colored_header', '1'),
('theme_dark_mode', '0'),
('theme_primary_color', '#00CED1'),
('theme_secondary_color', '#A9A9A9'),
('version', '0.1.0-beta.10'),
('welcome_message', 'Selamat datang, semoga cepat luluus :)'),
('welcome_title', 'Welcome to Graduate.in'),
('zerosonesfun-announce.text', 'Pak Lubis Says : Semoga lancar dalam menjalani tugas-tugas akhirnya ya');

-- --------------------------------------------------------

--
-- Table structure for table `db_tags`
--

CREATE TABLE `db_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_mode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `default_sort` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_tags`
--

INSERT INTO `db_tags` (`id`, `name`, `slug`, `description`, `color`, `background_path`, `background_mode`, `position`, `parent_id`, `default_sort`, `is_restricted`, `is_hidden`, `discussion_count`, `last_posted_at`, `last_posted_discussion_id`, `last_posted_user_id`, `icon`) VALUES
(1, 'Default', 'default', '', '#888', NULL, NULL, 0, NULL, NULL, 0, 0, 2, '2019-11-29 09:27:53', 2, 7, ''),
(2, 'TA', 'ta', 'Kategori yang dikhususkan untuk TA', '', NULL, NULL, 1, NULL, NULL, 0, 0, 3, '2019-12-10 16:18:44', 13, 7, 'fas fa-atlas'),
(3, 'KP', 'kp', 'Diskusi yang dikhususkan untuk Kerja Praktek', '', NULL, NULL, 2, NULL, NULL, 0, 0, 3, '2019-12-10 16:17:09', 12, 8, 'fas fa-briefcase');

-- --------------------------------------------------------

--
-- Table structure for table `db_tag_user`
--

CREATE TABLE `db_tag_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_users`
--

CREATE TABLE `db_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `avatar_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` blob,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_users`
--

INSERT INTO `db_users` (`id`, `username`, `email`, `is_email_confirmed`, `password`, `bio`, `avatar_url`, `preferences`, `joined_at`, `last_seen_at`, `marked_all_as_read_at`, `read_notifications_at`, `discussion_count`, `comment_count`, `read_flags_at`, `suspended_until`) VALUES
(1, 'admin', 'hamdanrobbi@gmail.com', 1, '$2y$10$w3nSvdKDk.G1KNUVIdNAVuvhDqYNgoBZ8i.8iSKLCSYL2bopfpsRO', NULL, NULL, NULL, '2019-11-18 13:43:18', '2019-12-10 16:21:41', NULL, '2019-12-01 11:40:19', 3, 6, '2019-12-10 16:21:21', NULL),
(3, 'hamdan_dzi', 'Hamdan@gmail.com', 0, '$2y$10$/x6tvXD4v447T07e5XZFPe3rAPDyvMTCVDYPYk7oZvJmlOWlXxws.', NULL, NULL, NULL, '2019-11-22 09:10:41', '2019-11-22 09:12:22', NULL, NULL, 0, 0, NULL, NULL),
(6, 'Aqiel', 'buffaurus@gmail.com', 1, '$2y$10$Gj60BuNFB5NT210Rjl4/yeMVeOD5HB3IqbqCiqPa/0Mx/p/Mah/kq', NULL, NULL, NULL, '2019-11-28 12:23:32', '2019-12-10 16:15:05', NULL, '2019-12-10 16:11:44', 1, 2, NULL, NULL),
(7, 'hamdan_dz', 'jouningakure7@gmail.com', 1, '$2y$10$wMvUwLYfrhhLzmUU9zlxEuzYyf4nHF.Pvaxx9ix9uA4v113H9eCgO', NULL, '6Gbs4su9ee9aVwgG.png', 0x7b226e6f746966795f64697363757373696f6e52656e616d65645f616c657274223a747275652c226e6f746966795f706f73744c696b65645f616c657274223a747275652c226e6f746966795f64697363757373696f6e4c6f636b65645f616c657274223a747275652c226e6f746966795f706f73744d656e74696f6e65645f616c657274223a747275652c226e6f746966795f706f73744d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f757365724d656e74696f6e65645f616c657274223a747275652c226e6f746966795f757365724d656e74696f6e65645f656d61696c223a66616c73652c226e6f746966795f6e6577506f73745f616c657274223a747275652c226e6f746966795f6e6577506f73745f656d61696c223a747275652c22666f6c6c6f7741667465725265706c79223a66616c73652c22646973636c6f73654f6e6c696e65223a747275652c22696e64657850726f66696c65223a747275652c226c6f63616c65223a226964227d, '2019-11-28 18:42:47', '2019-12-10 16:21:10', NULL, '2019-12-10 16:21:07', 2, 13, NULL, NULL),
(8, 'afina', 'vidchin08@gmail.com', 1, '$2y$10$/PqopOBtOikVLTlXjVFKqO5JSYawxugblIxOVkzffjWb1kEPVa2ai', NULL, NULL, NULL, '2019-12-01 12:41:24', '2019-12-10 16:17:22', NULL, '2019-12-02 07:15:05', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_user_profile_views`
--

CREATE TABLE `db_user_profile_views` (
  `id` int(10) UNSIGNED NOT NULL,
  `viewed_user_id` int(10) UNSIGNED NOT NULL,
  `viewer_id` int(10) UNSIGNED DEFAULT NULL,
  `visited_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_user_profile_views`
--

INSERT INTO `db_user_profile_views` (`id`, `viewed_user_id`, `viewer_id`, `visited_at`) VALUES
(1, 7, 1, '2019-12-10 15:59:16'),
(2, 7, 6, '2019-12-10 16:11:49'),
(3, 3, 6, '2019-12-10 16:12:16'),
(4, 6, 7, '2019-12-10 16:20:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_access_tokens`
--
ALTER TABLE `db_access_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `db_access_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `db_api_keys`
--
ALTER TABLE `db_api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_api_keys_key_unique` (`key`),
  ADD KEY `db_api_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `db_discussions`
--
ALTER TABLE `db_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_discussions_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `db_discussions_first_post_id_foreign` (`first_post_id`),
  ADD KEY `db_discussions_last_post_id_foreign` (`last_post_id`),
  ADD KEY `db_discussions_last_posted_at_index` (`last_posted_at`),
  ADD KEY `db_discussions_last_posted_user_id_index` (`last_posted_user_id`),
  ADD KEY `db_discussions_created_at_index` (`created_at`),
  ADD KEY `db_discussions_user_id_index` (`user_id`),
  ADD KEY `db_discussions_comment_count_index` (`comment_count`),
  ADD KEY `db_discussions_participant_count_index` (`participant_count`),
  ADD KEY `db_discussions_hidden_at_index` (`hidden_at`),
  ADD KEY `db_discussions_is_locked_index` (`is_locked`),
  ADD KEY `db_discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`);
ALTER TABLE `db_discussions` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `db_discussion_tag`
--
ALTER TABLE `db_discussion_tag`
  ADD PRIMARY KEY (`discussion_id`,`tag_id`),
  ADD KEY `db_discussion_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `db_discussion_user`
--
ALTER TABLE `db_discussion_user`
  ADD PRIMARY KEY (`user_id`,`discussion_id`),
  ADD KEY `db_discussion_user_discussion_id_foreign` (`discussion_id`);

--
-- Indexes for table `db_email_tokens`
--
ALTER TABLE `db_email_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `db_email_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `db_flags`
--
ALTER TABLE `db_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_flags_post_id_foreign` (`post_id`),
  ADD KEY `db_flags_user_id_foreign` (`user_id`),
  ADD KEY `db_flags_created_at_index` (`created_at`);

--
-- Indexes for table `db_groups`
--
ALTER TABLE `db_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_group_permission`
--
ALTER TABLE `db_group_permission`
  ADD PRIMARY KEY (`group_id`,`permission`);

--
-- Indexes for table `db_group_user`
--
ALTER TABLE `db_group_user`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `db_group_user_group_id_foreign` (`group_id`);

--
-- Indexes for table `db_login_providers`
--
ALTER TABLE `db_login_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_login_providers_provider_identifier_unique` (`provider`,`identifier`),
  ADD KEY `db_login_providers_user_id_foreign` (`user_id`);

--
-- Indexes for table `db_notifications`
--
ALTER TABLE `db_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_notifications_from_user_id_foreign` (`from_user_id`),
  ADD KEY `db_notifications_user_id_index` (`user_id`);

--
-- Indexes for table `db_password_tokens`
--
ALTER TABLE `db_password_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `db_password_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `db_posts`
--
ALTER TABLE `db_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_posts_discussion_id_number_unique` (`discussion_id`,`number`),
  ADD KEY `db_posts_edited_user_id_foreign` (`edited_user_id`),
  ADD KEY `db_posts_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `db_posts_discussion_id_number_index` (`discussion_id`,`number`),
  ADD KEY `db_posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  ADD KEY `db_posts_user_id_created_at_index` (`user_id`,`created_at`);
ALTER TABLE `db_posts` ADD FULLTEXT KEY `content` (`content`);

--
-- Indexes for table `db_post_likes`
--
ALTER TABLE `db_post_likes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `db_post_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `db_post_mentions_post`
--
ALTER TABLE `db_post_mentions_post`
  ADD PRIMARY KEY (`post_id`,`mentions_post_id`),
  ADD KEY `db_post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`);

--
-- Indexes for table `db_post_mentions_user`
--
ALTER TABLE `db_post_mentions_user`
  ADD PRIMARY KEY (`post_id`,`mentions_user_id`),
  ADD KEY `db_post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`);

--
-- Indexes for table `db_post_user`
--
ALTER TABLE `db_post_user`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `db_post_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `db_registration_tokens`
--
ALTER TABLE `db_registration_tokens`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `db_settings`
--
ALTER TABLE `db_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `db_tags`
--
ALTER TABLE `db_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_tags_slug_unique` (`slug`),
  ADD KEY `db_tags_parent_id_foreign` (`parent_id`),
  ADD KEY `db_tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  ADD KEY `db_tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`);

--
-- Indexes for table `db_tag_user`
--
ALTER TABLE `db_tag_user`
  ADD PRIMARY KEY (`user_id`,`tag_id`),
  ADD KEY `db_tag_user_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `db_users`
--
ALTER TABLE `db_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_users_username_unique` (`username`),
  ADD UNIQUE KEY `db_users_email_unique` (`email`),
  ADD KEY `db_users_joined_at_index` (`joined_at`),
  ADD KEY `db_users_last_seen_at_index` (`last_seen_at`),
  ADD KEY `db_users_discussion_count_index` (`discussion_count`),
  ADD KEY `db_users_comment_count_index` (`comment_count`);

--
-- Indexes for table `db_user_profile_views`
--
ALTER TABLE `db_user_profile_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_users_profile_views_user_id_foreign` (`viewed_user_id`),
  ADD KEY `db_user_profile_views_viewer_id_foreign` (`viewer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_api_keys`
--
ALTER TABLE `db_api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_discussions`
--
ALTER TABLE `db_discussions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `db_flags`
--
ALTER TABLE `db_flags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_groups`
--
ALTER TABLE `db_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_login_providers`
--
ALTER TABLE `db_login_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_notifications`
--
ALTER TABLE `db_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_posts`
--
ALTER TABLE `db_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `db_tags`
--
ALTER TABLE `db_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_users`
--
ALTER TABLE `db_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `db_user_profile_views`
--
ALTER TABLE `db_user_profile_views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `db_access_tokens`
--
ALTER TABLE `db_access_tokens`
  ADD CONSTRAINT `db_access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_api_keys`
--
ALTER TABLE `db_api_keys`
  ADD CONSTRAINT `db_api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_discussions`
--
ALTER TABLE `db_discussions`
  ADD CONSTRAINT `db_discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `db_posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `db_discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `db_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `db_discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `db_posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `db_discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `db_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `db_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `db_discussion_tag`
--
ALTER TABLE `db_discussion_tag`
  ADD CONSTRAINT `db_discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `db_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `db_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_discussion_user`
--
ALTER TABLE `db_discussion_user`
  ADD CONSTRAINT `db_discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `db_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_email_tokens`
--
ALTER TABLE `db_email_tokens`
  ADD CONSTRAINT `db_email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_flags`
--
ALTER TABLE `db_flags`
  ADD CONSTRAINT `db_flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `db_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_group_permission`
--
ALTER TABLE `db_group_permission`
  ADD CONSTRAINT `db_group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `db_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_group_user`
--
ALTER TABLE `db_group_user`
  ADD CONSTRAINT `db_group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `db_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_login_providers`
--
ALTER TABLE `db_login_providers`
  ADD CONSTRAINT `db_login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_notifications`
--
ALTER TABLE `db_notifications`
  ADD CONSTRAINT `db_notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `db_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `db_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_password_tokens`
--
ALTER TABLE `db_password_tokens`
  ADD CONSTRAINT `db_password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_posts`
--
ALTER TABLE `db_posts`
  ADD CONSTRAINT `db_posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `db_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `db_posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `db_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `db_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `db_post_likes`
--
ALTER TABLE `db_post_likes`
  ADD CONSTRAINT `db_post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `db_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_post_mentions_post`
--
ALTER TABLE `db_post_mentions_post`
  ADD CONSTRAINT `db_post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `db_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `db_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_post_mentions_user`
--
ALTER TABLE `db_post_mentions_user`
  ADD CONSTRAINT `db_post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `db_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_post_user`
--
ALTER TABLE `db_post_user`
  ADD CONSTRAINT `db_post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `db_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_tags`
--
ALTER TABLE `db_tags`
  ADD CONSTRAINT `db_tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `db_discussions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `db_tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `db_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `db_tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `db_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `db_tag_user`
--
ALTER TABLE `db_tag_user`
  ADD CONSTRAINT `db_tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `db_tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_user_profile_views`
--
ALTER TABLE `db_user_profile_views`
  ADD CONSTRAINT `db_user_profile_views_viewer_id_foreign` FOREIGN KEY (`viewer_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_users_profile_views_user_id_foreign` FOREIGN KEY (`viewed_user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
