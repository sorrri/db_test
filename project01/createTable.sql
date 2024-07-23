CREATE TABLE tbl_member (
  member_id INT PRIMARY KEY AUTO_INCREMENT,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  active_yn BOOLEAN NOT NULL
);

CREATE TABLE tbl_auth (
  auth_id INT PRIMARY KEY AUTO_INCREMENT,
  auth_name VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  active_yn BOOLEAN DEFAULT true NOT NULL
);

CREATE TABLE tbl_team (
  team_id INT PRIMARY KEY AUTO_INCREMENT,
  introduction VARCHAR(1023),
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  active_yn BOOLEAN DEFAULT true NOT NULL
);

CREATE TABLE tbl_profile (
  profile_member_id INT PRIMARY KEY,
  introduction VARCHAR(255),
  profile_image VARCHAR(255),
  nickname VARCHAR(255),
  soft_skill VARCHAR(255),
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  active_yn BOOLEAN DEFAULT true NOT NULL
);

CREATE TABLE tbl_team_member (
  member_id INT NOT NULL,
  team_role INT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  active_yn BOOLEAN NOT NULL,
  team_id INT NOT NULL,
  PRIMARY KEY (member_id, team_id)
);

CREATE TABLE tbl_request (
  request_id INT PRIMARY KEY AUTO_INCREMENT,
  sender_nickname VARCHAR(255) NOT NULL,
  receiver_nickname VARCHAR(255) NOT NULL,
  read_checked BOOLEAN DEFAULT FALSE NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  active_yn BOOLEAN NOT NULL,
  member_id INT NOT NULL,
  team_id INT NOT NULL
);

CREATE TABLE tbl_member_report (
  member_report_id INT PRIMARY KEY AUTO_INCREMENT,
  report_type VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  reported_id INT NOT NULL,
  reporter_id INT NOT NULL
);

CREATE TABLE tbl_post (
  post_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  content VARCHAR(1023) NOT NULL,
  post_type VARCHAR(20) NOT NULL COMMENT 'community, ask, notification, contest, recruit',
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  active_yn BOOLEAN NOT NULL,
  member_id INT NOT NULL
);

CREATE TABLE tbl_comment (
  comment_id INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  active_yn BOOLEAN NOT NULL,
  post_id INT NOT NULL,
  member_id INT NOT NULL
);

CREATE TABLE tbl_member_auth (
  member_id INT NOT NULL,
  auth_id INT NOT NULL,
  PRIMARY KEY (member_id, auth_id)
);

CREATE TABLE tbl_scrap_like (
  scrap_like_id INT PRIMARY KEY AUTO_INCREMENT,
  flag BOOLEAN NOT NULL,
  created_at DATETIME NOT NULL,
  member_id INT NOT NULL,
  post_id INT NOT NULL
);

CREATE TABLE tbl_contest (
  contest_post_id INT PRIMARY KEY,
  deadline DATETIME NOT NULL
);

CREATE TABLE tbl_tag (
  tag_id INT PRIMARY KEY AUTO_INCREMENT,
  tag_name VARCHAR(255) NOT NULL,
  tag_type VARCHAR(255) NOT NULL COMMENT 'post, stack'
);

CREATE TABLE tbl_skill (
  skill_id INT PRIMARY KEY AUTO_INCREMENT,
  url VARCHAR(255),
  tag_id INT NOT NULL,
  member_id INT NOT NULL
);

CREATE TABLE tbl_question (
  question_id INT PRIMARY KEY AUTO_INCREMENT,
  question VARCHAR(255) NOT NULL,
  recruit_post_id INT NOT NULL
);

CREATE TABLE tbl_recruit (
  recruit_post_id INT PRIMARY KEY NOT NULL,
  team_id INT NOT NULL
);

CREATE TABLE tbl_answer (
  answer VARCHAR(1023),
  created_at DATETIME NOT NULL,
  member_id INT NOT NULL,
  question_id INT NOT NULL,
  PRIMARY KEY (member_id, question_id)
);

CREATE TABLE tbl_post_report (
  post_report_id INT PRIMARY KEY AUTO_INCREMENT,
  report_type VARCHAR(255) NOT NULL,
  reporter_id INT NOT NULL,
  post_id INT NOT NULL,
  created_at DATETIME NOT NULL
);

CREATE TABLE tbl_post_tag (
  post_id INT NOT NULL,
  tag_id INT NOT NULL,
  PRIMARY KEY (post_id, tag_id)
);

ALTER TABLE tbl_profile ADD FOREIGN KEY (profile_member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_team_member ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_team_member ADD FOREIGN KEY (team_id) REFERENCES tbl_team (team_id);

ALTER TABLE tbl_request ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_request ADD FOREIGN KEY (team_id) REFERENCES tbl_team (team_id);

ALTER TABLE tbl_member_report ADD FOREIGN KEY (reported_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_member_report ADD FOREIGN KEY (reporter_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_post ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_comment ADD FOREIGN KEY (post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_comment ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_member_auth ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_member_auth ADD FOREIGN KEY (auth_id) REFERENCES tbl_auth (auth_id);

ALTER TABLE tbl_scrap_like ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_scrap_like ADD FOREIGN KEY (post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_contest ADD FOREIGN KEY (contest_post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_skill ADD FOREIGN KEY (tag_id) REFERENCES tbl_tag (tag_id) ON DELETE CASCADE;

ALTER TABLE tbl_skill ADD FOREIGN KEY (member_id) REFERENCES tbl_profile (profile_member_id);

ALTER TABLE tbl_question ADD FOREIGN KEY (recruit_post_id) REFERENCES tbl_recruit (recruit_post_id);

ALTER TABLE tbl_recruit ADD FOREIGN KEY (recruit_post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_recruit ADD FOREIGN KEY (team_id) REFERENCES tbl_team (team_id);

ALTER TABLE tbl_answer ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_answer ADD FOREIGN KEY (question_id) REFERENCES tbl_question (question_id);

ALTER TABLE tbl_post_report ADD FOREIGN KEY (reporter_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_post_report ADD FOREIGN KEY (post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_post_tag ADD FOREIGN KEY (post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_post_tag ADD FOREIGN KEY (tag_id) REFERENCES tbl_tag (tag_id) ON DELETE CASCADE;
