<%@page import="bean.UniversalUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sos图书管理系统</title>
<script type="text/javascript">
	function openLogin() {
		document.getElementById("login").style.display = "";
		document.getElementById("back").style.display = "";
	}
	function closeLogin() {
		document.getElementById("login").style.display = "none";
		document.getElementById("back").style.display = "none";
	}
	function prePageStr() {
		var url=window.location.href;
		var parPage=document.getElementById("parPage");
		parPage.value=url;
	}
</script>
<style type="text/css">
* {
	margin: 0;
	border: 0;
}
#top{
	
}
#allBack {
	position: absolute;
	top: 120px;
	z-index: -10;
	width: 1000px;
	opacity:0.2;
}

#allBack img {
	width: 500px;
	height: 400px;
}

#login {
	display:;
	position: absolute;
	top: 30%;
	width: 260px;
	height: 115px;
	background-color: #ccc;
	width: 260px;
	z-index: 10;
}

#closeLogin {
	position: absolute;
	right: 10px;
	top: 7px;
}

#back {
	display:;
	POSITION: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 152, 50, 0.8);
	filter: alpha(opacity = 80);
	z-index: 5;
	
}
</style>
</head>
<body>
	<div id="back" style="display: none;"></div>
	<div align="center">
		<div style="width: 1000px;">
			<div id="allBack" align="center">
				<img src="img/back-img.gif">
			</div>
		</div>
	</div>
	<div align="center" id="top">
		<div style="width: 0px; height: 0px;">
			<div id="login" align="center" style="display: none;">
				<s:form action="login">
					<s:textfield name="u_user.id" label="账号"></s:textfield>
					<s:textfield name="u_user.password" label="密码"></s:textfield>
					<s:select list="#{1:'普通用户',2:'图书管理员',3:'系统管理员'}" name="u_user.type"
						label="角色"></s:select>
					<%
						String url = request.getRequestURI();
						String query=request.getQueryString();
						if(query==null)
							query="";
						url=url+"?"+query;
					%>
					<s:hidden name="prePage" value="%{url}" id="parPage"></s:hidden>
					<s:submit value="登录"></s:submit>
				</s:form>
				<a href="javascript:closeLogin();" id="closeLogin">关闭</a>
			</div>
		</div>


		<div
			style="width: 1000px; background-image: url('img/top-back.png'); height: 120px;"
			align="right">
			<div>
				<%
					UniversalUser u_user = (UniversalUser) session.getAttribute("u_user");
					if (u_user == null) {
				%>
				<span
					style="font-size: 20px; color: #FF5809; position: relative; top: 93px; text-align: right;">您还未登录，请先<a
					href="javascript:openLogin();" onclick="prePageStr()" onkeydown="prePageStr()">登录</a>！
				</span>
				<%
					} else {
						if (u_user.getType() == 1) {
				%>
				<span
					style="font-size: 20px; color: red; position: relative; top: 93px; text-align: right;">
					你好,<a href="history.jsp"><%=u_user.getName()%></a>！<a href="out.jsp">退出</a>
				</span>
				<%
					}
				%>
				<%
					if (u_user.getType() == 2) {
				%>
				<span
					style="font-size: 20px; color: red; position: relative; top: 93px; text-align: right;">
					你好,<%=u_user.getName()%>,<a href="manager.jsp">管理后台</a>！<a href="out.jsp">退出</a>
				</span>
				<%
					}
				%>
				<%
					if (u_user.getType() == 3) {
				%>
				<span
					style="font-size: 20px; color: red; position: relative; top: 93px; text-align: right;">
					你好,<%=u_user.getName()%>,<a href="sysManage.jsp">管理后台</a>！<a href="out.jsp">退出</a>
				</span>
				<%
					}
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>