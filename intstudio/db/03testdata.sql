CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(64) NOT NULL,
  `pwd` varchar(64) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8

CREATE TABLE `shxt_dict` (
  `ID` int(11) NOT NULL,
  `DICT_TYPE` varchar(20) DEFAULT NULL,
  `DICT_CODE` varchar(20) DEFAULT NULL,
  `DICT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unx_dict` (`DICT_TYPE`,`DICT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
