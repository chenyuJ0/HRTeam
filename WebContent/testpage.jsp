<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <link href="${pageContext.request.contextPath}/public/css/bootstrap.min.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<table>
		<tr>
			<th>员工编号</th>
			<th>姓名</th>
			<th>部门</th>
			<th>职位</th>
			<th>离职时间</th>
			<th>离职类型</th>
			<th>离职原因</th>
			<th>备注</th>
		</tr>
		<c:forEach items="${info.list }" var="emp">
		<tr>
			<td>${emp.jobnum }</td>
			<td>${emp.empname }</td>
			<td>${emp.dept.depname }</td>
			<td>${emp.job.jobname }</td>
			<td><fmt:formatDate value="${emp.leavedate }" dateStyle="medium"/></td>
			<td>${emp.leavereason }</td>
			<td>${emp.leavetype }</td>
			<td>${emp.comment }</td>
		</tr>
		</c:forEach>
		
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
							href="${pageContext.request.contextPath }/emp/findDim?pn=${info.pageNum -1 }"
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
								href="${pageContext.request.contextPath }/emp/findDim?pn=${i}">${i}</a>
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
							href="${pageContext.request.contextPath }/emp/findDim?pn=${info.pageNum + 1}"
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