<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>员工入职</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/public/css/style.css" />
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/public/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/public/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding:20px">
    <div class="page_title">
        <h2 class="fl">员工入职</h2>
    </div>
    <form action="${pageContext.request.contextPath }/emp/addEmp" method="post">
    	<input type="hidden" name="recorder" value="${user.id }">
	    <table>
	        <tr style="height:50px">
	            <td style="text-align:right"><span class="item_name">员工姓名：</span></td>
	            <td><input type="text" class="textbox textbox_225" name="empname" /></td>
	            <td style="text-align:right"><span class="item_name">身份证号码：</span></td>
	            <td><input type="text" class="textbox textbox_225" id="idcard" name="empID" /></td>
	        </tr>
	        <tr style="height:50px">
	            <td style="text-align:right"><span class="item_name">性别：</span></td>
	            <td>
	                <select class="select" id="sex" name="gender" onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;"">
	                    <option value="0" >男</option>
	                    <option value="1" >女</option>
	                </select>
	            </td>
	            <td style="text-align:right"><span class="item_name">出生年月：</span></td>
	            <td><input type="text" class="textbox textbox_225" id="birthday" name="birth" readonly="readonly" /></td>
	        </tr>
	        <tr style="height:50px">
	            <td style="text-align: right"><span class="item_name">部门：</span></td>
	            <td>
	                <select class="select" name="dept_id">
	                    <option value="1">人事部</option>
	                    <option value="2">财务部</option>
	                    <option value="3">开发部</option>
	                    <option value="4">销售部</option>
	                </select>
	            </td>
	            <td style="text-align: right"><span class="item_name">职位：</span></td>
	            <td>
	                <select class="select" name="job_id">
	                    <option value="1">初级程序员</option>
	                    <option value="2">中级程序员</option>
	                    <option value="3">高级程序员</option>
	                    <option value="4">人事专员</option>
	                    <option value="5">人事主管</option>
	                    <option value="6">出纳</option>
	                    <option value="7">会计</option>
	                    <option value="8">销售员</option>
	                    <option value="9">销售经理</option>
	                </select>
	            </td>
	        </tr>
	        <tr style="height:50px">
	            
	            
	            <td style="text-align: right"><span class="item_name">员工状态：</span></td>
	            <td>
	                <select class="select" name="work_status">
	                    <option value="0">在职</option>
	                    <option value="1">离职</option>
	                </select>
	            </td>
	            <td style="text-align: right"><span class="item_name">用工信息：</span></td>
	            <td>
	                <select class="select" name="work_message">
	                    <option value="0">试用期员工</option>
	                    <option value="1">正式员工</option>
	                </select>
	            </td>
	        </tr>
	        <tr style="height:50px">
	            <td style="text-align:right"><span class="item_name">入职时间：</span></td>
	            <td>
	            	<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	            	<input type="text" class="textbox textbox_225" name="hiredate" value="<fmt:formatDate value="${now }" pattern='yyyy-MM-dd'/>" />
	            </td>
	            <td style="text-align:right"><span class="item_name">介绍人：</span></td>
	            <td><input type="text" class="textbox textbox_225" name="introducer" /></td>
	        </tr>
	        <tr>
	            <td style="text-align:right"><span class="item_name">备注：</span></td>
	            <td colspan="3">
	                <textarea placeholder="备注信息" class="textarea" name="comment" style="width:580px;height:100px;"></textarea>
	            </td>
	        </tr>
	        <tr style="height:50px">
	            <td></td>
	            <td colspan="3">
	                <input type="submit" value="保存" class="group_btn" onsubmit="return checkDisable();" />
	                &nbsp;&nbsp;
	                <input type="reset" value="重置" class="group_btn" />
	                <!-- &nbsp;&nbsp;
	                <input type="button" value="返回" class="group_btn" id="return"/> -->
	        </tr>
	    </table>
    </form>
    
    <script type="text/javascript">
		/* document.getElementById("return").onclick=function(){
			// window.location.href="${pageContext.request.contextPath}/findAllServlet";返回上一级（但是相当于前进）
			history.back();// 真正的返回历史记录的上一级
			
		} */
		
		document.getElementById("idcard").onblur=function(){
			var value = this.value.trim();
			var regExp = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{7}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$)/;
			if(!regExp.test(value)){
			   alert('身份证号非法.');
			   return;
			}
			
			var birthday = document.getElementById("birthday");
			var sex = document.getElementById("sex");
			
			if(value.length == 18){
			 var tmpStr = value.substring(6, 14);
			 birthday.value = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6)
			 sex.value = value.slice(14, 17) % 2 ? "0" : "1"; //0代表男，1代表女
			}
			if(value.length == 15){
			 var tmpStr = value.substring(6, 12);
			 temStr = "19" +temStr;
			 birthday.value = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6)
			 sex.value = value.slice(14, 15) % 2 ? "0" : "1";
			}
		}
		
		function checkDisable(){
			var birthday = document.getElementById("birthday");
			var sex = document.getElementById("sex");
			if(birthday.disabled == true && sex.disabled == true){
				// $("#birthday").removeAttr("disabled");
				birthday.disabled = false;
				// $("sex").removeAttr("disabled");
				sex.disabled = false;
			}
			return true;
		}
	</script>
</body>
</html>
