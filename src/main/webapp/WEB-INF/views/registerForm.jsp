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
        <li id="logo">person456</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fas fa-search small"></i></a></li>
    </ul>
</div>
<%--action="/ldg/login/login" method="post" onsubmit="return formCheck(this);--%>
<form class="form" action="<c:url value='/register/add'/>" method="post" onsubmit="return formCheck(this)">
    <h3 id="title">Register</h3>
    <div class="inputGroup">
        <input type="text" name="id" class="form-control" placeholder="사용하실 ID를 입력해주세요."><button id="idCheck" type="submit" class="btnPrimary">중복 확인</button>
    </div>
    <input type="password" id="pwd" name="pwd" placeholder="사용하실 PassWord를 입력해주세요.">
    <input type="password" id="pwdRepeat" name="pwdRepeat" placeholder="비밀번호를 다시 한 번 입력해주세요.">
    <p id="check" size="2"></p>
    <div>
        <input type="text" name="email" placeholder="이메일을 입력해주세요."><button id="emailCheck" type="submit">이메일 인증</button>
    </div>
    <div>
        <input type="text" name="inputCultiNum" placeholder="인증번호를 입력해주세요."><button id="cultiNumCheck" type="submit">인증 확인</button>
    </div>
    <input type="text" name="birth" placeholder="생년월일 8자리를 입력해주세요. ex)yyyy-mm-dd">
    <input type="text" name="name" placeholder="이름을 입력해주세요.">
    <label style="display: inline-block; white-space: nowrap;">
        <input type="radio" name="status" value="professor"> 교수
    </label>
    <label style="display: inline-block; white-space: nowrap;">
        <input type="radio" name="status" value="student"> 학생
    </label>
    <button id="registerBtn">Register</button>
    <div>
        <p>이미 계정이 있으신가요?? <a href="<c:url value="/login/login"/>">로그인</a>.</p>
    </div>
    <script>
        var emailVali = false;
        var cultiNumVali = false;
        if(${not empty param.regMsg}){
            alert(${param.regMsg});
        }
        function formCheck(frm){
            if ($('input[name="id"]').val() === "" || $('input[name="pwd"]').val() === "" || $('input[name="pwdRepeat"]').val() === "" ||
                $('input[name="email"]').val() === "" || $('input[name="birth"]').val() === "" || $('input[name="name"]').val() === "") {
                alert("모든 필수 필드를 입력하세요.");
                return false;
            }
            if($('input[name="birth"]').val === ""){
                alert("생년월일을 입력하세요.");
                return false;
            }
            if($('input[name="id"]').val().length < 5){
                alert("아이디는 최소 5글자여야합니다.");
                return false;
            }
            if($('input[name="pwd"]').val().length <5){
                alert("비밀번호는 최소 5글자여야합니다.");
                return false;
            }
            if($('input[name="pwd"]').val() != $('input[name="pwdRepeat"]').val()){
                alert("비밀번호가 일치하지 않습니다.")
                return false;
            }
            if (!$('input[name="status"]').is(':checked')) {
                alert("교수 또는 학생 중 하나를 선택하세요.");
                return false;
            }
            $(function(){ // id 중복을 확인했을 때, db에 해당 id로 유저가 있으면 중복된다고 알려주고, 아니면 사용 가능하다고 알려주기
                $('#idCheck').click(function(event){
                    event.preventDefault(); // 폼 제출 막기
                    var id = $('input[name="id"]').val();
                    $.ajax({
                        url : "<c:url value='/register/check'/>",
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
            if(!validate){
                return false;
            }
            if(emailVali == true && cultiNumVali==true){
                return true;
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
                }

            });
        });
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
                        if(response=="possible"){
                            alert("사용 가능한 ID입니다.");
                        }else{
                            validate=false;
                            alert("이미 사용중인 ID입니다.");
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
                        cultiNumVali = true;
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