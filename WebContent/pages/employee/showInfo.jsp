<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>员工信息查看</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding:20px">
    <div class="page_title">
        <h2 class="fl">员工信息</h2>
    </div>
    <table>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">员工姓名：</span></td>
            <td style="width:100px">张三</td>
            <td style="text-align:right"><span class="item_name">身份证号码：</span></td>
            <td>11111111111111111111</td>
        </tr>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">性别：</span></td>
            <td>男</td>
            <td style="text-align:right"><span class="item_name">出生年月：</span></td>
            <td>1989-1-1</td>
        </tr>
        <tr style="height:50px">
            <td style="text-align: right"><span class="item_name">部门：</span></td>
            <td>开发部</td>
            <td style="text-align: right"><span class="item_name">职位：</span></td>
            <td>中级程序员</td>
        </tr>
        <tr style="height:50px">
            <td style="text-align: right"><span class="item_name">员工状态：</span></td>
            <td>在职</td>
            <td style="text-align: right"><span class="item_name">用工信息：</span></td>
            <td>正式员工</td>
        </tr>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">入职时间：</span></td>
            <td>2016-1-1</td>
            <td style="text-align:right"><span class="item_name">介绍人：</span></td>
            <td>李四</td>
        </tr>
        <tr>
            <td style="text-align:right"><span class="item_name">备注：</span></td>
            <td colspan="3"><pre>朋友</pre></td>
        </tr>
        <tr style="height:50px">
            <td></td>
            <td colspan="3">
                <input type="button" value="返回" class="group_btn" />
        </tr>
    </table>
</body>
</html>
