<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>部门信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/public/css/font.css">
    <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
    
    <link href="${ctx }/public/css/bootstrap.min.css" rel="stylesheet">
    
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
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <%-- <a href="${ctx}">首页</a> --%>
      </span>
      																									
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${ctx}/dept/findAll" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
    
      <div class="layui-row" style="" align="center">
      
        <form class="layui-form layui-col-md12 x-so" method="post" action="${ctx }/dept/moHuSearch">
        <table>
        <tr style="height:50px">
            <td style="text-align:right;width: 120px " ><span class="item_name">部门描述：</span></td>
           			 <td><input type="text" class="textbox textbox_225" style="width: 120px;height:30px" name="des"  value="${dept1.des}" /></td>
            <td style="width: 120px; text-align: right"><span class="item_name">部门名称：</span></td>
            <td>
                <select class="select" name="id">
                    <option value="">全部</option>
                    <c:forEach items="${requestScope.list2}" var="dept" varStatus="stat">
                   		 <option value="${dept.id }"   <c:if test="${dept.id eq dept1.id}">selected="selected"</c:if>    >${dept.deptname }</option>
                    </c:forEach>
                    
                </select>
            </td>
            
            <td style="width: 120px; text-align: right">
                <input type="submit" value="查询" class="layui-btn" />
               <!--  <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button> -->
            </td>
        </tr>
    	</table>
       </form>
      </div>
  
      <table class="layui-table">
        <thead>
          <tr>
           <!--  <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th> -->
            <th>部门编号</th>
            <th>部门名称</th>
            <th>部门主管</th> 
            <th>部门创建日期</th>
            <th>部门描述</th>
            <th>部门人数</th>
            <th>创建人</th>
         <!-- <th>状态</th> -->
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.info.list}" var="dept" varStatus="stat">
     <tr>
           <!--  <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td> -->
            <td>${dept.deptno }</td>
            <td>${dept.deptname }</td>
            <c:if test="${ not empty dept.emp.empname}"><td>${dept.emp.empname }</td></c:if>
            <c:if test="${ empty dept.emp.empname}"><td>暂无</td></c:if>
            <td><fmt:formatDate value="${dept.create_date }" pattern="yyyy-MM-dd"/></td>
            <td>${dept.des }</td>
            <td>${dept.count }</td>
            <td>${dept.user.username }</td>
           
            <td class="td-manage">
             
              <a title="编辑"  onclick="x_admin_show('编辑','${ctx}/dept/update?id=${dept.id }');" href="javascript:;">
             
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除" onclick="member_del(this,'${dept.id }')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
				
			</c:forEach>
          
        </tbody>
      </table>
      
      
      <div align="center">
      
      
       		<div>
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${info.pageNum eq 1 }">
						<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
					</c:if>

					<c:if test="${info.pageNum ne 1 }">
						<li><a
							href="${pageContext.request.contextPath }/dept/moHuSearch?pn=${info.pageNum -1 }&des=${dept1.des}&id=${dept1.id}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>


					<c:forEach begin="1" end="${info.pages }" step="1" var="i">
						<c:if test="${info.pageNum eq i }">
							<li class="active"><span aria-hidden="true">${i}</span></li>
						</c:if>

						<c:if test="${info.pageNum ne i }">
							<li><a
								href="${pageContext.request.contextPath }/dept/moHuSearch?pn=${i}&des=${dept1.des}&id=${dept1.id}">${i}</a>
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
							href="${pageContext.request.contextPath }/dept/moHuSearch?pn=${info.pageNum + 1}&des=${dept1.des}&id=${dept1.id}"
							aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<span style="font-size: 18px">&nbsp;&nbsp;共${info.total }条记录，共${info.pages }页</span>
				</ul>
			</nav>
		</div>
       
      </div>

    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

    

      /*部门-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              //等以后再使用异步，这里先使用
              $.get("${ctx}/dept/deleteDept?id="+id);
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }



      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
   <!--  <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script> -->
  </body>

</html>