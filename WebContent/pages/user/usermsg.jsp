<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>用户个人信息</title>
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
        });
    </script>
</head>
<body>
	<dl class="admin_login">
			<dt>
				<strong>用户个人信息</strong> <em>User Messages</em>
			</dt>
			<dd>
				<table border="1">
					<tr>
						<td>用户Id</td>
						<td>${user.id }</td>
					</tr>
					<tr>
						<td>用户名</td>
						<td>${user.username }</td>
					</tr>
					<tr>
						<td>密码</td>
						<td>${user.password }</td>
					</tr>
					<tr>
						<td>创建日期</td>
						<td>${user.create_date }</td>
					</tr>
					<tr>
						<td>上次登录日期</td>
						<td>${user.last_login }</td>
					</tr>
					<tr>
						<td>真实姓名</td>
						<td>${user.name }</td>
					</tr>
				</table>
			</dd>
			<dd>
				<p>© 2020-2021 Azurelee 版权所有</p>
			</dd>
		</dl>
</body>
</html>