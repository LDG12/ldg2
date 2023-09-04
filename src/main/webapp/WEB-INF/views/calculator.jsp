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
    </style>
    <script>
    </script>
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
        </div>
        <div class="semester">
            <ol>
                <li class="active">1학년 1학기</li>
                <li>1학년 2학기</li>
                <li>2학년 1학기</li>
                <li>2학년 2학기</li>
                <li>3학년 1학기</li>
                <li>3학년 2학기</li>
                <li>4학년 1학기</li>
                <li>4학년 2학기</li>
            </ol>
        </div>
        <table class="subjects">
            <caption>
                <h3> 4학년 2학기</h3>
                <dl>
                    <dt>평점</dt>
                    <dd>4</dd>
                    <dt>전공</dt>
                    <dd>4</dd>
                    <dt>취득</dt>
                    <dd>4</dd>
                </dl>
            </caption>
            <thead>
                <th class="name">과목명</th>
                <th class="credit">학점</th>
                <th class="grade">성적</th>
                <th class="major">전공</th>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <input class="subject_name" maxlength="50">
                    </td>
                    <td>
                        <input class="subject_credit" type="number" maxlength="4" min="0">
                    </td>
                    <td>
                        <select class="subject_grade">
                            <option value="A+">A+</option>
                        </select>
                    </td>
                    <td>
                        <label>
                            <input class="subject_major" type="checkbox">
                        </label>
                    </td>
                </tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
            </tbody>
        </table>

    </div>
</div>


</body>
</html>