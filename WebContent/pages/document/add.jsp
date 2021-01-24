<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
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
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" method="POST" id="deptForm" enctype="multipart/form-data" action="${ctx}/doc/add">
          <div class="layui-form-item">
              <label for="title" class="layui-form-label">
                  <span class="x-red">*</span>备注
              </label>
              <div class="layui-input-inline">
                  <input type="textarea" id="title" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" placeholder="请输入备注"  name="description" value="">
              </div>
             
          </div>

            <div class="layui-form-item">
                <label for="z" class="layui-form-label">
                    <span class="x-red">*</span>创建人
                </label>
               <div class="layui-input-inline">
               		<input type="textarea" readonly="readonly" id="title"  required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${user.name }">
                  <input type="hidden" name="user_id" value=${user.id }>
              </div>
                   <%--  <select class="form-control">
                        <c:forEach items="${users}" var="item">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select> --%>
                </div>

            </div>


         <div class="layui-form-item">
              <label for="file" class="layui-form-label">
                  <span class="x-red">*</span>上传文件
              </label>
              <div class="layui-input-inline">
                  <input type="file" id="file" name="file" >
              </div>
             

             
          </div>
          <div class="layui-form-item">
              <label for="sub" class="layui-form-label">
              </label>
              <input type="submit" id="sub" value=" 提交" class="layui-btn" lay-filter="add" lay-submit=""/>
 
          </div>
           
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

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