<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<span>公告标题：</span>
	<div  class="text" style=" text-align:center">${readNotice.title }</div>
	<hr>
	<span>公告内容</span>
	<div  class="text" style=" text-align:center">${readNotice.context }</div>
	
</body>
</html>