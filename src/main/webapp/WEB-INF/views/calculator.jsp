<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fastcampus</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        body{
            background-color : #fff;
        }
        #container {
            width: calc(100% - 14cm);
            margin: 0 auto;
            padding: 10px;
            box-sizing: border-box;
        }
        .section{
            padding: 0 8px;
        }
        .chart, .semester{
            border: 1px solid #ededed;
            border-radius: 12px;
            resize:none;
            overflow:auto;
        }
        .overView{
            display: flex;
            justify-content: space-between;
            min-height: 52px;
            margin-bottom: 32px;
        }
        .overView p{
            display: inline-block;
        }
        .overView p.value{
            color: #c62917;
            font-size: 26px;
            font-weight: bold;
            line-height: 32px;
        }
        .overView p.total{
            margin-left: 4px;
            color: #a6a6a6;
            font-size: 12px;
            line-height: 18px;
        }
        .overView h4{
            margin-bottom: 2px;
            color: #444;
            font-size: 12px;
            font-weight: normal;
            line-height: 18px;
        }
        .semester {
            position: relative;
            margin-top: 8px;
            overflow-x: hidden; /* 가로 스크롤 바 숨김 */
            overflow-y: hidden;
        }

        .semester ol {
            display: flex; /* 요소들을 수평으로 정렬 */
            list-style: none; /* 리스트 마커 숨김 */
            padding: 0;
            margin: 0;
        }

        .semester li {
            color: #a6a6a6;
            flex: 0 0 auto; /* 요소들의 크기를 자동으로 설정 */
            margin-right: 10px; /* 요소들 사이의 간격 설정 (원하는 간격으로 조정) */
            padding: 5px; /* 요소 내부 여백 설정 (원하는 여백으로 조정) */
            margin-left:1rem;
            transition: color 0.3s, text-decoration 0.3s;
        }
        .semester li:hover{
            cursor:pointer;
        }
        .semester li.active{
            color:#000;
            text-decoration: underline;
        }
        .subjects {
            width: 100%; /* 표의 너비를 100%로 설정합니다. */
            border: 1px solid #ededed;
            border-radius: 12px;
        }

        /* 캡션 스타일을 설정합니다. */
        .subjects caption {
            text-align: left; /* 텍스트를 왼쪽 정렬합니다. */
            margin-top : 30px;
            font-size: 18px; /* 원하는 폰트 크기로 조정합니다. */
            margin-bottom: 10px; /* 하단 여백을 조정합니다. */
        }
        .subjects caption h3{
            margin-left:15px;
        }
        .subjects dl {
            display: table-row;
            text-align: left;
        }

        .subjects dt,
        .subjects dd {
            display: table-cell; /* dt와 dd 요소를 테이블 셀로 표시합니다. */
            padding: 5px 10px; /* 원하는 패딩 값을 설정합니다. */
            text-align: center; /* 텍스트를 중앙 정렬합니다. */
            font-family: "맑은 고딕", sans-serif;
            font-size:9px;
        }

        .subjects dt {
            font-weight: bold; /* 평점, 전공, 취득 등의 레이블에 볼드 스타일을 적용합니다. */
        }
        .subjects dd{
            color: #c62917;
        }

        th.thName{
            width : 80%;
            text-align: left;
            padding-left: 1cm;
            border-bottom: 1px solid #ededed;
            border-right: 1px solid #ededed;
            border-radius: 12px 0 0 0;
        }
        th.thCredit, th.thGrade{
            width : 6.67%;
            text-align: center;
            border-bottom: 1px solid #ededed;
            border-right:1px solid #ededed;
        }
        th.thMajor{
            width : 6.67%;
            text-align: center;
            border-bottom: 2px solid #ededed;
        }
        td input, td select, td input[type="checkbox"]{
            width:100%;
        }
        .no-padding-margin {
            padding: 0 !important;
            margin: 0 !important;
        }
        th, tr{
            height : 40px;
        }
        input:focus{
            outline: none;
        }
        .new:hover{
            cursor:pointer;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">ldg2</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/schedule/test'/>">Schedule</a></li>
        <li><a href="<c:url value='/calculator'/>">Calculator</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>
<div id="container" class="calculator">
    <div class="section">
        <div class="chart">
            <article class="overView">
                <div class="gradeAll">
                    <h4 class="h4">전체 평점</h4>
                    <p class="value">1.1</p>
                    <p class="total">/ 4.5</p>
                </div>
                <div class="major">
                    <h4 class="h4">전공 평점</h4>
                    <p class="value">1.1</p>
                    <p class="total">/ 4.5</p>
                </div>
                <div class="acquisition">
                    <h4 class="h4">취득 학점</h4>
                    <p class="value">1.1</p>
                    <p class="total">/ 120</p>
                </div>
            </article>
            <article class="graph">
                <div class="series"></div>
                <div class="plot">
                    <canvas class="flot-base" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 365px; height: 129px;" width="410" height="145">
                        <div> test </div>
                    <canvas class="flot-overlay" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 365px; height: 129px;" width="410" height="145">
                    </canvas>
                    </canvas>
                </div>
            </article>
        </div>
        <div class="semester">
            <ol>
                <li class="the_semester">1학년 1학기</li>
                <li class="the_semester">1학년 2학기</li>
                <li class="the_semester">2학년 1학기</li>
                <li class="the_semester">2학년 2학기</li>
                <li class="the_semester">3학년 1학기</li>
                <li class="the_semester">3학년 2학기</li>
                <li class="the_semester">4학년 1학기</li>
                <li class="the_semester">4학년 2학기</li>
            </ol>
        </div>
        <table class="subjects">
            <caption>
                <h3> 4학년 2학기</h3>
                <dl>
                    <dt>평점</dt>
                    <dd class="subject_GPA">0</dd>
                    <dt>전공</dt>
                    <dd class="subject_Major">0</dd>
                    <dt>취득</dt>
                    <dd class="subject_Acquisition">0</dd>
                </dl>
            </caption>
            <thead>
                <th class="thName">과목명</th>
                <th class="thCredit">학점</th>
                <th class="thGrade">성적</th>
                <th class="thMajor">전공</th>
            </thead>
            <tbody id="tableBody">

            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4"><a class="new">더 입력하기</a></td>
                </tr>
            </tfoot>
        </table>

    </div>
</div>
</body>
<script>
    $(document).ready(function(){
        for(var i=0; i<6; i++){
            test();
        }
        $('.new').on('click', function(){
            var body = $('#tableBody');
            body.append(createTr());
        })
        $('.the_semester').on('click', function(){
            var allSemester = $('.semester .the_semester');
            allSemester.remove('data-info');
            allSemester.css('text-decoration', 'none');
            allSemester.css('color', '#a6a6a6');
            console.log($(this).text());
            var semester = $(this);
            semester.attr('data-info', 'active');
            semester.css('text-decoration', 'underline');
            semester.css('color', '#000');
        })


        $('.tdMajor').on('click', function(){ // major 버튼을 누르면
            var tdMajor = $(this).prop('checked');
            if(tdMajor){
                $(this).attr('selected' , 'selected');
            }
            else{
                $(this).removeAttr('selected');
            }
            var acquisition = parseInt(0); // 총 취득
            var majorAcquisition = parseInt(0); // 전공 총 취득
            var sum=parseInt(0); // 총 학점
            var gpa = parseInt(0); // 총 평균
            var major = parseInt(0);
            var majorSum = parseInt(0); // 전공 취득
            // 전공버튼을 싹 다 돌아서, 눌려져있는 것들의 합을 체크
            $(this).closest('tbody').find('tr').find('.tdMajor').each(function(){
                var checked = $(this).prop("checked");
                var inputValue = $(this).closest('tr').find('.tdCredit').val(); // 해당 tr의 학점
                var tdGrade = $(this).closest('tr').find('.tdGrade option:selected'); // 해당 tr의 등급
                if(checked){ // 전공버튼에 체크가 되어있다면.
                    majorSum+= CreditCal(parseInt(inputValue), tdGrade.text());
                    majorAcquisition+=parseInt(inputValue);
                }
                console.log(majorSum);
                major = (majorSum / majorAcquisition).toFixed(2);
                $('.subject_Major').text(major);
            })
            $(this).closest('tbody').find('tr').find('.tdCredit').each(function(){
                var inputValue = $(this).val();
                acquisition += parseInt(inputValue);
                var tdGrade = $(this).closest('tr').find('.tdGrade option:selected');
                console.log(tdGrade.text());
                sum+=CreditCal(parseInt(inputValue), tdGrade.text());
                console.log(sum);
            });
            gpa = (sum / acquisition).toFixed(2);
            $('.subject_Acquisition').text(acquisition);
            $('.subject_GPA').text(gpa);
        })


        $('.tdGrade').on('change', function(){
            var acquisition = parseInt(0);
            var sum=parseInt(0);
            var gpa = parseInt(0);
            $(this).closest('tbody').find('tr').find('.tdCredit').each(function(){
                var inputValue = $(this).val();
                acquisition += parseInt(inputValue);
                var tdGrade = $(this).closest('tr').find('.tdGrade option:selected');
                console.log(tdGrade.text());
                sum+=CreditCal(parseInt(inputValue), tdGrade.text());
                console.log(sum);
            });
            gpa = (sum / acquisition).toFixed(2);
            $('.subject_Acquisition').text(acquisition);
            $('.subject_GPA').text(gpa);
        })


        $('.tdCredit').on('blur', function(){
            var acquisition = parseInt(0);
            var sum=parseInt(0);
            var gpa = parseInt(0);
            $(this).closest('tbody').find('tr').find('.tdCredit').each(function(){
                var inputValue = $(this).val();
                acquisition += parseInt(inputValue);
                var tdGrade = $(this).closest('tr').find('.tdGrade option:selected');
                console.log(tdGrade.text());
                sum+=CreditCal(parseInt(inputValue), tdGrade.text());
                console.log(sum);
            });
            gpa = (sum / acquisition).toFixed(2);
            $('.subject_Acquisition').text(acquisition);
            $('.subject_GPA').text(gpa);
        })
    })




    function test(){
        var body = $('#tableBody');
        body.append(createTr());
    }
    function createTr(){
        var test = '<tr class="no-padding-margin" style="background-color:#F9F9F9;padding:0;margin:0;">'+ createTd() +'</tr>';
        return test;
    }
    function createTd(){
        var test = '<td style="background-color:#F9F9F9;border:0.5px solid #999999;"><input name="" class="tdName"maxlength="50" style="border:none;background-color:#F9F9F9;padding-left:10px;"></td>'
        var credit = '<td style="background-color:#F9F9F9;border:0.5px solid #999999"><input name="" value="0" class="tdCredit"type="number" maxlength="4" min="0" style="border:none;background-color:#F9F9F9;padding-left:5px;"></td>'
        var grade = '<td style="background-color:#ffffff;border:0.5px solid #999999"><select name="" class="tdGrade">'+ createOption() +'</select></td>'
        var major = '<td style="background-color:#ffffff;border:0.5px solid #999999"><label><input name="" type="checkbox" class="tdMajor"></label></td>'
        return test+credit+grade+major;
    }
    function createOption(){
        var repository = ["A+","A","B+","B","C+","C","D+","D","F","P","NP"];
        var array = "";
        for(var i=0; i<repository.length; i++){
            if(i==0){
                array += '<option value="'+repository[i]+'" selected="selected">'+repository[i]+'</option>'
            }
            else{
                array += '<option value="'+repository[i]+'">'+repository[i]+'</option>'
            }
        }
        return array;
    }
    function CreditCal(value, grade){
        var aver =0;
        if(grade=='A+'){aver = parseInt(value)*4.5;}
        else if(grade=='A'){aver = parseInt(value)*4;}
        else if(grade=='B+'){aver = parseInt(value)*3.5}
        else if(grade=='B'){aver = parseInt(value)*3}
        else if(grade=='C+'){aver = parseInt(value)*2.5}
        else if(grade=='C'){aver = parseInt(value)*2}
        else if(grade=='D+'){aver = parseInt(value)*1.5}
        else if(grade=='D'){aver = parseInt(value)*1}
        else if(grade=='F'){aver=0}
        else if(grade=='P'){}
        else if(grade=='NP'){}
        return aver;
    }
</script>
</html>