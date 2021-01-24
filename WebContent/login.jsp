<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>HR人力资源管理系统</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/public/css/style.css" />
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
    <script src="${pageContext.request.contextPath }/public/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/public/js/verificationNumbers.js"></script>
    <script src="${pageContext.request.contextPath }/public/js/Particleground.js"></script>
    <script>
        $(document).ready(function () {
            //粒子背景特效
            $('body').particleground({
                dotColor: '#5cbdaa',
                lineColor: '#5cbdaa'
            });
            //测试提交，对接程序删除即可
            /* $(".submit_btn").click(function () {
                location.href = "index.jsp";
            }); */
        });
    </script>
</head>
<body>
	<form id="form" action="${pageContext.request.contextPath }/user/login" method="post">
		<dl class="admin_login">
			<dt>
				<strong>HR人力资源管理系统</strong> <em>HR Management System</em>
			</dt>
			<dd class="user_icon">
				<input type="text" name="username" placeholder="账号" class="login_txtbx" />
			</dd>
			<dd class="pwd_icon">
				<input type="password" name="password" placeholder="密码" class="login_txtbx" />
			</dd>
			<dd>
				<input type="submit" value="立即登陆" class="submit_btn" />
			</dd>
			<dd>
				<p>© 2020-2021  版权没有</p>
			</dd>
			<!-- 出错显示的信息框 -->
			<div role="alert" align="center" style="color:red">
				<strong>${login_msg }</strong>
			</div>
		</dl>
	</form>
</body>
</html>