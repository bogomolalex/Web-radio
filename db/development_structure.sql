CREATE TABLE `logs` (
  `id` int(11) NOT NULL auto_increment,
  `descr` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

CREATE TABLE `menus` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) default NULL,
  `descr` varchar(100) default NULL,
  `no` int(11) default NULL,
  `menu_id` int(11) default NULL,
  `mtype` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `programs` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) character set cp1251 NOT NULL default '',
  `description` text character set cp1251 NOT NULL,
  `image_url` varchar(200) character set cp1251 NOT NULL default '',
  `value_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL default '',
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

CREATE TABLE `userprofs` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(20) character set cp1251 default NULL,
  `password` varchar(20) character set cp1251 default NULL,
  `role` varchar(20) character set cp1251 default NULL,
  `name` text character set cp1251,
  `status` varchar(20) character set cp1251 default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20110216153707');

INSERT INTO schema_migrations (version) VALUES ('20110216162246');

INSERT INTO schema_migrations (version) VALUES ('20110216162530');

INSERT INTO schema_migrations (version) VALUES ('20110217061051');

INSERT INTO schema_migrations (version) VALUES ('20110217063453');

INSERT INTO schema_migrations (version) VALUES ('20110217064036');

INSERT INTO schema_migrations (version) VALUES ('20110217081515');

INSERT INTO schema_migrations (version) VALUES ('20110217081651');

INSERT INTO schema_migrations (version) VALUES ('20110217085404');