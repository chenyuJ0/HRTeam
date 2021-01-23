<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
	<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <link href="${pageContext.request.contextPath}/public/css/bootstrap.min.css" rel="stylesheet">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body  style="padding:20px">

	<div class="page_title">
		<h2 class="fl">文档查询</h2>
	</div>
<div>
	<table class="table table-bordered">
		<thead>
		<tr>
			<th>文件名称</th>
			<th>文件备注</th>
			<th>创建时间</th>
			<th>创建人</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${info.list }" var="doc">
		<tr>
			
			<td>${doc.filename }</td>
			<td>${doc.title }</td>
			<td><fmt:formatDate value="${doc.create_date}" dateStyle="medium" /></td>
			<td>${doc.user  }</td>
			<td>
				<button class="btn btn-default btn-xs btn-info" onClick="location.href='/admin/editStudent?id=${item.userid}'">修改</button>
				<button class="btn btn-default btn-xs btn-danger btn-primary" onClick="location.href='/admin/removeStudent?id=${item.userid}'">删除</button>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
		</div>
		<!-- 分页操作 -->
		<div>
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${info.pageNum eq 1 }">
						<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
					</c:if>

					<c:if test="${info.pageNum ne 1 }">
						<li><a
							href="${pageContext.request.contextPath }/doc/showAll?pn=${info.pageNum -1 }"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>


					<c:forEach begin="1" end="${info.pages }" step="1"
						var="i">
						<c:if test="${info.pageNum eq i }">
							<li class="active"><span aria-hidden="true">${i}</span></li>
						</c:if>

						<c:if test="${info.pageNum ne i }">
							<li><a
								href="${pageContext.request.contextPath }/doc/showAll?pn=${i}">${i}</a>
							</li>
						</c:if>
					</c:forEach>


					<c:if
						test="${info.pageNum+1 > info.pages}">
						<li class="disabled"><span aria-hidden="true">&raquo;</span></li>
					</c:if>

					<c:if
						test="${info.pageNum+1 <= info.pages }">
						<li><a
							href="${pageContext.request.contextPath }/doc/showAll?pn=${info.pageNum + 1}"
							aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<span style="font-size: 18px">&nbsp;&nbsp;共${info.total }条记录，共${info.pages }页</span>
				</ul>
			</nav>
		</div>
		
		
	</table>	
</div>
</body>
</html>