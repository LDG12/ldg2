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

8/26
1. schedule의 수업들 처리하는 로직 변경 (함수 생성)
2. rowspan 속성 이용해서 최대 4교시까지 처리 가능
3. 시간표 택1(여러 시간표 중 하나 고르는 것) 구현중중

8/28
1. 좌측 aside영역 현재 시간표, 가지고있는 시간표 목록 구현
2. 현재 시간표의 이수 학점 구현
3. 시간표 링크 구현예정정

8/29
1. 현재 시간표 이수학점에서 전공과 교양이 각각 몇학점인지 표현
2. 시간표 생성 버튼 및 생성 구현
2-1 에브리타임 홈페이지 확인 결과 3개의 시간표(test, test2, 임시)가 있을 때 새로운 시간표를 누르면 '시간표1'이 생성됨
2-2 해당 내용에 따라 schedule_set과 schedule_name을 기존 갖고있는 시간표와 비교하여 로직 생성
3. 현재 시간표의 이름(schedule_name)을 통해 db의 schedule_set을 읽어와서 추가한 과목에 값 부여까지 구현
4. 근데 생각해보니 동일 이름의 시간표가 db에 있을 수 있으니 시간표이름 + 사용자id의 map형식으로 db 조회를 해야함함

8/30
1. 시간표 생성 로직 완성
2. 시간표 조회(시간표1, 시간표2 등등 여러 시간표로 조회) 완성
3. 이제 시간표별로 수업 넣을떄 오류없게 해야하고, subejct/read 실행시 schedule/read로 이동하는것 완성해야함함

8/31
1. 시간표별 수업 삽입시 schedule_set을 통해 validation 과정 오류가 안나게 변경
2. 시간표 이름 변경 구현
3. subject/read시 model을 통해 데이터를 전달하던 것을 ajax로 변경
4. 시간표 삭제 구현중중

9/1
1. 시간표 삭제 구현 완료
2. 회원가입하면 schedule_set = 1, schedule_name ="시간표 1"로 초기화 설정 구현
3. 그런데 계정 한개로만 테스트해서 insert 부분 로직에 에러 발생. 해당 내용 수정중

9/2
** AWS E2C에 해당 웹 서버 배포 후 테스트 진행 (여러 사용자가 사용하는 것으로 발견하지 못한 에러 색출을 위해서임)
1. 로그인창 id placeholder '이메일'이 아닌 'id'로 수정
2. 시간표 생성 후 list_schedule2의 리스트 내용을 추가하도록 수정
3. 시간표 이름 변경 후 시간표를 추가할때 로직 변경
- 기존 : startWith("시간표 ")를 통해 list를 저장하고, list의 size만큼 정수를 저장하는 array를 만들었는데 시간표의 이름이 "시간표 "로 시작하지 않으면 array에 빈공간이 발생
- vallList를 통해 "시간표 "로 시작하는 시간표들의 이름을 저장하고, 해당 size에 맞게 array를 생성함. 이후 array를 정렬하여 가장 낮은 숫자로 시간표를 생성하도록 변경
4. 시간표 이름을 변경(update)하고 나서 now_schedule(현재 시간표 이름)에 적용되지 않던 것 해결
5. 1,2교시 수업이 아닌 1~4교시까지 수업이 있을 경우 Cell을 업데이트 하는 과정에서 now_Schedule의 split 문제 발생. 해당 내용 수정
6. 시간표가 1개일때 해당 시간표를 삭제하면 해당 scheudle_set에 해당하는 과목 모두 삭제 / "시간표 1", schedule_set =1로 초기화하여 시간표를 생성하는것 구현 중중

9/3
1. 시간표 1개일때 삭제시, "시간표 1"과 schedule_set 1로 초기화 하는 로직 구현
2. select 태그의 option으로 "1학기", "2학기" 등등 semester를 넣음
3. semester별 스케쥴 구현중중

9/4
1. jsp view에서 jquery와 javascript 구현중
2. 현재 학점계산기 테이블과 학점 계산기능 구현 완료
3. 이제 db부터 시작해서 dto, dao, service, controller 진행 예정

9/4
1. schedule_semester( "학기" )에 의한 내용을 추가하여 전반적인 수정 진행
2. UpdateCell, UpdateSchedule_list, UpdateMajorAndCredit 등 <select> 태그의 <option>으로 각 학기를 선택할 경우에 대한 기능을 추가하고 수정
3. 시간표 이름 변경, 시간표 삭제시 학기별 기능 구현
4. 학점 계산기(Credit Calculator) 구현중, 현재 전반적인 html이랑 css 진행중(에브리타임 카피)

9/5
1. calculator table, dto, dao, service 생성
2. view로부터 subject_name, credit, grade, major, cell_place를 controller에 보내고, 이를 통해 service에서 작업중
3. 만약 해당 cell_place에 이미 등록이 되어있다면 update를 진행, 등록된게 없다면 insert진행으로 구현중중


9/6
1. update와 insert 구현 완료
2. 1학년 1학기 -> 2학년 1학기 등, 다른 semester로 넘어가면 자동 update와 insert
3. 추가로 semester에 대한 gpa, majorGpa, acqisition과 전체 성적에 대한 gpa, majorgpa, acqusition 구현완료
4. 그래프 생성중이고 전체 학점에 따른 그래프 생성 구현중중


9/8
1. 학점계산기 구현 완료
2. 전체학점(전체 학기에 대한 성적)에 따라 각 학기별 평점이 그래프에 line으로 표시
3. 이후 각 grade가 몇%를 차지하는지 ul로 표기
4. css 손보는중중

9/9
1. 회원가입을 새로 해서 다시 테스트 해본 결과 오류가 매우 많아 수정작업 진행함
2. 회원가입 진행시 Schedule_info에 가장 최근 학기("2023 겨울학기")를 기준으로 새롭게 하나 만들어서 생성
3. readMajor, readCredit에 관한 함수가 Schedule_name을Load하는 과정이 끝나기 전에 계속 실행되어, 해당 내용의 순서 조정
4. Schedule_delete에 있어, semester에 대한 내용이 빠져있어 추가
5. Calculator에 전체 셀 초기화, 해당 row 셀 초기화 기능 추가
6. RegisterForm, Schedule, Calculator css 다듬기 완료료
