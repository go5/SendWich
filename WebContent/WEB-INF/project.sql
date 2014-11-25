/*
* 작업할때 편하라고 만들어 둔건데 DB 담당자 외 절대로 수정 금지.
* */
/*db 생성 */
CREATE SCHEMA `project` DEFAULT CHARACTER SET utf8 ;
/*테이블 생성 */
CREATE TABLE `project`.`member` (
`member_id` INT NOT NULL AUTO_INCREMENT,
`email` VARCHAR(50) NOT NULL,
`name` VARCHAR(20) NOT NULL,
`phone_number` VARCHAR(20) NOT NULL,
`join_date` DATE NULL,
`password` VARCHAR(50) NULL,
PRIMARY KEY (`member_id`),
UNIQUE INDEX `email_UNIQUE` (`email` ASC));

CREATE TABLE `project`.`location` (
`loc_id` INT NOT NULL AUTO_INCREMENT,
`loc_name` VARCHAR(50) NOT NULL,
gis_x double NOT NULL,
gis_y double NOT NULL,
mmsurl VARCHAR(200) ,
PRIMARY KEY (`loc_id`));

CREATE TABLE `project`.`board` (
`board_id` INT NOT NULL AUTO_INCREMENT,
`member_id` INT NOT NULL,
`title` VARCHAR(60) NOT NULL,
`textarea` TEXT NOT NULL,
`photo` VARCHAR(60)  NULL,
`upload_date` DATE NOT NULL,
`loc_id` INT NULL,
PRIMARY KEY (`board_id`),
INDEX `member_id_idx` (`member_id` ASC),
INDEX `location_id_idx` (`loc_id` ASC),
CONSTRAINT `FK_board_member`
FOREIGN KEY (`member_id`)
REFERENCES `project`.`member` (`member_id`)
ON DELETE RESTRICT
ON UPDATE RESTRICT,
CONSTRAINT `FK_board_loc`
FOREIGN KEY (`loc_id`)
REFERENCES `project`.`location` (`loc_id`)
ON DELETE RESTRICT
ON UPDATE RESTRICT
);

