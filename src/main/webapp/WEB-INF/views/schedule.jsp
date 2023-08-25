    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page session="true"%>
    <c:set var="loginId" value="${sessionScope.id}"/>
    <c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
    <c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>

    <html>
    <head>
        <meta charset="UTF-8">
        <title>fastcampus</title>
        <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: "Noto Sans KR", sans-serif;
            }


            input {
                width: 100%;
                height: 35px;
                margin: 5px 0px 10px 0px;
                border: 1px solid #e9e8e8;
                padding: 8px;
                background: #f8f8f8;
                outline-color: #e6e6e6;
            }

            textarea {
                width: 100%;
                background: #f8f8f8;
                margin: 5px 0px 10px 0px;
                border: 1px solid #e9e8e8;
                resize: none;
                padding: 8px;
                outline-color: #e6e6e6;
            }

            table{
                width:100%;
                border: 2px solid #d2d2d2;
                border-collapse: collapse;
                font-size: 0.9em;
            }
            th, td{
                border: 1px solid #d2d2d2;
                border-collapse: collapse;
            }
            th{
                height: 5px;
                width : 100px;
            }
            td {
                position: relative;
                width: 200px;
                height: 60px;
            }
            #table-container {
                flex: 1;
                margin: 5px 0 0 4px;
                overflow: hidden; /* 내용이 넘치면 숨김 처리합니다. */
            }
            #container {
                display: flex;
                height: 100vh;
            }
            aside {
                width: 20%;
                height: 50%;
                margin: 5px 0 0 0;
                background-color: #f8f8f8;
            }
            #button-container {
                position: fixed;
                bottom: 5px; /* 아래에서 5px 떨어진 위치 */
                left: 50%; /* 가운데로 이동 */
                transform: translateX(-50%); /* 가운데 정렬 */
                width: 300px; /* 원하는 가로 크기 */
                text-align: center;
                z-index: 1; /* 다른 요소 위에 표시 */
            }

            .shared-btn {
                background-color: rgb(89, 117, 196);
                color: white;
                width: 100%; /* 버튼을 가로 중앙에 맞추기 위해 100%로 설정 */
                height: 50px;
                font-size: 17px;
                border: none;
                border-radius: 5px;
                margin: 0 auto; /* 가운데 정렬 */
            }
            #subjects {
                position: fixed;
                bottom: 0; /* 아래쪽에 밀착되도록 설정 */
                left: 0;
                width: 100%;
                height: 50%; /* 전체 높이의 50% 비중 설정 */
                background-color: #f8f8f8;
                overflow-y: auto; /* 내용이 넘칠 경우 스크롤 표시 */
                box-shadow: 0px -2px 5px rgba(0, 0, 0, 0.1); /* 아래에 그림자 추가 */
            }

            #filter {
                text-align: right;
                padding: 10px;
            }
            .row {
                transition: background-color 0.3s; /* 배경색 변화를 부드럽게 만듭니다. */
                background-color: white; /* 초기 배경색을 설정합니다. */
            }

            .row:hover {
                background-color: #f0f0f0; /* 마우스를 갖다대었을 때의 배경색을 설정합니다. */
            }
            .subject_del{
                display: none;
                position: absolute;
                top : 0;
                right : 0;
                sizd:1px;
            }
            td:hover .subject_del{
                display:block;
            }
        </style>
        <script>
            $(function(){
                var test = $('#subjects').css('display');
                if(test=='block'){
                    $('#searchSubject').css('display', 'none');
                }
            })
        </script>
    </head>
    <body>
    <div id="menu">
        <ul>
            <li id="logo">ldg2</li>
            <li><a href="<c:url value='/'/>">Home</a></li>
            <li><a href="<c:url value='/schedule/test'/>">Schedule</a></li>
            <li><a href="<c:url value='/board/list'/>">Board</a></li>
            <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
            <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
            <li><a href=""><i class="fa fa-search"></i></a></li>
        </ul>
    </div>
    <div id="container">
        <aside>
                <div id="now_Schedule">
                    현재 시간표
                    <button id="loadSchedule" class="shared-btn">시간표 불러오기</button>
                </div>
        </aside>
        <div id="table-container">
            <table height="600" style="color: #121212">
                <caption>▶   강의 시간표  ◀</caption>
                <tr width=19%>
                    <th></th>
                    <th>월</th>
                    <th>화</th>
                    <th>수</th>
                    <th>목</th>
                    <th>금</th>
                </tr>
                <tr class="BRow">
                    <th>오전 9시</th>
                    <td id="mon-1"></td>
                    <td id="tue-1"></td>
                    <td id="wed-1"></td>
                    <td id="thu-1"></td>
                    <td id="fri-1"></td>
                </tr>
                <tr class="BRow">
                    <th>오전 10시</th>
                    <td id="mon-2"></td>
                    <td id="tue-2"></td>
                    <td id="wed-2"></td>
                    <td id="thu-2"></td>
                    <td id="fri-2"></td>
                </tr>
                <tr class="BRow">
                    <th>오전 11시</th>
                    <td id="mon-3"></td>
                    <td id="tue-3"></td>
                    <td id="wed-3"></td>
                    <td id="tur-3"></td>
                    <td id="fri-3"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 12시</th>
                    <td id="mon-4"></td>
                    <td id="tue-4"></td>
                    <td id="wed-4"></td>
                    <td id="tur-4"></td>
                    <td id="fri-4"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 1시</th>
                    <td id="mon-5"></td>
                    <td id="tue-5"></td>
                    <td id="wed-5"></td>
                    <td id="tur-5"></td>
                    <td id="fri-5"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 2시</th>
                    <td id="mon-6"></td>
                    <td id="tue-6"></td>
                    <td id="wed-6"></td>
                    <td id="tur-6"></td>
                    <td id="fri-6"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 3시</th>
                    <td id="mon-7"></td>
                    <td id="tue-7"></td>
                    <td id="wed-7"></td>
                    <td id="tur-7"></td>
                    <td id="fri-7"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 4시</th>
                    <td id="mon-8"></td>
                    <td id="tue-8"></td>
                    <td id="wed-8"></td>
                    <td id="tur-8"></td>
                    <td id="fri-8"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 5시</th>
                    <td id="mon-9"></td>
                    <td id="tue-9"></td>
                    <td id="wed-9"></td>
                    <td id="tur-9"></td>
                    <td id="fri-9"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 6시</th>
                    <td id="mon-10"></td>
                    <td id="tue-10"></td>
                    <td id="wed-10"></td>
                    <td id="tur-10"></td>
                    <td id="fri-10"></td>
                </tr>
            </table>
        </div>
    </div>
    <div id="button-container">
        <form action="<c:url value='/subject/read'/>" method="get">
            <button id="searchSubject" class="shared-btn">수업 목록 찾기</button>
        </form>
    </div>
    <div id="subjects" style="display:${not empty List ? 'block' : 'none'}">
        <div id="filter"><button id="closeSearchSubject" class="shared-btn">닫기</button></div>
        <table>
            <thead>
            <th><div>학수번호</div></th>
            <th><div>교과명목</div></th>
            <th><div>이수</div></th>
            <th><div>학점</div></th>
            <th><div>교수</div></th>
            <th><div>강의 시간</div></th>
            <th><div>강의실</div></th>
            <th><div>정원</div></th>
            <th><div>비고</div></th>
            </thead>
            <tbody>
            <c:if test="${not empty List}">
                <c:forEach var="subjectDto" items="${List}">
                    <tr class="row" id="subjectAdd${subjectDto.course_num}">
                    <form id="addSubject${subjectDto.course_num}" action="" method="">
                    <td><div>${subjectDto.course_num}</div></td>
                    <td><input type="hidden" name="subject_name" value="${subjectDto.subject_name}">${subjectDto.subject_name}</td>
                    <td><input type="hidden" name="major" value="${subjectDto.major}">${subjectDto.major}</td>
                    <td><input type="hidden" name="credit" value="${subjectDto.credit}">${subjectDto.credit}</td>
                    <td><input type="hidden" name="professor" value="${subjectDto.professor}">${subjectDto.professor}</td>
                    <td>
                        <input type="hidden" name="subject_first_day" value="${subjectDto.subject_first_day}">
                        <input type="hidden" name="subject_first_hour" value="${subjectDto.subject_first_hour}">
                        <input type="hidden" name="subject_second_day" value="${subjectDto.subject_second_day}">
                        <input type="hidden" name="subject_second_hour" value="${subjectDto.subject_second_hour}">
                        <input type="hidden" name="subject_third_day" value="${subjectDto.subject_third_day}">
                        <input type="hidden" name="subject_third_hour" value="${subjectDto.subject_third_hour}">
                        <input type="hidden" name="subject_fourth_day" value="${subjectDto.subject_fourth_day}">
                        <input type="hidden" name="subject_fourth_hour" value="${subjectDto.subject_fourth_hour}">
                        <div>
                            ${subjectDto.subject_first_day}${subjectDto.subject_first_hour} ${subjectDto.subject_second_day}${subjectDto.subject_second_hour} ${subjectDto.subject_third_day}${subjectDto.subject_third_hour} ${subjectDto.subject_fourth_day}${subjectDto.subject_fourth_hour}
                        </div>
                    </td>
                    <td><input type="hidden" name="place" value="${subjectDto.place}">${subjectDto.place}</td>
                    <td><div>${subjectDto.nop}</div></td>
                    <td><div>${subjectDto.etc}</div></td>
                    </form>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>
    <script>
        $(document).ready(function(){
            updateCellRe();
            $(document).on('click','.subject_del', function(){
                var arr =$(this).attr('id').split(',');
                var subject_name = arr[0];
                var sno = arr[1];
                var cellID = arr[2];
                var btns = $('[name="'+subject_name+'"]');
                var named = $('.subject-cell-'+sno);
                if(confirm("이 수업을 삭제하시겠습니까?")){
                    deleteSubject(subject_name, sno);
                    named.each(function(){
                        var name = $(this);
                        name.empty();
                        name.removeAttr('style');
                    })
                    // btns.each(function(){
                    //     var btn = $(this);
                    //     var tdElement = btn.parent();
                    //     // var tdID = tdElement.attr('id');
                    //     tdElement.empty();
                    //     tdElement.removeAttr('style');
                    // })
                }
            })
            function deleteSubject(subject_name, sno) {
                $.ajax({
                    url: "<c:url value='/schedule/delete'/>",
                    type: "post",
                    data: {
                        subject_name: subject_name,
                        sno: sno
                    },
                    success: function(response) {
                        if (response == "possible") {
                            alert("수업 삭제에 성공했습니다.");
                            updateCellRe();
                        } else {
                            alert("수업 삭제에 실패했습니다.");
                        }
                    },
                    error: function(error) {
                        alert("시간표 삭제 중 오류가 발생했습니다.");
                    }
                });
            }
<%--            수업 목록 보기 를 누르면 리스트가 나오고, 버튼은 사라지게 만들기--%>
            $('#searchSubject').on('click', function() {
                $('#subjects').css('display', 'block');
                $(this).css('display', 'none');
            });

            $('#closeSearchSubject').on('click', function(){
                $('#subjects').css('display', 'none');
                $('#searchSubject').css('display', 'block');
            });
            //테이블의 행을 누르면 add하기.
            $('tr.row').on('click', function (){
                // $(this).find('td').not(':last-child').on('click', function(){
                var clickedRow = $(this);
                var third_day = $('input[name="subject_third_day"]').val();
                var third_hour=$('input[name="subject_third_hour"]').val();
                var fourth_day = $('input[name="subject_fourth_day"]').val();
                var fourth_hour=$('input[name="subject_fourth_hour"]').val();
                console.log(third_day);
                console.log(third_hour);
                console.log(fourth_day);
                console.log(fourth_hour);
                var formData = {
                    subject_name: clickedRow.find('input[name="subject_name"]').val(),
                    major: clickedRow.find('input[name="major"]').val(),
                    credit: clickedRow.find('input[name="credit"]').val(),
                    professor: clickedRow.find('input[name="professor"]').val(),
                    subject_first_day: clickedRow.find('input[name="subject_first_day"]').val(),
                    subject_first_hour: clickedRow.find('input[name="subject_first_hour"]').val(),
                    subject_second_day: clickedRow.find('input[name="subject_second_day"]').val(),
                    subject_second_hour: clickedRow.find('input[name="subject_second_hour"]').val(),
                    place: clickedRow.find('input[name="place"]').val(),
                    subject_third_day : clickedRow.find('input[name="subject_third_day"]').val(),
                    subject_third_hour :clickedRow.find('input[name="subject_third_hour"]').val(),
                    subject_fourth_day:clickedRow.find('input[name="subject_fourth_day"]').val(),
                    subject_fourth_hour:clickedRow.find('input[name="subject_fourth_hour"]').val(),
                    cell_color : getRandomLightColor(hexColors)
                };
                var formDataV2={
                    subject_name: clickedRow.find('input[name="subject_name"]').val(),
                    major: clickedRow.find('input[name="major"]').val(),
                    credit: clickedRow.find('input[name="credit"]').val(),
                    professor: clickedRow.find('input[name="professor"]').val(),
                    subject_first_day: clickedRow.find('input[name="subject_first_day"]').val(),
                    subject_first_hour: clickedRow.find('input[name="subject_first_hour"]').val(),
                    subject_second_day: clickedRow.find('input[name="subject_second_day"]').val(),
                    subject_second_hour: clickedRow.find('input[name="subject_second_hour"]').val(),
                    place: clickedRow.find('input[name="place"]').val(),
                }
                if(third_day==="" && third_hour==="" && fourth_day==="" && fourth_hour===""){
                    $.ajax({
                        url : "<c:url value='/schedule/add'/>",
                        type : "POST",
                        data : formData,
                        success : function(response){
                            if(response=='possible'){
                                updateCellRe();
                            }
                            else{
                                alert("같은 시간대에 이미 수업이 있습니다.");
                            }
                        },
                        error:function(error){
                            alert("오류 발생");
                        }
                    })
                }
                else{
                    $.ajax({
                        url : "<c:url value='/schedule/add'/>",
                        type : "POST",
                        data : formDataV2,
                        success : function(response){
                            if(response=='possible'){
                                updateCellRe();
                            }
                            else{
                                alert("같은 시간대에 이미 수업이 있습니다.");
                            }
                        },
                        error:function(error){
                            alert("오류 발생");
                        }
                    })
                }
            })
        })
        function updateCellRe(){
            $.ajax({
                url : "<c:url value='/schedule/read'/>",
                type : "get",
                dataType:"json",
                cache : false,
                success:function(data){
                    console.log(data);
                    var schedules = data.scheduleDtoList;
                    var colors = data.color_infoDtoList;

                    for(var i=0; i<schedules.length; i++){
                        var color;
                        var item = schedules[i];
                        for(var j=0; j<colors.length; j++){
                            if(item.sno == colors[j].sno){
                                color = colors[j].cell_color;
                            }
                        }
                        console.log(color);
                        var firstCellID;
                        var secondCellID;
                        var thirdCellID;
                        var fourthCellID;
                        var mon = "mon-";
                        var tue = "tue-";
                        var wed = "wed-";
                        var thu = "thu-";
                        var fri = "fri-";
                        var subject_sno = item.sno;
                        var subject_name = item.subject_name;
                        var tmp = item.subject_first_day;
                        var f_hour = item.subject_first_hour.toString();
                        var tmp2 = item.subject_second_day;
                        var s_hour = item.subject_second_hour.toString();
                        var tmp3 = item.subject_third_day;
                        var t_hour = item.subject_third_hour.toString();
                        var tmp4 = item.subject_fourth_day;
                        var fourth_hour = item.subject_fourth_hour.toString();
                        if(tmp == '월'){firstCellID=mon+f_hour;}
                        else if(tmp == '화'){firstCellID=tue+f_hour;}
                        else if(tmp=='수'){firstCellID=wed+f_hour;}
                        else if(tmp=='목'){firstCellID=thu+f_hour;}
                        else if(tmp=='금'){firstCellID=fri+f_hour;}
                        if(tmp2 == '월'){secondCellID = mon+s_hour;}
                        else if(tmp2=='화'){secondCellID=tue+s_hour;}
                        else if(tmp2=='수'){secondCellID=wed+s_hour;}
                        else if(tmp2=='목'){secondCellID=thu+s_hour;}
                        else if(tmp2=='금'){secondCellID=fri+s_hour;}
                        if(tmp3!="" && tmp4!=""){
                            if(tmp3 == '월'){thirdCellID = mon+t_hour;}
                            else if(tmp3=='화'){thirdCellID=tue+t_hour;}
                            else if(tmp3=='수'){thirdCellID=wed+t_hour;}
                            else if(tmp3=='목'){thirdCellID=thu+t_hour;}
                            else if(tmp3=='금'){thirdCellID=fri+t_hour;}
                            if(tmp4 == '월'){fourthCellID = mon+fourth_hour;}
                            else if(tmp4=='화'){fourthCellID=tue+fourth_hour;}
                            else if(tmp4=='수'){fourthCellID=wed+fourth_hour;}
                            else if(tmp4=='목'){fourthCellID=thu+fourth_hour;}
                            else if(tmp4=='금'){fourthCellID=fri+fourth_hour;}
                            $('#'+firstCellID).css('background-color', color);
                            $('#'+secondCellID).css('background-color', color);
                            $('#'+thirdCellID).css('background-color', color);
                            $('#'+fourthCellID).css('background-color', color);
                            if(tmp == tmp2 && tmp == tmp3 && tmp == tmp4){
                                $('#'+firstCellID).html(subject_name).append(createBtn(subject_name,subject_sno, firstCellID)).css('text-align', 'center');
                                $('#'+firstCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+secondCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+thirdCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+fourthCellID).addClass('subject-cell-' + subject_sno);
                            }
                            else if((tmp == tmp2) !== (tmp3 == tmp4)){
                                $('#'+firstCellID).html(subject_name).append(createBtn(subject_name,subject_sno, firstCellID)).css('text-align', 'center');
                                $('#'+thirdCellID).html(subject_name).append(createBtn(subject_name,subject_sno, thirdCellID)).css('text-align', 'center');
                                $('#'+firstCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+secondCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+thirdCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+fourthCellID).addClass('subject-cell-' + subject_sno);

                            }
                        }
                        else{
                            $('#'+firstCellID).css('background-color', color);
                            $('#'+secondCellID).css('background-color', color);
                            if(tmp != tmp2){
                                $('#'+firstCellID).html(subject_name).append(createBtn(subject_name,subject_sno,firstCellID)).css('text-align', 'center');
                                $('#'+firstCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+secondCellID).html(subject_name).append(createBtn(subject_name,subject_sno,secondCellID)).css('text-align', 'center');
                                $('#'+secondCellID).addClass('subject-cell-' + subject_sno);
                            }
                            else{
                                $('#'+firstCellID).html(subject_name).append(createBtn(subject_name,subject_sno, firstCellID)).css('text-align', 'center');
                                $('#'+firstCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+secondCellID).addClass('subject-cell-' + subject_sno);
                            }
                        }
                    }
                },
                error:function(error){
                    alert("실패");
                }
            })
        }
        //랜덤 색깔을 얻어오는 함수
        function getRandomLightColor(colorArray) {
            var randomIndex = Math.floor(Math.random() * colorArray.length);
            return colorArray[randomIndex];
        }
        var hexColors = [
            "#FFE5CC", "#FFCCCC", "#FFFFCC", "#CCFFCC",
            "#FFCC99", "#FF9999", "#FFFF99", "#CCFF99",
            "#99FF99", "#99FFCC", "#99FFFF", "#CCFFFF"
        ];
        function createBtn(subject_name, sno, CellID){
            var btnClass = subject_name;
            var btnContent ='<button name="'+subject_name+'"id="'+subject_name+','+sno+','+CellID+'" class="subject_del">[x]</button>';
            return btnContent;
        }
    </script>
    </body>
    </html>
