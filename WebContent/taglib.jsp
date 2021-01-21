<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 设置一个项目路径的变量  -->
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!-- 配置分页标签   -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- 分页操作 -->
		<div>
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${info.pageNum eq 1 }">
						<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
					</c:if>

					<c:if test="${info.pageNum ne 1 }">
						<li><a
							href="${pageContext.request.contextPath }/findAll?pn=${info.pageNum -1 }"
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
								href="${pageContext.request.contextPath }/findAll?pn=${i}">${i}</a>
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
							href="${pageContext.request.contextPath }/findAll?pn=${info.pageNum + 1}"
							aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<span style="font-size: 18px">&nbsp;&nbsp;共${info.total }条记录，共${info.pages }页</span>
				</ul>
			</nav>
		</div>
</body>
</html>


