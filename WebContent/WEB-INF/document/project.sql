/*
* �۾��Ҷ� ���϶�� ����� �аǵ� DB ����� �� ����� ���� ����.
* */
/*db ���� */
CREATE SCHEMA `project` DEFAULT CHARACTER SET utf8 ;
/*���̺� ���� */
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
/*�׽�Ʈ�� �� ����*/
/*���*/
INSERT INTO `project`.`member` (`email`, `name`, `phone_number`, `join_date`, `password`) VALUES ('test', '�迵��', '01047874352', '141010', 'MTIzNA==');
INSERT INTO project.member(email, name, phone_number,join_date,password) Values("saint_kyj@naver.com","�迵��", "07075911436",DATE_FORMAT("14.09.04","%y%m%d"),"MTIzNA==");
/*ģ��*/
INSERT INTO project.friends VALUES(1, 2, 0);
INSERT INTO project.friends VALUES(2, 1, 0);
/*����*/
INSERT INTO project.location(loc_name, gis_x, gis_y) VALUES("SendWich",0,0);
/*��*/
INSERT INTO project.board(member_id,title, textarea,upload_date)
VALUES(1,"�����Դϴ�","������ϴ�. �����ڿ� ���� �׽�Ʈ�Դϴ�.",DATE_FORMAT("14.10.11","%y%m%d"));
INSERT INTO project.board(member_id,title, textarea,upload_date,loc_id)
VALUES(1,"�׽�Ʈ","���� ��",DATE_FORMAT("14.10.12","%y%m%d"),1);
/*��*/
INSERT INTO project.chart(board_id, loc_id, eva_type,eva_key,eva_value) VALUES(2,1,"������","������",5);
INSERT INTO project.chart(board_id, loc_id, eva_type,eva_key,eva_value) VALUES(2,1,"������","������",3);
INSERT INTO project.chart(board_id, loc_id, eva_type,eva_key,eva_value) VALUES(2,1,"������","�������",7);
/*���*/
INSERT INTO project.reply(member_id, board_id,reply_date,reply_text) VALUES(2,1,DATE_FORMAT("141012","%y%m%d"),"��");
INSERT INTO project.reply(member_id, board_id,reply_date,reply_text) VALUES(2,1,DATE_FORMAT("141012","%y%m%d"),"ù��° ����ΰ�");
INSERT INTO project.reply(member_id, board_id,reply_date,reply_text) VALUES(2,1,DATE_FORMAT("141012","%y%m%d"),"�ƴϿ�");
INSERT INTO project.reply(member_id, board_id,reply_date,reply_text) VALUES(2,1,DATE_FORMAT("141012","%y%m%d"),"�׷���");
/*����*/
INSERT INTO project.message(sender_id, reciever_id, textarea, send_date) VALUES(1,2,"�� �Ͼ��� ��ŭ �� �� ģ���� �Ͼ��⿡",DATE_FORMAT("141010","%y%m%d"));
INSERT INTO project.message(sender_id, reciever_id, textarea, send_date) VALUES(2,1,"���麸�� ������ �� ���麸�� �ٸ���",DATE_FORMAT("141010","%y%m%d"));