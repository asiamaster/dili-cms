
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for annunciate
-- ----------------------------
DROP TABLE IF EXISTS `annunciate`;
CREATE TABLE `annunciate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `firm_id` bigint(20) NOT NULL COMMENT '市场id',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `publish_type` tinyint(2) NULL DEFAULT NULL COMMENT '发布状态：1立即发布 2.定时发布',
  `send_state` tinyint(2) NOT NULL COMMENT '发送状态##1: 未发布, 2: 已发布, 3: 已撤消 4已结束',
  `stick_state` tinyint(2) NOT NULL DEFAULT 1 COMMENT '置顶状态##1:正常, 2:置顶',
  `type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '消息类型##1:平台公告, 2:待办事宜, 3:业务消息',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `notes` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `modifier_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `read_count` int(11) NULL DEFAULT NULL COMMENT '已读数, 需配置版本号更新',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11673 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for annunciate_item
-- ----------------------------
DROP TABLE IF EXISTS `annunciate_item`;
CREATE TABLE `annunciate_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `annunciate_id` bigint(20) NOT NULL COMMENT '通告id',
  `target_id` bigint(20) NULL DEFAULT NULL COMMENT '目标id##用户或客户id',
  `target_type` tinyint(4) NULL DEFAULT NULL COMMENT '目标类型##1:用户,2:客户',
  `target_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标名称',
  `read_state` tinyint(2) NULL DEFAULT NULL COMMENT '读取状态##1:未读, 2:已读, 3:已删除',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '读消息时间',
  `terminal` tinyint(2) NULL DEFAULT NULL COMMENT '阅读终端## 1: WEB, 2: 小程序, 3: 安卓, 4: IOS',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120833 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通告项，通告对应的用户id或客户id的一对一关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for annunciate_target
-- ----------------------------
DROP TABLE IF EXISTS `annunciate_target`;
CREATE TABLE `annunciate_target`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `annunciate_id` bigint(20) NULL DEFAULT NULL COMMENT '通告id',
  `target_type` tinyint(2) NULL DEFAULT NULL COMMENT '对象类型## 1: 用户, 2: 客户',
  `target_range` tinyint(2) NULL DEFAULT NULL COMMENT '对象范围, 1: 所有用户, 2:指定用户, 3:部门, 4:公司, 5: 司机, 6: 买家, 7: 经营户',
  `target_range_id` bigint(20) NULL DEFAULT 0 COMMENT '对象范围id，可能是岗位id、部门id、市场id，其它类型为空',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通告目标' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type_id` bigint(20) NULL DEFAULT NULL COMMENT '文件类型id',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图片url',
  `auth_type_id` tinyint(4) NULL DEFAULT NULL COMMENT '0：没有权限控制，10：部门权限,20：人员权限',
  `is_download` tinyint(4) NULL DEFAULT NULL COMMENT '是否可以下载（0:不可以下载，1：可以下载）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `firm_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属市场编码',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_auth
-- ----------------------------
DROP TABLE IF EXISTS `file_auth`;
CREATE TABLE `file_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NULL DEFAULT NULL COMMENT '文件id',
  `auth_value` bigint(20) NULL DEFAULT NULL COMMENT '权限id',
  `auth_text` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限的文本值',
  `auth_type` tinyint(4) NULL DEFAULT NULL COMMENT '权限类型：10：部门，20:人员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 425 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_item
-- ----------------------------
DROP TABLE IF EXISTS `file_item`;
CREATE TABLE `file_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NULL DEFAULT NULL COMMENT '文件id',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型后缀',
  `file_size` int(11) NULL DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 236 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_type
-- ----------------------------
DROP TABLE IF EXISTS `file_type`;
CREATE TABLE `file_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父节点id：0则是父节点',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `node_file_count` int(11) NULL DEFAULT NULL COMMENT '节点文件数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `firm_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属市场编码',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO `dili_cms`.`file_type`(`id`, `parent_id`, `name`, `node_file_count`, `remark`, `firm_code`, `creator_id`, `create_time`, `update_time`, `version`) VALUES (33, 0, '测试类型', 2, NULL, 'group', 1, '2021-02-01 17:49:54', '2021-04-28 18:03:41', 15);
