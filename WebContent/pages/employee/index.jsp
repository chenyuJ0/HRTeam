<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
     <link href="${pageContext.request.contextPath}/public/css/bootstrap.min.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>员工管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/public/css/style.css" />
    <!--[if lt IE 9]>
    <script src="public/js/html5.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/public/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/public/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding:20px">
   <table>
       <tr style="height:50px">
           <td style="text-align:right"><span class="item_name">员工工号：</span></td>
           <td><input type="text" class="textbox textbox_225" /></td>
           <td style="width: 120px; text-align: right"><span class="item_name">部门：</span></td>
           <td>
               <select class="select">
                   <option>全部</option>
                   <option>人事部</option>
                   <option>财务部</option>
                   <option>开发部</option>
                   <option>销售部</option>
               </select>
           </td>
           <td style="width: 120px; text-align: right"><span class="item_name">职位：</span></td>
           <td>
               <select class="select">
                   <option>全部</option>
                   <option>初级程序员</option>
                   <option>中级程序员</option>
                   <option>高级程序员</option>
                   <option>人事专员</option>
                   <option>人事主管</option>
                   <option>出纳</option>
                   <option>会计</option>
                   <option>销售员</option>
                   <option>销售经理</option>
               </select>
           </td>
           <td></td>
       </tr>
       <tr style="height:50px">
           <td style="text-align:right"><span class="item_name">员工姓名：</span></td>
           <td><input type="text" class="textbox textbox_225" /></td>
           <td style="width: 120px; text-align: right"><span class="item_name">员工状态：</span></td>
           <td>
               <select class="select">
                   <option>全部</option>
                   <option>在职</option>
                   <option>离职</option>
               </select>
           </td>
           <td style="width: 120px; text-align: right"><span class="item_name">用工信息：</span></td>
           <td>
               <select class="select">
                   <option>全部</option>
                   <option>试用期员工</option>
                   <option>正式员工</option>
               </select>
           </td>
           <td style="width: 120px; text-align: right">
               <input type="button" value="查询" class="group_btn" />
           </td>
       </tr>
   </table>

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
        <tr>
            <td>
                <a href="edit.html">编辑</a>
                <a href="#">删除</a>
                <a href="Changer.html">转正</a>
                <a href="Dimission.html">离职</a>
            </td>
            <td>00001</td>
            <td><a href="ShowInfo.html">张三</a></td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>在职</td>
            <td>试用期员工</td>
            <td>2016-1-1</td>
            <td></td>
        </tr>
        <tr>
            <td>
                <a href="edit.html">编辑</a>
                <a href="#">删除</a>
                <a href="Dimission.html">离职</a>
            </td>
            <td>00001</td>
            <td><a href="ShowInfo.html">张三</a></td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>在职</td>
            <td>正式员工</td>
            <td>2016-1-1</td>
            <td></td>
        </tr>
        <tr>
            <td>
                <a href="edit.html">编辑</a>
                <a href="#">删除</a>
            </td>
            <td>00001</td>
            <td><a href="ShowInfo.html">张三</a></td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>离职</td>
            <td>正式员工</td>
            <td>2016-3-1</td>
            <td>2016-4-1</td>
        </tr>
        <tr>
            <td>
                <a href="edit.html">编辑</a>
                <a href="#">删除</a>
            </td>
            <td>00001</td>
            <td><a href="ShowInfo.html">张三</a></td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>离职</td>
            <td>试用期员工</td>
            <td>2016-1-1</td>
            <td></td>
        </tr>
        <tr>
            <td>
                <a href="edit.html">编辑</a>
                <a href="#">删除</a>
            </td>
            <td>00001</td>
            <td><a href="ShowInfo.html">张三</a></td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>离职</td>
            <td>正式员工</td>
            <td>2016-1-1</td>
            <td>2016-7-1</td>
        </tr>
        <tr>
            <td>
                <a href="edit.html">编辑</a>
                <a href="#">删除</a>
                <a href="Dimission.html">离职</a>
            </td>
            <td>00001</td>
            <td><a href="ShowInfo.html">张三</a></td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>在职</td>
            <td>正式员工</td>
            <td>2016-1-1</td>
            <td></td>
        </tr>
    </table>
    <aside class="paging">
        <a>第一页</a>
        <a>1</a>
        <a>2</a>
        <a>3</a>
        <a>…</a>
        <a>1004</a>
        <a>最后一页</a>
    </aside>
</body>
</html>

</body>
</html>