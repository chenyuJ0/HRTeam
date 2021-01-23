<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
    <meta charset="UTF-8">
    <title>添加部门</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/public/css/font.css">
    <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
   </head>
	<body>
		<form class="layui-form" method="POST" id="deptForm"  action="${ctx}/dept/addDept" >
				<table  style="width:50%" >
					 
						<tr style="height:50px">
							<td colspan="2"><input type="hidden" name="user_id" id="id" value="${user.id }" > </td>
						</tr>
						<tr style="height:50px">
							<td><label for="username" class="layui-form-label"><span class="x-red">*</span>部门编号</label>	
                  			</td>
							<td><input type="number" id="name" name="deptno" required="" lay-verify="required"
                  				 autocomplete="off" class="layui-input" value="${dept.deptno }"></td>
						</tr>
						<tr style="height:50px" >
							<td><label for="username" class="layui-form-label"><span class="x-red">*</span>部门名称</label>
							</td>
							<td><input type="text" id="name" name="deptname" required="" lay-verify="required"
                  				autocomplete="off" class="layui-input" value="${dept.deptname }"></td>
						</tr>
						<tr style="height:50px" >
							<td><label for="username" class="layui-form-label"><span class="x-red">*</span>部门主管</label>
							</td>
							<td><select class="layui-form-label" name="deptManager" >
                    					 <option value="0">暂无</option> 
                    				<c:forEach items="${requestScope.list}" var="employee" varStatus="stat">
                   		 				<option value="${employee.id }">${employee.empname }</option>
                    				</c:forEach>
                				</select>
                			</td>
						</tr>
						<tr style="height:50px">
							<td><label for="phone" class="layui-form-label"><span class="x-red">*</span>创建日期</label></td>
							<td><input type="date" id="name" name="create_date" required="" lay-verify="required"
                  				autocomplete="off" class="layui-input" value="${dept.create_date }"></td>
						</tr>
						<tr style="height:50px" >
							<td><label for="phone" class="layui-form-label"><span class="x-red">*</span>部门描述</label></td>
							<td><input type="text" id="remark" name="des" required="" lay-verify="required"
                  				autocomplete="off" class="layui-input" value="${dept.des }"></td>
						</tr>
						<tr style="height:50px" align="center">
							<td><label for="L_repass" class="layui-form-label"></label></</td>
							<td><input type="submit" value=" 提交" class="layui-btn" lay-filter="add" lay-submit=""/></td>
						</tr>
						
					
				</table>
			</form>
		<script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        

          //监听提交
          form.on('submit(add)', function(data){
        	  
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
            	document.getElementById('deptForm').submit();
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
               
            });
            return false;
          });
          
        });
        
        
    </script>
		
		
		
		
	</body>
</html>
