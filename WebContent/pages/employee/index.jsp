<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
<title>员工管理</title>
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
			href="${ctx}/emp/findAllEmps" title="刷新"> <i class="layui-icon"
			style="line-height: 30px">ဂ</i></a>
	</div>

	<!-- form表单的查询栏 -->
	<div class="layui-row" style="" align="center">
		<form class="layui-form layui-col-md12 x-so" method="post"
			action="${ctx }/emp/findAllEmps">
			<table>
				<tr style="height: 50px">
					<td style="text-align: right"><span class="item_name">员工工号：</span></td>
					<td><input type="text" class="textbox textbox_225"
						name="jobnum" value="${emp.jobnum }" /></td>
					<td style="width: 120px; text-align: right"><span
						class="item_name">部门：</span></td>
					<td><select class="select" name="dept_id">
							<option value="0">全部</option>
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
						class="item_name">职位：</span></td>
					<td><select class="select" name="job_id">
							<option value="0">全部</option>
							<option value="1"
								<c:if test="${emp.job_id eq 1 }">selected="selected"</c:if>>初级程序员</option>
							<option value="2"
								<c:if test="${emp.job_id eq 2 }">selected="selected"</c:if>>中级程序员</option>
							<option value="3"
								<c:if test="${emp.job_id eq 3 }">selected="selected"</c:if>>高级程序员</option>
							<option value="4"
								<c:if test="${emp.job_id eq 4 }">selected="selected"</c:if>>人事专员</option>
							<option value="5"
								<c:if test="${emp.job_id eq 5 }">selected="selected"</c:if>>人事主管</option>
							<option value="6"
								<c:if test="${emp.job_id eq 6 }">selected="selected"</c:if>>出纳</option>
							<option value="7"
								<c:if test="${emp.job_id eq 7 }">selected="selected"</c:if>>会计</option>
							<option value="8"
								<c:if test="${emp.job_id eq 8 }">selected="selected"</c:if>>销售员</option>
							<option value="9"
								<c:if test="${emp.job_id eq 9 }">selected="selected"</c:if>>销售经理</option>
					</select></td>
					<td></td>
				</tr>
				<tr style="height: 50px">
					<td style="text-align: right"><span class="item_name">员工姓名：</span></td>
					<td><input type="text" class="textbox textbox_225"
						name="empname" value="${emp.empname }" /></td>
					<td style="width: 120px; text-align: right"><span
						class="item_name">员工状态：</span></td>
					<td><select class="select" name="work_status">
							<option value="0">全部</option>
							<option value="1"
								<c:if test="${emp.work_status eq 1 }">selected="selected"</c:if>>在职</option>
							<option value="2"
								<c:if test="${emp.work_status eq 2 }">selected="selected"</c:if>>离职</option>
					</select></td>
					<td style="width: 120px; text-align: right"><span
						class="item_name">用工信息：</span></td>
					<td><select class="select" name="work_message">
							<option value="0">全部</option>
							<option value="1"
								<c:if test="${emp.work_message eq 1 }">selected="selected"</c:if>>试用期员工</option>
							<option value="2"
								<c:if test="${emp.work_message eq 2 }">selected="selected"</c:if>>正式员工</option>
					</select></td>
					<td style="width: 120px; text-align: right"><input
							type="submit" value="查询" class="layui-btn" /> <!--  <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button> -->
						</td>
				</tr>
			</table>
		</form>
	</div>
	<!--  -->
	
	<!--  -->
	<!-- 数据展示部分 -->
	<table class="layui-table">
		<thead>
			<tr>
				<th>操作</th>
				<th>员工编号</th>
				<th>姓名</th>
				<th>部门</th>
				<th>职位</th>
				<th>状态</th>
				<th>用工形式</th>
				<th>入职时间</th>
				<th>离职时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${info.list }" var="employee" varStatus="e">
				<tr>
					<td><a
						href="${pageContext.request.contextPath }/emp/findEmpById?id=${employee.id }&action=edit">编辑</a>
						<a
						href="${pageContext.request.contextPath }/emp/modifiedDeletestatus?id=${employee.id }">删除</a>
						<c:if
							test="${employee.work_status eq 0 && employee.work_message eq 0 }">
							<a
								href="${pageContext.request.contextPath }/emp/findEmpById?id=${employee.id }&action=changer">转正</a>
							<a
								href="${pageContext.request.contextPath }/emp/findEmpById?id=${employee.id }&action=dimission">离职</a>
						</c:if> <c:if
							test="${employee.work_status eq 0 && employee.work_message eq 1 }">
							<a
								href="${pageContext.request.contextPath }/emp/findEmpById?id=${employee.id }&action=dimission">离职</a>
						</c:if></td>
					<td>${employee.jobnum }</td>
					<td><a
						href="${pageContext.request.contextPath }/emp/findEmpById?id=${employee.id }&action=showInfo">${employee.empname }</a></td>
					<td>${employee.dept.deptname }</td>
					<td>${employee.job.jobname }</td>
					<c:if test="${employee.work_status eq 0 }">
						<td>在职</td>
					</c:if>
					<c:if test="${employee.work_status eq 1 }">
						<td>离职</td>
					</c:if>
					<c:if test="${employee.work_message eq 0 }">
						<td>试用期员工</td>
					</c:if>
					<c:if test="${employee.work_message eq 1 }">
						<td>正式员工</td>
					</c:if>
					<td><fmt:formatDate value="${employee.hiredate }"
							dateStyle="medium" /></td>
					<td><fmt:formatDate value="${employee.leavedate }"
							dateStyle="medium" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!--  -->

	

	<!-- 分页操作 -->
	<div align="center">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<c:if test="${info.pageNum eq 1 }">
					<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
				</c:if>

				<c:if test="${info.pageNum ne 1 }">
					<li><a
						href="${pageContext.request.contextPath }/emp/findAllEmps?pn=${info.pageNum -1 }&jobnum=${emp.jobnum }&dept_id=${emp.dept_id }&job_id=${emp.job_id }&empname=${emp.empname }&work_status=${emp.work_status }&work_message=${emp.work_message }"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>

				<c:forEach begin="1" end="${info.pages }" step="1" var="i">
					<c:if test="${info.pageNum eq i }">
						<li class="active"><span aria-hidden="true">${i}</span></li>
					</c:if>

					<c:if test="${info.pageNum ne i }">
						<li><a
							href="${pageContext.request.contextPath }/emp/findAllEmps?pn=${i}&jobnum=${emp.jobnum }&dept_id=${emp.dept_id }&job_id=${emp.job_id }&empname=${emp.empname }&work_status=${emp.work_status }&work_message=${emp.work_message }">${i}</a>
						</li>
					</c:if>
				</c:forEach>

				<c:if test="${info.pageNum+1 > info.pages}">
					<li class="disabled"><span aria-hidden="true">&raquo;</span></li>
				</c:if>

				<c:if test="${info.pageNum+1 <= info.pages }">
					<li><a
						href="${pageContext.request.contextPath }/emp/findAllEmps?pn=${info.pageNum + 1}&jobnum=${emp.jobnum }&dept_id=${emp.dept_id }&job_id=${emp.job_id }&empname=${emp.empname }&work_status=${emp.work_status }&work_message=${emp.work_message }"
						aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<span style="font-size: 18px">&nbsp;&nbsp;共${info.total }条记录，共${info.pages }页</span>
			</ul>
		</nav>
	</div>
</body>
</html>