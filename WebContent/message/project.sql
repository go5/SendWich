CREATE SCHEMA `project` DEFAULT CHARACTER SET euckr COLLATE euckr_korean_ci ;

/*테이블 생성*/
CREATE TABLE `project`.`member` (
  `member_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `phone_number` VARCHAR(20) NOT NULL,
  `join_date` DATE NULL,
  `password` VARCHAR(50) NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
COMMENT = 'member infomation. ';

create Table `project`.`location`(
 `loc_id` INT NOT NULL auto_increment,
 `loc_name` varchar(50) not null,
 PRIMARY KEY (`loc_id`));
 
 CREATE TABLE `project`.`board` (
  `board_id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `title` VARCHAR(60) NOT NULL,
  `textarea` TEXT NOT NULL,
  `photo` BLOB NULL,
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
    REFERENCES `project`.`location` (`loc_name`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
    );
    
CREATE TABLE project.reply (
  member_id INT NOT NULL,
  board_id INT NOT NULL,
  reply_date DATE NOT NULL,
  reply_text TEXT NOT NULL,
  CONSTRAINT FK_reply_1 
	FOREIGN KEY (member_id)
    REFERENCES project.member (member_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT FK_reply_2
	FOREIGN KEY (board_id)
    REFERENCES project.board (board_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
    );

 CREATE TABLE project.evaluation (
  loc_id INT NOT NULL,
  eva_type VARCHAR(30) NOT NULL,
  eva_type_num INT NOT NULL,
  eva_key VARCHAR(20) NOT NULL,
  eva_vlaue INT NOT NULL,
  CONSTRAINT FK_evaluation_1 
	FOREIGN KEY (loc_id)
    REFERENCES project.location (loc_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE project.friends (
  member_id INT NOT NULL,
  friend_id INT NOT NULL,
  CONSTRAINT FK_friends_1 
	FOREIGN KEY(member_id)
    REFERENCES project.member (member_id)
    ON DELETE restrict
    ON UPDATE RESTRICT,
  CONSTRAINT FK_friends_2 
	FOREIGN KEY (friend_id)
    REFERENCES project.member (member_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
    );

CREATE TABLE project.message (
  sender_id INTEGER UNSIGNED NOT NULL,
  reciever_id INTEGER UNSIGNED NOT NULL,
  textarea TEXT NOT NULL,
  send_date DATE NOT NULL,
  CONSTRAINT FK_message_1
	FOREIGN KEY (sender_id)
    REFERENCES prooject.member (member_id)
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
INSERT INTO `project`.`member` (`email`, `name`, `phone_number`, `join_date`, `password`) VALUES ('keispacce.kyj@gmail.com', 'evan', '01047874352', '141010', '1234');

INSERT INTO project.member(email, name, phone_number,join_date,password) Values("saint_kyj@naver.com","김영준", "07075911436",DATE_FORMAT("14.09.04","%y%m%d"),"1234"); 

/*친구*/
INSERT INTO friends VALUES(1, 2);

INSERT INTO friends VALUES(2, 1);

/*지역*/
INSERT INTO location(loc_name) VALUES("종묘");

/*글*/
INSERT INTO board(member_id,title, textarea,upload_date) 
 VALUES(1,"공지입니다","관리잡니다. 관리자용 공지 테스트입니다.",DATE_FORMAT("14.10.11","%y%m%d"));

INSERT INTO board(member_id,title, textarea,upload_date,loc_id) 
 VALUES(1,"테스트","내용 무",DATE_FORMAT("14.10.12","%y%m%d"),1);

/*평가*/
INSERT INTO evaluation VALUES(1,"분위기",1,"조용함",5);

INSERT INTO evaluation VALUES(1,"분위기",2,"엄숙함",3);

INSERT INTO evaluation VALUES(1,"분위기",3,"아즈넉함",7);

/*댓글*/
INSERT INTO reply VALUES(2,1,DATE_FORMAT("141012","%y%m%d"),"넹");

INSERT INTO reply VALUES(1,1,DATE_FORMAT("141013","%y%m%d"),"테스트 공진데 리플 ㄴㄴ");

INSERT INTO reply VALUES(2,1,DATE_FORMAT("141013","%y%m%d"),"넹~");

INSERT INTO reply VALUES(1,1,DATE_FORMAT("141013","%y%m%d"),"-__-;;");

/*쪽지*/
INSERT INTO message VALUES(1,2,"널 믿었던 만큼 난 내 친구도 믿었기에",DATE_FORMAT("141010","%y%m%d"));

INSERT INTO message VALUES(2,1,"남들보다 빠르게 난 남들보다 다르게",DATE_FORMAT("141010","%y%m%d"));

