-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 11 月 05 日 18:42
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `dm`
--

-- --------------------------------------------------------

--
-- 表的结构 `dm_admin_menu`
--

CREATE TABLE IF NOT EXISTS `dm_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parent_id`),
  KEY `model` (`controller`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表' AUTO_INCREMENT=162 ;

--
-- 转存表中的数据 `dm_admin_menu`
--

INSERT INTO `dm_admin_menu` (`id`, `parent_id`, `type`, `status`, `list_order`, `app`, `controller`, `action`, `param`, `name`, `icon`, `remark`) VALUES
(1, 0, 0, 1, 20, 'admin', 'Plugin', 'default', '', '插件管理', 'cloud', '插件管理'),
(2, 1, 1, 1, 10000, 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理'),
(3, 2, 1, 0, 10000, 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理'),
(4, 2, 2, 0, 10000, 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序'),
(5, 2, 1, 0, 10000, 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子'),
(6, 0, 0, 1, 0, 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口'),
(7, 6, 1, 1, 50, 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理'),
(8, 7, 1, 0, 10000, 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接'),
(9, 7, 2, 0, 10000, 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存'),
(10, 7, 1, 0, 10000, 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接'),
(11, 7, 2, 0, 10000, 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存'),
(12, 7, 2, 0, 10000, 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接'),
(13, 7, 2, 0, 10000, 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序'),
(14, 7, 2, 0, 10000, 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏'),
(15, 6, 1, 1, 10, 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置'),
(16, 15, 2, 0, 10000, 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存'),
(17, 15, 1, 0, 10000, 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板'),
(18, 15, 2, 0, 10000, 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交'),
(19, 15, 1, 0, 10000, 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试'),
(20, 6, 1, 0, 10000, 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理'),
(21, 20, 1, 0, 10000, 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表'),
(22, 20, 1, 0, 10000, 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加'),
(23, 20, 2, 0, 10000, 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存'),
(24, 20, 1, 0, 10000, 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑'),
(25, 20, 2, 0, 10000, 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存'),
(26, 20, 2, 0, 10000, 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除'),
(27, 20, 2, 0, 10000, 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序'),
(28, 20, 1, 0, 10000, 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单'),
(29, 6, 1, 1, 30, 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理'),
(30, 29, 1, 0, 10000, 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航'),
(31, 29, 2, 0, 10000, 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存'),
(32, 29, 1, 0, 10000, 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航'),
(33, 29, 2, 0, 10000, 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存'),
(34, 29, 2, 0, 10000, 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航'),
(35, 29, 1, 0, 10000, 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单'),
(36, 35, 1, 0, 10000, 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单'),
(37, 35, 2, 0, 10000, 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存'),
(38, 35, 1, 0, 10000, 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单'),
(39, 35, 2, 0, 10000, 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存'),
(40, 35, 2, 0, 10000, 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单'),
(41, 35, 2, 0, 10000, 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序'),
(42, 1, 1, 1, 10000, 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表'),
(43, 42, 2, 0, 10000, 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用'),
(44, 42, 1, 0, 10000, 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置'),
(45, 42, 2, 0, 10000, 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交'),
(46, 42, 2, 0, 10000, 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装'),
(47, 42, 2, 0, 10000, 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新'),
(48, 42, 2, 0, 10000, 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件'),
(49, 109, 0, 1, 10000, 'admin', 'User', 'default', '', '管理组', '', '管理组'),
(50, 49, 1, 1, 10000, 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理'),
(51, 50, 1, 0, 10000, 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色'),
(52, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交'),
(53, 50, 1, 0, 10000, 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色'),
(54, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交'),
(55, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色'),
(56, 50, 1, 0, 10000, 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限'),
(57, 50, 2, 0, 10000, 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交'),
(58, 0, 1, 0, 10000, 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站'),
(59, 58, 2, 0, 10000, 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原'),
(60, 58, 2, 0, 10000, 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除'),
(61, 6, 1, 1, 10000, 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理'),
(62, 61, 1, 0, 10000, 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则'),
(63, 61, 2, 0, 10000, 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交'),
(64, 61, 1, 0, 10000, 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑'),
(65, 61, 2, 0, 10000, 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交'),
(66, 61, 2, 0, 10000, 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除'),
(67, 61, 2, 0, 10000, 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用'),
(68, 61, 2, 0, 10000, 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用'),
(69, 61, 2, 0, 10000, 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序'),
(70, 61, 1, 0, 10000, 'admin', 'Route', 'select', '', '选择URL', '', '选择URL'),
(71, 6, 1, 1, 0, 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息'),
(72, 71, 2, 0, 10000, 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交'),
(73, 6, 1, 0, 10000, 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改'),
(74, 73, 2, 0, 10000, 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交'),
(75, 6, 1, 1, 10000, 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置'),
(76, 75, 2, 0, 10000, 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交'),
(77, 6, 1, 0, 10000, 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存'),
(78, 6, 1, 1, 40, 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理'),
(79, 78, 1, 0, 10000, 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片'),
(80, 78, 2, 0, 10000, 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交'),
(81, 78, 1, 0, 10000, 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片'),
(82, 78, 2, 0, 10000, 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交'),
(83, 78, 2, 0, 10000, 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片'),
(84, 78, 1, 0, 10000, 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表'),
(85, 84, 1, 0, 10000, 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加'),
(86, 84, 2, 0, 10000, 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交'),
(87, 84, 1, 0, 10000, 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑'),
(88, 84, 2, 0, 10000, 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交'),
(89, 84, 2, 0, 10000, 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除'),
(90, 84, 2, 0, 10000, 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏'),
(91, 84, 2, 0, 10000, 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示'),
(92, 84, 2, 0, 10000, 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序'),
(93, 6, 1, 1, 10000, 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储'),
(94, 93, 2, 0, 10000, 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交'),
(95, 6, 1, 1, 20, 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理'),
(96, 95, 1, 0, 10000, 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板'),
(97, 95, 2, 0, 10000, 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板'),
(98, 95, 2, 0, 10000, 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装'),
(99, 95, 2, 0, 10000, 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新'),
(100, 95, 2, 0, 10000, 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板'),
(101, 95, 1, 0, 10000, 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板'),
(102, 95, 1, 0, 10000, 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置'),
(103, 95, 1, 0, 10000, 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表'),
(104, 95, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑'),
(105, 95, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存'),
(106, 95, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除'),
(107, 95, 2, 0, 10000, 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存'),
(108, 95, 1, 0, 10000, 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源'),
(109, 0, 0, 1, 10, 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理'),
(110, 49, 1, 1, 10000, 'admin', 'User', 'index', '', '管理员', '', '管理员管理'),
(111, 110, 1, 0, 10000, 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加'),
(112, 110, 2, 0, 10000, 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交'),
(113, 110, 1, 0, 10000, 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑'),
(114, 110, 2, 0, 10000, 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交'),
(115, 110, 1, 0, 10000, 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改'),
(116, 110, 2, 0, 10000, 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交'),
(117, 110, 2, 0, 10000, 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除'),
(118, 110, 2, 0, 10000, 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员'),
(119, 110, 2, 0, 10000, 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员'),
(120, 0, 0, 1, 30, 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理'),
(121, 120, 1, 1, 10000, 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表'),
(122, 121, 1, 0, 10000, 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章'),
(123, 121, 2, 0, 10000, 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交'),
(124, 121, 1, 0, 10000, 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章'),
(125, 121, 2, 0, 10000, 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交'),
(126, 121, 2, 0, 10000, 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除'),
(127, 121, 2, 0, 10000, 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布'),
(128, 121, 2, 0, 10000, 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶'),
(129, 121, 2, 0, 10000, 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐'),
(130, 121, 2, 0, 10000, 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序'),
(131, 120, 1, 1, 10000, 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表'),
(132, 131, 1, 0, 10000, 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类'),
(133, 131, 2, 0, 10000, 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交'),
(134, 131, 1, 0, 10000, 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类'),
(135, 131, 2, 0, 10000, 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交'),
(136, 131, 1, 0, 10000, 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框'),
(137, 131, 2, 0, 10000, 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序'),
(138, 131, 2, 0, 10000, 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类'),
(139, 120, 1, 1, 10000, 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理'),
(140, 139, 1, 0, 10000, 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面'),
(141, 139, 2, 0, 10000, 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交'),
(142, 139, 1, 0, 10000, 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面'),
(143, 139, 2, 0, 10000, 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交'),
(144, 139, 2, 0, 10000, 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面'),
(145, 120, 1, 1, 10000, 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签'),
(146, 145, 1, 0, 10000, 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签'),
(147, 145, 2, 0, 10000, 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交'),
(148, 145, 2, 0, 10000, 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态'),
(149, 145, 2, 0, 10000, 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签'),
(150, 0, 1, 0, 10000, 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表'),
(151, 150, 2, 0, 10000, 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件'),
(152, 109, 0, 1, 10000, 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组'),
(153, 152, 1, 1, 10000, 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户'),
(154, 153, 2, 0, 10000, 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑'),
(155, 153, 2, 0, 10000, 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用'),
(156, 152, 1, 1, 10000, 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户'),
(157, 156, 2, 0, 10000, 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定'),
(158, 6, 1, 1, 10000, 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理'),
(159, 158, 1, 0, 10000, 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作'),
(160, 158, 2, 0, 10000, 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交'),
(161, 158, 1, 0, 10000, 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');

-- --------------------------------------------------------

--
-- 表的结构 `dm_asset`
--

CREATE TABLE IF NOT EXISTS `dm_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_auth_access`
--

CREATE TABLE IF NOT EXISTS `dm_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_auth_rule`
--

CREATE TABLE IF NOT EXISTS `dm_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表' AUTO_INCREMENT=162 ;

--
-- 转存表中的数据 `dm_auth_rule`
--

INSERT INTO `dm_auth_rule` (`id`, `status`, `app`, `type`, `name`, `param`, `title`, `condition`) VALUES
(1, 1, 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', ''),
(2, 1, 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', ''),
(3, 1, 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', ''),
(4, 1, 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', ''),
(5, 1, 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', ''),
(6, 1, 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', ''),
(7, 1, 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', ''),
(8, 1, 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', ''),
(9, 1, 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', ''),
(10, 1, 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', ''),
(11, 1, 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', ''),
(12, 1, 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', ''),
(13, 1, 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', ''),
(14, 1, 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', ''),
(15, 1, 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', ''),
(16, 1, 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', ''),
(17, 1, 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', ''),
(18, 1, 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', ''),
(19, 1, 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', ''),
(20, 1, 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', ''),
(21, 1, 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', ''),
(22, 1, 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', ''),
(23, 1, 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', ''),
(24, 1, 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', ''),
(25, 1, 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', ''),
(26, 1, 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', ''),
(27, 1, 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', ''),
(28, 1, 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', ''),
(29, 1, 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', ''),
(30, 1, 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', ''),
(31, 1, 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', ''),
(32, 1, 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', ''),
(33, 1, 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', ''),
(34, 1, 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', ''),
(35, 1, 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', ''),
(36, 1, 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', ''),
(37, 1, 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', ''),
(38, 1, 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', ''),
(39, 1, 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', ''),
(40, 1, 'admin', 'admin_url', 'admin/Plugin/default', '', '插件管理', ''),
(41, 1, 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', ''),
(42, 1, 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', ''),
(43, 1, 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', ''),
(44, 1, 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', ''),
(45, 1, 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', ''),
(46, 1, 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', ''),
(47, 1, 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', ''),
(48, 1, 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', ''),
(49, 1, 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', ''),
(50, 1, 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', ''),
(51, 1, 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', ''),
(52, 1, 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', ''),
(53, 1, 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', ''),
(54, 1, 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', ''),
(55, 1, 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', ''),
(56, 1, 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', ''),
(57, 1, 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', ''),
(58, 1, 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', ''),
(59, 1, 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', ''),
(60, 1, 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', ''),
(61, 1, 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', ''),
(62, 1, 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', ''),
(63, 1, 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', ''),
(64, 1, 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', ''),
(65, 1, 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', ''),
(66, 1, 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', ''),
(67, 1, 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', ''),
(68, 1, 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', ''),
(69, 1, 'admin', 'admin_url', 'admin/Setting/default', '', '设置', ''),
(70, 1, 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', ''),
(71, 1, 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', ''),
(72, 1, 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', ''),
(73, 1, 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', ''),
(74, 1, 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', ''),
(75, 1, 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', ''),
(76, 1, 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', ''),
(77, 1, 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', ''),
(78, 1, 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', ''),
(79, 1, 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', ''),
(80, 1, 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', ''),
(81, 1, 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', ''),
(82, 1, 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', ''),
(83, 1, 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', ''),
(84, 1, 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', ''),
(85, 1, 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', ''),
(86, 1, 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', ''),
(87, 1, 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', ''),
(88, 1, 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', ''),
(89, 1, 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', ''),
(90, 1, 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', ''),
(91, 1, 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', ''),
(92, 1, 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', ''),
(93, 1, 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', ''),
(94, 1, 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', ''),
(95, 1, 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', ''),
(96, 1, 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', ''),
(97, 1, 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', ''),
(98, 1, 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', ''),
(99, 1, 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', ''),
(100, 1, 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', ''),
(101, 1, 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', ''),
(102, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', ''),
(103, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', ''),
(104, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', ''),
(105, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', ''),
(106, 1, 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', ''),
(107, 1, 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', ''),
(108, 1, 'admin', 'admin_url', 'admin/User/default', '', '管理组', ''),
(109, 1, 'admin', 'admin_url', 'admin/User/index', '', '管理员', ''),
(110, 1, 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', ''),
(111, 1, 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', ''),
(112, 1, 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', ''),
(113, 1, 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', ''),
(114, 1, 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', ''),
(115, 1, 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', ''),
(116, 1, 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', ''),
(117, 1, 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', ''),
(118, 1, 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', ''),
(119, 1, 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', ''),
(120, 1, 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', ''),
(121, 1, 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', ''),
(122, 1, 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', ''),
(123, 1, 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', ''),
(124, 1, 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', ''),
(125, 1, 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', ''),
(126, 1, 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', ''),
(127, 1, 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', ''),
(128, 1, 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', ''),
(129, 1, 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', ''),
(130, 1, 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', ''),
(131, 1, 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', ''),
(132, 1, 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', ''),
(133, 1, 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', ''),
(134, 1, 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', ''),
(135, 1, 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', ''),
(136, 1, 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', ''),
(137, 1, 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', ''),
(138, 1, 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', ''),
(139, 1, 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', ''),
(140, 1, 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', ''),
(141, 1, 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', ''),
(142, 1, 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', ''),
(143, 1, 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', ''),
(144, 1, 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', ''),
(145, 1, 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', ''),
(146, 1, 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', ''),
(147, 1, 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', ''),
(148, 1, 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', ''),
(149, 1, 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', ''),
(150, 1, 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', ''),
(151, 1, 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', ''),
(152, 1, 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', ''),
(153, 1, 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', ''),
(154, 1, 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', ''),
(155, 1, 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', ''),
(156, 1, 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', ''),
(157, 1, 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', ''),
(158, 1, 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', ''),
(159, 1, 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', ''),
(160, 1, 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', ''),
(161, 1, 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');

-- --------------------------------------------------------

--
-- 表的结构 `dm_black`
--

CREATE TABLE IF NOT EXISTS `dm_black` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` text NOT NULL,
  `xid` int(11) NOT NULL,
  `info` text NOT NULL,
  `checked` text NOT NULL,
  `time` int(11) NOT NULL,
  `del` int(11) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_board`
--

CREATE TABLE IF NOT EXISTS `dm_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `time` int(11) NOT NULL,
  `uid` text NOT NULL COMMENT '版主权限',
  `is_login` int(11) NOT NULL,
  `utime` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `del` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `dm_board`
--

INSERT INTO `dm_board` (`id`, `name`, `description`, `time`, `uid`, `is_login`, `utime`, `sort`, `del`) VALUES
(1, 'sp', '', 0, '', 1, 0, 1, 0),
(2, '动漫', '', 0, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dm_collection`
--

CREATE TABLE IF NOT EXISTS `dm_collection` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `count` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `utime` int(11) NOT NULL,
  `del` int(11) NOT NULL,
  `checked` int(11) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `dm_collection`
--

INSERT INTO `dm_collection` (`cid`, `name`, `description`, `count`, `uid`, `ctime`, `utime`, `del`, `checked`, `info`) VALUES
(1, '打飞机', '会打飞机的都是好孩子！！！！！', 1, 1, 0, 1509790174, 0, 0, '["18"]'),
(2, '大写', '啊实打实的', 0, 1, 1509641885, 1509791430, 0, 0, '[]'),
(3, '撒打算', '啊实打实打算', 1, 1, 1509791093, 1509791486, 0, 0, '["18"]'),
(4, '14634854', '0215231', 0, 1, 1509791478, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `dm_comment`
--

CREATE TABLE IF NOT EXISTS `dm_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text COMMENT '评论内容',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`object_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parent_id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_comments`
--

CREATE TABLE IF NOT EXISTS `dm_comments` (
  `coid` int(11) NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `xid` int(11) NOT NULL,
  `rid` int(11) NOT NULL COMMENT '回复评论的ID',
  `uid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `comments` text NOT NULL,
  `del` int(11) NOT NULL,
  PRIMARY KEY (`coid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_danmu`
--

CREATE TABLE IF NOT EXISTS `dm_danmu` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `__v` int(11) NOT NULL,
  `author` text NOT NULL,
  `uid` int(11) NOT NULL,
  `time` text NOT NULL,
  `color` text NOT NULL,
  `type` text NOT NULL,
  `player` text NOT NULL,
  `ip` text NOT NULL,
  `atime` int(11) NOT NULL,
  `del` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `dm_danmu`
--

INSERT INTO `dm_danmu` (`_id`, `__v`, `author`, `uid`, `time`, `color`, `type`, `player`, `ip`, `atime`, `del`, `text`) VALUES
(1, 0, 'admin', 1, '0', '', '', '12', '', 0, 0, '2ewqwedqwaeqw胜多负少'),
(2, 0, 'admin', 1, '4.065519', '#fff', 'right', '12', '127.0.0.1', 1509292885, 0, 'weqaweqweqwe'),
(3, 0, 'admin', 1, '15.885014', '#e54256', 'right', '12', '127.0.0.1', 1509292926, 0, '111111111111111'),
(4, 0, 'admin', 1, '44.691411', '#e54256', 'right', '12', '127.0.0.1', 1509292960, 0, '111111111111111asdasdasd'),
(5, 0, 'admin', 1, '56.607978', '#e54256', 'right', '12', '127.0.0.1', 1509292971, 0, 'qqqqqqqqqqqqq'),
(6, 0, 'admin', 1, '3.525061', '#fff', 'right', '12', '127.0.0.1', 1509292983, 0, 'wwwwwwwww'),
(7, 0, 'admin', 1, '3.402912', '#fff', 'right', '12', '127.0.0.1', 1509293074, 0, 'zzzzzzzzzzzz'),
(8, 0, 'admin', 1, '7.438747', '#fff', 'right', '12', '127.0.0.1', 1509293170, 0, '不怎么有！！'),
(9, 0, 'admin', 1, '4.796628', '#fff', 'right', '3', '127.0.0.1', 1509293530, 0, '6666666'),
(10, 0, 'admin', 1, '5.721563', '#fff', 'right', '3', '127.0.0.1', 1509387238, 1509387253, '666666666666'),
(11, 0, 'admin', 1, '0', '#fff', 'right', '3', '127.0.0.1', 1509387266, 1509387274, '111111111111111111111111111111'),
(12, 0, 'admin', 1, '679.460443', '#fff', 'right', '18', '127.0.0.1', 1509473808, 0, '6666666'),
(13, 0, 'admin', 1, '4.504469', '#fff', 'right', '14', '127.0.0.1', 1509790483, 0, '666666'),
(14, 0, 'admin', 1, '7.717618', '#fff', 'right', '19', '127.0.0.1', 1509821847, 0, '6666666666666666666666');

-- --------------------------------------------------------

--
-- 表的结构 `dm_event`
--

CREATE TABLE IF NOT EXISTS `dm_event` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `stime` int(11) NOT NULL,
  `etime` int(11) NOT NULL,
  `utime` int(11) NOT NULL,
  `location` text NOT NULL,
  `description` text NOT NULL,
  `photo` text NOT NULL,
  `doit` text NOT NULL,
  `join` text NOT NULL,
  `del` int(11) NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_event_thing`
--

CREATE TABLE IF NOT EXISTS `dm_event_thing` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `info` text NOT NULL,
  `del` int(11) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_good`
--

CREATE TABLE IF NOT EXISTS `dm_good` (
  `gid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` text NOT NULL,
  `xid` int(11) NOT NULL,
  `gb` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `del` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dm_harvest`
--

CREATE TABLE IF NOT EXISTS `dm_harvest` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` text NOT NULL,
  `xid` int(11) NOT NULL,
  `name` text NOT NULL,
  `time` int(11) NOT NULL,
  `del` int(11) NOT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `dm_harvest`
--

INSERT INTO `dm_harvest` (`hid`, `uid`, `type`, `xid`, `name`, `time`, `del`) VALUES
(1, 1, 'video', 3, '', 1509384054, 1),
(2, 1, 'video', 3, '', 1509384506, 1),
(3, 1, 'video', 3, '', 1509384686, 1),
(4, 1, 'video', 3, '', 1509384823, 1),
(5, 1, 'video', 3, '', 1509384828, 1),
(6, 1, 'video', 3, '', 1509384907, 1),
(7, 1, 'video', 3, '', 1509384926, 1),
(8, 1, 'video', 3, '', 1509384994, 1),
(9, 1, 'video', 3, '', 1509385064, 1),
(10, 1, 'video', 3, '', 1509385091, 1),
(11, 1, 'video', 3, '', 1509385178, 1509385208),
(12, 1, 'video', 3, '', 1509385211, 1509387200),
(13, 1, 'video', 3, '', 1509387218, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dm_hook`
--

CREATE TABLE IF NOT EXISTS `dm_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表' AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `dm_hook`
--

INSERT INTO `dm_hook` (`id`, `type`, `once`, `name`, `hook`, `app`, `description`) VALUES
(1, 1, 0, '应用初始化', 'app_init', 'cmf', '应用初始化'),
(2, 1, 0, '应用开始', 'app_begin', 'cmf', '应用开始'),
(3, 1, 0, '模块初始化', 'module_init', 'cmf', '模块初始化'),
(4, 1, 0, '控制器开始', 'action_begin', 'cmf', '控制器开始'),
(5, 1, 0, '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤'),
(6, 1, 0, '应用结束', 'app_end', 'cmf', '应用结束'),
(7, 1, 0, '日志write方法', 'log_write', 'cmf', '日志write方法'),
(8, 1, 0, '输出结束', 'response_end', 'cmf', '输出结束'),
(9, 1, 0, '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化'),
(10, 1, 0, '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化'),
(11, 1, 1, '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码'),
(12, 3, 0, '模板 body标签开始', 'body_start', '', '模板 body标签开始'),
(13, 3, 0, '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前'),
(14, 3, 0, '模板底部开始', 'footer_start', '', '模板底部开始'),
(15, 3, 0, '模板底部开始之前', 'before_footer', '', '模板底部开始之前'),
(16, 3, 0, '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前'),
(17, 3, 0, '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前'),
(18, 3, 0, '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始'),
(19, 3, 0, '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前'),
(20, 3, 0, '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始'),
(21, 3, 0, '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前'),
(22, 3, 1, '评论区', 'comment', '', '评论区'),
(23, 3, 1, '留言区', 'guestbook', '', '留言区'),
(24, 2, 0, '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘'),
(25, 4, 0, '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前'),
(26, 4, 0, '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前'),
(27, 2, 0, '后台登录页面', 'admin_login', 'admin', '后台登录页面'),
(28, 1, 1, '前台模板切换', 'switch_theme', 'cmf', '前台模板切换'),
(29, 3, 0, '主要内容之后', 'after_content', '', '主要内容之后'),
(30, 2, 0, '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前'),
(31, 2, 0, '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');

-- --------------------------------------------------------

--
-- 表的结构 `dm_hook_plugin`
--

CREATE TABLE IF NOT EXISTS `dm_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(30) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_link`
--

CREATE TABLE IF NOT EXISTS `dm_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `link_visible` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `dm_link`
--

INSERT INTO `dm_link` (`id`, `status`, `rating`, `list_order`, `description`, `url`, `name`, `image`, `target`, `rel`) VALUES
(1, 1, 1, 8, '弹幕啦', 'http://www.danmula.com', '弹幕啦', '', '_blank', ''),
(2, 1, 0, 10000, '动漫俱乐部', 'https://comiclub.com', '动漫俱乐部', '', '_blank', '');

-- --------------------------------------------------------

--
-- 表的结构 `dm_nav`
--

CREATE TABLE IF NOT EXISTS `dm_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `dm_nav`
--

INSERT INTO `dm_nav` (`id`, `is_main`, `name`, `remark`) VALUES
(1, 1, '主导航', '主导航'),
(2, 0, '底部导航', '');

-- --------------------------------------------------------

--
-- 表的结构 `dm_nav_menu`
--

CREATE TABLE IF NOT EXISTS `dm_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `dm_nav_menu`
--

INSERT INTO `dm_nav_menu` (`id`, `nav_id`, `parent_id`, `status`, `list_order`, `name`, `target`, `href`, `icon`, `path`) VALUES
(1, 1, 0, 1, 0, '首页', '', 'home', '', '0-1'),
(3, 1, 1, 1, 10000, '视频', '', 'home', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `dm_option`
--

CREATE TABLE IF NOT EXISTS `dm_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `dm_option`
--

INSERT INTO `dm_option` (`id`, `autoload`, `option_name`, `option_value`) VALUES
(7, 1, 'site_info', '{"site_name":"\\u5f39\\u5e55\\u5566","site_seo_title":"\\u5f39\\u5e55\\u5566","site_seo_keywords":"\\u4e00\\u4e2a\\u5c0f\\u7684\\u5f39\\u5e55\\u7ad9\\u70b9","site_seo_description":"","site_icp":"\\u82cfICP\\u590713006484\\u53f7-1","site_admin_email":"","site_analytics":"","urlmode":"1","html_suffix":""}'),
(8, 1, 'cmf_settings', '{"open_registration":"1","banned_usernames":""}'),
(9, 1, 'cdn_settings', '{"cdn_static_root":""}'),
(10, 1, 'admin_settings', '{"admin_password":"","admin_style":"flatadmin"}');

-- --------------------------------------------------------

--
-- 表的结构 `dm_photo`
--

CREATE TABLE IF NOT EXISTS `dm_photo` (
  `poid` int(11) NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `xid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `url` text NOT NULL,
  `time` int(11) NOT NULL,
  `del` int(11) NOT NULL,
  PRIMARY KEY (`poid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `dm_photo`
--

INSERT INTO `dm_photo` (`poid`, `type`, `xid`, `uid`, `url`, `time`, `del`) VALUES
(1, 'video', 5, 1, 'image/20171101\\ce05a0f9e78791b418459c43c8c876e9.jpg', 0, 0),
(2, 'video', 3, 1, 'image/20171101\\c4bd8cd00617f3f0872669a7d6a8eaac.jpg', 0, 1509473779),
(3, 'video', 3, 1, 'image/20171101\\2ee0d549d16d1dac5794950ab6f207f8.jpg', 0, 1509473779),
(4, 'video', 3, 1, 'image/20171101\\e510559685ebf03ca3a8305819eca614.jpg', 0, 1509473779),
(5, 'video', 18, 1, 'image/20171101\\89478fe48b5b42d41167b55e6fad0e2b.jpg', 0, 0),
(6, 'video', 3, 1, 'image/20171101\\fffd6ffb3adafc90bed4da21dcbab8b0.jpg', 0, 0),
(7, 'video', 14, 1, 'image/20171105\\4316f9fe37b07f70eee9d7a8f3b2baf8.jpg', 0, 0),
(8, 'video', 11, 1, 'image/20171105\\0f3260af64f5ced54917f5e5d3d4e489.jpg', 0, 0),
(9, 'video', 19, 1, 'image/20171105\\34e76dcf0238f95e2266349563267d78.PNG', 0, 0),
(10, 'video', 20, 1, 'image/20171105\\e58bc566d96c29f1d3d47c069103bc29.PNG', 0, 0),
(11, 'video', 21, 1, 'image/20171105\\7c91c12f5128933d0234c94aa558a6c8.jpg', 0, 0),
(12, 'video', 22, 1, 'image/20171106\\381b4d772220d3f0458265e10a20a914.jpg', 0, 0),
(13, 'video', 25, 1, 'image/20171106\\0374644d4958c63ce516e2f387730229.PNG', 0, 1509907156),
(14, 'video', 31, 1, 'image/20171106\\9f4f3d978a4c2df6d44dc198059c5f74.jpg', 0, 0),
(15, 'video', 30, 1, 'image/20171106\\925474e09ba2d98e7c58dfba80df17cf.png', 0, 0),
(16, 'video', 29, 1, 'image/20171106\\86b8599685a244762ee56a4cdd3c0863.PNG', 0, 0),
(17, 'video', 28, 1, 'image/20171106\\ed0d40bc8cd0e2a1bdc0b241dd7660e2.PNG', 0, 0),
(18, 'video', 27, 1, 'image/20171106\\f42219a96e54c66e4a7f55bfe71c4ecb.PNG', 0, 0),
(19, 'video', 26, 1, 'image/20171106\\cd98c6a818121c19a87e8402b33c88b1.jpg', 0, 0),
(20, 'video', 32, 1, 'image/20171106\\e79f370ee696328a27e3daca5d71a867.PNG', 0, 0),
(21, 'video', 25, 1, 'image/20171106\\5212f3eaaddbdf7fc29b54d06eadaf56.PNG', 0, 0),
(22, 'video', 24, 1, 'image/20171106\\cc326743e747bde51d18962467c771ad.jpg', 0, 0),
(23, 'video', 23, 1, 'image/20171106\\e6de855622cc82d28e1515494f641e2b.png', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dm_plugin`
--

CREATE TABLE IF NOT EXISTS `dm_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='插件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_point`
--

CREATE TABLE IF NOT EXISTS `dm_point` (
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `point` int(11) NOT NULL COMMENT '当前分数',
  `am` int(11) NOT NULL COMMENT 'add minus 加减[0减 1加]',
  `action` int(11) NOT NULL COMMENT '执行加减的分数',
  `time` int(11) NOT NULL,
  `del` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dm_portal_category`
--

CREATE TABLE IF NOT EXISTS `dm_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_portal_category_post`
--

CREATE TABLE IF NOT EXISTS `dm_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_portal_post`
--

CREATE TABLE IF NOT EXISTS `dm_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `post_parent` (`parent_id`),
  KEY `post_author` (`user_id`),
  KEY `post_date` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_portal_tag`
--

CREATE TABLE IF NOT EXISTS `dm_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_portal_tag_post`
--

CREATE TABLE IF NOT EXISTS `dm_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_recycle_bin`
--

CREATE TABLE IF NOT EXISTS `dm_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_role`
--

CREATE TABLE IF NOT EXISTS `dm_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='角色表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `dm_role`
--

INSERT INTO `dm_role` (`id`, `parent_id`, `status`, `create_time`, `update_time`, `list_order`, `name`, `remark`) VALUES
(1, 0, 1, 1329633709, 1329633709, 0, '超级管理员', '拥有网站最高管理员权限！'),
(2, 0, 1, 1329633709, 1329633709, 0, '普通管理员', '权限由最高管理员分配！');

-- --------------------------------------------------------

--
-- 表的结构 `dm_role_user`
--

CREATE TABLE IF NOT EXISTS `dm_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_route`
--

CREATE TABLE IF NOT EXISTS `dm_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='url路由表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_slide`
--

CREATE TABLE IF NOT EXISTS `dm_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_slide_item`
--

CREATE TABLE IF NOT EXISTS `dm_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_cid` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_theme`
--

CREATE TABLE IF NOT EXISTS `dm_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `dm_theme`
--

INSERT INTO `dm_theme` (`id`, `create_time`, `update_time`, `status`, `is_compiled`, `theme`, `name`, `version`, `demo_url`, `thumbnail`, `author`, `author_url`, `lang`, `keywords`, `description`) VALUES
(19, 0, 0, 0, 0, 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- --------------------------------------------------------

--
-- 表的结构 `dm_theme_file`
--

CREATE TABLE IF NOT EXISTS `dm_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `dm_theme_file`
--

INSERT INTO `dm_theme_file` (`id`, `is_public`, `list_order`, `theme`, `name`, `action`, `file`, `description`, `more`, `config_more`, `draft_more`) VALUES
(105, 0, 10, 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{"vars":{"hot_articles_category_id":{"title":"Hot Articles\\u5206\\u7c7bID","name":"hot_articles_category_id","value":"1","type":"text","tip":"","rule":[]}}}', '{"vars":{"hot_articles_category_id":{"title":"Hot Articles\\u5206\\u7c7bID","name":"hot_articles_category_id","value":"1","type":"text","tip":"","rule":[]}}}', NULL),
(106, 0, 10, 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{"vars":{"baidu_map_info_window_text":{"title":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57","name":"baidu_map_info_window_text","value":"ThinkCMF<br\\/><span class=''''>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>","type":"text","tip":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801","rule":[]},"company_location":{"title":"\\u516c\\u53f8\\u5750\\u6807","value":"","type":"location","tip":"","rule":{"require":true}},"address_cn":{"title":"\\u516c\\u53f8\\u5730\\u5740","value":"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7","type":"text","tip":"","rule":{"require":true}},"address_en":{"title":"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09","value":"NO.0001 Xie Tu Road, Shanghai China","type":"text","tip":"","rule":{"require":true}},"email":{"title":"\\u516c\\u53f8\\u90ae\\u7bb1","value":"catman@thinkcmf.com","type":"text","tip":"","rule":{"require":true}},"phone_cn":{"title":"\\u516c\\u53f8\\u7535\\u8bdd","value":"021 1000 0001","type":"text","tip":"","rule":{"require":true}},"phone_en":{"title":"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09","value":"+8621 1000 0001","type":"text","tip":"","rule":{"require":true}},"qq":{"title":"\\u8054\\u7cfbQQ","value":"478519726","type":"text","tip":"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00","rule":{"require":true}}}}', '{"vars":{"baidu_map_info_window_text":{"title":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57","name":"baidu_map_info_window_text","value":"ThinkCMF<br\\/><span class=''''>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>","type":"text","tip":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801","rule":[]},"company_location":{"title":"\\u516c\\u53f8\\u5750\\u6807","value":"","type":"location","tip":"","rule":{"require":true}},"address_cn":{"title":"\\u516c\\u53f8\\u5730\\u5740","value":"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7","type":"text","tip":"","rule":{"require":true}},"address_en":{"title":"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09","value":"NO.0001 Xie Tu Road, Shanghai China","type":"text","tip":"","rule":{"require":true}},"email":{"title":"\\u516c\\u53f8\\u90ae\\u7bb1","value":"catman@thinkcmf.com","type":"text","tip":"","rule":{"require":true}},"phone_cn":{"title":"\\u516c\\u53f8\\u7535\\u8bdd","value":"021 1000 0001","type":"text","tip":"","rule":{"require":true}},"phone_en":{"title":"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09","value":"+8621 1000 0001","type":"text","tip":"","rule":{"require":true}},"qq":{"title":"\\u8054\\u7cfbQQ","value":"478519726","type":"text","tip":"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00","rule":{"require":true}}}}', NULL),
(107, 0, 5, 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{"vars":{"top_slide":{"title":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","value":"","type":"text","dataSource":{"api":"admin\\/Slide\\/index","multi":false},"placeholder":"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247","tip":"","rule":{"require":true}}},"widgets":{"features":{"title":"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF","display":"1","vars":{"sub_title":{"title":"\\u526f\\u6807\\u9898","value":"Quickly understand the ThinkCMF","type":"text","placeholder":"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898","tip":"","rule":{"require":true}},"features":{"title":"\\u7279\\u6027\\u4ecb\\u7ecd","value":[{"title":"MVC\\u5206\\u5c42\\u6a21\\u5f0f","icon":"bars","content":"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002"},{"title":"\\u7528\\u6237\\u7ba1\\u7406","icon":"group","content":"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002"},{"title":"\\u4e91\\u7aef\\u90e8\\u7f72","icon":"cloud","content":"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002"},{"title":"\\u5b89\\u5168\\u7b56\\u7565","icon":"heart","content":"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002"},{"title":"\\u5e94\\u7528\\u6a21\\u5757\\u5316","icon":"cubes","content":"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002"},{"title":"\\u514d\\u8d39\\u5f00\\u6e90","icon":"certificate","content":"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002"}],"type":"array","item":{"title":{"title":"\\u6807\\u9898","value":"","type":"text","rule":{"require":true}},"icon":{"title":"\\u56fe\\u6807","value":"","type":"text"},"content":{"title":"\\u63cf\\u8ff0","value":"","type":"textarea"}},"tip":""}}},"last_news":{"title":"\\u6700\\u65b0\\u8d44\\u8baf","display":"1","vars":{"last_news_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"vars":{"top_slide":{"title":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","value":"","type":"text","dataSource":{"api":"admin\\/Slide\\/index","multi":false},"placeholder":"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247","tip":"","rule":{"require":true}}},"widgets":{"features":{"title":"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF","display":"1","vars":{"sub_title":{"title":"\\u526f\\u6807\\u9898","value":"Quickly understand the ThinkCMF","type":"text","placeholder":"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898","tip":"","rule":{"require":true}},"features":{"title":"\\u7279\\u6027\\u4ecb\\u7ecd","value":[{"title":"MVC\\u5206\\u5c42\\u6a21\\u5f0f","icon":"bars","content":"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002"},{"title":"\\u7528\\u6237\\u7ba1\\u7406","icon":"group","content":"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002"},{"title":"\\u4e91\\u7aef\\u90e8\\u7f72","icon":"cloud","content":"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002"},{"title":"\\u5b89\\u5168\\u7b56\\u7565","icon":"heart","content":"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002"},{"title":"\\u5e94\\u7528\\u6a21\\u5757\\u5316","icon":"cubes","content":"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002"},{"title":"\\u514d\\u8d39\\u5f00\\u6e90","icon":"certificate","content":"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002"}],"type":"array","item":{"title":{"title":"\\u6807\\u9898","value":"","type":"text","rule":{"require":true}},"icon":{"title":"\\u56fe\\u6807","value":"","type":"text"},"content":{"title":"\\u63cf\\u8ff0","value":"","type":"textarea"}},"tip":""}}},"last_news":{"title":"\\u6700\\u65b0\\u8d44\\u8baf","display":"1","vars":{"last_news_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
(108, 0, 10, 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{"vars":[],"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"vars":[],"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
(109, 0, 10, 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
(110, 0, 10, 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{"vars":{"varName1":{"title":"\\u70ed\\u95e8\\u641c\\u7d22","value":"1","type":"text","tip":"\\u8fd9\\u662f\\u4e00\\u4e2atext","rule":{"require":true}}}}', '{"vars":{"varName1":{"title":"\\u70ed\\u95e8\\u641c\\u7d22","value":"1","type":"text","tip":"\\u8fd9\\u662f\\u4e00\\u4e2atext","rule":{"require":true}}}}', NULL),
(111, 1, 0, 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{"vars":{"enable_mobile":{"title":"\\u624b\\u673a\\u6ce8\\u518c","value":1,"type":"select","options":{"1":"\\u5f00\\u542f","0":"\\u5173\\u95ed"},"tip":""}}}', '{"vars":{"enable_mobile":{"title":"\\u624b\\u673a\\u6ce8\\u518c","value":1,"type":"select","options":{"1":"\\u5f00\\u542f","0":"\\u5173\\u95ed"},"tip":""}}}', NULL),
(112, 1, 1, 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{"vars":{"company_name":{"title":"\\u516c\\u53f8\\u540d\\u79f0","name":"company_name","value":"\\u5f39\\u5e55\\u5566","type":"text","tip":"","rule":[]}}}', '{"vars":{"company_name":{"title":"\\u516c\\u53f8\\u540d\\u79f0","name":"company_name","value":"ThinkCMF","type":"text","tip":"","rule":[]}}}', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dm_third_party_user`
--

CREATE TABLE IF NOT EXISTS `dm_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_user`
--

CREATE TABLE IF NOT EXISTS `dm_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dm_user`
--

INSERT INTO `dm_user` (`id`, `user_type`, `sex`, `birthday`, `last_login_time`, `score`, `coin`, `create_time`, `user_status`, `user_login`, `user_pass`, `user_nickname`, `user_email`, `user_url`, `avatar`, `signature`, `last_login_ip`, `user_activation_key`, `mobile`, `more`) VALUES
(1, 1, 0, 0, 1509731967, 0, 0, 1506836138, 1, 'admin', '###3ca2b02ed622443202f7e3612c88b6a6', 'admin', 'maysrp@gmail.com', '', 'avatar/20171105/0e53a23590f35c1aa27c2789a0b865ac.PNG', '', '127.0.0.1', '', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dm_user_action`
--

CREATE TABLE IF NOT EXISTS `dm_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_user_action_log`
--

CREATE TABLE IF NOT EXISTS `dm_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_user_favorite`
--

CREATE TABLE IF NOT EXISTS `dm_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的描述',
  `table_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_user_login_attempt`
--

CREATE TABLE IF NOT EXISTS `dm_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_user_score_log`
--

CREATE TABLE IF NOT EXISTS `dm_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_user_token`
--

CREATE TABLE IF NOT EXISTS `dm_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dm_user_token`
--

INSERT INTO `dm_user_token` (`id`, `user_id`, `expire_time`, `create_time`, `token`, `device_type`) VALUES
(1, 1, 1524406175, 1508854175, '5c14912b08eb32a899f48a10fb45c57a4f016be77d8d439b5d73dec9f89b3421', 'web');

-- --------------------------------------------------------

--
-- 表的结构 `dm_verification_code`
--

CREATE TABLE IF NOT EXISTS `dm_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dm_video`
--

CREATE TABLE IF NOT EXISTS `dm_video` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `video` text NOT NULL COMMENT '0没有1查看2不通过大于2 通过',
  `photo` text NOT NULL,
  `board` int(11) NOT NULL,
  `board_next` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `utime` int(11) NOT NULL,
  `checked` int(11) NOT NULL,
  `del` int(11) NOT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `dm_video`
--

INSERT INTO `dm_video` (`vid`, `uid`, `name`, `description`, `video`, `photo`, `board`, `board_next`, `ctime`, `utime`, `checked`, `del`) VALUES
(3, 1, '和尚123', 'dsfsdfsdf啊实打实大啊实打实打算', 'video/20171028\\e3d9a8bea813abda988217efc2d12230.mp4', '', 1, 0, 1509199167, 1509819833, 1212, 0),
(2, 1, 'sadasdasd山東肥城', 'asdasdasdasda撒打算', 'video/20171026\\f87cdb095e7dac1638a826a6121de4a1.mp4', '', 0, 0, 1508947980, 0, 12, 1509216523),
(4, 1, '', '', 'video/20171028\\ce4ab60d621513e07e70d5b7048097e5.mp4', '', 0, 0, 1509199492, 0, 1212, 1509216504),
(5, 1, 'sdfsd', 'sdfsdfs', 'video/20171028\\199f7c489f1bc1704277702e8cfb73db.mp4', '', 0, 0, 1509200166, 0, 12312, 1509473254),
(6, 1, 'asxasdas', 'dasdasd', 'video/20171028\\68630be185a6fda07a9f07ed4418743a.mp4', '', 0, 0, 1509200417, 0, 2312, 1509473257),
(7, 1, 'asdsadf', 'dsfsdfs', 'video/20171028\\69efa2787046a9de046ab30e0621aa64.mp4', '', 0, 0, 1509201579, 0, 12131, 1509473260),
(8, 1, 'qwerwrwe', 'rwerwer', 'video/20171028\\a24a23e60ddee2b3185c094aeed01fc1.mp4', '', 0, 0, 1509202347, 0, 1213, 1509473263),
(9, 1, 'wasqda', 'asdasd', 'video/20171028\\a680a4245b929b90f9ff5ed0c7a5881c.mp4', '', 0, 0, 1509202543, 0, 123123, 1509216619),
(10, 1, 'asdasd', 'asdasda', 'video/20171028\\cb3b66859ad44df59eeeec09aaeb3cdd.mp4', '', 0, 0, 1509203130, 0, 23123, 1509216566),
(11, 1, 'sadasd', 'asdasd', 'video/20171028\\6d4e4bc600b3eae34dd2492daf935e2e.mp4', '', 1, 0, 1509203255, 1509819819, 2, 0),
(12, 2, 'sadasd', 'asdasd', 'video/20171028\\99eb3787273b45a16ca40790ba6d70a9.mp4', '', 0, 0, 1509203376, 0, 112312, 0),
(13, 1, 'aaaaaa', 'aaaaaaaaaaaaaa', 'video/20171028\\89165d8954dc8275ebe18c67a53baf68.mp4', '', 0, 0, 1509203430, 0, 123123, 1509216554),
(14, 1, 'Photoshope自动涂抹', '自动涂抹工具', 'video/20171029\\7d3c6dc3c697e362f0e977175305dde1.mp4', '', 2, 0, 1509209512, 1509821570, 21312, 0),
(15, 1, 'AV', '2333', 'video/20171029\\3d7a74e03bca7acd9e698bdd34e1f951.mp4', '', 0, 0, 1509219270, 0, 21312, 1509473265),
(16, 1, '666', '65+5', 'video/20171029\\23ef5f11aec57926ced4b2eeefb00e5e.mp4', '', 0, 0, 1509219326, 0, 213, 1509473268),
(17, 1, '武装少女 3', '士大夫似的', 'video/20171029\\245bc7c358c7309333fb3ffd924f584f.mp4', '', 0, 0, 1509220278, 1509220305, 2131, 1509473273),
(18, 1, '54154185', '撒士大夫士大夫', 'video/20171101\\4311a34f57f4664f04843ff96f73e21e.mp4', '', 2, 0, 1509473717, 1509819648, 1231, 0),
(19, 1, 'sasas', 'qweqwe', 'video/20171104\\2f68cc828cc0d10cf97b11b26b960133.MP4', '', 2, 0, 1509737727, 1509738403, 2, 0),
(20, 1, '让法国人', '岁的法国 ', 'video/20171104\\817e79008eb94ee85b070fa0c84f5a10.MP4', '', 2, 0, 1509737885, 1509819635, 32, 0),
(21, 1, '饿死的方式', '大范甘迪', 'video/20171104\\591ac5bdf9f342c3200cc68b55b97324.MP4', '', 2, 0, 1509737984, 0, 231, 0),
(22, 1, '银魂', '398', 'video/20171106\\6bcd88001ddd0a4aa7c1e87bf40c8b54.mp4', '', 2, 0, 1509905944, 1509906555, 2, 0),
(23, 1, '撒旦撒', '电风扇', 'video/20171106\\cfb644b5d2efed37cf4b938780fbfb7b.mp4', '', 1, 0, 1509906594, 0, 2, 0),
(24, 1, '速度few虽然他', '瑞特', 'video/20171106\\79d7e6ffe0cf884a5e6bde642d216666.mp4', '', 1, 0, 1509906617, 0, 2, 0),
(25, 1, 's啊', '阿文斯蒂芬的啊', 'video/20171106\\df408aa0848febad545cca5aeb3fe227.mp4', '', 1, 0, 1509906636, 0, 2, 0),
(26, 1, '阿斯達', '阿斯蒂芬', 'video/20171106\\84c05f32a1b7d0f8b300133183b4b68f.mp4', '', 1, 0, 1509906667, 0, 2, 0),
(27, 1, '俄方歲', '斯蒂芬森', 'video/20171106\\405185b98dc8dede198f0cb4c165310b.mp4', '', 1, 0, 1509906701, 0, 2, 0),
(28, 1, '在在在', '卸載重裝', 'video/20171106\\e8f4993698e4be16d7642efa0c605e2e.mp4', '', 1, 0, 1509906741, 0, 2, 0),
(29, 1, '多少', '瓦斯彈', 'video/20171106\\b26efb810e1996d48971fbd8d182e544.mp4', '', 1, 0, 1509906761, 0, 2, 0),
(30, 1, '撒旦', '阿斯達斯的', 'video/20171106\\6272178d1417736d809ff99eec018285.mp4', '', 1, 0, 1509906799, 0, 2, 0),
(31, 1, '武大偉', '撒旦發射的', 'video/20171106\\b601e3872ecd59a814e0b9c616ca2496.mp4', '', 2, 0, 1509906826, 0, 2, 0),
(32, 1, '阿斯大蘇打阿德斯', '阿斯達', 'video/20171106\\22b03131eea6367e5936e8e9ad9a3fb6.mp4', '', 2, 0, 1509906853, 0, 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dm_watch`
--

CREATE TABLE IF NOT EXISTS `dm_watch` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` text NOT NULL,
  `xid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `del` int(11) NOT NULL,
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `dm_watch`
--

INSERT INTO `dm_watch` (`wid`, `uid`, `type`, `xid`, `time`, `count`, `del`) VALUES
(1, 1, 'video', 18, 1509902275, 0, 0),
(2, 1, 'video', 18, 1509902278, 0, 0),
(3, 1, 'video', 18, 1509902280, 0, 0),
(4, 1, 'video', 18, 1509902434, 0, 0),
(5, 1, 'video', 18, 1509902677, 0, 0),
(6, 1, 'video', 18, 1509902680, 0, 0),
(7, 1, 'video', 18, 1509902685, 0, 0),
(8, 1, 'video', 18, 1509902688, 0, 0),
(9, 1, 'video', 18, 1509902690, 0, 0),
(10, 1, 'video', 21, 1509902696, 0, 0),
(11, 1, 'video', 21, 1509902699, 0, 0),
(12, 1, 'video', 21, 1509902703, 0, 0),
(13, 1, 'video', 21, 1509902705, 0, 0),
(14, 1, 'video', 21, 1509902707, 0, 0),
(15, 1, 'video', 21, 1509902710, 0, 0),
(16, 1, 'video', 21, 1509902958, 0, 0),
(17, 1, 'video', 21, 1509902960, 0, 0),
(18, 1, 'video', 20, 1509902962, 0, 0),
(19, 1, 'video', 19, 1509902964, 0, 0),
(20, 1, 'video', 18, 1509902966, 0, 0),
(21, 1, 'video', 12, 1509902970, 0, 0),
(22, 1, 'video', 12, 1509902990, 0, 0),
(23, 1, 'video', 12, 1509903008, 0, 0),
(24, 1, 'video', 12, 1509903080, 0, 0),
(25, 1, 'video', 12, 1509903147, 0, 0),
(26, 1, 'video', 12, 1509903156, 0, 0),
(27, 1, 'video', 12, 1509903213, 0, 0),
(28, 1, 'video', 12, 1509903248, 0, 0),
(29, 1, 'video', 12, 1509903256, 0, 0),
(30, 1, 'video', 12, 1509903267, 0, 0),
(31, 1, 'video', 12, 1509903292, 0, 0),
(32, 1, 'video', 12, 1509903305, 0, 0),
(33, 1, 'video', 12, 1509903317, 0, 0),
(34, 1, 'video', 12, 1509903329, 0, 0),
(35, 1, 'video', 14, 1509903627, 0, 0),
(36, 1, 'video', 14, 1509903638, 0, 0),
(37, 1, 'video', 14, 1509903658, 0, 0),
(38, 1, 'video', 14, 1509903677, 0, 0),
(39, 1, 'video', 14, 1509903686, 0, 0),
(40, 1, 'video', 14, 1509903702, 0, 0),
(41, 1, 'video', 14, 1509903722, 0, 0),
(42, 1, 'video', 14, 1509903731, 0, 0),
(43, 1, 'video', 14, 1509903742, 0, 0),
(44, 1, 'video', 14, 1509903764, 0, 0),
(45, 1, 'video', 14, 1509903782, 0, 0),
(46, 1, 'video', 14, 1509903793, 0, 0),
(47, 1, 'video', 14, 1509903810, 0, 0),
(48, 1, 'video', 14, 1509903829, 0, 0),
(49, 1, 'video', 18, 1509905749, 0, 0),
(50, 1, 'video', 18, 1509905760, 0, 0),
(51, 1, 'video', 22, 1509906529, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
