<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>员工入职</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/public/css/style.css" />
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/public/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/public/js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>
<body style="padding:20px">
    <div class="page_title">
        <h2 class="fl">员工入职</h2>
    </div>
    <table>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">员工姓名：</span></td>
            <td><input type="text" class="textbox textbox_225" /></td>
            <td style="text-align:right"><span class="item_name">身份证号码：</span></td>
            <td><input type="text" class="textbox textbox_225" /></td>
        </tr>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">性别：</span></td>
            <td>
                <select class="select" disabled="disabled">
                    <option>男</option>
                    <option>女</option>
                </select>
            </td>
            <td style="text-align:right"><span class="item_name">出生年月：</span></td>
            <td><input type="text" class="textbox textbox_225" disabled="disabled" /></td>
        </tr>
        <tr style="height:50px">
            <td style="text-align: right"><span class="item_name">部门：</span></td>
            <td>
                <select class="select">
                    <option>人事部</option>
                    <option>财务部</option>
                    <option>开发部</option>
                    <option>销售部</option>
                </select>
            </td>
            <td style="text-align: right"><span class="item_name">职位：</span></td>
            <td>
                <select class="select">
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
        </tr>
        <tr style="height:50px">
            
            
            <td style="text-align: right"><span class="item_name">员工状态：</span></td>
            <td>
                <select class="select">
                    <option>在职</option>
                    <option>离职</option>
                </select>
            </td>
            <td style="text-align: right"><span class="item_name">用工信息：</span></td>
            <td>
                <select class="select">
                    <option>试用期员工</option>
                    <option>正式员工</option>
                </select>
            </td>
        </tr>
        <tr style="height:50px">
            <td style="text-align:right"><span class="item_name">入职时间：</span></td>
            <td><input type="text" class="textbox textbox_225" /></td>
            <td style="text-align:right"><span class="item_name">介绍人：</span></td>
            <td><input type="text" class="textbox textbox_225" /></td>
        </tr>
        <tr>
            <td style="text-align:right"><span class="item_name">备注：</span></td>
            <td colspan="3">
                <textarea placeholder="备注信息" class="textarea" style="width:580px;height:100px;"></textarea>
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
