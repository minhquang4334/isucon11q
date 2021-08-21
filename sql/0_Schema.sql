DROP TABLE IF EXISTS `isu_association_config`;
DROP TABLE IF EXISTS `isu_condition`;
DROP TABLE IF EXISTS `isu`;
DROP TABLE IF EXISTS `user`;

-- SELECT * FROM `isu` WHERE `jia_user_id` = ? ORDER BY `id` DESC
-- INSERT INTO `isu` (`jia_isu_uuid`, `name`, `image`, `jia_user_id`) VALUES (?, ?, ?, ?)"
-- UPDATE `isu` SET `character` = ? WHERE  `jia_isu_uuid` = ?
-- SELECT * FROM `isu` WHERE `jia_user_id` = ? AND `jia_isu_uuid` = ?
-- SELECT * FROM `isu` WHERE `jia_user_id` = ? AND `jia_isu_uuid` = ?
-- SELECT `image` FROM `isu` WHERE `jia_user_id` = ? AND `jia_isu_uuid` = ?
-- SELECT COUNT(*) AS `cnt` FROM `isu` WHERE `jia_user_id` = ? AND `jia_isu_uuid` = ?
-- SELECT name FROM `isu` WHERE `jia_isu_uuid` = ? AND `jia_user_id` = ?
-- SELECT COUNT(*) AS `cnt` FROM `isu` WHERE `jia_isu_uuid` = ?
CREATE TABLE `isu` (
  `id` bigint AUTO_INCREMENT,
  `jia_isu_uuid` CHAR(36) NOT NULL UNIQUE,
  `name` VARCHAR(255) NOT NULL,
  `image` LONGBLOB,
  `character` VARCHAR(255),
  `jia_user_id` VARCHAR(64) NOT NULL,
  `created_at` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY(`id`),
  KEY key_jia_user_isu_id (jia_user_id, jia_isu_uuid),
  KEY key_character (`character`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

-- SELECT * FROM `isu_condition` WHERE `jia_isu_uuid` = ? ORDER BY `timestamp` DESC LIMIT 1
-- SELECT * FROM `isu_condition` WHERE `jia_isu_uuid` = ? ORDER BY `timestamp` ASC
-- SELECT * FROM `isu_condition` WHERE `jia_isu_uuid` = ? AND `timestamp` < ? ORDER BY `timestamp` DESC
-- SELECT * FROM `isu_condition` WHERE `jia_isu_uuid` = ? AND `timestamp` < ? AND ? <= `timestamp` ORDER BY `timestamp` DESC
-- SELECT * FROM `isu_condition` WHERE `jia_isu_uuid` = ? ORDER BY timestamp DESC
-- INSERT INTO `isu_condition` (`jia_isu_uuid`, `timestamp`, `is_sitting`, `condition`, `message`) VALUES (?, ?, ?, ?, ?)
CREATE TABLE `isu_condition` (
  `id` bigint AUTO_INCREMENT,
  `jia_isu_uuid` CHAR(36) NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `is_sitting` TINYINT(1) NOT NULL,
  `condition` VARCHAR(255) NOT NULL,
  `message` VARCHAR(255) NOT NULL,
  `created_at` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY(`id`),
  KEY key_jia__isu_id (jia_isu_uuid, timestamp)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

-- 'SELECT COUNT(*) AS `cnt` FROM `user` WHERE `jia_user_id` = ?'
-- INSERT IGNORE INTO user (`jia_user_id`) VALUES (?)
CREATE TABLE `user` (
  `jia_user_id` VARCHAR(64) PRIMARY KEY,
  `created_at` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

-- 'SELECT * FROM `isu_association_config` WHERE `name` = ?', 'jia_service_url'
-- INSERT INTO `isu_association_config` (`name`, `url`) VALUES (?, ?) ON DUPLICATE KEY UPDATE `url` = VALUES(`url`)
CREATE TABLE `isu_association_config` (
  `name` VARCHAR(255) PRIMARY KEY,
  `url` VARCHAR(255) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;
