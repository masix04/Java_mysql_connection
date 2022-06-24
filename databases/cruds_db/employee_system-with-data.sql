/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 8.0.29 : Database - employee_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`employee_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `employee_system`;

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `dept_no` varchar(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_no`),
  UNIQUE KEY `uc_departments_dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `departments` */

insert  into `departments`(`dept_no`,`dept_name`) values ('d009','Customer Service'),('d005','Development'),('d002','Finanace'),('d003','Human Resources'),('d001','Marketing'),('d004','Production'),('d006','Quality Management'),('d008','Research'),('d007','Sales');

/*Table structure for table `dept_emp` */

DROP TABLE IF EXISTS `dept_emp`;

CREATE TABLE `dept_emp` (
  `emp_no` int NOT NULL,
  `dept_no` varchar(4) NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `fk_dept_emp_dept_no` (`dept_no`),
  CONSTRAINT `fk_dept_emp_dept_no` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`),
  CONSTRAINT `fk_dept_emp_emp_no` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dept_emp` */

insert  into `dept_emp`(`emp_no`,`dept_no`) values (461591,'d002'),(473302,'d002'),(475053,'d004'),(13616,'d005'),(109820,'d005'),(240129,'d006'),(111877,'d009');

/*Table structure for table `dept_manager` */

DROP TABLE IF EXISTS `dept_manager`;

CREATE TABLE `dept_manager` (
  `dept_no` varchar(4) NOT NULL,
  `emp_no` int NOT NULL,
  PRIMARY KEY (`dept_no`,`emp_no`),
  KEY `fk_dept_manager_emp_no` (`emp_no`),
  CONSTRAINT `fk_dept_manager_dept_no` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`),
  CONSTRAINT `fk_dept_manager_emp_no` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dept_manager` */

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `emp_title` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`),
  UNIQUE KEY `uc_employees_emp_title` (`emp_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `employees` */

insert  into `employees`(`emp_no`,`emp_title`,`birth_date`,`first_name`,`last_name`,`gender`,`hire_date`) values (2,'e0006','2001-09-29','Ian','Fence','M','2019-10-30'),(3,'e0007','2001-10-30','Rica','Banance','F','2019-11-30'),(13616,'e0003','1961-08-30','Perry','Lorho','F','1991-08-03'),(109820,'e0001','1952-11-11','Juichirou','Ghelli','F','1986-12-13'),(111877,'m0001','1962-10-18','Xiaobin','Spinelli','F','1991-08-17'),(240129,'e0004','1952-08-11','Roddy','Karnin','M','1985-05-29'),(461591,'s0002','1964-11-17','Xudong','Samarati','M','1985-11-13'),(473302,'s0001','2000-07-25','abc','xyz','M','1990-04-28'),(475053,'e0002','1954-11-18','Byong','Delgrande','F','1991-07-09');

/*Table structure for table `salaries` */

DROP TABLE IF EXISTS `salaries`;

CREATE TABLE `salaries` (
  `emp_no` int NOT NULL,
  `salary` int NOT NULL,
  PRIMARY KEY (`emp_no`),
  CONSTRAINT `fk_salaries_emp_no` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `salaries` */

/*Table structure for table `titles` */

DROP TABLE IF EXISTS `titles`;

CREATE TABLE `titles` (
  `title_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`title_id`),
  CONSTRAINT `fk_titles_titles_id` FOREIGN KEY (`title_id`) REFERENCES `employees` (`emp_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `titles` */

insert  into `titles`(`title_id`,`title`) values ('e0001','Assistant Engineer'),('e0002','Engineer'),('e0003','Senior Engineer'),('e0004','Technique Leader'),('m0001','Manager'),('s0001','Staff'),('s0002','Senior Staff');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
