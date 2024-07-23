
-- 회원 삽입
INSERT INTO tbl_member (member_id, password, email, created_at, updated_at, active_yn) VALUES
(1, 'qswedlmer!ml3$5', '1etterh.dev@gmail.com', NOW(), NOW(), TRUE),
(2, 'sdqwlmlkjop3$13', 'ksr6505@gmail.com', NOW(), NOW(), TRUE),
(3, 'apklekopokopva$', 'rlfgks97@gmail.com', NOW(), NOW(), TRUE),
(4, 'jlifenwjksnc,sj', 'caolian2003@gmail.com', NOW(), NOW(), TRUE),
(5, 'dasdasdlwkqjked', 'wjdwnstj0810@gmail.com', NOW(), NOW(), TRUE),
(6, 'kdfoigodfkdllsf', 'kdfoigod@gmail.com', NOW(), NOW(), TRUE),
(7, 'glkdjsfwdfdfslk', 'glkidjgg@gmail.com', NOW(), NOW(), TRUE), 
(8, 'pkmoffneklffkms', 'pkmodk@gmail.com', NOW(), NOW(), TRUE),
(9, 'obnelwkdpfnrkew', 'donrkldk@gmail.com', NOW(), NOW(), TRUE),
(10, 'lekfinkllsklkef', 'leksdif@gmail.com', NOW(), NOW(), TRUE),
(11, 'glkenofnsklelkf', 'bknlwen@gmail.com', NOW(), NOW(), TRUE),
(12, 'xdiorelkfflskdm', 'adagag@gmail.com', NOW(), NOW(), TRUE), 
(13, 'blknewdlflejwle', 'ljnflwje@gmail.com', NOW(), NOW(), TRUE),
(14, 'gkm@#fkanonflke', 'kbjnwjef@gmail.com', NOW(), NOW(), TRUE),
(15, 'oprnfngoenwklwe', 'akej@gmail.com', NOW(), NOW(), TRUE);

-- 프로필 삽입
INSERT INTO tbl_profile (profile_member_id, introduction, profile_image, nickname, soft_skill, created_at, updated_at, active_yn) VALUES
(1, '안녕하세요 김서현입니다~', NULL, '김서현', '타자가 빨라요', NOW(), NOW(), TRUE),
(2, '안녕하세요 김소리입니다!', NULL, '김소리', '다양한 커뮤니케이션 화법이 있어요', NOW(), NOW(),TRUE),
(3, '안녕하세요 용길한입니다 :)', 'https://사진/본인이미지', '용길한', NULL, NOW(), NOW(), TRUE),
(4, '안녕하세요 장민근입니다 ^^', NULL, '장민근', '시간관리 정말 잘합니다', NOW(), NOW(), TRUE),
(5, '안녕하세요 정준서입니다 ㅇㅅㅇ', 'https://문서/사진/이미지', '정준서', NULL, NOW(), NOW(), TRUE), 
(6, '안녕하세요 서한준입니다~', NULL, '서한준', '타자가 빨라요', NOW(), NOW(), TRUE),
(7, '안녕하세요 주정한입니다!', NULL, '주정한', '다양한 커뮤니케이션 화법이 있어요', NOW(), NOW(),TRUE),
(8, '안녕하세요 소주현입니다 :)', 'https://사진/본인이미지', '소주현', NULL, NOW(), NOW(), TRUE),
(9, '안녕하세요 표영주입니다 ^^', NULL, '표영주', '시간관리 정말 잘합니다', NOW(), NOW(), TRUE),
(10, '안녕하세요 홍나연입니다 ㅇㅅㅇ', 'https://문서/사진/이미지', '홍나연', NULL, NOW(), NOW(), TRUE), 
(11, '안녕하세요 11번님입니다~', NULL, '11번님', '타자가 빨라요', NOW(), NOW(), TRUE),
(12, '안녕하세요 추지훈입니다!', NULL, '추지훈', '다양한 커뮤니케이션 화법이 있어요', NOW(), NOW(),TRUE),
(13, '안녕하세요 서가을입니다 :)', 'https://사진/본인이미지', '서가을', NULL, NOW(), NOW(), TRUE),
(14, '안녕하세요 박다은입니다 ^^', NULL, '박다은', '시간관리 정말 잘합니다', NOW(), NOW(), TRUE),
(15, '안녕하세요 김종현입니다 ㅇㅅㅇ', 'https://문서/사진/이미지', '김종현', NULL, NOW(), NOW(), TRUE); 

