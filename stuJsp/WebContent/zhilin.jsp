<%@ page 
language="java" 
contentType="text/html;
charset=UTF-8"
pageEncoding="UTF-8"
import="java.util.*,java.text.*"
errorPage="error.jsp"
%>
<%-- language="java"   --告诉服务器使用什么动态语言来翻译jsp文件
     import="java.util.*" --告诉服务器java文件使用什么包
	pageEncoding="utf-8"  --告诉服务器使用什么编码翻译jsp文件（成java文件）
	contentType="text/html; charset=utf-8" 服务器发送浏览器的数据类型和内容编码
	注意：在开发工具中，以后只需要设置pageEncoding即可解决中文乱码问题
	session=true  是否使用httpsession
	info=“” 设置jsp说明；可以通过getServletInfo（）获得
	errorPage="error.jsp"指定错误页面errorPage="error.jsp"
	isErrorPage="false" 是否为错误页面，当为错误页面时不能再指定错误页面；
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--  1.原理是把被包含的页面（header.jsp）
的内容翻译到包含页面(index.jsp)中,合并成翻译成一个java源文件，
再编译运行！！，这种包含叫静态包含（源码包含）
  2.如果使用静态包含，被包含页面中不需要出现全局的html标签了！！！
（如html、head、body）--%>
<%@include file="/common/header.jsp"%>
	<%
		//前面引入了包所以这里可以直接创建对象；
		new Date();
		new SimpleDateFormat();
	%>
	
   <%
     int a=1,b=0;
   a=a/b;
   %>
  
</body>
</html>