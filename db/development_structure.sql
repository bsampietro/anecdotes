CREATE TABLE `posts` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `text` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `tag_id` int(11) default NULL,
  `language_code` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `posts_info` (
  `id` int(11) NOT NULL auto_increment,
  `post_id` int(11) default NULL,
  `votes` int(11) default '0',
  `voters_ips` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tags` (
  `id` int(11) default NULL,
  `ki` varchar(255) default NULL,
  `number_of_stories` int(11) default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `nick` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20090504221557');

INSERT INTO schema_migrations (version) VALUES ('20090504223805');

INSERT INTO schema_migrations (version) VALUES ('20090506171504');

INSERT INTO schema_migrations (version) VALUES ('20090506172109');

INSERT INTO schema_migrations (version) VALUES ('20090506234121');

INSERT INTO schema_migrations (version) VALUES ('20090507190036');

INSERT INTO schema_migrations (version) VALUES ('20090509225755');

INSERT INTO schema_migrations (version) VALUES ('20090509231312');