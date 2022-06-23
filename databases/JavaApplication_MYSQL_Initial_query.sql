create table if not exists `javabase`.`users` (
	`id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `phoneNumber` INT(20) NOT NULL,
    `active` TINYINT(1), 
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `login_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted_at` DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER Table `javabase`.`users` add PRIMARY KEY(`id`);

INSERT into `javabase`.`users` (`id`,`name`,`phoneNumber`,`active`,`created_at`,`login_at`,`deleted_at`) VALUES(1,'Q Khan',0305,0,'2022-06-22 06:22:22','2022-06-22 06:22:22','2022-06-22 06:22:22' );

select * from `javabase`.`users`