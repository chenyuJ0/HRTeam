<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>未签订合同人员</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding:20px">
    <table>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">员工姓名：</span></td>
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
            <td style="width: 120px; text-align: right">
                <input type="button" value="查询" class="group_btn" />
            </td>
        </tr>
    </table>

    <div class="page_title">
        <h2 class="fl">人员信息</h2>
    </div>
    <table class="table">
        <tr>
            <th>操作</th>
            <th>员工编号</th>
            <th>姓名</th>
            <th>部门</th>
            <th>职位</th>
            <th>入职日期</th>
            <th>转正日期</th>
        </tr>
        <tr>
            <td><a href="ContractAdd.html">签订合同</a></td>
            <td>00001</td>
            <td>张三</td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>2016-1-1</td>
            <td>2016-3-1</td>
        </tr>
        <tr>
            <td><a href="ContractAdd.html">签订合同</a></td>
            <td>00001</td>
            <td>张三</td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>2016-1-1</td>
            <td>2016-3-1</td>
        </tr>
        <tr>
            <td><a href="ContractAdd.html">签订合同</a></td>
            <td>00001</td>
            <td>张三</td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>2016-1-1</td>
            <td></td>
        </tr>
        <tr>
            <td><a href="ContractAdd.html">签订合同</a></td>
            <td>00001</td>
            <td>张三</td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>2016-1-1</td>
            <td>2016-3-1</td>
        </tr>
        <tr>
            <td><a href="ContractAdd.html">签订合同</a></td>
            <td>00001</td>
            <td>张三</td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>2016-1-1</td>
            <td></td>
        </tr>
        <tr>
            <td><a href="ContractAdd.html">签订合同</a></td>
            <td>00001</td>
            <td>张三</td>
            <td>开发部</td>
            <td>初级程序员</td>
            <td>2016-1-1</td>
            <td>2016-3-1</td>
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
