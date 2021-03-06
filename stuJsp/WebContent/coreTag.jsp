<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,com.rlovep.entity.Student"
    %>
    
<%--导入核心标签库 --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>核心标签jiangjie</title>
</head>
<body>

<%--使用标签库 --%>
<%--set标签：保存数据到域中，默认保存到pag域中
    var:属性名
    value：属性价值，可以是对象
    scope:范围
 --%>
<c:set var="name" value="rose" scope="page"></c:set>


<%--out标签： 类似输出表达式：<%= %>
    value:显示的内容；
    default：value为空时显示的内容
    escapexml：是否对<等实体符号转义；
--%>
<%--el表达式输出，调用属性 --%>
<c:out value="${name }" default="<h3>标题3</h3>" escapeXml="true"></c:out>
<%--默认值测试，以及输出特殊字符 --%>
<c:out value="${peace }" default="<h3>标题</h3>" escapeXml="true"></c:out>
<hr/>


<%--remove标签：删除数据，默认删除到pag域中
    var:属性名
    scope：范围
 --%>
<c:remove var="name" scope="page"/>
<c:out value="${name }" default="删除name之后" escapeXml="true"></c:out>
<hr/>


<%--catch标签：可以用来取得发生错误时的信息，同时可以进行适当处理.相当于try catch
    var:保存错误信息的exception
 --%>
 <c:catch var="e">
 <%
   int a=0,b=10;
 	b=b/a;
 %>
 </c:catch>
 <%--输出错误信息 --%>
 <c:out value="${e }"/>
<%-- <%
   int a=0,b=10;
 	b=b/a;
 %> --%>
 <hr/>
 
 <%--
    <c:url>标签将URL格式化为一个字符串，然后存储在一个变量中
    var:变量名。
    value：url
    context：本地的另一个工程库
  --%>
  <%--c：param 在重定向时当参数用 --%>
  <c:url var="url" value="el.jsp">
    <c:param name="pass" value="peace"/>
  </c:url>
  <a href="${url }">url重定向</a>
   <c:url var="baidu" value="http://wwww.baidu.com"/>
   <a href="${baidu }">百度</a>
<hr/>
<%--<c:import>标签：功能类似于<jsp:import>,但是功能更加强大。可以导入外部jsp文件，和保存到输入流中
    var：输出保存到string
    varReader:输出保存到输入字符流
    url：包含的页面
 --%>
 <c:import url="/common/header1.jsp" >
  <c:param name="name" value="sisi"/>
  </c:import>
  <hr/>
 <%--c:redirect 标签 可以是绝对地址 
 	url：地址
 	context：另外一个jsp容器
  --%>
<%--  <c:redirect url="el.jsp">
   <c:param name="pass" value="wang"></c:param>
 </c:redirect> --%>
 <%
   Integer score=new Integer(60);
   pageContext.setAttribute("score", score);
 %>
   <%--if标签 ：单条件判断
     test:判断是否为true执行
   --%>
    <c:if test="${!empty score}">
    	条件成立
    </c:if>
    <hr/>
    <%--choose标签+when标签+otherwirse标签: 多条件判断 --%>
    <c:set var="score" value="56"></c:set>
    
    <c:choose>
    	<c:when test="${score>=90 && score<=100}">
    		优秀
    	</c:when>
    	<c:when test="${score>=80 && score<90}">
    		良好
    	</c:when>
    	<c:when test="${score>=70 && score<80}">
    		一般
    	</c:when>
    	<c:when test="${score>=60 && score<70}">
    		及格
    	</c:when>
    	<c:otherwise>
    		不及格
    	</c:otherwise>
    </c:choose>
 
   <%-- forEach标签：循环 --%>
    <%
    	//List
     	List<Student>  list = new ArrayList<Student>();
     	list.add(new Student("rose",18));
     	list.add(new Student("jack",28));
     	list.add(new Student("lucy",38));
     	//放入域中
     	pageContext.setAttribute("list",list);
     	
     	//Map
     	Map<String,Student> map = new HashMap<String,Student>();
     	map.put("100",new Student("mark",20));
     	map.put("101",new Student("maxwell",30));
     	map.put("102",new Student("narci",40));
     	//放入域中
     	pageContext.setAttribute("map",map);
     %>
     <hr/>
     <%--
      begin="" : 从哪个元素开始遍历，从0开始.默认从0开始
      end="":     到哪个元素结束。默认到最后一个元素
      step="" ： 步长    (每次加几)  ，默认1
      items=""： 需要遍历的数据（集合） 
      var=""： 每个元素的名称 
      varStatus=""： 当前正在遍历元素的状态对象。（count属性：当前位置，从1开始,last属性：最后一个）
      
     --%>
    <c:forEach items="${list}" var="student" varStatus="varSta">
    	序号：${varSta.count} - 姓名：${student.name } - 年龄：${student.age}<br/>
    </c:forEach>
    
    <hr/>
    
    <c:forEach items="${map}" var="entry">
    	${entry.key } - 姓名： ${entry.value.name } - 年龄：${entry.value.age }<br/>
    </c:forEach>
    <hr/>
    <%-- forToken标签： 循环特殊字符串 --%>
    <%
    	String str = "java-php-net-平面";
    	pageContext.setAttribute("str",str);
     %>
    
    <c:forTokens items="${str}" delims="-" var="s" varStatus="status">
    	${s }<br/>
    	<c:if test="${status.last }">
    	<c:out value="输出：${status.count}"/>个元素
    	</c:if>
    </c:forTokens>
</body>
</html>