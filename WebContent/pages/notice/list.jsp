<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>职业信息</title>
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
  </head>
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
       <%--  <a href="${ctx}">首页</a> --%>
      </span>
     <!-- javascript:location.replace(location.href); -->
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${ctx}/notice/findAll" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
    
      <div class="layui-row" style="" align="center">
      
        <form class="layui-form layui-col-md12 x-so" method="post" action="${ctx }/notice/moHuSearch">
        <table>
        <tr style="height:50px">
            <td style="text-align:right;width: 120px " ><span class="item_name">公告标题：</span></td>
           			 <td><input type="text" class="textbox textbox_225" style="width: 120px;height:30px" name="title" value="${notice1.title }" /></td>
            <td style="width: 120px; text-align: right"><span class="item_name">公告内容：</span></td>
            		 <td><input type="text" class="textbox textbox_225" style="width: 120px;height:30px" name="context" value="${notice1.context }" /></td>
            
            <td style="width: 120px; text-align: right">
                <input type="submit" value="查询" class="layui-btn" />
            </td>
        </tr>
    </table>
   </form>
   </div>
      
      <table class="layui-table">
        <thead>
          <tr>
            <th>公告标题</th>
            <th>公告内容</th>
            <th>创建日期</th>
            <th>最后一次修改时间</th>
            <th>创建用户</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.info.list}" var="notice" varStatus="stat">
     <tr>
            <td>${notice.title }</td>
            <td>${notice.context }</td>
            <%-- <td>${notice.create_date }</td> --%>
            <td><fmt:formatDate value="${notice.create_date }" pattern="yyyy-MM-dd"/></td>
            <%-- <td>${notice.lastModifiled }</td> --%>
            <c:if test="${ not empty notice.lastModifiled}"><td><fmt:formatDate value="${notice.lastModifiled }" pattern="yyyy-MM-dd"/></td></c:if>
            <c:if test="${ empty notice.lastModifiled}"><td>暂未修改</td></c:if>
            <td>${notice.user.username }</td>
            <td class="td-manage">
            
              <a title="编辑"  onclick="x_admin_show('编辑','${ctx}/notice/update?id=${notice.id }');" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除" onclick="member_del(this,'${notice.id }')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
              
               <a title="展示" onclick="x_admin_show('查看','${ctx}/notice/readNotice?id=${notice.id }')" href="javascript:;">
                <i class="layui-icon">&#xe611;</i>
              </a>
              
              
            </td>
          </tr>
				
			</c:forEach>
          
        </tbody>
      </table>
      
      
      <!--  <div class="page">  -->
      <div align="center">
      
       		<div>
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${info.pageNum eq 1 }">
						<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
					</c:if>

					<c:if test="${info.pageNum ne 1 }">
						<li><a
							href="${pageContext.request.contextPath }/notice/moHuSearch?pn=${info.pageNum -1 }&title=${notice1.title}&context=${notice1.context}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>


					<c:forEach begin="1" end="${info.pages }" step="1"
						var="i">
						<c:if test="${info.pageNum eq i }">
							<li class="active"><span aria-hidden="true">${i}</span></li>
						</c:if>

						<c:if test="${info.pageNum ne i }">
							<li>
								<a href="${pageContext.request.contextPath }/notice/moHuSearch?pn=${i}&title=${notice1.title}&context=${notice1.context}">${i}</a>
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
							href="${pageContext.request.contextPath }/notice/moHuSearch?pn=${info.pageNum + 1}&title=${notice1.title}&context=${notice1.context}"
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

      
       /*公告-查看*/
      function member_show(obj,id){
          layer.confirm('是否查看？',function(index){
              //发异步删除数据
              //等以后再使用异步，这里先使用
              $.get("${ctx}/notice/readNotice?id="+id);
          });
      } 
      

      /*公告-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              //等以后再使用异步，这里先使用
              $.get("${ctx}/notice/deleteNotice?id="+id);
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
    
  </body>

</html>