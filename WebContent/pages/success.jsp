<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/con/findAllCons">
    <table>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">员工姓名：</span></td>
            <td><input type="text" class="textbox textbox_225" name="empname" value="${emp.empname }"/></td>
            <td style="width: 120px; text-align: right"><span class="item_name">部门：</span></td>
            
            <td>
                <select class="select" name="dept_id">
                    <option value="0">全部</option>
                    <%-- <c:forEach items="${info.list }" var="${dept }">
                    	<option value="dept.id">${dept.deptname }</option>
                    </c:forEach> --%>
                    
                    <option value="1" <c:if test="${emp.dept_id eq 1 }">selected="selected"</c:if> >人事部</option>
                    <option value="2" <c:if test="${emp.dept_id eq 2 }">selected="selected"</c:if> >财务部</option>
                    <option value="3" <c:if test="${emp.dept_id eq 3 }">selected="selected"</c:if> >开发部</option>
                    <option value="4" <c:if test="${emp.dept_id eq 4 }">selected="selected"</c:if> >销售部</option>
                </select>
            </td>
            
            <td style="width: 120px; text-align: right"><span class="item_name">转正类型：</span></td>
            <td>
                <select class="select" name="changetype">
                    <option value="0">全部</option>
                    <option value="1" <c:if test="${emp.changetype eq 1 }">selected="selected"</c:if> >正常转正</option>
                    <option value="2" <c:if test="${emp.changetype eq 2 }">selected="selected"</c:if> >提前转正</option>
                    <option value="3" <c:if test="${emp.changetype eq 3 }">selected="selected"</c:if> >推迟转正</option>
                </select>
            </td>
            <td style="width: 120px; text-align: right">
                <input type="submit" value="查询" class="group_btn" />
            </td>
        </tr>
    </table>
</form>
    <div class="page_title">
        <h2 class="fl">转正信息</h2>
    </div>
    <table class="table">
        <tr>
            <th>员工编号</th>
            <th>姓名</th>
            <th>部门</th>
            <th>职位</th>
            <th>转正类型</th>
            <th>入职日期</th>
            <th>转正日期</th>
            <th>创建人</th>
        </tr>
        
        <c:forEach items="${info.list }" var="emp">
        	<tr>
        		<td>${emp.jobnum }</td>
        		<td>${emp.empname }</td>
        		<td>${emp.dept.deptname }</td>
        		<td>${emp.job.jobname }</td>
        		<td>
        			<c:if test="${emp.changetype eq 0 }">正常转正</c:if>
        			<c:if test="${emp.changetype eq 1 }">提前转正</c:if>
        			<c:if test="${emp.changetype eq 2 }">提前转正</c:if>
        		</td>
        		<td><fmt:formatDate value="${emp.hiredate }" dateStyle="medium"/></td>
        		<td><fmt:formatDate value="${emp.changedate }" dateStyle="medium"/></td>
        		<td>${emp.user.name }</td>
        	</tr>
        </c:forEach>
       
    </table>
    
    
    <div class="page_title">
        <h2 class="fl">转正信息</h2>
    </div>
    <table class="table">
        <tr>
            <th>员工编号</th>
            <th>姓名</th>
            <th>部门</th>
            <th>职位</th>
            <th>转正类型</th>
            <th>入职日期</th>
            <th>转正日期</th>
            <th>创建人</th>
        </tr>
        
        <c:forEach items="${info.list }" var="emp">
        	<tr>
        		<td>${emp.jobnum }</td>
        		<td>${emp.empname }</td>
        		<td>${emp.dept.deptname }</td>
        		<td>${emp.job.jobname }</td>
        		<td>
        			<c:if test="${emp.changetype eq 0 }">正常转正</c:if>
        			<c:if test="${emp.changetype eq 1 }">提前转正</c:if>
        			<c:if test="${emp.changetype eq 2 }">提前转正</c:if>
        		</td>
        		<td><fmt:formatDate value="${emp.hiredate }" dateStyle="medium"/></td>
        		<td><fmt:formatDate value="${emp.changedate }" dateStyle="medium"/></td>
        		<td>${emp.user.name }</td>
        	</tr>
        </c:forEach>
       
    
  <!--  -->  
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>