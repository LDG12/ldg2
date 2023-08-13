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
            width:400px;
            height:600px; /* 조금 높여서 등록 버튼이 아래로 내려가도록 */
            display : flex;
            flex-direction: column;
            align-items:center;
            justify-content: center; /* 세로 중앙 정렬 */
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid rgb(89,117,196);
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
        <li id="logo">person456</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fas fa-search small"></i></a></li>
    </ul>
</div>
<form id="form" method="post">
    <h3 id="title">Register</h3>
    <input type="text" name="id" placeholder="사용하실 ID를 입력해주세요."><button id="idCheck" type="submit">중복 확인</button>
    <input type="password" id="pwd" placeholder="사용하실 PassWord를 입력해주세요.">
    <input type="password" id="pwdRepeat" placeholder="비밀번호를 다시 한 번 입력해주세요.">
    <p id="check" size="2"></p>
    <input type="text" name="email" placeholder="이메일을 입력해주세요.">
    <input type="text" name="birth" placeholder="생일을 입력해주세요. ex)2020-01-01">
    <input type="text" name="name" placeholder="이름을 입력해주세요.">
    <label style="display: inline-block; white-space: nowrap;">
        <input type="radio" name="role" value="professor"> 교수
    </label>
    <label style="display: inline-block; white-space: nowrap;">
        <input type="radio" name="role" value="student"> 학생
    </label>
    <button id="registerBtn">Register</button>
    <div>
        <p>이미 계정이 있으신가요?? <a href="<c:url value="/login/login"/>">로그인</a>.</p>
    </div>
    <script>
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
                }

            });
        });
        $(function(){ // id 중복을 확인했을 때, db에 해당 id로 유저가 있으면 중복된다고 알려주고, 아니면 사용 가능하다고 알려주기
            $('#idCheck').click(function(event){
                event.preventDefault(); // 폼 제출 막기
                var id = $('input[name="id"]').val();
                $.ajax({
                    url : "/ldg/register/check", // 수정된 경로
                    method : "POST",
                    data : {id:id},
                    success:function(response){
                        if(response=="possible"){
                            alert("사용 가능한 ID입니다.");
                        }else{
                            alert("이미 사용중인 ID입니다.");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("에러가 발생했습니다: " + error);
                    }
                });
            });
        });
    </script>
</form>
</body>
</html>