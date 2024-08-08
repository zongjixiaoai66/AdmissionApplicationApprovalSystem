/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t282`;
CREATE DATABASE IF NOT EXISTS `t282` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t282`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='字典表';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'ruxiaoshenbao_yesno_types', '处理状态', 1, '处理中', NULL, NULL, '2022-03-21 08:14:13'),
	(2, 'ruxiaoshenbao_yesno_types', '处理状态', 2, '通过', NULL, NULL, '2022-03-21 08:14:13'),
	(3, 'ruxiaoshenbao_yesno_types', '处理状态', 3, '拒绝', NULL, NULL, '2022-03-21 08:14:13'),
	(4, 'zhuanye_types', '人员身份', 1, '校内', NULL, NULL, '2022-03-21 08:14:13'),
	(5, 'zhuanye_types', '人员身份', 2, '校外', NULL, NULL, '2022-03-21 08:14:13'),
	(6, 'ruxiaojiancha_status_types', '是否去过风险地区', 1, '是', NULL, NULL, '2022-03-21 08:14:13'),
	(7, 'ruxiaojiancha_status_types', '是否去过风险地区', 2, '否', NULL, NULL, '2022-03-21 08:14:13'),
	(8, 'news_types', '公告类型', 1, '公告类型1', NULL, NULL, '2022-03-21 08:14:13'),
	(9, 'news_types', '公告类型', 2, '公告类型2', NULL, NULL, '2022-03-21 08:14:13'),
	(10, 'news_types', '公告类型', 3, '公告类型3', NULL, NULL, '2022-03-21 08:14:13'),
	(11, 'sex_types', '性别', 1, '男', NULL, NULL, '2022-03-21 08:14:13'),
	(12, 'sex_types', '性别', 2, '女', NULL, NULL, '2022-03-21 08:14:13');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='公告信息';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `news_name`, `news_types`, `news_photo`, `insert_time`, `news_content`, `create_time`) VALUES
	(1, '公告标题1', 1, 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/news1.jpg', '2022-03-21 08:59:36', '公告详情1', '2022-03-21 08:59:36'),
	(2, '公告标题2', 3, 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/news2.jpg', '2022-03-21 08:59:36', '公告详情2', '2022-03-21 08:59:36'),
	(3, '公告标题3', 1, 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/news3.jpg', '2022-03-21 08:59:36', '公告详情3', '2022-03-21 08:59:36'),
	(4, '公告标题4', 1, 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/news4.jpg', '2022-03-21 08:59:36', '公告详情4', '2022-03-21 08:59:36'),
	(5, '公告标题5', 2, 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/news5.jpg', '2022-03-21 08:59:36', '公告详情5', '2022-03-21 08:59:36');

DROP TABLE IF EXISTS `ruxiaojiancha`;
CREATE TABLE IF NOT EXISTS `ruxiaojiancha` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ruxiaoshenbao_id` int DEFAULT NULL COMMENT '入校申报',
  `tiwen` decimal(10,2) DEFAULT NULL COMMENT '体温',
  `ruxiaojiancha_photo` varchar(200) DEFAULT NULL COMMENT '健康码',
  `xingcheng_photo` varchar(200) DEFAULT NULL COMMENT '行程码',
  `ruxiaojiancha_status_types` int DEFAULT NULL COMMENT '是否去过风险地区',
  `ruxiaojiancha_content` text COMMENT '检查详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='入校检查';

DELETE FROM `ruxiaojiancha`;
INSERT INTO `ruxiaojiancha` (`id`, `ruxiaoshenbao_id`, `tiwen`, `ruxiaojiancha_photo`, `xingcheng_photo`, `ruxiaojiancha_status_types`, `ruxiaojiancha_content`, `create_time`) VALUES
	(1, 1, 602.34, 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/1647853704491.webp', 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/1647853699461.jpeg', 1, '<p>检查详情1</p>', '2022-03-21 08:59:36'),
	(2, 2, 595.67, 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/1647853686204.webp', 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/1647853690074.jpeg', 2, '<p>检查详情2</p>', '2022-03-21 08:59:36'),
	(3, 3, 840.40, 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/1647853672227.webp', 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/1647853676288.jpeg', 1, '<p>检查详情3</p>', '2022-03-21 08:59:36'),
	(4, 4, 226.41, 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/1647853659921.webp', 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/1647853664154.jpeg', 2, '<p>检查详情4</p>', '2022-03-21 08:59:36'),
	(6, 5, 111.00, 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/1647853938281.webp', 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/1647853940785.jpeg', 2, '<p><span style="color: rgb(96, 98, 102);">检查详情123</span></p>', '2022-03-21 09:12:28');

DROP TABLE IF EXISTS `ruxiaoshenbao`;
CREATE TABLE IF NOT EXISTS `ruxiaoshenbao` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ruxiaoshenbao_uuid_number` varchar(200) DEFAULT NULL COMMENT '编号 Search111',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `zhuanye_types` int DEFAULT NULL COMMENT '人员身份 Search111',
  `ruxiaoshenbao_time` timestamp NULL DEFAULT NULL COMMENT '入校时间',
  `cuxiao_time` timestamp NULL DEFAULT NULL COMMENT '出校时间',
  `ruxiaoshenbao_yesno_types` int DEFAULT NULL COMMENT '处理状态 Search111',
  `ruxiaoshenbao_yesno_text` text COMMENT '申请结果',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='入校申报';

DELETE FROM `ruxiaoshenbao`;
INSERT INTO `ruxiaoshenbao` (`id`, `ruxiaoshenbao_uuid_number`, `yonghu_id`, `zhuanye_types`, `ruxiaoshenbao_time`, `cuxiao_time`, `ruxiaoshenbao_yesno_types`, `ruxiaoshenbao_yesno_text`, `create_time`) VALUES
	(1, '16478531761202', 1, 1, '2022-03-21 08:59:36', '2022-03-21 08:59:36', 1, NULL, '2022-03-21 08:59:36'),
	(4, '16478531761205', 2, 1, '2022-03-21 08:59:36', '2022-03-21 08:59:36', 1, NULL, '2022-03-21 08:59:36'),
	(5, '16478531761203', 1, 1, '2022-03-21 08:59:36', '2022-03-21 08:59:36', 2, '通过', '2022-03-21 08:59:36');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(3, 1, 'admin', 'users', '管理员', 'p46j0bozmhsazyqlew9tuc33nr1zn30q', '2022-03-21 08:59:42', '2024-07-24 03:00:34'),
	(4, 1, 'a1', 'yonghu', '用户', '32u4p6ku429e94np5ymnhgcga2g07pu7', '2022-03-21 09:09:48', '2024-07-24 03:01:24');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2022-04-30 16:00:00');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_delete` int DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_photo`, `sex_types`, `yonghu_phone`, `yonghu_id_number`, `yonghu_email`, `yonghu_delete`, `create_time`) VALUES
	(1, '用户1', '123456', '用户姓名1', 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/yonghu1.jpg', 1, '17703786901', '410224199610232001', '1@qq.com', 1, '2022-03-21 08:59:36'),
	(2, '用户2', '123456', '用户姓名2', 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/yonghu2.jpg', 1, '17703786902', '410224199610232002', '2@qq.com', 1, '2022-03-21 08:59:36'),
	(3, '用户3', '123456', '用户姓名3', 'http://localhost:8080/ruxiaoshenbaoshenpi/upload/yonghu3.jpg', 2, '17703786903', '410224199610232003', '3@qq.com', 1, '2022-03-21 08:59:36');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
