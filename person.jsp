<%-- 
    Document   : person
    Created on : 2019-12-20, 12:45:10
    Author     : Administrator
--%>

<%@page import="com.bbs.model.ReplyBean"%>
<%@page import="com.bbs.model.TopicBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.PersonAction"%>
<%-- <%
    String user = (String)session.getAttribute("userName");
    if(user==null)
    {%>
<script>
  alert("进入个人空间请先登录。");
  location.href = "index.jsp";
</script>
<%}    
%> --%>

<%
String user = (String)session.getAttribute("userName");
System.out.println("这里上");
System.out.println(user);
PersonAction pa = new PersonAction(); 
ArrayList psa = new ArrayList();
ArrayList pst = new ArrayList();
ArrayList psp = new ArrayList();

psa = pa.getSomeAttentioner(user);
pst = pa.getSomeTopic(user);
psp = pa.getSomeReply(user);

System.out.println("这里下");

System.out.println("-------------psa=" + psa.size() + "pst=" + pst.size() + "psp=" + psp.size());

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>菜鸟IT技术论坛</title>
</head>

<body>
  <jsp:include flush="true" page="head.jsp"></jsp:include>

  <div class="pubWidth">
    <div class="homepic">
      <div><img src="images/h1.jpg"><a href="allattention.jsp">我的关注</a></div>
      <div><img src="images/h2.jpg"><a href="allreply.jsp">回复的帖子</a></div>
      <div><img src="images/h3.jpg"><a href="alltopic.jsp">我的帖子</a></div>
    </div>
  </div>

  <jsp:include flush="true" page="tail.jsp"></jsp:include>
</body>

</html>