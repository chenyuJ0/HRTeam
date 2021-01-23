<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑合同信息</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/public/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/public/css/bootstrap.min.css">
<!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
<script src="${pageContext.request.contextPath }/public/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath }/public/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding: 20px">
	<div class="page_title">
		<h2 class="fl">编辑文件信息</h2>
	</div>
	<div class="panel-body">
		<form class="form-horizontal" role="form"
			action="${pageContext.request.contextPath}/doc/edit" id="editfrom"
			method="post">

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">文件名</label>
				<div class="col-sm-10">
					<input readonly="readonly" class="form-control" id="inputPassword3"
						name="title" placeholder="${document.filename}">
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">创建人</label>
				<div class="col-sm-10">
					<input readonly="readonly" type="text" class="form-control"
						id="inputPassword5" name="username" placeholder="${document.name}">
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">创建日期</label>
				<div class="col-sm-10">
					<input type="date"
						value="<fmt:formatDate value="${document.create_date}" dateStyle="medium" pattern="yyyy-MM-dd" />"
						name="create_date" />
				</div>
			</div>


			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">文件备注</label>
				<div class="col-sm-10">
					<input type="textarea" class="form-control" id="inputPassword4"
						name="description" placeholder="请输入文件备注信息"
						value="${document.description}">
				</div>
			</div>
			
			<input type="hidden" name="id" value="${document.id }">

			<div class="form-group" style="text-align: center">
				<button class="btn btn-default" type="submit">提交</button>
				<button class="btn btn-default" type="reset">重置</button>
			</div>
			<div class="form-group" style="text-align: right">
				<a href="${ctx}/doc/showAll"> <cite>返回</cite>
				</a>
			</div>
		</form>
	</div>
</body>
</html>
