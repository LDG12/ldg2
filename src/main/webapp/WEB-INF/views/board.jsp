<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }

        .container {
            width : 50%;
            margin : auto;
        }
        .comment-container{
            width : 50%;
            margin : auto;
        }

        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
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

        .frm {
            width:100%;
        }
        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }

        .btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">fastcampus</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>
<script>
    let modifyMsg = "${msg}"
    if(modifyMsg=="MODIFY OK")alert("게시글 수정이 정상적으로 완료되었습니다.");
    else if(modifyMsg =="MODIFY ERROR") alert("게시글 수정이 실패하였습니다. 다시 시도해주세요.");
</script>
<div class="container">
    <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
    <form id="form" class="frm" action="" method="post">
        <input type="hidden" name="bno" value="${boardDto.bno}">

        <input name="title" type="text" value="<c:out value='${boardDto.title}'/>" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><br>
        <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><c:out value='${boardDto.content}'/></textarea><br>

        <c:if test="${mode eq 'new'}">
            <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
        </c:if>
        <c:if test="${mode ne 'new'}">
            <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
        </c:if>
        <c:if test="${boardDto.writer eq loginId}">
            <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
            <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
        </c:if>
        <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
    </form>
</div>

<br>
<form id="commentForm" class="form-container" action="" method="">
    <input type="hidden" name="bno" value="${param.bno}"/>
    <input type="hidden" name="page" value="${param.page}"/>
    <input type="hidden" name="pageSize" value="${param.pageSize}"/>
    <div class="comment-container">
        <input type="text" name="comment" placeholder="댓글을 입력하세요">
        <button id="commentAddBtn" class="btn commentAddBtn">등록</button>
    </div>
</form>
<form id="commentReadForm" class="form-container" action="" method="">
    <c:if test="${not empty commentList}">
        <div id="commentsList">
        <c:forEach var="commentDto" items="${commentList}">
            <div class="comment" data-comment="${commentDto.comment}" data-cno="${commentDto.cno}">
                <c:choose>
                    <c:when test="${commentDto.reg_date.time >= startOfToday.toEpochMilli()}">
                        <div>${commentDto.commenter} / <fmt:formatDate value="${commentDto.reg_date}" pattern="HH:mm" type="time"/></div>
                    </c:when>
                    <c:otherwise>
                        <div>${commentDto.commenter} / <fmt:formatDate value="${commentDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></div>
                    </c:otherwise>
                </c:choose>

                <input type="text" value=" ${commentDto.comment}" readonly="readonly" data-cno="${commentDto.cno}"/>
            </div>
           <c:if test="${sessionScope.id eq commentDto.commenter}">
                 <button type=button id="commentRemoveBtn" class="btn commentRemoveBtn" data-cno="${commentDto.cno}">[x]</button>
                <button type=button id="commentModifyBtn" class="btn commentModifyBtn" data-cno="${commentDto.cno}">[수정]</button>
                 <input type="hidden" name="cno" value="${commentDto.cno}">
            </c:if>
            <br>
        </c:forEach>
        <div>
    </c:if>
</form>
<script>
    var commentOpen= false;
    $(document).ready(function(){
        let formCheck = function() {
            let form = document.getElementById("form");
            if(form.title.value=="") {
                alert("제목을 입력해 주세요.");
                form.title.focus();
                return false;
            }

            if(form.content.value=="") {
                alert("내용을 입력해 주세요.");
                form.content.focus();
                return false;
            }
            return true;
        }
        $(document).ready(function(){
            $("#commentAddBtn").on("click", function (event){
                var form = $("#commentForm");
                form.attr("action", "<c:url value='/comment/add'/>");
                form.attr("method", "post");
                form.submit();
            })
            $(document).on('click', '.commentRemoveBtn', function(){
                if (!confirm("정말로 삭제하시겠습니까?")) return;
                var cno = $(this).data("cno");
                var comment = $(".comment[data-cno='" + cno + "']").data("comment");
                // URL 파라미터 값을 가져오기
                var urlParams = new URLSearchParams(window.location.search);
                var bno = urlParams.get('bno');
                var page = urlParams.get('page');
                var pageSize = urlParams.get('pageSize');
                // Create a data object with the values to send
                var data = {
                    cno: cno,
                    comment: comment,
                    bno: bno,
                    page: page,
                    pageSize: pageSize
                };
                // Send the POST request using $.ajax()
                $.ajax({
                    type: "POST",
                    url: "<c:url value='/comment/remove'/>",
                    data: data,
                    success: function(response) {
                        if(response == "possible"){
                            alert("댓글 삭제가 완료되었습니다.");
                            location.reload();
                        }
                        else{
                            alert("댓글 삭제 실패");
                        }
                        console.log(response);
                    },
                    error: function(xhr, status, error) {
                        alert("댓글 삭제 오류 발생");
                        // Handle the error response
                        console.error(error);
                    }
                });
            });
            $(document).on('click', '#commentModifyBtn', function(){
                alert("수정 기능 호출");
                var cno = $(this).data('cno');
                var comment = $("input[data-cno='" + cno + "']").val();
                var inputElement = $("input[data-cno='" + cno + "']");
                var isReadonly = inputElement.prop("readonly");
                if(isReadonly){
                    inputElement.prop("readonly", false);
                    $(this).text("등록");
                    return;
                }
                $.ajax({
                    type:"POST",
                    url:"<c:url value='/comment/modify'/>",
                    data:{cno:cno, comment:comment},
                    success:function (response){
                        if(response == "possible"){
                            alert("수정 완료");
                            location.reload();
                        }
                        else{
                            alert("수정 실패");
                        }
                    },
                    error:function(xhr, status, error){
                        alert("오류 발생함...");
                    }
                })
            })
        })

        $("#writeNewBtn").on("click", function(){
            location.href="<c:url value='/board/write'/>";
        });

        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/board/write'/>");
            form.attr("method", "post");

            if(formCheck())
                form.submit();
        });

        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let isReadonly = $("input[name=title]").attr('readonly');

            // 1. 읽기 상태이면, 수정 상태로 변경
            if(isReadonly=='readonly') {
                $(".writing-header").html("게시판 수정");
                $("input[name=title]").attr('readonly', false);
                $("textarea").attr('readonly', false);
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
                return;
            }

            // 2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });

        $("#removeBtn").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;

            let form = $("#form");
            form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
            form.attr("method", "post");
            form.submit();
        });

        $("#listBtn").on("click", function(){
            location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
        });
    });
</script>
</body>
</html>