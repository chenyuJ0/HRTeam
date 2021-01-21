<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link
	href="${pageContext.request.contextPath}/public/css/bootstrap.min.css"
	rel="stylesheet">
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>离职信息查询</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/public/css/style.css" />
<!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
<script src="${pageContext.request.contextPath }/public/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath }/public/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding: 20px">
	<form action="${pageContext.request.contextPath }/con/findDis">
	<table>
		<tr style="height: 50px">
			<td style="text-align: right"><span class="item_name">员工姓名：</span></td>
			<td><input type="text" class="textbox textbox_225"
				name="empname" value="${emp.empname }" /></td>
			<td style="width: 120px; text-align: right"><span
				class="item_name">部门：</span></td>
			<td><select class="select" name="dept_id">
					<option value="0">全部</option>
					<%-- <c:forEach items="${info.list }" var="${dept }">
							<option value="dept.id">${dept.deptname }</option>
						</c:forEach> --%>

					<option value="1"
						<c:if test="${emp.dept_id eq 1 }">selected="selected"</c:if>>人事部</option>
					<option value="2"
						<c:if test="${emp.dept_id eq 2 }">selected="selected"</c:if>>财务部</option>
					<option value="3"
						<c:if test="${emp.dept_id eq 3 }">selected="selected"</c:if>>开发部</option>
					<option value="4"
						<c:if test="${emp.dept_id eq 4 }">selected="selected"</c:if>>销售部</option>
			</select></td>
			<td style="width: 120px; text-align: right"><span
				class="item_name">离职类型：</span></td>
			<td><select class="select" name="leavetype">
					<option value="0">全部</option>
					<option value="1"
						<c:if test="${emp.leavetype eq 1 }">selected="selected"</c:if>>离职</option>
					<option value="2"
						<c:if test="${emp.leavetype eq 2 }">selected="selected"</c:if>>劝退</option>
					<option value="3"
						<c:if test="${emp.leavetype eq 3 }">selected="selected"</c:if>>辞退</option>
					<option value="4"
						<c:if test="${emp.leavetype eq 4 }">selected="selected"</c:if>>自离</option>
			</select></td>
			<td style="width: 120px; text-align: right"><input type="submit"
				value="查询" class="group_btn" /></td>
		</tr>
	</table>
	</form>


	<div class="page_title">
		<h2 class="fl">离职信息</h2>
	</div>
	<table class="table">
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
				<td>${emp.dept.deptname }</td>
				<td>${emp.job.jobname }</td>
				<td><fmt:formatDate value="${emp.leavedate }"
						dateStyle="medium" /></td>
				<td><c:if test="${emp.leavetype eq 0}">离职</c:if> <c:if
						test="${emp.leavetype eq 1}">劝退</c:if> <c:if
						test="${emp.leavetype eq 2}">辞退</c:if> <c:if
						test="${emp.leavetype eq 3}">自离</c:if></td>
				<td><c:if test="${emp.leavereason eq 0}">薪资福利</c:if> <c:if
						test="${emp.leavereason eq 1}">身体原因</c:if> <c:if
						test="${emp.leavereason eq 2}">人际关系</c:if> <c:if
						test="${emp.leavereason eq 3}">家庭原因</c:if> <c:if
						test="${emp.leavereason eq 4}">发展空间</c:if> <c:if
						test="${emp.leavereason eq 5}">上级主管</c:if> <c:if
						test="${emp.leavereason eq 6}">能力欠缺</c:if> <c:if
						test="${emp.leavereason eq 7}">出差原因</c:if> <c:if
						test="${emp.leavereason eq 8}">其它</c:if></td>
				<td>${emp.leavecomment }</td>
			</tr>
		</c:forEach>

	</table>
	<!-- 分页操作 -->
	<div align="center">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<c:if test="${info.pageNum eq 1 }">
					<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
				</c:if>

				<c:if test="${info.pageNum ne 1 }">
					<li><a
						href="${pageContext.request.contextPath }/con/findDis?pn=${info.pageNum -1 }&empname=${emp.empname }&dept_id=${emp.dept_id }&changetype=${emp.changetype }"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>


				<c:forEach begin="1" end="${info.pages }" step="1" var="i">
					<c:if test="${info.pageNum eq i }">
						<li class="active"><span aria-hidden="true">${i}</span></li>
					</c:if>

					<c:if test="${info.pageNum ne i }">
						<li><a
							href="${pageContext.request.contextPath }/con/findDis?pn=${i}&empname=${emp.empname }&dept_id=${emp.dept_id }&changetype=${emp.changetype }">${i}</a>
						</li>
					</c:if>
				</c:forEach>


				<c:if test="${info.pageNum+1 > info.pages}">
					<li class="disabled"><span aria-hidden="true">&raquo;</span></li>
				</c:if>

				<c:if test="${info.pageNum+1 <= info.pages }">
					<li><a
						href="${pageContext.request.contextPath }/con/findDis?pn=${info.pageNum + 1}&empname=${emp.empname }&dept_id=${emp.dept_id }&changetype=${emp.changetype }"
						aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<span style="font-size: 18px">&nbsp;&nbsp;共${info.total }条记录，共${info.pages }页</span>
			</ul>
		</nav>
	</div>

</body>
</html>
