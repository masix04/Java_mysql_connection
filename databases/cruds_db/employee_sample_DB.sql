CREATE DATABASE `employee_system`

CREATE TABLE `departments` (
    `dept_no` VARCHAR(4)  NOT NULL ,
    `dept_name` VARCHAR(40)  NOT NULL ,
    PRIMARY KEY (
        `dept_no`
    ),
    CONSTRAINT `uc_departments_dept_name` UNIQUE (
        `dept_name`
    )
);
INSERT INTO departments VALUES
    ('d001','Marketing'),
    ('d002','Finanace'),
    ('d003','Human Resources'),
    ('d004','Production'),
    ('d005','Development'),
    ('d006','Quality Management'),
    ('d007','Sales'),
    ('d008','Research'),
    ('d009','Customer Service');

CREATE TABLE `employees` (
    `emp_no` INT  NOT NULL ,
    `emp_title` VARCHAR(255)  NOT NULL ,
    `birth_date` DATE  NOT NULL ,
    `first_name` VARCHAR(255)  NOT NULL ,
    `last_name` VARCHAR(255)  NOT NULL ,
    `gender` VARCHAR(50)  NOT NULL ,
    `hire_date` DATE  NOT NULL ,
    PRIMARY KEY (
        `emp_no`
    ),
    CONSTRAINT `uc_employees_emp_title` UNIQUE (
        `emp_title`
    )
);
DELETE FROM `employees`
INSERT INTO `employees` VALUES (473302,'s0001','2000-07-25','Hideyuki','Zallocco','M','1990-04-28'),
				(475053,'e0002','1954-11-18','Byong','Delgrande','F','1991-7-9'),
				(461591,'s0002','1964-11-17','Xudong','Samarati','M','1985-11-13'),
				(13616,'e0003','1961-8-30','Perry','Lorho','F','1991-8-3'),
				(240129,'e0004','1952-8-11','Roddy','Karnin','M','1985-5-29'),
				(109820,'e0001','1952-11-11','Juichirou','Ghelli','F','1986-12-13'),
				(111877,'m0001','1962-10-18','Xiaobin','Spinelli','F','1991-8-17');

CREATE TABLE `dept_emp` (
    `emp_no` INT  NOT NULL ,  
    `dept_no` VARCHAR(4)  NOT NULL ,     
    PRIMARY KEY (
        `emp_no`,`dept_no`
    )
);

INSERT INTO `dept_emp`
VALUES (473302, 'd002'),
	(475053, 'd004'),
	(461591, 'd002'),
	(13616, 'd005'),
	(240129, 'd006'),
	(109820, 'd005'),
	(111877, 'd009');

CREATE TABLE `dept_manager` (
    `dept_no` VARCHAR(4)  NOT NULL ,
    `emp_no` INT  NOT NULL ,
    PRIMARY KEY (
        `dept_no`,`emp_no`
    )
);

INSERT INTO dept_manager VALUES
    ('d001',110022),
    ('d001',110039),
    ('d002',110085),
    ('d002',110114),
    ('d003',110183),
    ('d003',110228),
    ('d004',110303),
    ('d004',110344),
    ('d004',110386),
    ('d004',110420),
    ('d005',110511),
    ('d005',110567),
    ('d006',110725),
    ('d006',110765),
    ('d006',110800),
    ('d006',110854),
    ('d007',111035),
    ('d007',111133),
    ('d008',111400),
    ('d008',111534),
    ('d009',111692),
    ('d009',111784),
    ('d009',111877),
    ('d009',111939);


CREATE TABLE `salaries` (
    `emp_no` INT  NOT NULL ,
    `salary` INT  NOT NULL ,
    PRIMARY KEY (
        `emp_no`
    )
);
DROP TABLE `titles`
CREATE TABLE `titles` (
    `title_id` VARCHAR(255) NOT NULL ,
    `title` VARCHAR(255)  NOT NULL ,
    PRIMARY KEY (
        `title_id`
    )
);
DELETE FROM titles
INSERT INTO titles VALUES
    ('s0001','Staff'),
    ('s0002','Senior Staff'),
    ('e0001','Assistant Engineer'),
    ('e0002','Engineer'),
    ('e0003','Senior Engineer'),
    ('e0004','Technique Leader'),
    ('m0001','Manager');


ALTER TABLE `dept_emp` ADD CONSTRAINT `fk_dept_emp_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`);

ALTER TABLE `dept_emp` ADD CONSTRAINT `fk_dept_emp_dept_no` FOREIGN KEY(`dept_no`)
REFERENCES `departments` (`dept_no`);

ALTER TABLE `dept_manager` ADD CONSTRAINT `fk_dept_manager_dept_no` FOREIGN KEY(`dept_no`)
REFERENCES `departments` (`dept_no`);

ALTER TABLE `dept_manager` ADD CONSTRAINT `fk_dept_manager_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`);

ALTER TABLE `salaries` ADD CONSTRAINT `fk_salaries_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`);

ALTER TABLE `titles` ADD CONSTRAINT `fk_titles_titles_id` FOREIGN KEY(`title_id`)
REFERENCES `employees` (`emp_title`);