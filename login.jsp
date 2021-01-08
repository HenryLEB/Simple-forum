<%-- 
    Document   : login
    Created on : 2019-11-6, 8:43:54
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>菜鸟IT技术论坛</title>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <jsp:include flush="true" page="head.jsp"></jsp:include>
	
	<div class="pubWidth">
		<table width="90%" border="0" align="center" class="txthead">
  <form method="post" action="LoginServlet">
  <tr>
    <td><table width="60%" border="1" align="center" class="txthead">
      <tr>
        <td colspan="2" bgcolor="#00CCFF">请填写登录信息</td>
      </tr>
      <tr>
        <td>用户名*</td>
        <td><input type="text" name="userName" /></td>
      </tr>
      <tr>
        <td>密码*</td>
        <td><input type="password" name="password" /></td>
      </tr>
      <tr>
        <td colspan="2"><input type="submit" name="Submit" value="登录" />
          <input type="reset" name="Submit2" value="重置" /></td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>
	</div>
	<jsp:include flush="true" page="tail.jsp"></jsp:include>      
  
    </body>
</html>
