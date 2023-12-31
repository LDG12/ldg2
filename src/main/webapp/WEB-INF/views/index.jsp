<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? 'Login' : 'Logout'}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fastcampus</title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
<script>
  var urlParams = new URLSearchParams(window.location.search);
  var regmessage = urlParams.get('regMsg');
  var pwdmessage = urlParams.get('pwdMsg');
  if (regmessage) {
    alert(decodeURIComponent(regmessage));
  }
  if(pwdmessage){
    alert(decodeURIComponent(pwdmessage));
  }
</script>
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
<div style="text-align:center">
  <h1>This is HOME</h1>
  <h1>This is HOME</h1>
  <h1>This is HOME</h1>
</div>
</body>
<script>

</script>
</html>