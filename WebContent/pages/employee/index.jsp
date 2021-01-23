<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>员工管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/public/css/style.css" />
	<link href="${pageContext.request.contextPath}/public/css/bootstrap.min.css" rel="stylesheet">
	
    <!--[if lt IE 9]>
    <script src="public/js/html5.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/public/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/public/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding:20px">
	<!-- 用于模糊查询 -->
	<form action="${pageContext.request.contextPath }/emp/findAllEmps" method="post">
		<table>
		    <tr style="height:50px">
		        <td style="text-align:right"><span class="item_name">员工工号：</span></td>
		        <td><input type="text" class="textbox textbox_225" name="jobnum" value="${emp.jobnum }"/></td>
		        <td style="width: 120px; text-align: right"><span class="item_name">部门：</span></td>
		        <td>
		            <select class="select" name="dept_id">
		                <option value="0">全部</option>
		                <option value="1" <c:if test="${emp.dept_id eq 1 }">selected="selected"</c:if> >人事部</option>
	                    <option value="2" <c:if test="${emp.dept_id eq 2 }">selected="selected"</c:if> >财务部</option>
	                    <option value="3" <c:if test="${emp.dept_id eq 3 }">selected="selected"</c:if> >开发部</option>
	                    <option value="4" <c:if test="${emp.dept_id eq 4 }">selected="selected"</c:if> >销售部</option>
		            </select>
		        </td>
		        <td style="width: 120px; text-align: right"><span class="item_name">职位：</span></td>
		        <td>
		            <select class="select" name="job_id">
		                <option value="0">全部</option>
		                <option value="1" <c:if test="${emp.job_id eq 1 }">selected="selected"</c:if> >初级程序员</option>
	                    <option value="2" <c:if test="${emp.job_id eq 2 }">selected="selected"</c:if> >中级程序员</option>
	                    <option value="3" <c:if test="${emp.job_id eq 3 }">selected="selected"</c:if> >高级程序员</option>
	                    <option value="4" <c:if test="${emp.job_id eq 4 }">selected="selected"</c:if> >人事专员</option>
	                    <option value="5" <c:if test="${emp.job_id eq 5 }">selected="selected"</c:if> >人事主管</option>
	                    <option value="6" <c:if test="${emp.job_id eq 6 }">selected="selected"</c:if> >出纳</option>
	                    <option value="7" <c:if test="${emp.job_id eq 7 }">selected="selected"</c:if> >会计</option>
	                    <option value="8" <c:if test="${emp.job_id eq 8 }">selected="selected"</c:if> >销售员</option>
	                    <option value="9" <c:if test="${emp.job_id eq 9 }">selected="selected"</c:if> >销售经理</option>
		            </select>
		        </td>
		        <td></td>
		    </tr>
		    <tr style="height:50px">
		        <td style="text-align:right"><span class="item_name">员工姓名：</span></td>
		        <td><input type="text" class="textbox textbox_225" name="empname" value="${emp.empname }" /></td>
		        <td style="width: 120px; text-align: right"><span class="item_name">员工状态：</span></td>
		        <td>
		            <select class="select" name="work_status">
		                <option value="0" >全部</option>
		                <option value="1" <c:if test="${emp.work_status eq 1 }">selected="selected"</c:if> >在职</option>
	                    <option value="2" <c:if test="${emp.work_status eq 2 }">selected="selected"</c:if> >离职</option>
		            </select>
		        </td>
		        <td style="width: 120px; text-align: right"><span class="item_name">用工信息：</span></td>
		        <td>
		            <select class="select" name="work_message">
		                <option value="0" >全部</option>
		                <option value="1" <c:if test="${emp.work_message eq 1 }">selected="selected"</c:if> >试用期员工</option>
	                    <option value="2" <c:if test="${emp.work_message eq 2 }">selected="selected"</c:if> >正式员工</option>
		            </select>
		        </td>
		        <td style="width: 120px; text-align: right">
		            <input type="submit" value="查询" class="group_btn" />
		        </td>
		    </tr>
		</table>
	</form>
	<!-- 用于修改删除员工后的deletestatus -->
		    <form id="deleteForm" action="${pageContext.request.contextPath }/emp/modifiedDeletestatus" method="post">
		    	<input type="hidden" name="id" id="deleteId">
		    	<input type="hidden" name="deletestatus" value="1">
		    </form>

    <div class="page_title">
        <h2 class="fl">员工信息</h2>
    </div>
    <table class="table">
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
        <c:forEach items="${info.list }" var="employee" varStatus="e">
	        <tr>
	            <td>
	                <a href="${pageContext.request.contextPath }/emp/findEmpById?id=${employee.id }&action=edit">编辑</a>
	                <a href="${pageContext.request.contextPath }/emp/modifiedDeletestatus?id=${employee.id }" >删除</a>
	                <c:if test="${employee.work_status eq 0 && employee.work_message eq 0 }">
	                	<a href="${pageContext.request.contextPath }/emp/findEmpById?id=${employee.id }&action=changer">转正</a>
	                	<a href="${pageContext.request.contextPath }/emp/findEmpById?id=${employee.id }&action=dimission">离职</a>
	                </c:if>
	                <c:if test="${employee.work_status eq 0 && employee.work_message eq 1 }">
	                	<a href="${pageContext.request.contextPath }/emp/findEmpById?id=${employee.id }&action=dimission">离职</a>
	                </c:if>
	            </td>
	            <td>${employee.jobnum }</td>
	            <td><a href="${pageContext.request.contextPath }/emp/findEmpById?id=${employee.id }&action=showInfo">${employee.empname }</a></td>
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
	            <td><fmt:formatDate value="${employee.hiredate }" dateStyle="medium"/></td>
	            <td></td>
	        </tr>
        </c:forEach>
    </table>
    
    <!-- 分页操作 -->
	<div>
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

				<c:forEach begin="1" end="${info.pages }" step="1"
					var="i">
					<c:if test="${info.pageNum eq i }">
						<li class="active"><span aria-hidden="true">${i}</span></li>
					</c:if>

					<c:if test="${info.pageNum ne i }">
						<li><a
							href="${pageContext.request.contextPath }/emp/findAllEmps?pn=${i}&jobnum=${emp.jobnum }&dept_id=${emp.dept_id }&job_id=${emp.job_id }&empname=${emp.empname }&work_status=${emp.work_status }&work_message=${emp.work_message }">${i}</a>
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