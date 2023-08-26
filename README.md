# ldg2
에브리타임 어플 -> 웹

8/13 브라우저 로그인 -> db 확인 -> 성공 or 실패 구현

8/14
1. 회원가입 성공시 DB 저장 및 메인 화면으로 이동
2. 이메일 인증 기능 구현, 이메일로 인증번호 전송까지는 성공했으나 인증이 안됨

8/16
1. 이메일로 온 인증번호를 비교해 회원가입 기능 구현
2. 비밀번호 찾기 구현하다 끝
3. View에서 받아온 한글이 인식이 안됨 왜지

8/17
1. 비밀번호 찾기 기능 구현(아이디, 이메일 validate 이후 해당 아이디와 이메일을 가진 user의 password를 set하고 update)
2. 게시판(Board)와 관련된 Dto, Dao, My-batis, DB 구현
3. boardList에 게시물이 뜨게 하긴 했는데 페이징이 안됨 -> 1페이지면 10개, 2페이지면 다음 10개인데 안움직임


8/18
1. 게시물 읽기, 쓰기, 삭제, 수정 기능
2. 검색기능 구현까지 했음
3. 그런데 검색어 결과가 1개의 board라도 아래의 paging이 10개가 다 나옴. begin이랑 end를 봐야할듯

8/19
1. 검색을 한 상태에서도 페이징 완료
2. 댓글 Dao, Dto, Service 생성
3. 댓글 컨트롤러 작성중

8/20
1. 댓글 read, write 구현 완료
2. 그런데 삭제가 잘 안됨. 수정도 구현해야함

8/21
1. 댓글 remove, modify 구현 완료
2. remove가 안됐던 이유는 form의 action이랑 method 관련한 자바스크립트, j쿼리 사용법 미숙
3. modify도 해당 사항 미숙으로 시간이 너무 걸림

8/22
1. 수강생이 브라우저에서 수강할 과목인 Subject 테이블이랑 dto, dao, service 생성
2. 수강생의 시간표인 Schedule 테이블, dto, dao, service 생성
3. view에서 'search'버튼을 누르면 subject에 있는 과목들이 테이블로 나오게 구현
4. 해당 과목을 누르면 시간표에 적용이 되게 해야함

8/23
1. subject에 들어있는 목록들을 누르면 schedule db에 insert 하는것 구현
2. 만약 같은 요일, 같은 시간에 이미 과목이 있다면 insert 못하게 구현
3. 해당 schedule을 read해서 테이블 background에 맞게 설정해야함

8//24
1. 페이지가 로딩되면 schedule을 read하는 것 구현
2. read한 내용을 바탕으로 해당 subject의 요일, 시간에 따라 background-color 변경 구현
3. 색상 변경을 위한 테이블 color_info 생성(sno << schedule 외래키 / sid << user_info의 외래키) Dto, Dao, Service 생성완료
4. 과목표에서 해당 과목을 고르면 바로 read하여 background-color 변경 구현
5. 추가로 insert 하자 마자 해당 위치에 버튼생기도록 만듬
6. 이제 버튼(delete)을 누르면 해당 과목이 스케쥴에서 삭제되도록 해야함

8/25
1. delete 기능 구현. schdule이랑 color_info에서 둘다 삭제 구현함.
2. schedule이랑 subject에 day와 hour을 최대 4개까지 증가. ----> 전공수업은 주로 월1,월2,월3,월4 이렇게 4교시 이어서 할때도 있으니까.
3. 수업이 4교시까지만 있는게 아닌 1,2교시만 있다면 null값을 넣어 해결
4. 근데 아직 4교시 수업을 넣으면 셀에 3칸밖에 차지를 안함. 4칸 다 들어오게 해야함.
