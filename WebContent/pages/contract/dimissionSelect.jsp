<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link
	href="${pageContext.request.contextPath}/public/css/bootstrap.min.css"
	rel="stylesheet">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>离职信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="${ctx}/public/logo.ico"
	type="image/x-icon" />
<link rel="stylesheet" href="${ctx}/public/css/font.css">
<link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
<link href="${ctx }/public/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/public/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <%-- <a href="${ctx}">首页</a> --%>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="${ctx}/con/findDis" title="刷新"> <i class="layui-icon"
			style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">

		<!-- form表单的查询栏 -->
		<div class="layui-row" style="" align="center">
			<form class="layui-form layui-col-md12 x-so" method="post"
				action="${ctx }/con/findDis">
				<table>
					<tr style="height: 50px">
						<td style="text-align: right; width: 120px"><span
							class="item_name">员工姓名：</span></td>
						<td><input type="text" class="textbox textbox_225"
							style="width: 120px; height: 30px" name="empname"
							value="${emp.empname }" /></td>
						<td style="width: 120px; text-align: right"><span
							class="item_name">部门：</span></td>
						<td><select class="select" name="dept_id">
								<option value="0">全部</option>
								<c:forEach items="${requestScope.list2}" var="dept"
									varStatus="stat">
									<option value="${dept.id }"
										<c:if test="${dept.id eq emp.dept_id}">selected="selected"</c:if>>${dept.deptname }</option>
								</c:forEach>
						</select>
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
						<td style="width: 120px; text-align: right"><input
							type="submit" value="查询" class="layui-btn" /> <!--  <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button> -->
						</td>
					</tr>
				</table>
			</form>
		</div>

		<!-- 数据展示部分 -->
		<table class="layui-table">
			<thead>
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
			</thead>
			<tbody>
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
			</tbody>
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
