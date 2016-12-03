<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sos图书管理系统-登录</title>
</head>
<body>
	<div align="center">
		<div style="width: 1000px;top: 100px;position: relative;">
		<h3>欢迎使用SOS图书管理系统</h3>
			<div id="login">
				<s:form action="login" method="post">
					<s:textfield name="u_user.id" label="账号"></s:textfield>
					<s:textfield name="u_user.password" label="密码"></s:textfield>

					<s:select list="#{1:'普通用户',2:'图书管理员',3:'系统管理员'}" name="u_user.type"
						label="角色"></s:select>
					<s:submit value="登录"></s:submit>
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>