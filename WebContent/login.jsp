<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>HR人力资源管理系统</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="public/css/style.css" />
    <style>
        body {
            height: 100%;
            background: #16a085;
            overflow: hidden;
        }

        canvas {
            z-index: -1;
            position: absolute;
        }
    </style>
    <script src="public/js/jquery.js"></script>
    <script src="public/js/verificationNumbers.js"></script>
    <script src="public/js/Particleground.js"></script>
    <script>
        $(document).ready(function () {
            //粒子背景特效
            $('body').particleground({
                dotColor: '#5cbdaa',
                lineColor: '#5cbdaa'
            });
            //测试提交，对接程序删除即可
            $(".submit_btn").click(function () {
                location.href = "index.jsp";
            });
        });
    </script>
</head>
<body>
    <dl class="admin_login">
        <dt>
            <strong>HR人力资源管理系统</strong>
            <em>HR Management System</em>
        </dt>
        <dd class="user_icon">
            <input type="text" placeholder="账号" class="login_txtbx" />
        </dd>
        <dd class="pwd_icon">
            <input type="password" placeholder="密码" class="login_txtbx" />
        </dd>

        <dd>
            <input type="button" value="立即登陆" class="submit_btn" />
        </dd>
        <dd>
            <p>© 2015-2016 Azurelee 版权所有</p>
        </dd>
    </dl>
</body>
</html>