-- 태그 삽입
INSERT INTO tbl_tag (tag_id, tag_name, tag_type) VALUES
(1, 'spring boot', 'stack'),
(2, 'mariaDB', 'stack'),
(3, 'java', 'stack'),
(4, 'vue.js', 'stack'),
(5, 'Figma', 'stack'),
(6, 'back-end', 'position'),
(7, 'front-end', 'position'),
(8, 'full-end', 'position');

-- 프로필 별 skill 삽입
INSERT INTO tbl_skill(skill_id, url, tag_id, member_id) VALUES
(1, 'github/spring_boot',1,1),
(2, 'github/mariaDB',2,1),
(3, 'github/java',3,1),
(4, 'github/vue.js',4,1),
(5, 'github/Figma',5,1),
(6, 'github/back-end',6,1),
(7, 'github/front-end',7,1),
(8, 'github/spring_boot',1,2),
(9, 'github/mariaDB',2,2),
(10, 'github/java',3,2),
(11, 'github/vue.js',4,2),
(12, 'github/Figma',5,2),
(13, 'github/back-end',6,2),
(14, 'github/front-end',7,2),
(15, 'github/full-stack',8,2),
(16, 'github/vue.js',4,3),
(17, 'github/Figma',5,3),
(18, 'github/front-end',7,3),
(19, 'github/spring_boot',1,4),
(20, 'github/mariaDB',2,4),
(21, 'github/java',3,4),
(22, 'github/back-end',6,4),
(23, 'github/spring_boot',1,5),
(24, 'github/vue.js',4,5);

-- 팀 삽입
INSERT INTO tbl_team (team_id, introduction, created_at, updated_at, active_yn) VALUES
(1, '일조하겠습니다 - 안녕하세요!! 저희는 개발만을 위해 사는 사람들입니다.', NOW(), NOW(), TRUE),
(2, '코미사 - 안녕하세요. 코딩에 미친 사람 모임입니다.', NOW(), NOW(), TRUE),
(3, '자바를 자바 - 자바 좋아하는사람 모여~~', NOW(), NOW(), FALSE),
(4, '잠은 죽어서 자 - 자는 시간 아깝다. 개발해라', NOW(), NOW(), TRUE),
(5, '졸려!!! - 자고싶어!!!', NOW(), NOW(), FALSE),
(6, '커피수혈시급 - 1일 4커피 하면서 공모전 준비하실 분', NOW(), NOW(), TRUE),
(7, 'ai리오너라 - 인공지능 공모전 나가자!!', NOW(), NOW(), TRUE),
(8, '배고파요밥주세요 - IoT 하자', NOW(), NOW(), FALSE),
(9, '작당모의 - 네카라쿠배당토작!!!', NOW(), NOW(), TRUE),
(10, '라이언 귀여워 - 라이언이 나라다', NOW(), NOW(), TRUE);

-- 팀 멤버 삽입 (‼️ 0: 팀장 / 1: 팀원)
INSERT INTO tbl_team_member (member_id, team_id, team_role, created_at, updated_at, active_yn) VALUES
-- 0: 팀장 , 1: 팀원
(1, 1, 1, NOW(), NOW(), TRUE),
(1, 4, 1, NOW(), NOW(), TRUE),
(1, 10, 0, NOW(), NOW(), TRUE),
(2, 1, 1, NOW(), NOW(), TRUE),
(2, 5, 1, NOW(), NOW(), TRUE),
(3, 1, 0, NOW(), NOW(), TRUE),
(3, 6, 1, NOW(), NOW(), TRUE),
(4, 1, 1, NOW(), NOW(), TRUE),
(4, 7, 0, NOW(), NOW(), true),
(5, 1, 1, NOW(), NOW(), FALSE),
(5, 8, 0, NOW(), NOW(), FALSE),
(6, 2, 1, NOW(), NOW(), TRUE),
(7, 2, 1, NOW(), NOW(), FALSE),
(8, 2, 0, NOW(), NOW(), TRUE),
(9, 3, 0, NOW(), NOW(), FALSE),
(10, 3, 1, NOW(), NOW(), FALSE),
(11, 9, 1, NOW(), NOW(), FALSE),
(11, 5, 0, NOW(), NOW(), FALSE),
(12, 4, 0, NOW(), NOW(), TRUE),
(13, 10, 1, NOW(), NOW(), FALSE),
(14, 6, 0, NOW(), NOW(), TRUE),
(15, 7, 1, NOW(), NOW(), TRUE),
(15, 8, 1, NOW(), NOW(), FALSE),
(15, 9, 0, NOW(), NOW(), TRUE);

