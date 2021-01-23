<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>员工信息查看</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/public/css/style.css" />
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/public/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/pubiic/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding:20px">
    <div class="page_title">
        <h2 class="fl">员工信息</h2>
    </div>
    <table>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">员工姓名：</span></td>
            <td style="width:100px">${emp.empname }</td>
            <td style="text-align:right"><span class="item_name">身份证号码：</span></td>
            <td>${emp.empID }</td>
        </tr>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">性别：</span></td>
            <td>
				<c:if test="${emp.gender eq 0 }">男</c:if>
				<c:if test="${emp.gender eq 1 }">女</c:if>
			</td>
            <td style="text-align:right"><span class="item_name">出生年月：</span></td>
            <td><fmt:formatDate value="${emp.birth }" dateStyle="medium"/></td>
        </tr>
        <tr style="height:50px">
            <td style="text-align: right"><span class="item_name">部门：</span></td>
            <td>
	            ${emp.dept.deptname }
            </td>
            <td style="text-align: right"><span class="item_name">职位：</span></td>
            <td>
            	${emp.job.jobname }
            </td>
        </tr>
        <tr style="height:50px">
            <td style="text-align: right"><span class="item_name">员工状态：</span></td>
            <td>
            	<c:if test="${emp.work_status eq 0 }">在职</c:if>
            	<c:if test="${emp.work_status eq 1 }">离职</c:if>
            </td>
            <td style="text-align: right"><span class="item_name">用工信息：</span></td>
            <td>
            	<c:if test="${emp.work_message eq 0 }">试用期员工</c:if>
            	<c:if test="${emp.work_message eq 1 }">正式员工</c:if>
            </td>
        </tr>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">入职时间：</span></td>
            <td>
            	<fmt:formatDate value="${emp.hiredate }" dateStyle="medium"/>
            </td>
            <td style="text-align:right"><span class="item_name">介绍人：</span></td>
            <td>${emp.introducer }</td>
        </tr>
        <tr>
            <td style="text-align:right"><span class="item_name">备注：</span></td>
            <td colspan="3"><pre>${emp.comment }</pre></td>
        </tr>
        <tr style="height:50px">
            <td></td>
            <td colspan="3">
                <input type="button" value="返回" class="group_btn" id="return"/>
        </tr>
    </table>
    <script type="text/javascript">
		document.getElementById("return").onclick=function(){
			// window.location.href="${pageContext.request.contextPath}/findAllServlet";返回上一级（但是相当于前进）
			history.back();// 真正的返回历史记录的上一级
		}
	</script>
</body>
</html>
