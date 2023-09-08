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
        *{
            color: #666; font-family: "맑은 고딕", 돋움,  "Apple SD Gothic Neo", tahoma; _font-family: 돋움, tahoma; font-size: 12px; letter-spacing: -0.5px;
        }
        body{
            background-color: #f8f8f8;
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
        .chart{
            width:950px;
            hegiht:150px;
        }
        .chart, .semester{
            border: 1px solid #ededed;
            border-radius: 12px;
            resize: block;
            overflow:auto;
            width:950px;
        }
        .overView{
            text-align: center;
            display:flex;
            align-items: center;
            justify-content: center;
            flex-display: column;
        }
        .gradeAll, .acquisition, .major{
            padding:20px;
        }
        .graph{
            display: flex;
            justify-content: space-between;
            align-items: stretch;
        }
        .xplot{
            background-color: #ffffff;
            width:300px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            list-style: none;
            flex-grow:1;
            padding-top : 2cm;
        }
        .xplot li{
            width:300px;
            margin :13px 0;
            padding-left: 10px;
            line-height: 1;
            color : #000;
            width:300px;
        }
        .ratiowrapper{
            width:300px;
            display: flex;
        }
        .ratiograde{
            width:50px;
        }
        .ratioText{
            margin-left:0.3cm;
            font-size:5px;
        }
        .ratiobar{
            width: 100%;
            height: 15px;
            padding:0;
            text-align: center;
            background-color: #4F98FF;
            color: #111;
        }
        /*.overView{*/
        /*    display: flex;*/
        /*    justify-content: space-between;*/
        /*    min-height: 52px;*/
        /*    margin-bottom: 32px;*/
        /*}*/
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
            overflow-x : scroll;
            white-space: nowrap;
        }

        .semester ol {
            display: flex; /* 요소들을 수평으로 정렬 */
            list-style: none; /* 리스트 마커 숨김 */
            padding: 0;
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
        .subject_save{
            position: relative;
            left:14cm;
            border: 1px solid #ededed;
            border-radius: 12px;
            background-color: #c62917;
            color:#f0f0f0;
            width:130px;
            height:25px;
            text-align: center;
            line-height:23px;
            font-family: "맑은 고딕", sans-serif;
            font-size:15px;
        }

        .subject_save:hover{
            cursor: pointer;
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                <div class="plot">
                    <canvas id="the_chart" style="height:300px; width:500px"></canvas>
                </div>
                <ul class="xplot">
                </ul>
            </article>
        </div>
        <div class="semester">
            <ol class="the_semesters">
                <li class="the_semester" data-info="active">1학년 1학기</li>
                <li class="the_semester">1학년 2학기</li>
                <li class="the_semester">2학년 1학기</li>
                <li class="the_semester">2학년 2학기</li>
                <li class="the_semester">3학년 1학기</li>
                <li class="the_semester">3학년 2학기</li>
                <li class="the_semester">4학년 1학기</li>
                <li class="the_semester">4학년 2학기</li>
                <li class="the_semester">5학년 1학기</li>
                <li class="the_semester">5학년 2학기</li>
                <li class="the_semester">6학년 1학기</li>
                <li class="the_semester">6학년 2학기</li>
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
                    <dd><a class="subject_save">성적 반영</a></dd>
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
        for(var i=0; i<10; i++){
            test(i);
        }
        $('.the_semester').first().css('text-decoration', 'underline').css('color', '#000');
        selectSemester();
        updateCalculation2();
        selectGpa();
        $('.new').on('click', function(){
            var body = $('#tableBody');
            body.append(createTr());
        })
        $('.the_semester').on('click', function(){
            var now_semester="싯팔";
            $('.the_semester').closest('.the_semesters').find('.the_semester').each(function(){
                if($(this).attr('data-info') == "active"){
                    now_semester = $(this).text();
                }
            })
            var select_semester = $(this);
            console.log(now_semester);
            insertSemester(now_semester, function(){
                var allSemester = $('.semester .the_semester');
                allSemester.removeAttr('data-info');
                allSemester.css('text-decoration', 'none');
                allSemester.css('color', '#a6a6a6');
                console.log(select_semester.text());
                select_semester.attr('data-info', 'active');
                select_semester.css('text-decoration', 'underline');
                select_semester.css('color', '#000');
                selectSemester();
            })
        })
        $(".subject_save").on("click", function (){
            var now_semester = $('.the_semester[data-info="active"]').text();
            insertSemester(now_semester);
        })

        $('.tdMajor').on('click', updateCalculation2);
        // $('.tdMajor').on('click', function(){ // major 버튼을 누르면
        //     var tdMajor = $(this).prop('checked');
        //     if(tdMajor){
        //         $(this).attr('selected' , 'selected');
        //     }
        //     else{
        //         $(this).removeAttr('selected');
        //     }
        //     var acquisition = parseInt(0); // 총 취득
        //     var majorAcquisition = parseInt(0); // 전공 총 취득
        //     var sum=parseInt(0); // 총 학점
        //     var gpa = parseInt(0); // 총 평균
        //     var major = parseInt(0);
        //     var majorSum = parseInt(0); // 전공 취득
        //     // 전공버튼을 싹 다 돌아서, 눌려져있는 것들의 합을 체크
        //     $(this).closest('tbody').find('tr').find('.tdMajor').each(function(){
        //         var checked = $(this).prop("checked");
        //         var inputValue = $(this).closest('tr').find('.tdCredit').val(); // 해당 tr의 학점
        //         var tdGrade = $(this).closest('tr').find('.tdGrade option:selected'); // 해당 tr의 등급
        //         if(checked){ // 전공버튼에 체크가 되어있다면.
        //             majorSum+= CreditCal(parseInt(inputValue), tdGrade.text());
        //             majorAcquisition+=parseInt(inputValue);
        //         }
        //         console.log(majorSum);
        //         major = (majorSum / majorAcquisition).toFixed(2);
        //         if(major=="NaN"){major=0;}
        //         $('.subject_Major').text(major);
        //     })
        //     $(this).closest('tbody').find('tr').find('.tdCredit').each(function(){
        //         var inputValue = $(this).val();
        //         acquisition += parseInt(inputValue);
        //         var tdGrade = $(this).closest('tr').find('.tdGrade option:selected');
        //         console.log(tdGrade.text());
        //         sum+=CreditCal(parseInt(inputValue), tdGrade.text());
        //         console.log(sum);
        //     });
        //     gpa = (sum / acquisition).toFixed(2);
        //     if(gpa=="NaN"){gpa=0;}
        //     if(major="NaN"){major=0;}
        //     if(acquisition=="NaN"){acquisition=0;}
        //     $('.subject_Acquisition').text(acquisition);
        //     $('.subject_GPA').text(gpa);
        // })


        $('.tdGrade').on('change', updateCalculation2);
        // $('.tdGrade').on('change', function(){
        //     var tdMajor = $(this).prop('checked');
        //     if(tdMajor){
        //         $(this).attr('selected' , 'selected');
        //     }
        //     else{
        //         $(this).removeAttr('selected');
        //     }
        //     var acquisition = parseInt(0); // 총 취득
        //     var majorAcquisition = parseInt(0); // 전공 총 취득
        //     var sum=parseInt(0); // 총 학점
        //     var gpa = parseInt(0); // 총 평균
        //     var major = parseInt(0);
        //     var majorSum = parseInt(0); // 전공 취득
        //     // 전공버튼을 싹 다 돌아서, 눌려져있는 것들의 합을 체크
        //     $(this).closest('tbody').find('tr').find('.tdMajor').each(function(){
        //         var checked = $(this).prop("checked");
        //         var inputValue = $(this).closest('tr').find('.tdCredit').val(); // 해당 tr의 학점
        //         var tdGrade = $(this).closest('tr').find('.tdGrade option:selected'); // 해당 tr의 등급
        //         if(checked){ // 전공버튼에 체크가 되어있다면.
        //             majorSum+= CreditCal(parseInt(inputValue), tdGrade.text());
        //             majorAcquisition+=parseInt(inputValue);
        //         }
        //         console.log(majorSum);
        //         major = (majorSum / majorAcquisition).toFixed(2);
        //         if(major=="NaN"){major=0;}
        //         $('.subject_Major').text(major);
        //     })
        //     $(this).closest('tbody').find('tr').find('.tdCredit').each(function(){
        //         var inputValue = $(this).val();
        //         acquisition += parseInt(inputValue);
        //         var tdGrade = $(this).closest('tr').find('.tdGrade option:selected');
        //         console.log(tdGrade.text());
        //         sum+=CreditCal(parseInt(inputValue), tdGrade.text());
        //         console.log(sum);
        //     });
        //     gpa = (sum / acquisition).toFixed(2);
        //     if(gpa=="NaN"){gpa=0;}
        //     if(major="NaN"){major=0;}
        //     if(acquisition=="NaN"){acquisition=0;}
        //     $('.subject_Acquisition').text(acquisition);
        //     $('.subject_GPA').text(gpa);
        // })

        $('.tdCredit').on('blur', updateCalculation2);
        // $('.tdCredit').on('blur', function(){
        //     var tdMajor = $(this).prop('checked');
        //     if(tdMajor){
        //         $(this).attr('selected' , 'selected');
        //     }
        //     else{
        //         $(this).removeAttr('selected');
        //     }
        //     var acquisition = parseInt(0); // 총 취득
        //     var majorAcquisition = parseInt(0); // 전공 총 취득
        //     var sum=parseInt(0); // 총 학점
        //     var gpa = parseInt(0); // 총 평균
        //     var major = parseInt(0);
        //     var majorSum = parseInt(0); // 전공 취득
        //     // 전공버튼을 싹 다 돌아서, 눌려져있는 것들의 합을 체크
        //     $(this).closest('tbody').find('tr').find('.tdMajor').each(function(){
        //         var checked = $(this).prop("checked");
        //         var inputValue = $(this).closest('tr').find('.tdCredit').val(); // 해당 tr의 학점
        //         var tdGrade = $(this).closest('tr').find('.tdGrade option:selected'); // 해당 tr의 등급
        //         if(checked){ // 전공버튼에 체크가 되어있다면.
        //             majorSum+= CreditCal(parseInt(inputValue), tdGrade.text());
        //             majorAcquisition+=parseInt(inputValue);
        //         }
        //         console.log(majorSum);
        //         major = (majorSum / majorAcquisition).toFixed(2);
        //         if(major=="NaN"){major=0;}
        //         $('.subject_Major').text(major);
        //     })
        //     $(this).closest('tbody').find('tr').find('.tdCredit').each(function(){
        //         var inputValue = $(this).val();
        //         acquisition += parseInt(inputValue);
        //         var tdGrade = $(this).closest('tr').find('.tdGrade option:selected');
        //         console.log(tdGrade.text());
        //         sum+=CreditCal(parseInt(inputValue), tdGrade.text());
        //         console.log(sum);
        //     });
        //     gpa = (sum / acquisition).toFixed(2);
        //     if(gpa=="NaN"){gpa=0;}
        //     if(major="NaN"){major=0;}
        //     if(acquisition=="NaN"){acquisition=0;}
        //     $('.subject_Acquisition').text(acquisition);
        //     $('.subject_GPA').text(gpa);
        // })
    })

    // semester 학기별 평점, 전공평점, 취득학점의 총합
    function updateCalculation2(){
        var acquisition = parseInt(0); // 총 취득
        var majorAcquisition = parseInt(0); // 전공 총 취득
        var sum = parseInt(0); // 총 학점
        var gpa = parseInt(0); // 총 평균
        var major = parseInt(0);
        var majorSum = parseInt(0); // 전공 취득

        $('#tableBody').find('tr').each(function(){
            var inputCredit = $(this).find('.tdCredit').val();
            var inputGrade = $(this).find('.tdGrade option:selected').text();
            var inputMajor = $(this).find('.tdMajor').prop("checked");
            sum+=CreditCal(inputCredit, inputGrade);
            if(inputMajor){
                var num = CreditCal(inputCredit, inputGrade);
                console.log(num);
                majorSum += num;
                majorAcquisition+=parseInt(inputCredit);
            }
            else{

            }
            acquisition += parseInt(inputCredit);
        })
        gpa = (sum/acquisition).toFixed(2);
        major = (majorSum / majorAcquisition).toFixed(2);
        if(isNaN(gpa)){gpa=0;}
        if(isNaN(major)){major=0;}
        $('.subject_GPA').text(gpa);
        $('.subject_Major').text(major);
        $('.subject_Acquisition').text(acquisition);
        selectGpa();
    }


    function test(int){
        var body = $('#tableBody');
        body.append(createTr(int));
    }
    function createTr(int){
        var test = '<tr class="no-padding-margin" style="background-color:#F9F9F9;padding:0;margin:0;">'+ createTd(int) +'</tr>';
        return test;
    }
    function createTd(int){
        var test = '<td style="background-color:#F9F9F9;border:0.5px solid #999999;"><input id="name'+int+'" class="tdName"maxlength="50" style="border:none;background-color:#F9F9F9;padding-left:10px;"></td>'
        var credit = '<td style="background-color:#F9F9F9;border:0.5px solid #999999"><input id="credit'+int+'" value="0" class="tdCredit"type="number" maxlength="4" min="0" style="border:none;background-color:#F9F9F9;padding-left:5px;"></td>'
        var grade = '<td style="background-color:#ffffff;border:0.5px solid #999999"><select id="grade'+int+'" class="tdGrade">'+ createOption() +'</select></td>'
        var major = '<td style="background-color:#ffffff;border:0.5px solid #999999"><label><input id="major'+int+'" type="checkbox" class="tdMajor"></label></td>'
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
    function ClearCell(int){
        for(var i=int; i<10; i++){
            $('#name'+i).val("");
            $('#credit'+i).val(0);
            $('#grade'+i).val('A+').attr('selected', 'selected');
            $('#major'+i).attr("checked", false);
        }
    }
    function CreditCal(value, grade){
        var aver =0;
        if(grade=='A+'){aver = parseFloat(value)*4.5;}
        else if(grade=='A'){aver = parseFloat(value)*4;}
        else if(grade=='B+'){aver = parseFloat(value)*3.5}
        else if(grade=='B'){aver = parseFloat(value)*3}
        else if(grade=='C+'){aver = parseFloat(value)*2.5}
        else if(grade=='C'){aver = parseFloat(value)*2}
        else if(grade=='D+'){aver = parseFloat(value)*1.5}
        else if(grade=='D'){aver = parseFloat(value)*1}
        else if(grade=='F'){aver=0}
        else if(grade=='P'){}
        else if(grade=='NP'){}
        return aver;
    }
    // 전체 semester (ex)1학년 1학기~4학년2학기까지의 모든 값들의 평점, 전공평점, 취득학점)
    function selectGpa(){
        var gpa="";
        var majorGpa="";
        var acquisition="";
        var gradeAll = "";
        var gradeArr;
        $.ajax({
            url:"<c:url value='/calculator/selectAll'/>",
            type:"get",
            success:function(data){
                var gpaArr = data;
                var tmpString ="";
                console.log(gpaArr);
                gpa=gpaArr[0];
                majorGpa=gpaArr[1];
                acquisition=gpaArr[2];
                tmpString = gpaArr[3];
                gradeAll = tmpString.substring(1);
                gradeArr = gradeAll.split(",");
                if(isNaN(gpa)){
                    gpa =0;
                }
                if(isNaN(majorGpa)){
                    majorGpa=0;
                }
                $('.gradeAll').find('.value').text(gpa);
                $('.major').find('.value').text(majorGpa);
                $('.acquisition').find('.value').text(acquisition);
                createRatio(gradeArr);
                graphGPA();
            }
            ,error:function(error){
                alert("오류 발생");
            }
        })
    }
    function graphGPA(){
        var semester =["1학년 1학기", "1학년 2학기", "2학년 1학기", "2학년 2학기", "3학년 1학기", "3학년 2학기",
        "4학년 1학기", "4학년 2학기", "5학년 1학기", "5학년 2학기", "6학년 1학기", "6학년 2학기"];
        $.ajax({
            url:"<c:url value='/calculator/selectGPA'/>",
            type:"get",
            success:function(data){
                var gpaList = data;
                if(gpaList[0]==0){
                    tttest(gpaList, semester);
                }
                else{
                    tttest(gpaList, semester);
                }
            },
            error:function(error){
                alert("에러 발생");
            }
        })
    }
    function createRatio(gradeArr){
        var xplot = $('.xplot');
        xplot.find('li').remove();
        console.log(gradeArr);
        var string=[]; var integer=[];
        var gradeGroup ={
            AP:[], A:[], BP:[], B:[], CP:[], C:[], DP:[], D:[], F:[], P:[], NP:[]
        }
        var length = gradeArr.length;
        for(var i=0; i<length; i++){
            if(gradeArr[i] == "A+"){gradeGroup["AP"].push(gradeArr[i]);}
            else if(gradeArr[i] == "A"){gradeGroup["A"].push(gradeArr[i]);}
            else if(gradeArr[i] == "B+"){gradeGroup["BP"].push(gradeArr[i]);}
            else if(gradeArr[i] == "B"){gradeGroup["B"].push(gradeArr[i]);}
            else if(gradeArr[i] == "C+"){gradeGroup["CP"].push(gradeArr[i]);}
            else if(gradeArr[i] == "C"){gradeGroup["C"].push(gradeArr[i]);}
            else if(gradeArr[i] == "D+"){gradeGroup["DP"].push(gradeArr[i]);}
            else if(gradeArr[i] == "D"){gradeGroup["D"].push(gradeArr[i]);}
            else if(gradeArr[i] == "F"){gradeGroup["F"].push(gradeArr[i]);}
            else if(gradeArr[i] == "P"){gradeGroup["P"].push(gradeArr[i]);}
            else if(gradeArr[i] == "NP"){gradeGroup["NP"].push(gradeArr[i]);}
        }
        for(var group in gradeGroup){
            var groupLength = gradeGroup[group].length;
            if(groupLength!=0){
                string.push(group);
                integer.push(groupLength);
            }
        }
        console.log(string);
        console.log(integer);
        for(var i=0; i<string.length; i++){
            var number = integer[i]/length*100;
            var tmp=string[i];
            if(string[i] =="AP"){tmp="A+";}
            else if(string[i] =="BP"){tmp="B+";}
            else if(string[i] =="CP"){tmp="C+";}
            else if(string[i] =="DP"){tmp="D+";}
            createLi(tmp, number);
        }
    }
    function createLi(string, integer){
        var percent = integer.toFixed(2)
        console.log("percent=",percent);
        var xplot = $('.xplot');
        var li = '<li><span class="ratiograde">'+string+'</span><div class="ratiowrapper"><div class="ratiobar" style="width:'+percent+'%"></div><span class="ratioText">'+percent+'%</span></div></li>'
        xplot.append(li);
    }
    function selectSemester(){
        var now_semester = $('.the_semester[data-info="active"]').text();
        $.ajax({
            url : "<c:url value='/calculator/select'/>",
            type:"get",
            data : {semester : now_semester},
            success:function(data){
                var semesterData = data;
                if(semesterData.length != 0){
                    var length = semesterData.length;
                    for(var i=0; i<semesterData.length; i++){
                        var inputName = $('#name'+i);
                        var inputCredit = $('#credit'+i);
                        var inputGrade = $('#grade'+i);
                        var inputMajor=$('#major'+i);
                        inputName.val(semesterData[i].subject_name);
                        inputCredit.val(semesterData[i].credit);
                        inputGrade.find('option[value="'+semesterData[i].grade+'"]').prop('selected', true);
                        if(semesterData[i].major=="yes"){
                            inputMajor.prop('checked', true);
                            inputMajor.attr("selected", "selected");
                        }
                        else{
                            inputMajor.prop('checked', false);
                        }
                        $('.subjects').find('caption').find('h3').text(now_semester);
                    }
                    ClearCell(length);
                }
                selectGpa();
                updateCalculation2();
            },
            error:function(error){
                alert("에러 발생");
            }
        })
    }
    function insertSemester(now_semester, callback){
        var inputName =[];
        var inputCredit = [];
        var inputGrade = [];
        var inputMajor =[];
        var inputCell_place =[];
        $('#tableBody').find('tr').each(function(index, row) {
            var splitID = $(row).find('.tdName').attr('id');
            var number = splitID.substring(4);
            inputName.push($(row).find('.tdName').val());
            inputCredit.push($(row).find('.tdCredit').val());
            inputGrade.push($(row).find('.tdGrade option:selected').val());
            inputCell_place.push(number);
            var isChecked = $(row).find('.tdMajor').prop("checked");
            if (isChecked) {
                inputMajor.push('yes');
            } else {
                inputMajor.push('no');
            }
        });
        var jsonName = JSON.stringify(inputName);
        var jsonCredit = JSON.stringify(inputCredit);
        var jsonGrade = JSON.stringify(inputGrade);
        var jsonMajor = JSON.stringify(inputMajor);
        var jsonCell_place = JSON.stringify(inputCell_place);
        $.ajax({
            url : "<c:url value='/calculator/insert'/>",
            type : "post",
            data : {jsonName : jsonName,
            jsonCredit : jsonCredit,
            jsonGrade : jsonGrade,
            jsonMajor : jsonMajor,
            semester : now_semester,
            jsonCell_place : jsonCell_place},
            success:function(data){
                selectGpa();
                if(typeof callback=='function'){
                    callback();
                }
            }
        })
    }
    function tttest(gpaList, semester){
        console.log(gpaList);
        console.log(semester);
        var theArray = [];
        for(var i=0; i<gpaList.length; i++){
            theArray.push(semester[i]);
        }
        console.log(theArray);
        const grades = theArray;
        const data = gpaList;
        const canvas = document.getElementById("the_chart");
        // 그래프를 그릴 캔버스 요소 가져오기
        const ctx = document.getElementById("the_chart").getContext("2d");
        var previousChart = Chart.getChart(ctx);
        if (previousChart) {
            previousChart.destroy();
        }
        canvas.height="300px";
        canvas.width="500px";
        // 데이터셋 생성
        const dataset = {
            labels: grades,
            datasets: [{
                label: "학점 점수",
                data: data,
                borderColor: "rgba(75, 192, 192, 1)",
                borderWidth: 1,
                fill: false,
                lineTension: 0, // 직선으로 그리기
            }]
        };

        // 그래프 옵션 설정
        const options = {
            responsive: true,
            scales: {
                x: {
                    display: true,
                    title: {
                        display: true,
                    }
                },
                y: {
                    display: true,
                    title: {
                        display: true,
                    },
                    min: 1.5,
                    max: 4.5,
                    stepSize: 0.5,
                    beginAtZero: false,  // 시작값을 0으로 설정하지 않음
                    callback: function (value, index, values) {
                        // 원하는 값만 반환하도록 수정
                        if (value === 4.0 || value === 3.0 || value === 2.0) {
                            return value.toString();
                        }
                        return "";
                    },
                    ticks:{
                        stepSize: 1,
                    }
                }
            },
            animation:{
                duration:0
            }
        };
        // 라인 그래프 생성
        const myChart = new Chart(ctx, {
            type: "line", // 라인 그래프
            data: dataset,
            options: options
        });
    }
</script>
</html>