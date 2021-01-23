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
		<form class="layui-form" method="POST" id="deptForm"  action="${ctx}/notice/updateNotice">
				<table  style="width:50%" >
					 
						<tr style="height:50px">
							<td colspan="2"><input type="hidden" name="id" id="id" value="${notice.id }" > </td>
						</tr>
						<tr style="height:50px">
							<td><label for="username" class="layui-form-label"><span class="x-red">*</span>公告标题</label>	
                  			</td>
							<td><input type="text" id="name" name="title" required="" lay-verify="required"
                 				 autocomplete="off" class="layui-input" value="${notice.title }" /></td>
						</tr>
						<tr style="height:50px" >
							<td><label for="username" class="layui-form-label"><span class="x-red">*</span>公告内容</label>
							</td>
							<td><input type="text" id="name" name="context" required="" lay-verify="required"
                  				autocomplete="off" class="layui-input" value="${notice.context }"></td>
						</tr>
						
						<tr style="height:50px" >
							<td><label for="username" class="layui-form-label"><span class="x-red">*</span>创建时间</label>
							</td>
							<td><input type="date" id="name" name="create_date" required="" lay-verify="required" 
                  				autocomplete="off" class="layui-input" value="${notice.create_date }"></td>
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
            layer.alert("修改成功", {icon: 6},function () {
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
