<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>签订合同</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/public/css/style.css" />
<!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
<script src="${pageContext.request.contextPath }/public/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>
<script
	src="${pageContext.request.contextPath }/public/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding: 20px">
	<div class="page_title">
		<h2 class="fl">签订合同</h2>
	</div>
	<form action="${pageContext.request.contextPath }/con/addCon">
		<table>
			<tr style="height: 50px">
				<td style="text-align: right"><span class="item_name">员工姓名：</span></td>
				<td style="width: 300px">${emp.empname }</td>
				<td style="text-align: right"><span class="item_name">员工编号：</span></td>
				<td>${emp.jobnum }</td>
			</tr>

			<tr style="height: 50px">
				<td style="text-align: right"><span class="item_name">部门：</span></td>
				<td>${emp.dept.deptname }</td>
				<td style="text-align: right"><span class="item_name">职位：</span></td>
				<td>${emp.job.jobname }</td>
			</tr>

			<c:if test="${emp.contract.contract_date ne null}">
				<tr style="height: 50px">
					<td style="text-align: right"><span class="item_name">上次签订日期：</span></td>
					<td><fmt:formatDate value="${emp.contract.contract_date }"
							dateStyle="medium" /></td>
					<td></td>
					<td></td>
				</tr>

				<tr style="height: 50px">
					<td style="text-align: right"><span class="item_name">上次合同开始日期：</span></td>
					<td><fmt:formatDate value="${emp.contract.start_date }"
							dateStyle="medium" /></td>
					<td style="text-align: right"><span class="item_name">上次合同结束日期：</span></td>
					<td><fmt:formatDate value="${emp.contract.end_date }"
							dateStyle="medium" /></td>
				</tr>
			</c:if>

			<tr style="height: 50px">
				<td style="text-align: right"><span class="item_name">签订日期：</span></td>
				<td><input type="date" class="textbox textbox_225"
					name="contract_date" value="contract_date" /></td>
				<td></td>
				<td></td>
			</tr>
			<tr style="height: 50px">
				<td style="text-align: right"><span class="item_name">本次合同开始日期：</span></td>
				<td><input type="date" class="textbox textbox_225"
					name="start_date" value="start_date" /></td>
				<td style="text-align: right"><span class="item_name">本次合同结束日期：</span></td>
				<td><input type="date" class="textbox textbox_225"
					name="end_date" value="end_date" /></td>
			</tr>

			<tr>
				<td style="text-align: right"><span class="item_name">备注：</span></td>
				<td colspan="3"><textarea placeholder="备注信息" class="textarea"
						style="width: 580px; height: 100px;" name="comment"></textarea></td>
			</tr>
			<tr style="height: 50px">
				<td></td>
				<td colspan="3"><input type="submit" value="保存"
					class="group_btn" /> &nbsp;&nbsp; <a
					href="${pageContext.request.contextPath }/con/findAllCons"></a>
					&nbsp;&nbsp;
                	<input type="button" value="返回" onclick="javascript:window.location.replace(document.referrer;)" class="group_btn" />
				<!-- <input type="button" value="返回" οnclick="javascript:window.location.replace(document.referrer);"/> -->
			</tr>

			<input type="hidden" name="emp_id" value="${emp.id }" />
		</table>
	</form>
</body>
</html>
