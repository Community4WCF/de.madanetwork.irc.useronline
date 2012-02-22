CREATE TABLE IF NOT EXISTS wbb1_1_irc_useronline (
  nickname varchar(50) NOT NULL,
  channel varchar(50) NOT NULL,
  op tinyint(1) unsigned NOT NULL,
  voice tinyint(1) unsigned NOT NULL,
  KEY nickname (nickname),
  KEY channel (channel)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;