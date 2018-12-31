/*
Navicat MySQL Data Transfer

Source Server         : LocalCore
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : auth

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-12-31 12:49:37
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `token_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `reg_mail` varchar(255) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Account System';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('2', 'ADMIN', '8301316D0D8448A34FA6D0C6BF1CBFA2B4A1A93A', '', '', '', '', '', '', '2018-12-28 19:52:11', '127.0.0.1', '127.0.0.1', '0', '0', '00', null, '0', '2', '0', '', '', '0', '', '0');

-- ----------------------------
-- Table structure for `account_access`
-- ----------------------------
DROP TABLE IF EXISTS `account_access`;
CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_access
-- ----------------------------
INSERT INTO `account_access` VALUES ('2', '3', '-1');

-- ----------------------------
-- Table structure for `account_banned`
-- ----------------------------
DROP TABLE IF EXISTS `account_banned`;
CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- ----------------------------
-- Records of account_banned
-- ----------------------------

-- ----------------------------
-- Table structure for `account_muted`
-- ----------------------------
DROP TABLE IF EXISTS `account_muted`;
CREATE TABLE `account_muted` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int(10) unsigned NOT NULL DEFAULT '0',
  `mutetime` int(10) unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) NOT NULL,
  `mutereason` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mute List';

-- ----------------------------
-- Records of account_muted
-- ----------------------------

-- ----------------------------
-- Table structure for `autobroadcast`
-- ----------------------------
DROP TABLE IF EXISTS `autobroadcast`;
CREATE TABLE `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT '-1',
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) unsigned DEFAULT '1',
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of autobroadcast
-- ----------------------------

-- ----------------------------
-- Table structure for `battlenet_account_heirlooms`
-- ----------------------------
DROP TABLE IF EXISTS `battlenet_account_heirlooms`;
CREATE TABLE `battlenet_account_heirlooms` (
  `accountId` int(10) unsigned NOT NULL,
  `itemId` int(11) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of battlenet_account_heirlooms
-- ----------------------------

-- ----------------------------
-- Table structure for `ip_banned`
-- ----------------------------
DROP TABLE IF EXISTS `ip_banned`;
CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

-- ----------------------------
-- Records of ip_banned
-- ----------------------------

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` varchar(250) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for `logs_ip_actions`
-- ----------------------------
DROP TABLE IF EXISTS `logs_ip_actions`;
CREATE TABLE `logs_ip_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier',
  `account_id` int(10) unsigned NOT NULL COMMENT 'Account ID',
  `character_guid` int(10) unsigned NOT NULL COMMENT 'Character Guid',
  `type` tinyint(3) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text COMMENT 'Notes inserted by system',
  `unixtime` int(10) unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `comment` text COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used to log ips of individual actions';

-- ----------------------------
-- Records of logs_ip_actions
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_account_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_account_permissions`;
CREATE TABLE `rbac_account_permissions` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Permission relation';

-- ----------------------------
-- Records of rbac_account_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_default_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_default_permissions`;
CREATE TABLE `rbac_default_permissions` (
  `secId` int(10) unsigned NOT NULL COMMENT 'Security Level id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'permission id',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_default_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default permission to assign to different account security levels';

-- ----------------------------
-- Records of rbac_default_permissions
-- ----------------------------
INSERT INTO `rbac_default_permissions` VALUES ('3', '192', '-1');
INSERT INTO `rbac_default_permissions` VALUES ('2', '193', '-1');
INSERT INTO `rbac_default_permissions` VALUES ('1', '194', '-1');
INSERT INTO `rbac_default_permissions` VALUES ('0', '195', '-1');

-- ----------------------------
-- Table structure for `rbac_linked_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_linked_permissions`;
CREATE TABLE `rbac_linked_permissions` (
  `id` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `linkedId` int(10) unsigned NOT NULL COMMENT 'Linked Permission id',
  PRIMARY KEY (`id`,`linkedId`),
  KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`),
  KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`),
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission - Linked Permission relation';

-- ----------------------------
-- Records of rbac_linked_permissions
-- ----------------------------
INSERT INTO `rbac_linked_permissions` VALUES ('192', '21');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '42');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '43');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '193');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '196');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '778');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '779');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '780');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '781');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '782');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '783');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '784');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '785');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '786');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '787');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '788');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '789');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '790');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '791');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '792');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '793');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '794');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '795');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '796');
INSERT INTO `rbac_linked_permissions` VALUES ('192', '835');
INSERT INTO `rbac_linked_permissions` VALUES ('193', '48');
INSERT INTO `rbac_linked_permissions` VALUES ('193', '194');
INSERT INTO `rbac_linked_permissions` VALUES ('193', '197');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '1');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '2');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '11');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '13');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '14');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '15');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '16');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '17');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '18');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '19');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '20');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '22');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '23');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '25');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '26');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '27');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '28');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '29');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '30');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '31');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '32');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '33');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '34');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '35');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '36');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '37');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '38');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '39');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '40');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '41');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '44');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '46');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '47');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '51');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '195');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '198');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '632');
INSERT INTO `rbac_linked_permissions` VALUES ('194', '798');
INSERT INTO `rbac_linked_permissions` VALUES ('195', '3');
INSERT INTO `rbac_linked_permissions` VALUES ('195', '4');
INSERT INTO `rbac_linked_permissions` VALUES ('195', '5');
INSERT INTO `rbac_linked_permissions` VALUES ('195', '6');
INSERT INTO `rbac_linked_permissions` VALUES ('195', '24');
INSERT INTO `rbac_linked_permissions` VALUES ('195', '49');
INSERT INTO `rbac_linked_permissions` VALUES ('195', '199');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '7');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '200');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '201');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '226');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '227');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '230');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '231');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '233');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '234');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '235');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '238');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '239');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '240');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '241');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '242');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '243');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '244');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '245');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '246');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '247');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '248');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '249');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '250');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '251');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '252');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '253');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '254');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '255');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '256');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '257');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '258');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '259');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '260');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '261');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '262');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '264');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '265');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '266');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '267');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '268');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '269');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '270');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '271');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '272');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '279');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '280');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '283');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '287');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '288');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '289');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '290');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '291');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '292');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '293');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '294');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '295');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '296');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '297');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '298');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '299');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '302');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '303');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '304');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '305');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '306');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '307');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '308');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '309');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '310');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '313');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '314');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '319');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '320');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '321');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '322');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '323');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '324');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '325');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '326');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '327');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '328');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '329');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '330');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '331');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '332');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '333');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '334');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '335');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '336');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '337');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '338');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '339');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '340');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '341');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '342');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '343');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '344');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '345');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '346');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '347');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '348');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '349');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '350');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '351');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '352');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '353');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '354');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '355');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '356');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '357');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '358');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '359');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '360');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '361');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '362');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '363');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '364');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '365');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '366');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '373');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '375');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '400');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '401');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '402');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '403');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '404');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '405');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '406');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '407');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '417');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '418');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '419');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '420');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '421');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '422');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '423');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '424');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '425');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '426');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '427');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '428');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '429');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '434');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '435');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '436');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '437');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '438');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '439');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '440');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '441');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '442');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '443');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '444');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '445');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '446');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '447');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '448');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '449');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '450');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '451');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '452');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '453');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '454');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '455');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '456');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '457');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '458');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '459');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '461');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '463');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '464');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '465');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '472');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '474');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '475');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '476');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '477');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '478');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '488');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '489');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '491');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '492');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '493');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '495');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '497');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '498');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '499');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '500');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '502');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '503');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '505');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '508');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '511');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '513');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '514');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '516');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '519');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '522');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '523');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '526');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '527');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '529');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '530');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '533');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '535');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '536');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '537');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '538');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '539');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '540');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '541');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '556');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '581');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '582');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '592');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '593');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '596');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '602');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '603');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '604');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '605');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '606');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '607');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '608');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '609');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '610');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '611');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '612');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '613');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '614');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '615');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '616');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '617');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '618');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '619');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '620');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '621');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '622');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '623');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '624');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '625');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '626');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '627');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '628');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '629');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '630');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '631');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '633');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '634');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '635');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '636');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '637');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '638');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '639');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '640');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '641');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '642');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '643');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '644');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '645');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '646');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '647');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '648');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '649');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '650');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '651');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '652');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '653');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '654');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '655');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '656');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '657');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '658');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '659');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '660');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '661');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '662');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '663');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '664');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '665');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '666');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '667');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '668');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '669');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '670');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '671');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '672');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '673');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '674');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '675');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '676');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '677');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '678');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '679');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '680');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '681');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '682');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '683');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '684');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '685');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '686');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '687');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '688');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '689');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '690');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '691');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '692');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '693');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '694');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '695');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '696');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '697');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '698');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '699');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '700');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '701');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '702');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '703');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '704');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '705');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '706');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '707');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '708');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '709');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '710');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '711');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '712');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '713');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '714');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '715');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '716');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '717');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '718');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '719');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '721');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '722');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '723');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '724');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '725');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '726');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '727');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '728');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '729');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '730');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '733');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '734');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '735');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '736');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '738');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '739');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '748');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '753');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '757');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '773');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '777');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '836');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '837');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '838');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '839');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '840');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '841');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '843');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '852');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '866');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '867');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '870');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '871');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '872');
INSERT INTO `rbac_linked_permissions` VALUES ('196', '873');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '232');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '236');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '237');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '273');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '274');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '275');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '276');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '277');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '284');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '285');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '286');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '301');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '311');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '387');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '388');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '389');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '390');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '391');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '392');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '393');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '394');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '395');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '396');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '397');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '398');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '399');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '473');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '479');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '480');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '481');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '482');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '485');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '486');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '487');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '494');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '501');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '506');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '509');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '510');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '517');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '518');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '521');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '542');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '543');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '550');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '558');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '568');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '571');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '572');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '573');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '574');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '575');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '576');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '577');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '578');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '579');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '580');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '583');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '584');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '585');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '586');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '587');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '588');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '589');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '590');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '591');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '594');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '595');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '601');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '743');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '750');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '758');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '761');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '762');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '763');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '764');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '765');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '766');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '767');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '768');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '769');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '770');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '771');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '772');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '774');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '856');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '857');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '858');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '859');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '860');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '861');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '862');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '863');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '864');
INSERT INTO `rbac_linked_permissions` VALUES ('197', '865');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '218');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '300');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '312');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '315');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '316');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '317');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '318');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '367');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '368');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '369');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '370');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '371');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '372');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '374');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '376');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '377');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '408');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '409');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '410');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '411');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '412');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '413');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '414');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '415');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '416');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '430');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '431');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '432');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '433');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '462');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '466');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '467');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '468');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '469');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '470');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '471');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '483');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '484');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '490');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '504');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '512');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '515');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '520');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '524');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '528');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '531');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '532');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '544');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '545');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '546');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '547');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '548');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '549');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '551');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '552');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '553');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '554');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '555');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '557');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '559');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '560');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '561');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '562');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '563');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '564');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '565');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '566');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '567');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '569');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '570');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '597');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '598');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '599');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '600');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '737');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '740');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '741');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '742');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '744');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '745');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '746');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '747');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '749');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '751');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '752');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '754');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '755');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '756');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '759');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '760');
INSERT INTO `rbac_linked_permissions` VALUES ('198', '855');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '217');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '221');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '222');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '223');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '225');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '263');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '496');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '507');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '525');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '534');
INSERT INTO `rbac_linked_permissions` VALUES ('199', '797');

-- ----------------------------
-- Table structure for `rbac_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_permissions`;
CREATE TABLE `rbac_permissions` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission List';

-- ----------------------------
-- Records of rbac_permissions
-- ----------------------------
INSERT INTO `rbac_permissions` VALUES ('1', 'Instant logout');
INSERT INTO `rbac_permissions` VALUES ('2', 'Skip Queue');
INSERT INTO `rbac_permissions` VALUES ('3', 'Join Normal Battleground');
INSERT INTO `rbac_permissions` VALUES ('4', 'Join Random Battleground');
INSERT INTO `rbac_permissions` VALUES ('5', 'Join Arenas');
INSERT INTO `rbac_permissions` VALUES ('6', 'Join Dungeon Finder');
INSERT INTO `rbac_permissions` VALUES ('7', 'Skip idle connection check');
INSERT INTO `rbac_permissions` VALUES ('11', 'Log GM trades');
INSERT INTO `rbac_permissions` VALUES ('13', 'Skip Instance required bosses check');
INSERT INTO `rbac_permissions` VALUES ('14', 'Skip character creation team mask check');
INSERT INTO `rbac_permissions` VALUES ('15', 'Skip character creation class mask check');
INSERT INTO `rbac_permissions` VALUES ('16', 'Skip character creation race mask check');
INSERT INTO `rbac_permissions` VALUES ('17', 'Skip character creation reserved name check');
INSERT INTO `rbac_permissions` VALUES ('18', 'Skip character creation death knight min level check');
INSERT INTO `rbac_permissions` VALUES ('19', 'Skip needed requirements to use channel check');
INSERT INTO `rbac_permissions` VALUES ('20', 'Skip disable map check');
INSERT INTO `rbac_permissions` VALUES ('21', 'Skip reset talents when used more than allowed check');
INSERT INTO `rbac_permissions` VALUES ('22', 'Skip spam chat check');
INSERT INTO `rbac_permissions` VALUES ('23', 'Skip over-speed ping check');
INSERT INTO `rbac_permissions` VALUES ('24', 'Two side faction characters on the same account');
INSERT INTO `rbac_permissions` VALUES ('25', 'Allow say chat between factions');
INSERT INTO `rbac_permissions` VALUES ('26', 'Allow channel chat between factions');
INSERT INTO `rbac_permissions` VALUES ('27', 'Two side mail interaction');
INSERT INTO `rbac_permissions` VALUES ('28', 'See two side who list');
INSERT INTO `rbac_permissions` VALUES ('29', 'Add friends of other faction');
INSERT INTO `rbac_permissions` VALUES ('30', 'Save character without delay with .save command');
INSERT INTO `rbac_permissions` VALUES ('31', 'Use params with .unstuck command');
INSERT INTO `rbac_permissions` VALUES ('32', 'Can be assigned tickets with .assign ticket command');
INSERT INTO `rbac_permissions` VALUES ('33', 'Notify if a command was not found');
INSERT INTO `rbac_permissions` VALUES ('34', 'Check if should appear in list using .gm ingame command');
INSERT INTO `rbac_permissions` VALUES ('35', 'See all security levels with who command');
INSERT INTO `rbac_permissions` VALUES ('36', 'Filter whispers');
INSERT INTO `rbac_permissions` VALUES ('37', 'Use staff badge in chat');
INSERT INTO `rbac_permissions` VALUES ('38', 'Resurrect with full Health Points');
INSERT INTO `rbac_permissions` VALUES ('39', 'Restore saved gm setting states');
INSERT INTO `rbac_permissions` VALUES ('40', 'Allows to add a gm to friend list');
INSERT INTO `rbac_permissions` VALUES ('41', 'Use Config option START_GM_LEVEL to assign new character level');
INSERT INTO `rbac_permissions` VALUES ('42', 'Allows to use CMSG_WORLD_TELEPORT opcode');
INSERT INTO `rbac_permissions` VALUES ('43', 'Allows to use CMSG_WHOIS opcode');
INSERT INTO `rbac_permissions` VALUES ('44', 'Receive global GM messages/texts');
INSERT INTO `rbac_permissions` VALUES ('45', 'Join channels without announce');
INSERT INTO `rbac_permissions` VALUES ('46', 'Change channel settings without being channel moderator');
INSERT INTO `rbac_permissions` VALUES ('47', 'Enables lower security than target check');
INSERT INTO `rbac_permissions` VALUES ('48', 'Enable IP, Last Login and EMail output in pinfo');
INSERT INTO `rbac_permissions` VALUES ('49', 'Forces to enter the email for confirmation on password change');
INSERT INTO `rbac_permissions` VALUES ('50', 'Allow user to check his own email with .account');
INSERT INTO `rbac_permissions` VALUES ('51', 'Allow trading between factions');
INSERT INTO `rbac_permissions` VALUES ('192', 'Role: Sec Level Administrator');
INSERT INTO `rbac_permissions` VALUES ('193', 'Role: Sec Level Gamemaster');
INSERT INTO `rbac_permissions` VALUES ('194', 'Role: Sec Level Moderator');
INSERT INTO `rbac_permissions` VALUES ('195', 'Role: Sec Level Player');
INSERT INTO `rbac_permissions` VALUES ('196', 'Role: Administrator Commands');
INSERT INTO `rbac_permissions` VALUES ('197', 'Role: Gamemaster Commands');
INSERT INTO `rbac_permissions` VALUES ('198', 'Role: Moderator Commands');
INSERT INTO `rbac_permissions` VALUES ('199', 'Role: Player Commands');
INSERT INTO `rbac_permissions` VALUES ('200', 'Command: rbac');
INSERT INTO `rbac_permissions` VALUES ('201', 'Command: rbac account');
INSERT INTO `rbac_permissions` VALUES ('202', 'Command: rbac account list');
INSERT INTO `rbac_permissions` VALUES ('203', 'Command: rbac account grant');
INSERT INTO `rbac_permissions` VALUES ('204', 'Command: rbac account deny');
INSERT INTO `rbac_permissions` VALUES ('205', 'Command: rbac account revoke');
INSERT INTO `rbac_permissions` VALUES ('206', 'Command: rbac list');
INSERT INTO `rbac_permissions` VALUES ('217', 'Command: account');
INSERT INTO `rbac_permissions` VALUES ('218', 'Command: account addon');
INSERT INTO `rbac_permissions` VALUES ('219', 'Command: account create');
INSERT INTO `rbac_permissions` VALUES ('220', 'Command: account delete');
INSERT INTO `rbac_permissions` VALUES ('221', 'Command: account lock');
INSERT INTO `rbac_permissions` VALUES ('222', 'Command: account lock country');
INSERT INTO `rbac_permissions` VALUES ('223', 'Command: account lock ip');
INSERT INTO `rbac_permissions` VALUES ('224', 'Command: account onlinelist');
INSERT INTO `rbac_permissions` VALUES ('225', 'Command: account password');
INSERT INTO `rbac_permissions` VALUES ('226', 'Command: account set');
INSERT INTO `rbac_permissions` VALUES ('227', 'Command: account set addon');
INSERT INTO `rbac_permissions` VALUES ('228', 'Command: account set gmlevel');
INSERT INTO `rbac_permissions` VALUES ('229', 'Command: account set password');
INSERT INTO `rbac_permissions` VALUES ('230', 'Command: achievement');
INSERT INTO `rbac_permissions` VALUES ('231', 'Command: achievement add');
INSERT INTO `rbac_permissions` VALUES ('232', 'Command: arena');
INSERT INTO `rbac_permissions` VALUES ('233', 'Command: arena captain');
INSERT INTO `rbac_permissions` VALUES ('234', 'Command: arena create');
INSERT INTO `rbac_permissions` VALUES ('235', 'Command: arena disband');
INSERT INTO `rbac_permissions` VALUES ('236', 'Command: arena info');
INSERT INTO `rbac_permissions` VALUES ('237', 'Command: arena lookup');
INSERT INTO `rbac_permissions` VALUES ('238', 'Command: arena rename');
INSERT INTO `rbac_permissions` VALUES ('239', 'Command: ban');
INSERT INTO `rbac_permissions` VALUES ('240', 'Command: ban account');
INSERT INTO `rbac_permissions` VALUES ('241', 'Command: ban character');
INSERT INTO `rbac_permissions` VALUES ('242', 'Command: ban ip');
INSERT INTO `rbac_permissions` VALUES ('243', 'Command: ban playeraccount');
INSERT INTO `rbac_permissions` VALUES ('244', 'Command: baninfo');
INSERT INTO `rbac_permissions` VALUES ('245', 'Command: baninfo account');
INSERT INTO `rbac_permissions` VALUES ('246', 'Command: baninfo character');
INSERT INTO `rbac_permissions` VALUES ('247', 'Command: baninfo ip');
INSERT INTO `rbac_permissions` VALUES ('248', 'Command: banlist');
INSERT INTO `rbac_permissions` VALUES ('249', 'Command: banlist account');
INSERT INTO `rbac_permissions` VALUES ('250', 'Command: banlist character');
INSERT INTO `rbac_permissions` VALUES ('251', 'Command: banlist ip');
INSERT INTO `rbac_permissions` VALUES ('252', 'Command: unban');
INSERT INTO `rbac_permissions` VALUES ('253', 'Command: unban account');
INSERT INTO `rbac_permissions` VALUES ('254', 'Command: unban character');
INSERT INTO `rbac_permissions` VALUES ('255', 'Command: unban ip');
INSERT INTO `rbac_permissions` VALUES ('256', 'Command: unban playeraccount');
INSERT INTO `rbac_permissions` VALUES ('257', 'Command: bf');
INSERT INTO `rbac_permissions` VALUES ('258', 'Command: bf start');
INSERT INTO `rbac_permissions` VALUES ('259', 'Command: bf stop');
INSERT INTO `rbac_permissions` VALUES ('260', 'Command: bf switch');
INSERT INTO `rbac_permissions` VALUES ('261', 'Command: bf timer');
INSERT INTO `rbac_permissions` VALUES ('262', 'Command: bf enable');
INSERT INTO `rbac_permissions` VALUES ('263', 'Command: account email');
INSERT INTO `rbac_permissions` VALUES ('264', 'Command: account set sec');
INSERT INTO `rbac_permissions` VALUES ('265', 'Command: account set sec email');
INSERT INTO `rbac_permissions` VALUES ('266', 'Command: account set sec regmail');
INSERT INTO `rbac_permissions` VALUES ('267', 'Command: cast');
INSERT INTO `rbac_permissions` VALUES ('268', 'Command: cast back');
INSERT INTO `rbac_permissions` VALUES ('269', 'Command: cast dist');
INSERT INTO `rbac_permissions` VALUES ('270', 'Command: cast self');
INSERT INTO `rbac_permissions` VALUES ('271', 'Command: cast target');
INSERT INTO `rbac_permissions` VALUES ('272', 'Command: cast dest');
INSERT INTO `rbac_permissions` VALUES ('273', 'Command: character');
INSERT INTO `rbac_permissions` VALUES ('274', 'Command: character customize');
INSERT INTO `rbac_permissions` VALUES ('275', 'Command: character changefaction');
INSERT INTO `rbac_permissions` VALUES ('276', 'Command: character changerace');
INSERT INTO `rbac_permissions` VALUES ('277', 'Command: character deleted');
INSERT INTO `rbac_permissions` VALUES ('279', 'Command: character deleted list');
INSERT INTO `rbac_permissions` VALUES ('280', 'Command: character deleted restore');
INSERT INTO `rbac_permissions` VALUES ('283', 'Command: character level');
INSERT INTO `rbac_permissions` VALUES ('284', 'Command: character rename');
INSERT INTO `rbac_permissions` VALUES ('285', 'Command: character reputation');
INSERT INTO `rbac_permissions` VALUES ('286', 'Command: character titles');
INSERT INTO `rbac_permissions` VALUES ('287', 'Command: levelup');
INSERT INTO `rbac_permissions` VALUES ('288', 'Command: pdump');
INSERT INTO `rbac_permissions` VALUES ('289', 'Command: pdump load');
INSERT INTO `rbac_permissions` VALUES ('290', 'Command: pdump write');
INSERT INTO `rbac_permissions` VALUES ('291', 'Command: cheat');
INSERT INTO `rbac_permissions` VALUES ('292', 'Command: cheat casttime');
INSERT INTO `rbac_permissions` VALUES ('293', 'Command: cheat cooldown');
INSERT INTO `rbac_permissions` VALUES ('294', 'Command: cheat explore');
INSERT INTO `rbac_permissions` VALUES ('295', 'Command: cheat god');
INSERT INTO `rbac_permissions` VALUES ('296', 'Command: cheat power');
INSERT INTO `rbac_permissions` VALUES ('297', 'Command: cheat status');
INSERT INTO `rbac_permissions` VALUES ('298', 'Command: cheat taxi');
INSERT INTO `rbac_permissions` VALUES ('299', 'Command: cheat waterwalk');
INSERT INTO `rbac_permissions` VALUES ('300', 'Command: debug');
INSERT INTO `rbac_permissions` VALUES ('301', 'Command: debug anim');
INSERT INTO `rbac_permissions` VALUES ('302', 'Command: debug areatriggers');
INSERT INTO `rbac_permissions` VALUES ('303', 'Command: debug arena');
INSERT INTO `rbac_permissions` VALUES ('304', 'Command: debug bg');
INSERT INTO `rbac_permissions` VALUES ('305', 'Command: debug entervehicle');
INSERT INTO `rbac_permissions` VALUES ('306', 'Command: debug getitemstate');
INSERT INTO `rbac_permissions` VALUES ('307', 'Command: debug getitemvalue');
INSERT INTO `rbac_permissions` VALUES ('308', 'Command: debug getvalue');
INSERT INTO `rbac_permissions` VALUES ('309', 'Command: debug combat');
INSERT INTO `rbac_permissions` VALUES ('310', 'Command: debug itemexpire');
INSERT INTO `rbac_permissions` VALUES ('311', 'Command: debug lootrecipient');
INSERT INTO `rbac_permissions` VALUES ('312', 'Command: debug los');
INSERT INTO `rbac_permissions` VALUES ('313', 'Command: debug mod32value');
INSERT INTO `rbac_permissions` VALUES ('314', 'Command: debug moveflags');
INSERT INTO `rbac_permissions` VALUES ('315', 'Command: debug play');
INSERT INTO `rbac_permissions` VALUES ('316', 'Command: debug play cinematics');
INSERT INTO `rbac_permissions` VALUES ('317', 'Command: debug play movie');
INSERT INTO `rbac_permissions` VALUES ('318', 'Command: debug play sound');
INSERT INTO `rbac_permissions` VALUES ('319', 'Command: debug send');
INSERT INTO `rbac_permissions` VALUES ('320', 'Command: debug send buyerror');
INSERT INTO `rbac_permissions` VALUES ('321', 'Command: debug send channelnotify');
INSERT INTO `rbac_permissions` VALUES ('322', 'Command: debug send chatmessage');
INSERT INTO `rbac_permissions` VALUES ('323', 'Command: debug send equiperror');
INSERT INTO `rbac_permissions` VALUES ('324', 'Command: debug send largepacket');
INSERT INTO `rbac_permissions` VALUES ('325', 'Command: debug send opcode');
INSERT INTO `rbac_permissions` VALUES ('326', 'Command: debug send qinvalidmsg');
INSERT INTO `rbac_permissions` VALUES ('327', 'Command: debug send qpartymsg');
INSERT INTO `rbac_permissions` VALUES ('328', 'Command: debug send sellerror');
INSERT INTO `rbac_permissions` VALUES ('329', 'Command: debug send setphaseshift');
INSERT INTO `rbac_permissions` VALUES ('330', 'Command: debug send spellfail');
INSERT INTO `rbac_permissions` VALUES ('331', 'Command: debug setaurastate');
INSERT INTO `rbac_permissions` VALUES ('332', 'Command: debug setbit');
INSERT INTO `rbac_permissions` VALUES ('333', 'Command: debug setitemvalue');
INSERT INTO `rbac_permissions` VALUES ('334', 'Command: debug setvalue');
INSERT INTO `rbac_permissions` VALUES ('335', 'Command: debug setvid');
INSERT INTO `rbac_permissions` VALUES ('336', 'Command: debug spawnvehicle');
INSERT INTO `rbac_permissions` VALUES ('337', 'Command: debug threat');
INSERT INTO `rbac_permissions` VALUES ('338', 'Command: debug update');
INSERT INTO `rbac_permissions` VALUES ('339', 'Command: debug worldstate');
INSERT INTO `rbac_permissions` VALUES ('340', 'Command: wpgps');
INSERT INTO `rbac_permissions` VALUES ('341', 'Command: deserter');
INSERT INTO `rbac_permissions` VALUES ('342', 'Command: deserter bg');
INSERT INTO `rbac_permissions` VALUES ('343', 'Command: deserter bg add');
INSERT INTO `rbac_permissions` VALUES ('344', 'Command: deserter bg remove');
INSERT INTO `rbac_permissions` VALUES ('345', 'Command: deserter instance');
INSERT INTO `rbac_permissions` VALUES ('346', 'Command: deserter instance add');
INSERT INTO `rbac_permissions` VALUES ('347', 'Command: deserter instance remove');
INSERT INTO `rbac_permissions` VALUES ('348', 'Command: disable');
INSERT INTO `rbac_permissions` VALUES ('349', 'Command: disable add');
INSERT INTO `rbac_permissions` VALUES ('350', 'Command: disable add achievement_criteria');
INSERT INTO `rbac_permissions` VALUES ('351', 'Command: disable add battleground');
INSERT INTO `rbac_permissions` VALUES ('352', 'Command: disable add map');
INSERT INTO `rbac_permissions` VALUES ('353', 'Command: disable add mmap');
INSERT INTO `rbac_permissions` VALUES ('354', 'Command: disable add outdoorpvp');
INSERT INTO `rbac_permissions` VALUES ('355', 'Command: disable add quest');
INSERT INTO `rbac_permissions` VALUES ('356', 'Command: disable add spell');
INSERT INTO `rbac_permissions` VALUES ('357', 'Command: disable add vmap');
INSERT INTO `rbac_permissions` VALUES ('358', 'Command: disable remove');
INSERT INTO `rbac_permissions` VALUES ('359', 'Command: disable remove achievement_criteria');
INSERT INTO `rbac_permissions` VALUES ('360', 'Command: disable remove battleground');
INSERT INTO `rbac_permissions` VALUES ('361', 'Command: disable remove map');
INSERT INTO `rbac_permissions` VALUES ('362', 'Command: disable remove mmap');
INSERT INTO `rbac_permissions` VALUES ('363', 'Command: disable remove outdoorpvp');
INSERT INTO `rbac_permissions` VALUES ('364', 'Command: disable remove quest');
INSERT INTO `rbac_permissions` VALUES ('365', 'Command: disable remove spell');
INSERT INTO `rbac_permissions` VALUES ('366', 'Command: disable remove vmap');
INSERT INTO `rbac_permissions` VALUES ('367', 'Command: event info');
INSERT INTO `rbac_permissions` VALUES ('368', 'Command: event activelist');
INSERT INTO `rbac_permissions` VALUES ('369', 'Command: event start');
INSERT INTO `rbac_permissions` VALUES ('370', 'Command: event stop');
INSERT INTO `rbac_permissions` VALUES ('371', 'Command: gm');
INSERT INTO `rbac_permissions` VALUES ('372', 'Command: gm chat');
INSERT INTO `rbac_permissions` VALUES ('373', 'Command: gm fly');
INSERT INTO `rbac_permissions` VALUES ('374', 'Command: gm ingame');
INSERT INTO `rbac_permissions` VALUES ('375', 'Command: gm list');
INSERT INTO `rbac_permissions` VALUES ('376', 'Command: gm visible');
INSERT INTO `rbac_permissions` VALUES ('377', 'Command: go');
INSERT INTO `rbac_permissions` VALUES ('387', 'Command: gobject');
INSERT INTO `rbac_permissions` VALUES ('388', 'Command: gobject activate');
INSERT INTO `rbac_permissions` VALUES ('389', 'Command: gobject add');
INSERT INTO `rbac_permissions` VALUES ('390', 'Command: gobject add temp');
INSERT INTO `rbac_permissions` VALUES ('391', 'Command: gobject delete');
INSERT INTO `rbac_permissions` VALUES ('392', 'Command: gobject info');
INSERT INTO `rbac_permissions` VALUES ('393', 'Command: gobject move');
INSERT INTO `rbac_permissions` VALUES ('394', 'Command: gobject near');
INSERT INTO `rbac_permissions` VALUES ('395', 'Command: gobject set');
INSERT INTO `rbac_permissions` VALUES ('396', 'Command: gobject set phase');
INSERT INTO `rbac_permissions` VALUES ('397', 'Command: gobject set state');
INSERT INTO `rbac_permissions` VALUES ('398', 'Command: gobject target');
INSERT INTO `rbac_permissions` VALUES ('399', 'Command: gobject turn');
INSERT INTO `rbac_permissions` VALUES ('400', 'debug transport');
INSERT INTO `rbac_permissions` VALUES ('401', 'Command: guild');
INSERT INTO `rbac_permissions` VALUES ('402', 'Command: guild create');
INSERT INTO `rbac_permissions` VALUES ('403', 'Command: guild delete');
INSERT INTO `rbac_permissions` VALUES ('404', 'Command: guild invite');
INSERT INTO `rbac_permissions` VALUES ('405', 'Command: guild uninvite');
INSERT INTO `rbac_permissions` VALUES ('406', 'Command: guild rank');
INSERT INTO `rbac_permissions` VALUES ('407', 'Command: guild rename');
INSERT INTO `rbac_permissions` VALUES ('408', 'Command: honor');
INSERT INTO `rbac_permissions` VALUES ('409', 'Command: honor add');
INSERT INTO `rbac_permissions` VALUES ('410', 'Command: honor add kill');
INSERT INTO `rbac_permissions` VALUES ('411', 'Command: honor update');
INSERT INTO `rbac_permissions` VALUES ('412', 'Command: instance');
INSERT INTO `rbac_permissions` VALUES ('413', 'Command: instance listbinds');
INSERT INTO `rbac_permissions` VALUES ('414', 'Command: instance unbind');
INSERT INTO `rbac_permissions` VALUES ('415', 'Command: instance stats');
INSERT INTO `rbac_permissions` VALUES ('416', 'Command: instance savedata');
INSERT INTO `rbac_permissions` VALUES ('417', 'Command: learn');
INSERT INTO `rbac_permissions` VALUES ('418', 'Command: learn all');
INSERT INTO `rbac_permissions` VALUES ('419', 'Command: learn all my');
INSERT INTO `rbac_permissions` VALUES ('420', 'Command: learn all my class');
INSERT INTO `rbac_permissions` VALUES ('421', 'Command: learn all my pettalents');
INSERT INTO `rbac_permissions` VALUES ('422', 'Command: learn all my spells');
INSERT INTO `rbac_permissions` VALUES ('423', 'Command: learn all my talents');
INSERT INTO `rbac_permissions` VALUES ('424', 'Command: learn all gm');
INSERT INTO `rbac_permissions` VALUES ('425', 'Command: learn all crafts');
INSERT INTO `rbac_permissions` VALUES ('426', 'Command: learn all default');
INSERT INTO `rbac_permissions` VALUES ('427', 'Command: learn all lang');
INSERT INTO `rbac_permissions` VALUES ('428', 'Command: learn all recipes');
INSERT INTO `rbac_permissions` VALUES ('429', 'Command: unlearn');
INSERT INTO `rbac_permissions` VALUES ('430', 'Command: lfg');
INSERT INTO `rbac_permissions` VALUES ('431', 'Command: lfg player');
INSERT INTO `rbac_permissions` VALUES ('432', 'Command: lfg group');
INSERT INTO `rbac_permissions` VALUES ('433', 'Command: lfg queue');
INSERT INTO `rbac_permissions` VALUES ('434', 'Command: lfg clean');
INSERT INTO `rbac_permissions` VALUES ('435', 'Command: lfg options');
INSERT INTO `rbac_permissions` VALUES ('436', 'Command: list');
INSERT INTO `rbac_permissions` VALUES ('437', 'Command: list creature');
INSERT INTO `rbac_permissions` VALUES ('438', 'Command: list item');
INSERT INTO `rbac_permissions` VALUES ('439', 'Command: list object');
INSERT INTO `rbac_permissions` VALUES ('440', 'Command: list auras');
INSERT INTO `rbac_permissions` VALUES ('441', 'Command: list mail');
INSERT INTO `rbac_permissions` VALUES ('442', 'Command: lookup');
INSERT INTO `rbac_permissions` VALUES ('443', 'Command: lookup area');
INSERT INTO `rbac_permissions` VALUES ('444', 'Command: lookup creature');
INSERT INTO `rbac_permissions` VALUES ('445', 'Command: lookup event');
INSERT INTO `rbac_permissions` VALUES ('446', 'Command: lookup faction');
INSERT INTO `rbac_permissions` VALUES ('447', 'Command: lookup item');
INSERT INTO `rbac_permissions` VALUES ('448', 'Command: lookup itemset');
INSERT INTO `rbac_permissions` VALUES ('449', 'Command: lookup object');
INSERT INTO `rbac_permissions` VALUES ('450', 'Command: lookup quest');
INSERT INTO `rbac_permissions` VALUES ('451', 'Command: lookup player');
INSERT INTO `rbac_permissions` VALUES ('452', 'Command: lookup player ip');
INSERT INTO `rbac_permissions` VALUES ('453', 'Command: lookup player account');
INSERT INTO `rbac_permissions` VALUES ('454', 'Command: lookup player email');
INSERT INTO `rbac_permissions` VALUES ('455', 'Command: lookup skill');
INSERT INTO `rbac_permissions` VALUES ('456', 'Command: lookup spell');
INSERT INTO `rbac_permissions` VALUES ('457', 'Command: lookup spell id');
INSERT INTO `rbac_permissions` VALUES ('458', 'Command: lookup taxinode');
INSERT INTO `rbac_permissions` VALUES ('459', 'Command: lookup tele');
INSERT INTO `rbac_permissions` VALUES ('460', 'Command: lookup title');
INSERT INTO `rbac_permissions` VALUES ('461', 'Command: lookup map');
INSERT INTO `rbac_permissions` VALUES ('462', 'Command: announce');
INSERT INTO `rbac_permissions` VALUES ('463', 'Command: channel');
INSERT INTO `rbac_permissions` VALUES ('464', 'Command: channel set');
INSERT INTO `rbac_permissions` VALUES ('465', 'Command: channel set ownership');
INSERT INTO `rbac_permissions` VALUES ('466', 'Command: gmannounce');
INSERT INTO `rbac_permissions` VALUES ('467', 'Command: gmnameannounce');
INSERT INTO `rbac_permissions` VALUES ('468', 'Command: gmnotify');
INSERT INTO `rbac_permissions` VALUES ('469', 'Command: nameannounce');
INSERT INTO `rbac_permissions` VALUES ('470', 'Command: notify');
INSERT INTO `rbac_permissions` VALUES ('471', 'Command: whispers');
INSERT INTO `rbac_permissions` VALUES ('472', 'Command: group');
INSERT INTO `rbac_permissions` VALUES ('473', 'Command: group leader');
INSERT INTO `rbac_permissions` VALUES ('474', 'Command: group disband');
INSERT INTO `rbac_permissions` VALUES ('475', 'Command: group remove');
INSERT INTO `rbac_permissions` VALUES ('476', 'Command: group join');
INSERT INTO `rbac_permissions` VALUES ('477', 'Command: group list');
INSERT INTO `rbac_permissions` VALUES ('478', 'Command: group summon');
INSERT INTO `rbac_permissions` VALUES ('479', 'Command: pet');
INSERT INTO `rbac_permissions` VALUES ('480', 'Command: pet create');
INSERT INTO `rbac_permissions` VALUES ('481', 'Command: pet learn');
INSERT INTO `rbac_permissions` VALUES ('482', 'Command: pet unlearn');
INSERT INTO `rbac_permissions` VALUES ('483', 'Command: send');
INSERT INTO `rbac_permissions` VALUES ('484', 'Command: send items');
INSERT INTO `rbac_permissions` VALUES ('485', 'Command: send mail');
INSERT INTO `rbac_permissions` VALUES ('486', 'Command: send message');
INSERT INTO `rbac_permissions` VALUES ('487', 'Command: send money');
INSERT INTO `rbac_permissions` VALUES ('488', 'Command: additem');
INSERT INTO `rbac_permissions` VALUES ('489', 'Command: additemset');
INSERT INTO `rbac_permissions` VALUES ('490', 'Command: appear');
INSERT INTO `rbac_permissions` VALUES ('491', 'Command: aura');
INSERT INTO `rbac_permissions` VALUES ('492', 'Command: bank');
INSERT INTO `rbac_permissions` VALUES ('493', 'Command: bindsight');
INSERT INTO `rbac_permissions` VALUES ('494', 'Command: combatstop');
INSERT INTO `rbac_permissions` VALUES ('495', 'Command: cometome');
INSERT INTO `rbac_permissions` VALUES ('496', 'Command: commands');
INSERT INTO `rbac_permissions` VALUES ('497', 'Command: cooldown');
INSERT INTO `rbac_permissions` VALUES ('498', 'Command: damage');
INSERT INTO `rbac_permissions` VALUES ('499', 'Command: dev');
INSERT INTO `rbac_permissions` VALUES ('500', 'Command: die');
INSERT INTO `rbac_permissions` VALUES ('501', 'Command: dismount');
INSERT INTO `rbac_permissions` VALUES ('502', 'Command: distance');
INSERT INTO `rbac_permissions` VALUES ('503', 'Command: flusharenapoints');
INSERT INTO `rbac_permissions` VALUES ('504', 'Command: freeze');
INSERT INTO `rbac_permissions` VALUES ('505', 'Command: gps');
INSERT INTO `rbac_permissions` VALUES ('506', 'Command: guid');
INSERT INTO `rbac_permissions` VALUES ('507', 'Command: help');
INSERT INTO `rbac_permissions` VALUES ('508', 'Command: hidearea');
INSERT INTO `rbac_permissions` VALUES ('509', 'Command: itemmove');
INSERT INTO `rbac_permissions` VALUES ('510', 'Command: kick');
INSERT INTO `rbac_permissions` VALUES ('511', 'Command: linkgrave');
INSERT INTO `rbac_permissions` VALUES ('512', 'Command: listfreeze');
INSERT INTO `rbac_permissions` VALUES ('513', 'Command: maxskill');
INSERT INTO `rbac_permissions` VALUES ('514', 'Command: movegens');
INSERT INTO `rbac_permissions` VALUES ('515', 'Command: mute');
INSERT INTO `rbac_permissions` VALUES ('516', 'Command: neargrave');
INSERT INTO `rbac_permissions` VALUES ('517', 'Command: pinfo');
INSERT INTO `rbac_permissions` VALUES ('518', 'Command: playall');
INSERT INTO `rbac_permissions` VALUES ('519', 'Command: possess');
INSERT INTO `rbac_permissions` VALUES ('520', 'Command: recall');
INSERT INTO `rbac_permissions` VALUES ('521', 'Command: repairitems');
INSERT INTO `rbac_permissions` VALUES ('522', 'Command: respawn');
INSERT INTO `rbac_permissions` VALUES ('523', 'Command: revive');
INSERT INTO `rbac_permissions` VALUES ('524', 'Command: saveall');
INSERT INTO `rbac_permissions` VALUES ('525', 'Command: save');
INSERT INTO `rbac_permissions` VALUES ('526', 'Command: setskill');
INSERT INTO `rbac_permissions` VALUES ('527', 'Command: showarea');
INSERT INTO `rbac_permissions` VALUES ('528', 'Command: summon');
INSERT INTO `rbac_permissions` VALUES ('529', 'Command: unaura');
INSERT INTO `rbac_permissions` VALUES ('530', 'Command: unbindsight');
INSERT INTO `rbac_permissions` VALUES ('531', 'Command: unfreeze');
INSERT INTO `rbac_permissions` VALUES ('532', 'Command: unmute');
INSERT INTO `rbac_permissions` VALUES ('533', 'Command: unpossess');
INSERT INTO `rbac_permissions` VALUES ('534', 'Command: unstuck');
INSERT INTO `rbac_permissions` VALUES ('535', 'Command: wchange');
INSERT INTO `rbac_permissions` VALUES ('536', 'Command: mmap');
INSERT INTO `rbac_permissions` VALUES ('537', 'Command: mmap loadedtiles');
INSERT INTO `rbac_permissions` VALUES ('538', 'Command: mmap loc');
INSERT INTO `rbac_permissions` VALUES ('539', 'Command: mmap path');
INSERT INTO `rbac_permissions` VALUES ('540', 'Command: mmap stats');
INSERT INTO `rbac_permissions` VALUES ('541', 'Command: mmap testarea');
INSERT INTO `rbac_permissions` VALUES ('542', 'Command: morph');
INSERT INTO `rbac_permissions` VALUES ('543', 'Command: demorph');
INSERT INTO `rbac_permissions` VALUES ('544', 'Command: modify');
INSERT INTO `rbac_permissions` VALUES ('545', 'Command: modify arenapoints');
INSERT INTO `rbac_permissions` VALUES ('546', 'Command: modify bit');
INSERT INTO `rbac_permissions` VALUES ('547', 'Command: modify drunk');
INSERT INTO `rbac_permissions` VALUES ('548', 'Command: modify energy');
INSERT INTO `rbac_permissions` VALUES ('549', 'Command: modify faction');
INSERT INTO `rbac_permissions` VALUES ('550', 'Command: modify gender');
INSERT INTO `rbac_permissions` VALUES ('551', 'Command: modify honor');
INSERT INTO `rbac_permissions` VALUES ('552', 'Command: modify hp');
INSERT INTO `rbac_permissions` VALUES ('553', 'Command: modify mana');
INSERT INTO `rbac_permissions` VALUES ('554', 'Command: modify money');
INSERT INTO `rbac_permissions` VALUES ('555', 'Command: modify mount');
INSERT INTO `rbac_permissions` VALUES ('556', 'Command: modify phase');
INSERT INTO `rbac_permissions` VALUES ('557', 'Command: modify rage');
INSERT INTO `rbac_permissions` VALUES ('558', 'Command: modify reputation');
INSERT INTO `rbac_permissions` VALUES ('559', 'Command: modify runicpower');
INSERT INTO `rbac_permissions` VALUES ('560', 'Command: modify scale');
INSERT INTO `rbac_permissions` VALUES ('561', 'Command: modify speed');
INSERT INTO `rbac_permissions` VALUES ('562', 'Command: modify speed all');
INSERT INTO `rbac_permissions` VALUES ('563', 'Command: modify speed backwalk');
INSERT INTO `rbac_permissions` VALUES ('564', 'Command: modify speed fly');
INSERT INTO `rbac_permissions` VALUES ('565', 'Command: modify speed walk');
INSERT INTO `rbac_permissions` VALUES ('566', 'Command: modify speed swim');
INSERT INTO `rbac_permissions` VALUES ('567', 'Command: modify spell');
INSERT INTO `rbac_permissions` VALUES ('568', 'Command: modify standstate');
INSERT INTO `rbac_permissions` VALUES ('569', 'Command: modify talentpoints');
INSERT INTO `rbac_permissions` VALUES ('570', 'Command: npc');
INSERT INTO `rbac_permissions` VALUES ('571', 'Command: npc add');
INSERT INTO `rbac_permissions` VALUES ('572', 'Command: npc add formation');
INSERT INTO `rbac_permissions` VALUES ('573', 'Command: npc add item');
INSERT INTO `rbac_permissions` VALUES ('574', 'Command: npc add move');
INSERT INTO `rbac_permissions` VALUES ('575', 'Command: npc add temp');
INSERT INTO `rbac_permissions` VALUES ('576', 'Command: npc add delete');
INSERT INTO `rbac_permissions` VALUES ('577', 'Command: npc add delete item');
INSERT INTO `rbac_permissions` VALUES ('578', 'Command: npc add follow');
INSERT INTO `rbac_permissions` VALUES ('579', 'Command: npc add follow stop');
INSERT INTO `rbac_permissions` VALUES ('580', 'Command: npc set');
INSERT INTO `rbac_permissions` VALUES ('581', 'Command: npc set allowmove');
INSERT INTO `rbac_permissions` VALUES ('582', 'Command: npc set entry');
INSERT INTO `rbac_permissions` VALUES ('583', 'Command: npc set factionid');
INSERT INTO `rbac_permissions` VALUES ('584', 'Command: npc set flag');
INSERT INTO `rbac_permissions` VALUES ('585', 'Command: npc set level');
INSERT INTO `rbac_permissions` VALUES ('586', 'Command: npc set link');
INSERT INTO `rbac_permissions` VALUES ('587', 'Command: npc set model');
INSERT INTO `rbac_permissions` VALUES ('588', 'Command: npc set movetype');
INSERT INTO `rbac_permissions` VALUES ('589', 'Command: npc set phase');
INSERT INTO `rbac_permissions` VALUES ('590', 'Command: npc set spawndist');
INSERT INTO `rbac_permissions` VALUES ('591', 'Command: npc set spawntime');
INSERT INTO `rbac_permissions` VALUES ('592', 'Command: npc set data');
INSERT INTO `rbac_permissions` VALUES ('593', 'Command: npc info');
INSERT INTO `rbac_permissions` VALUES ('594', 'Command: npc near');
INSERT INTO `rbac_permissions` VALUES ('595', 'Command: npc move');
INSERT INTO `rbac_permissions` VALUES ('596', 'Command: npc playemote');
INSERT INTO `rbac_permissions` VALUES ('597', 'Command: npc say');
INSERT INTO `rbac_permissions` VALUES ('598', 'Command: npc textemote');
INSERT INTO `rbac_permissions` VALUES ('599', 'Command: npc whisper');
INSERT INTO `rbac_permissions` VALUES ('600', 'Command: npc yell');
INSERT INTO `rbac_permissions` VALUES ('601', 'Command: npc tame');
INSERT INTO `rbac_permissions` VALUES ('602', 'Command: quest');
INSERT INTO `rbac_permissions` VALUES ('603', 'Command: quest add');
INSERT INTO `rbac_permissions` VALUES ('604', 'Command: quest complete');
INSERT INTO `rbac_permissions` VALUES ('605', 'Command: quest remove');
INSERT INTO `rbac_permissions` VALUES ('606', 'Command: quest reward');
INSERT INTO `rbac_permissions` VALUES ('607', 'Command: reload');
INSERT INTO `rbac_permissions` VALUES ('608', 'Command: reload access_requirement');
INSERT INTO `rbac_permissions` VALUES ('609', 'Command: reload achievement_criteria_data');
INSERT INTO `rbac_permissions` VALUES ('610', 'Command: reload achievement_reward');
INSERT INTO `rbac_permissions` VALUES ('611', 'Command: reload all');
INSERT INTO `rbac_permissions` VALUES ('612', 'Command: reload all achievement');
INSERT INTO `rbac_permissions` VALUES ('613', 'Command: reload all area');
INSERT INTO `rbac_permissions` VALUES ('614', 'Command: broadcast_text');
INSERT INTO `rbac_permissions` VALUES ('615', 'Command: reload all gossips');
INSERT INTO `rbac_permissions` VALUES ('616', 'Command: reload all item');
INSERT INTO `rbac_permissions` VALUES ('617', 'Command: reload all locales');
INSERT INTO `rbac_permissions` VALUES ('618', 'Command: reload all loot');
INSERT INTO `rbac_permissions` VALUES ('619', 'Command: reload all npc');
INSERT INTO `rbac_permissions` VALUES ('620', 'Command: reload all quest');
INSERT INTO `rbac_permissions` VALUES ('621', 'Command: reload all scripts');
INSERT INTO `rbac_permissions` VALUES ('622', 'Command: reload all spell');
INSERT INTO `rbac_permissions` VALUES ('623', 'Command: reload areatrigger_involvedrelation');
INSERT INTO `rbac_permissions` VALUES ('624', 'Command: reload areatrigger_tavern');
INSERT INTO `rbac_permissions` VALUES ('625', 'Command: reload areatrigger_teleport');
INSERT INTO `rbac_permissions` VALUES ('626', 'Command: reload auctions');
INSERT INTO `rbac_permissions` VALUES ('627', 'Command: reload autobroadcast');
INSERT INTO `rbac_permissions` VALUES ('628', 'Command: reload command');
INSERT INTO `rbac_permissions` VALUES ('629', 'Command: reload conditions');
INSERT INTO `rbac_permissions` VALUES ('630', 'Command: reload config');
INSERT INTO `rbac_permissions` VALUES ('631', 'Command: reload battleground_template');
INSERT INTO `rbac_permissions` VALUES ('632', 'Command: .mutehistory');
INSERT INTO `rbac_permissions` VALUES ('633', 'Command: reload creature_linked_respawn');
INSERT INTO `rbac_permissions` VALUES ('634', 'Command: reload creature_loot_template');
INSERT INTO `rbac_permissions` VALUES ('635', 'Command: reload creature_onkill_reputation');
INSERT INTO `rbac_permissions` VALUES ('636', 'Command: reload creature_questender');
INSERT INTO `rbac_permissions` VALUES ('637', 'Command: reload creature_queststarter');
INSERT INTO `rbac_permissions` VALUES ('638', 'Command: reload creature_summon_groups');
INSERT INTO `rbac_permissions` VALUES ('639', 'Command: reload creature_template');
INSERT INTO `rbac_permissions` VALUES ('640', 'Command: reload creature_text');
INSERT INTO `rbac_permissions` VALUES ('641', 'Command: reload disables');
INSERT INTO `rbac_permissions` VALUES ('642', 'Command: reload disenchant_loot_template');
INSERT INTO `rbac_permissions` VALUES ('643', 'Command: reload event_scripts');
INSERT INTO `rbac_permissions` VALUES ('644', 'Command: reload fishing_loot_template');
INSERT INTO `rbac_permissions` VALUES ('645', 'Command: reload game_graveyard_zone');
INSERT INTO `rbac_permissions` VALUES ('646', 'Command: reload game_tele');
INSERT INTO `rbac_permissions` VALUES ('647', 'Command: reload gameobject_questender');
INSERT INTO `rbac_permissions` VALUES ('648', 'Command: reload gameobject_loot_template');
INSERT INTO `rbac_permissions` VALUES ('649', 'Command: reload gameobject_queststarter');
INSERT INTO `rbac_permissions` VALUES ('650', 'Command: reload gm_tickets');
INSERT INTO `rbac_permissions` VALUES ('651', 'Command: reload gossip_menu');
INSERT INTO `rbac_permissions` VALUES ('652', 'Command: reload gossip_menu_option');
INSERT INTO `rbac_permissions` VALUES ('653', 'Command: reload item_enchantment_template');
INSERT INTO `rbac_permissions` VALUES ('654', 'Command: reload item_loot_template');
INSERT INTO `rbac_permissions` VALUES ('655', 'Command: reload item_set_names');
INSERT INTO `rbac_permissions` VALUES ('656', 'Command: reload lfg_dungeon_rewards');
INSERT INTO `rbac_permissions` VALUES ('657', 'Command: reload locales_achievement_reward');
INSERT INTO `rbac_permissions` VALUES ('658', 'Command: reload locales_creature');
INSERT INTO `rbac_permissions` VALUES ('659', 'Command: reload locales_creature_text');
INSERT INTO `rbac_permissions` VALUES ('660', 'Command: reload locales_gameobject');
INSERT INTO `rbac_permissions` VALUES ('661', 'Command: reload locales_gossip_menu_option');
INSERT INTO `rbac_permissions` VALUES ('662', 'Command: reload locales_item');
INSERT INTO `rbac_permissions` VALUES ('663', 'Command: reload locales_item_set_name');
INSERT INTO `rbac_permissions` VALUES ('664', 'Command: reload locales_npc_text');
INSERT INTO `rbac_permissions` VALUES ('665', 'Command: reload locales_page_text');
INSERT INTO `rbac_permissions` VALUES ('666', 'Command: reload locales_points_of_interest');
INSERT INTO `rbac_permissions` VALUES ('667', 'Command: reload locales_quest');
INSERT INTO `rbac_permissions` VALUES ('668', 'Command: reload mail_level_reward');
INSERT INTO `rbac_permissions` VALUES ('669', 'Command: reload mail_loot_template');
INSERT INTO `rbac_permissions` VALUES ('670', 'Command: reload milling_loot_template');
INSERT INTO `rbac_permissions` VALUES ('671', 'Command: reload npc_spellclick_spells');
INSERT INTO `rbac_permissions` VALUES ('672', 'Command: reload npc_trainer');
INSERT INTO `rbac_permissions` VALUES ('673', 'Command: reload npc_vendor');
INSERT INTO `rbac_permissions` VALUES ('674', 'Command: reload page_text');
INSERT INTO `rbac_permissions` VALUES ('675', 'Command: reload pickpocketing_loot_template');
INSERT INTO `rbac_permissions` VALUES ('676', 'Command: reload points_of_interest');
INSERT INTO `rbac_permissions` VALUES ('677', 'Command: reload prospecting_loot_template');
INSERT INTO `rbac_permissions` VALUES ('678', 'Command: reload quest_poi');
INSERT INTO `rbac_permissions` VALUES ('679', 'Command: reload quest_template');
INSERT INTO `rbac_permissions` VALUES ('680', 'Command: reload rbac');
INSERT INTO `rbac_permissions` VALUES ('681', 'Command: reload reference_loot_template');
INSERT INTO `rbac_permissions` VALUES ('682', 'Command: reload reserved_name');
INSERT INTO `rbac_permissions` VALUES ('683', 'Command: reload reputation_reward_rate');
INSERT INTO `rbac_permissions` VALUES ('684', 'Command: reload reputation_spillover_template');
INSERT INTO `rbac_permissions` VALUES ('685', 'Command: reload skill_discovery_template');
INSERT INTO `rbac_permissions` VALUES ('686', 'Command: reload skill_extra_item_template');
INSERT INTO `rbac_permissions` VALUES ('687', 'Command: reload skill_fishing_base_level');
INSERT INTO `rbac_permissions` VALUES ('688', 'Command: reload skinning_loot_template');
INSERT INTO `rbac_permissions` VALUES ('689', 'Command: reload smart_scripts');
INSERT INTO `rbac_permissions` VALUES ('690', 'Command: reload spell_required');
INSERT INTO `rbac_permissions` VALUES ('691', 'Command: reload spell_area');
INSERT INTO `rbac_permissions` VALUES ('692', 'Command: reload spell_bonus_data');
INSERT INTO `rbac_permissions` VALUES ('693', 'Command: reload spell_group');
INSERT INTO `rbac_permissions` VALUES ('694', 'Command: reload spell_learn_spell');
INSERT INTO `rbac_permissions` VALUES ('695', 'Command: reload spell_loot_template');
INSERT INTO `rbac_permissions` VALUES ('696', 'Command: reload spell_linked_spell');
INSERT INTO `rbac_permissions` VALUES ('697', 'Command: reload spell_pet_auras');
INSERT INTO `rbac_permissions` VALUES ('698', 'Command: character changeaccount');
INSERT INTO `rbac_permissions` VALUES ('699', 'Command: reload spell_proc');
INSERT INTO `rbac_permissions` VALUES ('700', 'Command: reload spell_scripts');
INSERT INTO `rbac_permissions` VALUES ('701', 'Command: reload spell_target_position');
INSERT INTO `rbac_permissions` VALUES ('702', 'Command: reload spell_threats');
INSERT INTO `rbac_permissions` VALUES ('703', 'Command: reload spell_group_stack_rules');
INSERT INTO `rbac_permissions` VALUES ('704', 'Command: reload trinity_string');
INSERT INTO `rbac_permissions` VALUES ('705', 'Command: reload warden_action');
INSERT INTO `rbac_permissions` VALUES ('706', 'Command: reload waypoint_scripts');
INSERT INTO `rbac_permissions` VALUES ('707', 'Command: reload waypoint_data');
INSERT INTO `rbac_permissions` VALUES ('708', 'Command: reload vehicle_accessory');
INSERT INTO `rbac_permissions` VALUES ('709', 'Command: reload vehicle_template_accessory');
INSERT INTO `rbac_permissions` VALUES ('710', 'Command: reset');
INSERT INTO `rbac_permissions` VALUES ('711', 'Command: reset achievements');
INSERT INTO `rbac_permissions` VALUES ('712', 'Command: reset honor');
INSERT INTO `rbac_permissions` VALUES ('713', 'Command: reset level');
INSERT INTO `rbac_permissions` VALUES ('714', 'Command: reset spells');
INSERT INTO `rbac_permissions` VALUES ('715', 'Command: reset stats');
INSERT INTO `rbac_permissions` VALUES ('716', 'Command: reset talents');
INSERT INTO `rbac_permissions` VALUES ('717', 'Command: reset all');
INSERT INTO `rbac_permissions` VALUES ('718', 'Command: server');
INSERT INTO `rbac_permissions` VALUES ('719', 'Command: server corpses');
INSERT INTO `rbac_permissions` VALUES ('720', 'Command: server exit');
INSERT INTO `rbac_permissions` VALUES ('721', 'Command: server idlerestart');
INSERT INTO `rbac_permissions` VALUES ('722', 'Command: server idlerestart cancel');
INSERT INTO `rbac_permissions` VALUES ('723', 'Command: server idleshutdown');
INSERT INTO `rbac_permissions` VALUES ('724', 'Command: server idleshutdown cancel');
INSERT INTO `rbac_permissions` VALUES ('725', 'Command: server info');
INSERT INTO `rbac_permissions` VALUES ('726', 'Command: server plimit');
INSERT INTO `rbac_permissions` VALUES ('727', 'Command: server restart');
INSERT INTO `rbac_permissions` VALUES ('728', 'Command: server restart cancel');
INSERT INTO `rbac_permissions` VALUES ('729', 'Command: server set');
INSERT INTO `rbac_permissions` VALUES ('730', 'Command: server set closed');
INSERT INTO `rbac_permissions` VALUES ('731', 'Command: server set difftime');
INSERT INTO `rbac_permissions` VALUES ('732', 'Command: server set loglevel');
INSERT INTO `rbac_permissions` VALUES ('733', 'Command: server set motd');
INSERT INTO `rbac_permissions` VALUES ('734', 'Command: server shutdown');
INSERT INTO `rbac_permissions` VALUES ('735', 'Command: server shutdown cancel');
INSERT INTO `rbac_permissions` VALUES ('736', 'Command: server motd');
INSERT INTO `rbac_permissions` VALUES ('737', 'Command: tele');
INSERT INTO `rbac_permissions` VALUES ('738', 'Command: tele add');
INSERT INTO `rbac_permissions` VALUES ('739', 'Command: tele del');
INSERT INTO `rbac_permissions` VALUES ('740', 'Command: tele name');
INSERT INTO `rbac_permissions` VALUES ('741', 'Command: tele group');
INSERT INTO `rbac_permissions` VALUES ('742', 'Command: ticket');
INSERT INTO `rbac_permissions` VALUES ('743', 'Command: ticket assign');
INSERT INTO `rbac_permissions` VALUES ('744', 'Command: ticket close');
INSERT INTO `rbac_permissions` VALUES ('745', 'Command: ticket closedlist');
INSERT INTO `rbac_permissions` VALUES ('746', 'Command: ticket comment');
INSERT INTO `rbac_permissions` VALUES ('747', 'Command: ticket complete');
INSERT INTO `rbac_permissions` VALUES ('748', 'Command: ticket delete');
INSERT INTO `rbac_permissions` VALUES ('749', 'Command: ticket escalate');
INSERT INTO `rbac_permissions` VALUES ('750', 'Command: ticket escalatedlist');
INSERT INTO `rbac_permissions` VALUES ('751', 'Command: ticket list');
INSERT INTO `rbac_permissions` VALUES ('752', 'Command: ticket onlinelist');
INSERT INTO `rbac_permissions` VALUES ('753', 'Command: ticket reset');
INSERT INTO `rbac_permissions` VALUES ('754', 'Command: ticket response');
INSERT INTO `rbac_permissions` VALUES ('755', 'Command: ticket response append');
INSERT INTO `rbac_permissions` VALUES ('756', 'Command: ticket response appendln');
INSERT INTO `rbac_permissions` VALUES ('757', 'Command: ticket togglesystem');
INSERT INTO `rbac_permissions` VALUES ('758', 'Command: ticket unassign');
INSERT INTO `rbac_permissions` VALUES ('759', 'Command: ticket viewid');
INSERT INTO `rbac_permissions` VALUES ('760', 'Command: ticket viewname');
INSERT INTO `rbac_permissions` VALUES ('761', 'Command: titles');
INSERT INTO `rbac_permissions` VALUES ('762', 'Command: titles add');
INSERT INTO `rbac_permissions` VALUES ('763', 'Command: titles current');
INSERT INTO `rbac_permissions` VALUES ('764', 'Command: titles remove');
INSERT INTO `rbac_permissions` VALUES ('765', 'Command: titles set');
INSERT INTO `rbac_permissions` VALUES ('766', 'Command: titles set mask');
INSERT INTO `rbac_permissions` VALUES ('767', 'Command: wp');
INSERT INTO `rbac_permissions` VALUES ('768', 'Command: wp add');
INSERT INTO `rbac_permissions` VALUES ('769', 'Command: wp event');
INSERT INTO `rbac_permissions` VALUES ('770', 'Command: wp load');
INSERT INTO `rbac_permissions` VALUES ('771', 'Command: wp modify');
INSERT INTO `rbac_permissions` VALUES ('772', 'Command: wp unload');
INSERT INTO `rbac_permissions` VALUES ('773', 'Command: wp reload');
INSERT INTO `rbac_permissions` VALUES ('774', 'Command: wp show');
INSERT INTO `rbac_permissions` VALUES ('777', 'Command: mailbox');
INSERT INTO `rbac_permissions` VALUES ('778', 'Command: ahbot');
INSERT INTO `rbac_permissions` VALUES ('779', 'Command: ahbot items');
INSERT INTO `rbac_permissions` VALUES ('780', 'Command: ahbot items gray');
INSERT INTO `rbac_permissions` VALUES ('781', 'Command: ahbot items white');
INSERT INTO `rbac_permissions` VALUES ('782', 'Command: ahbot items green');
INSERT INTO `rbac_permissions` VALUES ('783', 'Command: ahbot items blue');
INSERT INTO `rbac_permissions` VALUES ('784', 'Command: ahbot items purple');
INSERT INTO `rbac_permissions` VALUES ('785', 'Command: ahbot items orange');
INSERT INTO `rbac_permissions` VALUES ('786', 'Command: ahbot items yellow');
INSERT INTO `rbac_permissions` VALUES ('787', 'Command: ahbot ratio');
INSERT INTO `rbac_permissions` VALUES ('788', 'Command: ahbot ratio alliance');
INSERT INTO `rbac_permissions` VALUES ('789', 'Command: ahbot ratio horde');
INSERT INTO `rbac_permissions` VALUES ('790', 'Command: ahbot ratio neutral');
INSERT INTO `rbac_permissions` VALUES ('791', 'Command: ahbot rebuild');
INSERT INTO `rbac_permissions` VALUES ('792', 'Command: ahbot reload');
INSERT INTO `rbac_permissions` VALUES ('793', 'Command: ahbot status');
INSERT INTO `rbac_permissions` VALUES ('794', 'Command: .guild info');
INSERT INTO `rbac_permissions` VALUES ('795', 'Command: .instance setbossstate');
INSERT INTO `rbac_permissions` VALUES ('796', 'Command: instance getbossstate');
INSERT INTO `rbac_permissions` VALUES ('797', 'Command: pvpstats');
INSERT INTO `rbac_permissions` VALUES ('798', 'Command: .mod xp');
INSERT INTO `rbac_permissions` VALUES ('835', 'Command: debug loadcells');
INSERT INTO `rbac_permissions` VALUES ('836', 'Command: .debug boundary');
INSERT INTO `rbac_permissions` VALUES ('837', 'Command: .npc evade');
INSERT INTO `rbac_permissions` VALUES ('838', 'Command: .pet level');
INSERT INTO `rbac_permissions` VALUES ('839', 'Command: .server shutdown force');
INSERT INTO `rbac_permissions` VALUES ('840', 'Command: .server restart force');
INSERT INTO `rbac_permissions` VALUES ('841', 'Command: .debug neargraveyard');
INSERT INTO `rbac_permissions` VALUES ('843', 'Command: reload quest_greeting');
INSERT INTO `rbac_permissions` VALUES ('852', 'Command: debug dummy');
INSERT INTO `rbac_permissions` VALUES ('855', 'Command: debug play music');
INSERT INTO `rbac_permissions` VALUES ('856', 'Command: npc spawngroup');
INSERT INTO `rbac_permissions` VALUES ('857', 'Command: npc despawngroup');
INSERT INTO `rbac_permissions` VALUES ('858', 'Command: gobject spawngroup');
INSERT INTO `rbac_permissions` VALUES ('859', 'Command: gobject despawngroup');
INSERT INTO `rbac_permissions` VALUES ('860', 'Command: list respawns');
INSERT INTO `rbac_permissions` VALUES ('861', 'Command: group set');
INSERT INTO `rbac_permissions` VALUES ('862', 'Command: group set assistant');
INSERT INTO `rbac_permissions` VALUES ('863', 'Command: group set maintank');
INSERT INTO `rbac_permissions` VALUES ('864', 'Command: group set mainassist');
INSERT INTO `rbac_permissions` VALUES ('865', 'Command: npc showloot');
INSERT INTO `rbac_permissions` VALUES ('866', 'Command: list spawnpoints');
INSERT INTO `rbac_permissions` VALUES ('867', 'Command: reload quest_greeting_locale');
INSERT INTO `rbac_permissions` VALUES ('870', 'Command: debug threatinfo');
INSERT INTO `rbac_permissions` VALUES ('871', 'Command: debug instancespawn');
INSERT INTO `rbac_permissions` VALUES ('872', 'Command: server debug');
INSERT INTO `rbac_permissions` VALUES ('873', 'Command: reload creature_movement_override');

-- ----------------------------
-- Table structure for `realmcharacters`
-- ----------------------------
DROP TABLE IF EXISTS `realmcharacters`;
CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

-- ----------------------------
-- Records of realmcharacters
-- ----------------------------
INSERT INTO `realmcharacters` VALUES ('1', '2', '0');

-- ----------------------------
-- Table structure for `realmlist`
-- ----------------------------
DROP TABLE IF EXISTS `realmlist`;
CREATE TABLE `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '12340',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';

-- ----------------------------
-- Records of realmlist
-- ----------------------------
INSERT INTO `realmlist` VALUES ('1', 'WotLKCore', '127.0.0.1', '127.0.0.1', '255.255.255.0', '8085', '0', '0', '1', '0', '0', '12340');

-- ----------------------------
-- Table structure for `updates`
-- ----------------------------
DROP TABLE IF EXISTS `updates`;
CREATE TABLE `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of all applied updates in this database.';

-- ----------------------------
-- Records of updates
-- ----------------------------
INSERT INTO `updates` VALUES ('2014_11_10_00_auth.sql', '0E3CB119442D09DD88E967015319BBC8DAFBBFE0', 'ARCHIVED', '2015-03-21 16:44:12', '0');
INSERT INTO `updates` VALUES ('2014_11_10_01_auth.sql', '327E77A1DA3546D5275AB249915DD57EDD6FDD3D', 'ARCHIVED', '2015-03-21 16:44:12', '0');
INSERT INTO `updates` VALUES ('2014_12_10_00_auth.sql', '821703A96D80F9080074852B5A46E2909C9562EA', 'ARCHIVED', '2015-03-21 16:44:12', '0');
INSERT INTO `updates` VALUES ('2014_12_21_00_auth.sql', 'CE2E5D2CD82E79C25294539ADED27A1429105B43', 'ARCHIVED', '2015-03-21 16:44:12', '0');
INSERT INTO `updates` VALUES ('2015_03_20_00_auth.sql', 'E8C5B74BB45F0F35DEC182C72BACF435C7066FB0', 'ARCHIVED', '2015-03-21 16:44:12', '0');
INSERT INTO `updates` VALUES ('2015_03_20_01_auth.sql', '862961815354DA2746F5F71FBC8155F57CBE75AB', 'ARCHIVED', '2015-03-21 16:44:12', '0');
INSERT INTO `updates` VALUES ('2015_03_20_02_auth.sql', '33E4F94086590768EF5D4855DD43D7DE7C06ADA4', 'ARCHIVED', '2015-03-21 16:44:51', '0');
INSERT INTO `updates` VALUES ('2015_08_21_00_auth.sql', 'C31A9E1D28E11B60BE8F8198637DD51F6D75123F', 'ARCHIVED', '2015-10-05 18:16:19', '0');
INSERT INTO `updates` VALUES ('2015_11_07_00_auth.sql', '0ACDD35EC9745231BCFA701B78056DEF94D0CC53', 'ARCHIVED', '2016-02-20 05:02:40', '515');
INSERT INTO `updates` VALUES ('2016_01_13_00_auth.sql', '24615CC69B3CD7BB4699874647C35BA86E8A93FD', 'ARCHIVED', '2016-01-12 18:00:00', '0');
INSERT INTO `updates` VALUES ('2016_04_11_00_auth.sql', '0ACDD35EC9745231BCFA701B78056DEF94D0CC53', 'ARCHIVED', '2018-05-26 14:02:21', '44');
INSERT INTO `updates` VALUES ('2016_05_11_00_auth.sql', '95B66235B8D67BF1CA216EB09F313C1F8F393B47', 'ARCHIVED', '2018-05-26 14:02:21', '191');
INSERT INTO `updates` VALUES ('2016_06_06_00_auth.sql', 'A0A8D73A952D0618833416513D53F73A70E7EA25', 'ARCHIVED', '2018-05-26 14:02:22', '116');
INSERT INTO `updates` VALUES ('2016_09_22_00_auth.sql', '70047954E3556BFA430ADD5680EF8797F74A4B9E', 'ARCHIVED', '2018-05-26 14:02:22', '88');
INSERT INTO `updates` VALUES ('2016_10_16_00_auth.sql', '0ACDD35EC9745231BCFA701B78056DEF94D0CC53', 'ARCHIVED', '2018-05-26 14:02:22', '52');
INSERT INTO `updates` VALUES ('2017_01_06_00_auth.sql', '6CCFE6A9774EC733C9863D36A0F15F3534189BBD', 'ARCHIVED', '2018-05-26 14:02:22', '137');
INSERT INTO `updates` VALUES ('2017_01_08_00_auth.sql', 'A68511D0BF94C41F720A11B630CCB36BBEA6B17D', 'ARCHIVED', '2018-05-26 14:02:22', '194');
INSERT INTO `updates` VALUES ('2017_02_06_00_auth_335.sql', '612068198F744892ECC0ACFE3BDCB6D72995916E', 'ARCHIVED', '2018-05-26 14:02:22', '154');
INSERT INTO `updates` VALUES ('2017_03_17_00_auth.sql', '4902E9B1B063F399F928C2DD7AFD60427738E227', 'ARCHIVED', '2018-05-26 14:02:22', '82');
INSERT INTO `updates` VALUES ('2017_04_19_00_auth.sql', 'EAE1C1D3AA752259785C056A8F18515E1EF32BC9', 'ARCHIVED', '2018-05-26 14:02:22', '47');
INSERT INTO `updates` VALUES ('2017_05_29_00_auth.sql', '74BBB703AABD8A6BCB905EA2F5C14A5E26124CDD', 'ARCHIVED', '2018-05-26 14:02:22', '122');
INSERT INTO `updates` VALUES ('2017_06_12_00_auth.sql', '176532AED785F1F759382C79A28E0FED92E99779', 'ARCHIVED', '2018-05-26 14:02:23', '163');
INSERT INTO `updates` VALUES ('2017_06_12_01_auth.sql', '661B4935E101AF188BEBF43203144104E89F8C54', 'ARCHIVED', '2018-05-26 14:02:23', '129');
INSERT INTO `updates` VALUES ('2017_06_12_02_auth.sql', '166F059E411FAA4901BBBA09A41EF07B1CADC4B6', 'ARCHIVED', '2018-05-26 14:02:23', '123');
INSERT INTO `updates` VALUES ('2017_06_17_00_auth.sql', '4A172895CB9DA8EFE1270434D6ECB22D4F4DCB17', 'ARCHIVED', '2018-05-26 14:02:23', '80');
INSERT INTO `updates` VALUES ('2017_06_28_00_auth.sql', 'D32EF80F57F629C23395D80F06E91D7E40719F83', 'ARCHIVED', '2018-05-26 14:02:23', '80');
INSERT INTO `updates` VALUES ('2017_08_01_00_auth.sql', '6ECE808AF52345177189E962C0606B769B6806A6', 'ARCHIVED', '2018-05-26 14:02:23', '116');
INSERT INTO `updates` VALUES ('2017_10_13_00_auth.sql', '87674E0D166AC60E3725B445714427892E42C6FE', 'ARCHIVED', '2018-05-26 14:02:23', '124');
INSERT INTO `updates` VALUES ('2017_10_29_00_auth.sql', 'F742569F56BB29CE9C8DBBD40A6AB474F846485C', 'ARCHIVED', '2018-05-26 14:02:23', '230');
INSERT INTO `updates` VALUES ('2017_12_17_00_auth.sql', '2CD99730D4D32DBF0584CD5B1AA6F8F4AE3DA975', 'ARCHIVED', '2018-05-26 14:02:24', '113');
INSERT INTO `updates` VALUES ('2018_01_03_00_auth_2018_01_02_00_auth.sql', '08AF5DAB45515B681B738DA17FA414C7C7CCA44E', 'ARCHIVED', '2018-05-26 14:02:24', '304');
INSERT INTO `updates` VALUES ('2018_01_09_00_auth.sql', 'A5D4EC8FCFAB4F2DCE70EDCAD1ACBFB484FD68D5', 'ARCHIVED', '2018-05-26 14:02:24', '113');
INSERT INTO `updates` VALUES ('2018_01_24_00_auth.sql', '167B17D8A253D62A8112F8A7EB21C6E99CAEF1E4', 'ARCHIVED', '2018-05-26 14:02:24', '113');
INSERT INTO `updates` VALUES ('2018_02_19_00_auth.sql', '80E50F9C7F1EE7BA62789EA4C4F009170B79E6C9', 'RELEASED', '2018-05-26 14:02:24', '46');
INSERT INTO `updates` VALUES ('2018_03_06_00_auth.sql', '2D71E93DF7419A30D0D21D8A80CF05698302575A', 'RELEASED', '2018-05-26 14:02:24', '116');
INSERT INTO `updates` VALUES ('2018_03_08_00_auth.sql', '624C58A07E0B4DDC4C1347E8BA8EFEEFD5B43DA7', 'RELEASED', '2018-05-26 14:02:24', '121');
INSERT INTO `updates` VALUES ('2018_06_23_00_auth.sql', 'BE35312C386A127D047E5A7CE0D14DB41D905F8E', 'RELEASED', '2018-12-28 19:32:15', '257');
INSERT INTO `updates` VALUES ('2018_08_30_00_auth.sql', '22F69864361D3E72F800379338310172C0576D1C', 'RELEASED', '2018-12-28 19:32:16', '229');
INSERT INTO `updates` VALUES ('2018_09_06_00_auth.sql', '309D21E0DF82ED8921F77EAFDE741F38AC32BB13', 'RELEASED', '2018-12-28 19:32:16', '130');
INSERT INTO `updates` VALUES ('2018_09_17_00_auth.sql', '4DB671F0A4FA1A93AF28FB6426AF13DE72C7DA3D', 'RELEASED', '2018-12-28 19:32:16', '131');

-- ----------------------------
-- Table structure for `updates_include`
-- ----------------------------
DROP TABLE IF EXISTS `updates_include`;
CREATE TABLE `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of directories where we want to include sql updates.';

-- ----------------------------
-- Records of updates_include
-- ----------------------------
INSERT INTO `updates_include` VALUES ('$/sql/updates/auth', 'RELEASED');
INSERT INTO `updates_include` VALUES ('$/sql/custom/auth', 'RELEASED');
INSERT INTO `updates_include` VALUES ('$/sql/old/3.3.5a/auth', 'ARCHIVED');

-- ----------------------------
-- Table structure for `uptime`
-- ----------------------------
DROP TABLE IF EXISTS `uptime`;
CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

-- ----------------------------
-- Records of uptime
-- ----------------------------
INSERT INTO `uptime` VALUES ('1', '1455966214', '0', '0', 'TrinityCore rev. d4184065b6d5 2016-02-20 03:20:43 +0100 (3.3.5 branch) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1456051317', '0', '0', 'TrinityCore rev. d4184065b6d5 2016-02-20 03:20:43 +0100 (3.3.5 branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1461764993', '0', '0', 'TrinityCore rev. 02d7df6aa435 2016-04-20 19:44:57 +0200 (3.3.5 branch) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1495606237', '0', '0', 'TrinityCore rev. 02d7df6aa435 2016-04-20 19:44:57 +0200 (3.3.5 branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1495606670', '0', '0', 'TrinityCore rev. 02d7df6aa435 2016-04-20 19:44:57 +0200 (3.3.5 branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1495606774', '3269403', '1', 'TrinityCore rev. 02d7df6aa435 2016-04-20 19:44:57 +0200 (3.3.5 branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1498876473', '0', '0', 'TrinityCore rev. 02d7df6aa435 2016-04-20 19:44:57 +0200 (3.3.5 branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1498876636', '2949000', '1', 'TrinityCore rev. 02d7df6aa435 2016-04-20 19:44:57 +0200 (3.3.5 branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1501830429', '6024004', '1', 'TrinityCore rev. 02d7df6aa435 2016-04-20 19:44:57 +0200 (3.3.5 branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1509854443', '0', '0', 'TrinityCore rev. 02d7df6aa435 2016-04-20 19:44:57 +0200 (3.3.5 branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1510025702', '82203', '1', 'TrinityCore rev. 02d7df6aa435 2016-04-20 19:44:57 +0200 (3.3.5 branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1511512765', '1201', '1', 'TrinityCore rev. 02d7df6aa435 2016-04-20 19:44:57 +0200 (3.3.5 branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1527324706', '0', '0', 'TrinityCore rev. e67fce624645 2018-05-25 16:53:07 +0200 (3.3.5 branch) (Win32, Release, Static)');
INSERT INTO `uptime` VALUES ('1', '1527377173', '3065', '0', 'TrinityCore rev. e67fce624645 2018-05-25 16:53:07 +0200 (3.3.5 branch) (Win32, Release, Static)');
INSERT INTO `uptime` VALUES ('1', '1545985943', '0', '0', 'TrinityCore rev. 3dbe80ee2e0d 2018-12-26 19:45:30 +0100 (3.3.5 branch) (Win32, Release, Static)');
INSERT INTO `uptime` VALUES ('1', '1545987013', '0', '0', 'TrinityCore rev. 3dbe80ee2e0d 2018-12-26 19:45:30 +0100 (3.3.5 branch) (Win32, Release, Static)');
INSERT INTO `uptime` VALUES ('1', '1545987079', '0', '0', 'TrinityCore rev. 3dbe80ee2e0d 2018-12-26 19:45:30 +0100 (3.3.5 branch) (Win32, Release, Static)');
INSERT INTO `uptime` VALUES ('1', '1545987231', '0', '0', 'TrinityCore rev. 3dbe80ee2e0d 2018-12-26 19:45:30 +0100 (3.3.5 branch) (Win32, Release, Static)');
