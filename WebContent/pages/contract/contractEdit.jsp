<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑合同信息</title>
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
	<form action="${pageContext.request.contextPath }/con/updateCon">
		<div class="page_title">
			<h2 class="fl">编辑合同信息</h2>
		</div>
		<table>
			<tr style="height: 50px">
				<td style="text-align: right"><span class="item_name">员工姓名：</span></td>
				<td style="width: 300px">${emp.empname}</td>
				<td style="text-align: right"><span class="item_name">员工编号：</span></td>
				<td>${emp.jobnum}</td>
			</tr>
			<tr style="height: 50px">
				<td style="text-align: right"><span class="item_name">部门：</span></td>
				<td>${emp.dept.deptname}</td>
				<td style="text-align: right"><span class="item_name">职位：</span></td>
				<td>${emp.job.jobname}</td>
			</tr>
			<tr style="height: 50px">
				<td style="text-align: right"><span class="item_name">签订日期：</span></td>
				<td><input type="date" class="textbox textbox_225" name="contract_date" value=""/></td>
				<td></td>
				<td></td>
			</tr>
			<tr style="height: 50px">
				<td style="text-align: right"><span class="item_name">合同开始日期：</span></td>
				<td><input type="date" class="textbox textbox_225" name="start_date" value=""/></td>
				<td style="text-align: right"><span class="item_name">合同结束日期：</span></td>
				<td><input type="date" class="textbox textbox_225" name="end_date" value=""/></td>
			</tr>
			<tr>
				<td style="text-align: right"><span class="item_name">备注：</span></td>
				<td colspan="3"><textarea placeholder="备注信息" class="textarea"
						style="width: 580px; height: 100px;" name="comment" value=""></textarea></td>
			</tr>
			<tr style="height: 50px">
				<td></td>
				<td colspan="3"><input type="submit" value="保存"
					class="group_btn" /> &nbsp;&nbsp; <input type="button" value="返回" class="group_btn" id="return"/>
			</tr>
			<input type="hidden" name="id" value="${emp.contract.id }"/>
		</table>
		<script type="text/javascript">
		document.getElementById("return").onclick=function(){
			// window.location.href="${pageContext.request.contextPath}/findAllServlet";返回上一级（但是相当于前进）
			history.back();// 真正的返回历史记录的上一级
		}
	</script>
	</form>
</body>
</html>
