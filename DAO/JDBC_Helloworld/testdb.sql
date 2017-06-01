CREATE DATABASE `testdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
CREATE TABLE `name_table` (
  `_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `work` varchar(32) DEFAULT NULL,
  `others` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