-- 요청 삽입
INSERT INTO tbl_request (request_id, sender_nickname, receiver_nickname, read_checked, member_id, team_id, created_at, updated_at, active_yn) VALUES
(1, '김서현', '11번님', TRUE, 1, 5, NOW(), NOW(), TRUE),
(2, '김소리', '정준서', FALSE, 2, 8, NOW(), NOW(), TRUE);

-- 권한 삽입
INSERT INTO tbl_auth (auth_name, created_at, updated_at, active_yn)
VALUES ('master', NOW(), NOW(), TRUE),
       ('admin', NOW(), NOW(), TRUE),
       ('user', NOW(), NOW(), TRUE),
       ('undefined', NOW(), NOW(), TRUE),
       ('guest', NOW(), NOW(), TRUE);

-- 회원 별 권한
INSERT INTO tbl_member_auth(member_id, auth_id) VALUES 
(1,1),(1,2),(1,3),(1,4),
(2,3),(2,4),
(3,1),(3,2),(3,3),(3,4),
(4,2),(4,1),(4,3),(4,4),
(5,3),(5,4);

-- 게시글
-- 멤버가 게시글을 쓰는 INSERT 문
INSERT INTO tbl_post (title, content, post_type, member_id, created_at, updated_at, active_yn)
VALUES 
    ('잠은 죽어서 자라아아아아', '싫으시면 바로 죽여드리죠', 'recruit', 8, NOW(), NOW(), TRUE),
    ('일조하겠습니다 구인글', '사람 구합니다. 너무 힘들어요. 문서작업해주세요 제발요ㅛ', 'recruit', 3, NOW(), NOW(), TRUE),
    ('라이언 귀엽군요 저희랑 함께하시죠', '라이언 만나러 사바나 가실 분 구합니다. 목숨은 알아서 지키기', 'recruit', 9, NOW(), NOW(), TRUE),
    ('코미사 구인', '코드에 미친 사람만 모집합니다. 안미쳐도 미치게 만들어 드려요 싱싱한 뇌만 가지고 오세요', 'recruit', 12, NOW(), NOW(), TRUE),
    ('자바자바 자바라', '갈고리 들고 자바 개발자 기다리는중', 'recruit', 11, NOW(), NOW(), TRUE),
    ('잠에 미친 개발자들 모집중!@@@@@', '하루 평균 수면 시간 20시간인 팀원들과 공모전 진행해보죠', 'recruit', 14, NOW(), NOW(), TRUE),
    ('체내 70%가 카페인으로 이루어진 사람을 모집합니다', '주사기로 피 빼시면 커피가 나올 때까지 굴려드립니다', 'recruit', 4, NOW(), NOW(), TRUE),
    ('AI를 노비로 부리고 싶은 human들은 어서 우리 배에 올라타시게', '인간시대의 영광을 되찾기 위한 프로젝트입니다. AI 척살이 저희 팀의 목표에요', 'recruit', 5, NOW(), NOW(), TRUE),
    ('헝그리정신으로 취업시장 극복하자', '취업때까지 단식을 진행하고 있습니다. 굶어죽기 싫으면 취업해야되겠죠 ^^?', 'recruit', 15, NOW(), NOW(), TRUE),
    ('!@#$ 작당모의 $#@!', '누가 좀 만들어주세요', 'recruit', 1, NOW(), NOW(), TRUE), 
    ('제발 읽어주세요.', '팀원이 너무 마음에 안드는데 강퇴를 어떻게 하는지 모르겠습니다.', 'ask', 1, NOW(), NOW(), TRUE),
    ('유료변환', '이거 나중에 유료로 바뀌는거 아니죠?? 안바꼈음 좋겠는데...', 'ask', 1, NOW(), NOW(), TRUE),
    ('요청이 있습니다', '기능이 좀 더 많아졌으면 좋겠어요', 'ask', 1, NOW(), NOW(), TRUE),
    ('공개 SW 개발자 대회', '링크는 알아서 찾으시고, 많은 참여는 부탁드려요~.', 'contest', 3, NOW(),NOW(),TRUE),
    ('새싹톤', '쑥쑥 자라나는 이 나라의 새싹들아 새싹톤에 참가하여 너희의 실력을 드러내보아라! 링크는 깜빡함 ㅎㅎ', 'contest', 3, NOW(), NOW(), TRUE);

