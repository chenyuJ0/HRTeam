<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>员工转正设置</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/public/css/style.css" />
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/public/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/public/js/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <script type="text/javascript">
    	function getDate() {
			var myDate = new Date();
			myDate = myDate.formatDate('yyyy-MM-dd');
			return myDate;
		}
    </script>
</head>
<body style="padding:20px">
    <div class="page_title">
        <h2 class="fl">员工转正设置</h2>
    </div>
    <form action="${pageContext.request.contextPath }/emp/change" method="post">
    	<input type="hidden" name="changerecorder" value="${user.id }">
    	<input type="hidden" name="id" value="${emp.id }">
    	<input type="hidden" name="work_message" value="1">
	    <table>
	        <tr style="height:50px">
	            <td style="text-align: right"><span class="item_name">员工工号：</span></td>
	            <td><span class="item_name">${emp.jobnum }</span></td>
	            <td style="text-align: right"><span class="item_name">员工姓名：</span></td>
	            <td><span class="item_name">${emp.empname }</span></td>
	        </tr>
	        <tr style="height:50px">
	            <td style="text-align: right"><span class="item_name">部门：</span></td>
	            <td><span class="item_name">
	            	<c:if test="${emp.dept_id eq 1 }">人事部</c:if>
	            	<c:if test="${emp.dept_id eq 2 }">财务部</c:if>
	            	<c:if test="${emp.dept_id eq 3 }">开发部</c:if>
	            	<c:if test="${emp.dept_id eq 4 }">销售部</c:if>
	            </span></td>
	            <td style="text-align: right"><span class="item_name">岗位：</span></td>
	            <td><span class="item_name">
	            	<c:if test="${emp.job_id eq 1 }">初级程序员</c:if>
	            	<c:if test="${emp.job_id eq 2 }">中级程序员</c:if>
	            	<c:if test="${emp.job_id eq 3 }">高级程序员</c:if>
	            	<c:if test="${emp.job_id eq 4 }">人事专员</c:if>
	            	<c:if test="${emp.job_id eq 5 }">人事主管</c:if>
	            	<c:if test="${emp.job_id eq 6 }">出纳</c:if>
	            	<c:if test="${emp.job_id eq 7 }">会计</c:if>
	            	<c:if test="${emp.job_id eq 8 }">销售员</c:if>
	            	<c:if test="${emp.job_id eq 9 }">销售经理</c:if>
	            </span></td>
	        </tr>
	        <tr style="height:50px">
	            <td style="text-align: right"><span class="item_name">入职日期：</span></td>
	            <td><span class="item_name">
	            	<fmt:formatDate value="${emp.hiredate }" dateStyle="medium"/>
	            </span></td>
	            <td style="text-align: right"><span class="item_name">原转正日期：</span></td>
	            <td><span class="item_name">
					<fmt:formatDate value="${rechangedate }" dateStyle="medium"/>
				</span></td>
	        </tr>
	        <tr style="height:50px">
	            <td style="text-align: right"><span class="item_name">转正类型：</span></td>
	            <td>
	                <select class="select" name="changetype">
	                    <option value="0">正常转正</option>
	                    <option value="1">提前转正</option>
	                    <option value="2">推迟转正</option>
	                </select>
	            </td>
	            <td style="text-align: right"><span class="item_name">转正日期：</span></td>
	            <td>
	            	<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	            	<input type="text" class="textbox textbox_225" name="changedate" value="<fmt:formatDate value="${now }" pattern='yyyy-MM-dd'/>" />
				</td>
	        </tr>
	        <tr>
	            <td style="text-align:right"><span class="item_name">转正信息：</span></td>
	            <td colspan="3">
	                <textarea placeholder="转正信息" class="textarea" name="changecomment" style="width:580px;height:100px;"></textarea>
	            </td>
	        </tr>
	        <tr style="height:50px">
	            <td></td>
	            <td colspan="3">
	                <input type="submit" value="保存" class="group_btn" />
	                &nbsp;&nbsp;
	                <input type="reset" value="重置" class="group_btn" />
	                &nbsp;&nbsp;
	                <input type="button" value="返回" class="group_btn" id="return" />
	        </tr>
	    </table>
    </form>
    <script type="text/javascript">
		document.getElementById("return").onclick=function(){
			// window.location.href="${pageContext.request.contextPath}/findAllServlet";返回上一级（但是相当于前进）
			history.back();// 真正的返回历史记录的上一级
		}
	</script>
</body>
</html>
