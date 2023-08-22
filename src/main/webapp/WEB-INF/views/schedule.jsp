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

        button {
            background-color: rgb(89, 117, 196);
            color: white;
            width: 100%; /* 버튼을 가로 중앙에 맞추기 위해 100%로 설정 */
            height: 50px;
            font-size: 17px;
            border: none;
            border-radius: 5px;
            margin: 0 auto; /* 가운데 정렬 */
        }
    </style>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">ldg2</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
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
            <tr>
                <th>오전 9시</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>오전 10시</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>오전 11시</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>오후 12시</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>오후 1시</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>오후 2시</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>오후 3시</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>오후 4시</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>오후 5시</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>오후 6시</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </div>
</div>
<div id="button-container">
    <button>수업 목록 찾기</button>
</div>
</body>
</html>
