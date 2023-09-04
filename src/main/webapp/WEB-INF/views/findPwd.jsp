<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? 'Login' : 'Logout'}"/>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <style>
        * { box-sizing:border-box; }
        a { text-decoration: none; }
        form {
            width:400px;
            height:500px;
            display : flex;
            flex-direction: column;
            align-items:center;
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
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<form class="form" action="<c:url value='/login/findPwd'/>" method="post" onsubmit="return formCheck(this)">
    <h3 id="title">Find Password</h3><br><br>
    <div class="inputGroup">
        <input type="text" name="id" class="form-control" placeholder="사용자 ID를 입력해주세요."><button id="idCheck" type="submit" class="btnPrimary">아이디 확인</button>
    </div>
    <div>
        <input type="text" name="email" placeholder="이메일을 입력해주세요."><button id="emailCheck" type="submit">이메일 인증</button>
    </div>
    <div>
        <input type="text" name="inputCultiNum" placeholder="인증번호를 입력해주세요."><button id="cultiNumCheck" type="submit">인증 확인</button>
    </div>
    <input type="hidden" name="userid" value="${id}">
    <div>
        <p>아이디를 잊어버리셨나요? <a href="<c:url value="/login/findID"/>">아이디 찾기</a>.</p>
    </div>
    <button id="registerBtn" type="submit">찾기</button>
    <script>
        var EmailCheck = false;
        var IdCheck = false;
        function formCheck(frm){
            if($('input[name="id"]').val() === "" || $('input[name="email"]').val() === "" || $('input[name="inputCultiNum"]').val()===""){
                alert("모든 필수 필드를 입력하세요.");
                return false;
            }
            if($('input[name="id"]').val().length < 5){
                alert("아이디는 최소 5글자여야합니다.");
                return false;
            }
            if(EmailCheck==false){
                alert("이메일 인증을 진행해주세요.");
                return false;
            }
            if(EmailCheck == true && IdCheck==true){
                return true;
            }
            else{
                return false;
            }

        }
        $(function(){ // id 중복을 확인했을 때, db에 해당 id로 유저가 있으면 중복된다고 알려주고, 아니면 사용 가능하다고 알려주기
            $('#idCheck').click(function(event){
                event.preventDefault(); // 폼 제출 막기
                var id = $('input[name="id"]').val();
                if(id.length<5){
                    alert("아이디의 길이는 5글자 이상이어야 합니다.");
                    return;
                }
                $.ajax({

                    url : "<c:url value='/register/check'/>",
                    method : "POST",
                    data : {id:id},
                    success:function(response){
                        if(response=="impossible"){
                            IdCheck=true;
                            alert("아이디가 정상적으로 확인되었습니다.");
                        }else{
                            alert("존재하지않는 ID입니다..");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("에러가 발생했습니다: " + error);
                    }
                });
            });
        });
        $('#emailCheck').click(function(event) {
            event.preventDefault();
            const email = $('input[name="email"]').val(); // 이메일 주소값 얻어오기!
            if(email===""){
                alert("이메일을 입력하세요.")
                return
            }
            console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
            const checkInput = $('input[name="cultiNum"]') // 인증번호 입력하는곳
            var emailCheckUrl = '<%= request.getContextPath() %>/register/emailCheck';
            $.ajax({
                type : 'get',
                url : emailCheckUrl+"?email="+ email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
                success : function (data) {
                    console.log("data : " +  data);
                    checkInput.attr('disabled',false);
                    emailVali = true;
                    code =data;
                    alert('인증번호가 전송되었습니다.')
                }
            }); // end ajax
        }); // end send eamil

        $('#cultiNumCheck').click(function(event) {
            event.preventDefault();
            const inputCultiNum = $('input[name="inputCultiNum"]').val();
            var emailCheckUrl = '<%= request.getContextPath() %>/register/checkCultiNum';

            $.ajax({
                type: 'get',
                url: emailCheckUrl,
                data: { inputCultiNum: inputCultiNum },
                success: function(response) {
                    if (response === "possible") {
                        EmailCheck=true;
                        alert("인증번호가 일치합니다. 회원가입이 가능합니다.");

                    } else {
                        alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
                    }
                },
                error: function(xhr, status, error) {
                    alert("에러가 발생했습니다: " + error);
                }
            });
        });

    </script>
</form>
</body>
</html>
