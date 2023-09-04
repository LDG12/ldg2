<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? 'Login' : 'Logout'}"/>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <style>

        * { box-sizing:border-box; }
        a { text-decoration: none; }
        form {
            width: 500px;
            height: 600px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 1px solid rgb(89, 117, 196);
            border-radius: 10px;
        }

        input[type='text'], input[type='password'] {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        #registerBtn {
            background-color: rgb(89,117,196);
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
        #title {
            font-size : 50px;
            margin: 40px 0 30px 0;
        }
        #msg {
            height: 30px;
            text-align: center;
            font-size: 16px;
            color: red;
            margin-bottom: 20px;
        }
    </style>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<%--action="/ldg/login/login" method="post" onsubmit="return formCheck(this);--%>
<form class="form" action="<c:url value='/login/updatePwd'/>" method="post" onsubmit="return formCheck(this)">
    <h3 id="title">Update Pwd</h3>
    <input type="password" name="pwd"  placeholder="사용하실 비밀번호를 입력해주세요.">
    <input type="password" name="pwdRepeat" placeholder="비밀번호를 다시한번 입력해주세요.">
    <p id="check" size="2"></p>
    <input type="hidden" name="id" value="${id}">
    <input type="hidden" name="email" value="${email}">
    <button id="findIdBtn">Register</button>
</form>
<script>
    var pwdStatus = false;
    function formCheck(frm){
        if($('input[name="pwd"]').val() === "" || $('input[name="pwdRepeat"]').val() === ""){
            alert("모든 필수 필드를 입력하세요.");
            return false;
        }
        if($('input[name="pwd"]').val().length < 5){
            alert("비밀번호는 최소 5글자여야합니다.");
            return false;
        }
        if($('input[name="pwd"]').val() === $('input[name="pwdRepeat"]').val()){
            return true
        }
        else{
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

    }
    $(function(){ // 비밀번호와 비밀번호 재확인을 확인해서 바로바로 알려줄 수 있게 하는 것임.
        $('#pwd').keyup(function(){
            $('#check').html('');
        });
        $('#pwdRepeat').keyup(function(){

            if($('#pwd').val() != $('#pwdRepeat').val()){
                $('#check').html('비밀번호 일치하지 않음<br><br>');
                $('#check').attr('color', '#f82a2aa3');

            } else{
                $('#check').html('비밀번호 일치함<br><br>');
                $('#check').attr('color', '#199894b3');
                pwdStatus=true;
            }

        });
    });
</script>
</body>
</html>