<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>员工离职</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding:20px">
    <div class="page_title">
        <h2 class="fl">员工离职</h2>
    </div>
    <table>
        <tr style="height:50px">
            <td style="text-align: right"><span class="item_name">员工工号：</span></td>
            <td><span class="item_name">00001</span></td>
            <td style="text-align: right"><span class="item_name">员工姓名：</span></td>
            <td><span class="item_name">张三</span></td>
        </tr>
        <tr style="height:50px">
            <td style="text-align: right"><span class="item_name">部门：</span></td>
            <td><span class="item_name">开发部</span></td>
            <td style="text-align: right"><span class="item_name">岗位：</span></td>
            <td><span class="item_name">中级程序员</span></td>
        </tr>
        <tr style="height:50px">
            <td style="text-align: right"><span class="item_name">入职日期：</span></td>
            <td><span class="item_name">2016-1-1</span></td>
            <td style="text-align: right"><span class="item_name">转正日期：</span></td>
            <td><span class="item_name">2016-3-1</span></td>
        </tr>
        <tr style="height:50px">
            <td style="text-align: right"><span class="item_name">离职日期：</span></td>
            <td><input type="text" class="textbox textbox_225" /> </td>
            <td style="text-align: right"><span class="item_name">离职原因：</span></td>
            <td>
                <select class="select">
                    <option>薪酬福利</option>
                    <option>身体原因</option>
                    <option>人际关系</option>
                    <option>家庭原因</option>
                    <option>发展空间</option>
                    <option>上级主管</option>
                    <option>能力欠缺</option>
                    <option>出差原因</option>
                    <option>其他</option>
                </select>
            </td>
        </tr>
        <tr>
            <td style="text-align:right"><span class="item_name">离职类型：</span></td>
            <td colspan="3">
                <select class="select">
                    <option>离职</option>
                    <option>劝退</option>
                    <option>辞退</option>
                    <option>自离</option>
                </select>
            </td>
        </tr>
        <tr>
            <td style="text-align:right"><span class="item_name">备注：</span></td>
            <td colspan="3">
                <textarea placeholder="备注" class="textarea" style="width:400px;height:100px;"></textarea>
            </td>
        </tr>
        <tr style="height:50px">
            <td></td>
            <td colspan="3">
                <input type="button" value="保存" class="group_btn" />
                &nbsp;&nbsp;
                <input type="button" value="返回" class="group_btn" />
        </tr>
    </table>
</body>
</html>
