CREATE TABLE `antikeim` (
  `title` varchar(36) NOT NULL,
  `descr` text,
  `belongs_to` varchar(36),
  PRIMARY KEY (`title`),
  CONSTRAINT `ANTIKEIM_TITLE` FOREIGN KEY (`belongs_to`) REFERENCES `antikeim` (`title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user` (
  `username` varchar(12) NOT NULL,
  `password` varchar(10),
  `name` varchar(25) NOT NULL,
  `surname` varchar(35) NOT NULL,
  `reg_date` date,
  `email` varchar(30),
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `company` (
  `AFM` char(9) NOT NULL,
  `DOY` varchar(15),
  `name` varchar(35) NOT NULL,
  `phone` bigint(16),
  `street` varchar(15),
  `num` tinyint(4),
  `city` varchar(15),
  `country` varchar(15),
  PRIMARY KEY (`AFM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `degree` (
  `titlos` varchar(50),
  `idryma` varchar(40),
  `bathmida` enum('LYKEIO','UNIV','MASTER','PHD') NOT NULL,
  PRIMARY KEY (`titlos`,`idryma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `employee` (
  `username` varchar(12) NOT NULL,
  `bio` text,
  `sistatikes` varchar(35),
  `certificates` varchar(35),
  `awards` varchar(35),
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `evaluator` (
  `username` varchar(12) NOT NULL,
  `exp_years` tinyint(4),
  `firm` char(9),
  PRIMARY KEY (`username`),
  CONSTRAINT `EVALR_USER` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EVALR_COMP` FOREIGN KEY (`firm`) REFERENCES `company` (`AFM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `job` (
  `id` int(4) NOT NULL,
  `start_date` date,
  `salary` float(6,1),
  `position` varchar(40),
  `edra` varchar(45),
  `evaluator` varchar(12),
  `announce_date` datetime,
  `submission_date` date,
  PRIMARY KEY (`id`),
  CONSTRAINT `JOB_EVALR` FOREIGN KEY (`evaluator`) REFERENCES `evaluator` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `evaluation` (
  `empl_username` varchar(12) NOT NULL,
  `job_id` int(4),
  `interview` int(11),
  `report` int(11),
  `achievements` int(11),
  `evaluation_result` tinyint(4),
  PRIMARY KEY (`empl_username`),
  CONSTRAINT `EVAL_EMPL` FOREIGN KEY (`empl_username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `evaluationresult` (
  `EvId` int(4) NOT NULL AUTO_INCREMENT,
  `empl_username` varchar(12) NOT NULL,
  `job_id` int(4) NOT NULL,
  `grade` int(4),
  `comments` varchar(255),
  PRIMARY KEY (`EvId`,`empl_username`),
  CONSTRAINT `EVALRES_EMPL` FOREIGN KEY (`empl_username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EVALRES_JOB` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `has_degree` (
  `degr_title` varchar(50) NOT NULL,
  `degr_idryma` varchar(40) NOT NULL,
  `empl_username` varchar(12) NOT NULL,
  `etos` year(4),
  `grade` float(3,1),
  PRIMARY KEY (`degr_title`,`degr_idryma`,`empl_username`),
  CONSTRAINT `HASDGR_DGR` FOREIGN KEY (`degr_title`) REFERENCES `degree` (`titlos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `HASDGR_EMPL` FOREIGN KEY (`empl_username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `job_application` (
  `job_id` int(11) NOT NULL,
  `empl_username` varchar(12) NOT NULL,
  PRIMARY KEY (`job_id`,`empl_username`),
  CONSTRAINT `JOBAPL_EMPL` FOREIGN KEY (`empl_username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `JOBAPL_JOB` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `languages` (
  `employee` varchar(12) NOT NULL,
  `lang` set('EN','FR','SP','GR') NOT NULL,
  PRIMARY KEY (`employee`,`lang`),
  CONSTRAINT `LANG_EMPL` FOREIGN KEY (`employee`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `log` (
  `username` varchar(12) NOT NULL,
  `date_time` datetime,
  `success` tinyint(1),
  `kind` enum('insert','update','delete',''),
  `table_name` varchar(25),
  PRIMARY KEY (`username`),
  CONSTRAINT `LOG_USER` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `manager` (
  `managerUsername` varchar(12) NOT NULL,
  `exp_years` tinyint(4),
  `firm` char(9),
  PRIMARY KEY (`namagerUsername`),
  CONSTRAINT `MAN_COMP` FOREIGN KEY (`firm`) REFERENCES `company` (`AFM`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MAN_USER` FOREIGN KEY (`namagerUsername`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `needs` (
  `job_id` int(4) NOT NULL,
  `antikeim_title` varchar(36) NOT NULL,
  PRIMARY KEY (`job_id`),
  CONSTRAINT `NEEDS_ANTIKEIM` FOREIGN KEY (`antikeim_title`) REFERENCES `antikeim` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `NEEDS_JOB` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `project` (
  `empl` varchar(12) NOT NULL,
  `num` tinyint(4) NOT NULL,
  `descr` text,
  `url` varchar(60),
  PRIMARY KEY (`empl`,`num`),
  CONSTRAINT `PROJECT_EMPL` FOREIGN KEY (`empl`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `requestevaluation` (
  `empl_username` varchar(12) NOT NULL,
  `job_id` int(4) NOT NULL,
  PRIMARY KEY (`empl_username`,`job_id`),
  CONSTRAINT `REQEVAL_JOB` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `REQEVAL_LANG` FOREIGN KEY (`empl_username`) REFERENCES `languages` (`employee`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `user_role` (
  `username` varchar(12) NOT NULL,
  `role` set('manager','evaluator','employee','admin') NOT NULL,
  PRIMARY KEY (`username`, `role`),
  CONSTRAINT `USROLE_USER` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