-- 팀원 모집 게시글과 팀 맵핑
INSERT INTO tbl_recruit (recruit_post_id, team_id) values
(1,4),
(2,1),
(3,10),
(4,2),
(5,3),
(6,5),
(7,6),
(8,7),
(9,8),
(10,9);

-- 공모전 게시글과 공모전 맵핑
INSERT INTO tbl_contest (contest_post_id, deadline) VALUES
(14, '2024-07-10 18:00:00'),
(15, '3024-07-10 00:00:00');

-- 게시글 별 태그
INSERT INTO tbl_post_tag (post_id, tag_id) VALUES
(1, 1), 
(1, 3), 
(2, 6), 
(5, 3), 
(8, 8);

-- 시험 문항
INSERT INTO tbl_question(question, recruit_post_id) VALUES
('당신의 이름은 무엇인가요?',1),
('당신의 수면시간은 몇시간인가요?',1),
('당신이 만약 하루에 4시간 이상 잔다면 지원을 멈춰주세요', 1),
('서버를 실제 호스팅 해 본 경험이 있으신가여ㅛ?', 10),
('포트포워딩 개념에 대해 설명하시오', 10),
('소켓통신을 활용하여 기능을 구현해봤나요?',10),
('스프링 MVP를 적용하여 프로젝트를 진행했나요?', 10);

-- 시험 답변
INSERT INTO tbl_answer(member_id, question_id, answer, created_at) VALUES
(1,1,'후우...',NOW()),
(1,2,'힘들다...',NOW()),
(1,3,'이제...',NOW()),
(11,4,'충분하지...',NOW()),
(11,5,'않을까??...',NOW()),
(11,6,'흐으윽...',NOW()),
(11,7,'난 아직 살아있디...',NOW());

-- 댓글
INSERT INTO tbl_comment (content, post_id, member_id, created_at, updated_at, active_yn) VALUES
('좋은 공고글이네요!!', 1, 1, NOW(), NOW(), TRUE),
('전공자만 가능인가요??', 1, 2, NOW(), NOW(), TRUE),
('저도 하고싶습니다!', 1, 4, NOW(), NOW(), TRUE),
('ㅇㅅㅇ', 1, 5, NOW(), NOW(), TRUE), 
('비전공자도 가능한가요??', 6, 8, NOW(), NOW(), TRUE),
('하루 평균 수면시간이 20시간이면 시체아닌가요', 6, 10, NOW(), NOW(), TRUE),
('취업때까지 단식이면 그냥 죽으라는건가요ㅜㅅㅜ', 9, 13, NOW(), NOW(), TRUE),
('전 들어가면 굶어죽겠네요..', 9, 7, NOW(), NOW(), TRUE),
('제가 만들겠습니다!!', 10, 4, NOW(), NOW(), TRUE);

-- 신고
INSERT INTO tbl_member_report (report_type, reported_id, reporter_id, created_at) VALUES
('Spam', 8, 2, NOW()),
('Harassment', 8, 4, NOW()),
('Inappropriate Content', 8, 6, NOW()),
('Abuse', 8, 10, NOW());

INSERT INTO tbl_post_report (report_type, reporter_id, post_id, created_at) VALUES
('Harassment', 4, 6, NOW()),
('Abuse', 7, 6, NOW()),
('Abuse', 1, 6, NOW()),
('Abuse', 9, 6, NOW());

-- 스크랩 & 좋아요(‼️ false : 스크랩 / true : 좋아요)
INSERT INTO tbl_scrap_like (member_id, post_id, flag, created_at) VALUES
-- TRUE: like , FALSE: scrap
(1, 1, TRUE, NOW()),
(1, 2, FALSE, NOW()),
(2, 1, TRUE, NOW()),
(3, 3, FALSE, NOW()),
(5, 8, TRUE, NOW()),
(10, 3, TRUE, NOW());