CREATE TABLE project.reply (
`reply_id` int(11) NOT NULL AUTO_INCREMENT,
`member_id` int(11) NOT NULL,
`board_id` int(11) NOT NULL,
`reply_date` date NOT NULL,
`reply_text` text NOT NULL,
PRIMARY KEY (`reply_id`),
CONSTRAINT `FK_reply_1`
FOREIGN KEY (`member_id`)
REFERENCES `project`.`member` (`member_id`)
ON DELETE RESTRICT
ON UPDATE RESTRICT,
CONSTRAINT `FK_reply_2`
FOREIGN KEY (`board_id`)
REFERENCES `project`.`board` (`board_id`)
ON DELETE RESTRICT
ON UPDATE RESTRICT
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE project.pq_board (
`board_id` int(11) NOT NULL AUTO_INCREMENT,
`member_id` int(11) NOT NULL,
`title` varchar(60) COLLATE utf8_bin NOT NULL,
`textarea` varchar(200) COLLATE utf8_bin NOT NULL,
`photo` varchar(45) COLLATE utf8_bin NOT NULL,
`upload_date` date NOT NULL,
`answer` varchar(60) COLLATE utf8_bin NOT NULL,
PRIMARY KEY (`board_id`),
CONSTRAINT `fk_pq1_idx`
FOREIGN KEY (`member_id`)
REFERENCES `project`.`member` (`member_id`)
ON DELETE RESTRICT
ON UPDATE RESTRICT
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE project.pq_reply (
`reply_id` int(11) NOT NULL AUTO_INCREMENT,
`member_id` int(11) NOT NULL,
`board_id` int(11) NOT NULL,
`reply_date` date DEFAULT NULL,
`reply_field` varchar(60) COLLATE utf8_bin DEFAULT NULL,
PRIMARY KEY (`reply_id`),
CONSTRAINT `fk_pqr1_idx`
FOREIGN KEY (`board_id`)
REFERENCES `project`.`pq_board` (`board_id`)
ON DELETE RESTRICT
ON UPDATE RESTRICT,
CONSTRAINT `fk_pqr2_idx`
FOREIGN KEY (`member_id`)
REFERENCES `project`.`member` (`member_id`)
ON DELETE RESTRICT
ON UPDATE RESTRICT
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE project.chart (
`chart_id` int(11) NOT NULL AUTO_INCREMENT,
`board_id` int(11) NOT NULL,
`loc_id` int(11) NOT NULL,
`eva_type` varchar(45) COLLATE utf8_bin NOT NULL,
`eva_key` varchar(45) COLLATE utf8_bin NOT NULL,
`eva_value` int(11) NOT NULL,
PRIMARY KEY (`chart_id`),
CONSTRAINT `FK_chart1_idx`
FOREIGN KEY (`board_id`)
REFERENCES `project`.`board` (`board_id`)
ON DELETE RESTRICT
ON UPDATE RESTRICT,
CONSTRAINT `FK_chart2_idx`
FOREIGN KEY (`loc_id`)
REFERENCES `project`.`location` (`loc_id`)
ON DELETE RESTRICT
ON UPDATE RESTRICT
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE project.friends (
member_id INT NOT NULL,
friend_id INT NOT NULL,
invited int not null DEFAULT '0',
CONSTRAINT FK_friends_1
FOREIGN KEY(member_id)
REFERENCES project.member (member_id)
ON DELETE RESTRICT
ON UPDATE RESTRICT,
CONSTRAINT FK_friends_2
FOREIGN KEY (friend_id)
REFERENCES project.member (member_id)
ON DELETE RESTRICT
ON UPDATE RESTRICT
);
CREATE TABLE project.message (
msg_id integer NOT NULL AUTO_INCREMENT,
sender_id INTEGER UNSIGNED NOT NULL,
reciever_id INTEGER UNSIGNED NOT NULL,
textarea TEXT NOT NULL,
send_date DATE NOT NULL,
PRIMARY KEY (msg_id),
CONSTRAINT FK_message_1
FOREIGN KEY (sender_id)
REFERENCES project.member (member_id)
ON DELETE RESTRICT
ON UPDATE RESTRICT,
CONSTRAINT FK_message_2
FOREIGN KEY (reciever_id)
REFERENCES project.member (member_id)
ON DELETE RESTRICT
ON UPDATE RESTRICT
);
/*테스트용 값 삽입*/
/*멤버*/
INSERT INTO `project`.`member` (`email`, `name`, `phone_number`, `join_date`, `password`) VALUES ('test', '김영준', '01047874352', '141010', 'MTIzNA==');
INSERT INTO project.member(email, name, phone_number,join_date,password) Values("saint_kyj@naver.com","김영준", "07075911436",DATE_FORMAT("14.09.04","%y%m%d"),"MTIzNA==");
/*친구*/
INSERT INTO project.friends VALUES(1, 2, 0);
INSERT INTO project.friends VALUES(2, 1, 0);
/*지역*/
INSERT INTO project.location(loc_name, gis_x, gis_y) VALUES("SendWich",0,0);
/*글*/
INSERT INTO project.board(member_id,title, textarea,upload_date)
VALUES(1,"공지입니다","관리잡니다. 관리자용 공지 테스트입니다.",DATE_FORMAT("14.10.11","%y%m%d"));
INSERT INTO project.board(member_id,title, textarea,upload_date,loc_id)
VALUES(1,"테스트","내용 무",DATE_FORMAT("14.10.12","%y%m%d"),1);
/*평가*/
INSERT INTO project.chart(board_id, loc_id, eva_type,eva_key,eva_value) VALUES(2,1,"분위기","조용함",5);
INSERT INTO project.chart(board_id, loc_id, eva_type,eva_key,eva_value) VALUES(2,1,"분위기","엄숙함",3);
INSERT INTO project.chart(board_id, loc_id, eva_type,eva_key,eva_value) VALUES(2,1,"분위기","아즈넉함",7);
/*댓글*/
INSERT INTO project.reply(member_id, board_id,reply_date,reply_text) VALUES(2,1,DATE_FORMAT("141012","%y%m%d"),"넹");
INSERT INTO project.reply(member_id, board_id,reply_date,reply_text) VALUES(2,1,DATE_FORMAT("141012","%y%m%d"),"첫번째 댓글인가");
INSERT INTO project.reply(member_id, board_id,reply_date,reply_text) VALUES(2,1,DATE_FORMAT("141012","%y%m%d"),"아니용");
INSERT INTO project.reply(member_id, board_id,reply_date,reply_text) VALUES(2,1,DATE_FORMAT("141012","%y%m%d"),"그래용");
/*쪽지*/
INSERT INTO project.message(sender_id, reciever_id, textarea, send_date) VALUES(1,2,"널 믿었던 만큼 난 내 친구도 믿었기에",DATE_FORMAT("141010","%y%m%d"));
INSERT INTO project.message(sender_id, reciever_id, textarea, send_date) VALUES(2,1,"남들보다 빠르게 난 남들보다 다르게",DATE_FORMAT("141010","%y%m%d"));