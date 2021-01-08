<%-- 
    Document   : Topic
    Created on : 2019-11-8, 16:53:22
    Author     : Administrator
--%>

<%
    String userName = (String)session.getAttribute("userName");
    if(userName==null)
    {%>
<script>
  alert("发帖请先登录。");
  location.href = "login.jsp";
</script>
<%}    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>菜鸟IT技术论坛</title>
  <link href="css/newcss.css" rel="stylesheet" type="text/css" />
  <script>
    function check() {
      var title = document.getElementById("title").value;
      if (title == null | title == "") {
        alert("请输入标题");
        return false;
      }
      var content = document.getElementById("content").value;
      if (content == null | content == "") {
        alert("请输入内容");
        return false;
      }
      if (content.length < 4) {
        alert("请不要潜水");
        return false;
      }
      return true;
    }

  </script>
</head>

<body>

  <jsp:include flush="true" page="head.jsp"></jsp:include>



  <div class="pubWidth">


    <table width="90%" border="0" align="center" class="txthead" style="padding: 20px;">


      <form action="AddTopicServlet" method="post" enctype="multipart/form-data">
        <tr>
          <td>
            <table width="90%" border="1" align="center" class="txthead">
              <tr>
                <td colspan="2" bgcolor="#00CCFF">发表新帖</td>
              </tr>
              <tr>
                <td>标题</td>
                <td><input name="title" type="text" id="title" /></td>
              </tr>
              <tr>
                <td height="148">内容</td>
                <td><label for="textarea"></label>
                  <textarea name="content" rows="12" id="content"  style="resize: none;width: 600px;padding: 10px;" >请输入内容</textarea>
                  <label for="textfield"></label></td>
              </tr>
              <tr>
                <td>
                  <div align="center">图片</div>
                </td>
                <td><input type="file" name="topicImage" accept="image/*" /></td>
              </tr>
              <tr>
                <td>
                  <div align="center">帖子类别</div>
                </td>
                <td><input type="text" name="sort" /></td>
              </tr>
              <tr>
                <td colspan="2"><input type="submit" name="Submit" value="提交" onclick="return check()" />
                  <input type="reset" name="Submit2" value="重置" /></td>
              </tr>
              
            </table>
          </td>
        </tr>
      </form>
    </table>
  </div>
  <jsp:include flush="true" page="tail.jsp"></jsp:include>
</body>

</html>