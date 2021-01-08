<%-- 
    Document   : allattention
    Created on : 2019-12-20, 14:26:51
    Author     : Administrator
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.PersonAction"%>
<%
String user = (String)session.getAttribute("userName");
PersonAction pa = new PersonAction();
ArrayList psa = new ArrayList();

psa = pa.getAllAttentioner(user);

System.out.println("-------------psa=" + psa.size());

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
    <table width="90%" border="0" align="center" class="txthead">
      <tr>
        <td>
          </br></br>
          <table width="100%" border="1">
            <tr align="center">
              <div>关注的人</div>
            </tr>
            <tr>
              <%
              for(int i = 0;i < psa.size();i++){
                  String outpsa = (String)psa.get(i);
                  if((i%4==0)&(i!=0)){
          %>
            </tr>
            <%
                  }
          %>
            <td>
              <div><%=outpsa%></div>
            </td>
            <%
              }
          %>

      </tr>
    </table>
    </br></br>
    </td>
    </tr>
    </table>
  </div>

  <jsp:include flush="true" page="tail.jsp"></jsp:include>
</body>

</html>