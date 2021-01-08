<%-- 
    Document   : reg
    Created on : 2019-10-11, 17:01:07
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>菜鸟IT技术论坛</title>
  <link href="css/newcss.css" rel="stylesheet" type="text/css" />
  <script>
    function check() {
      var userName = document.getElementById("userName").value;
      if (userName == "" | userName == null) {
        alert("用户名不得为空。");
        return false;
      }

      var password1 = document.getElementById("password1").value;
      if (password1 == "" | password1 == null) {
        alert("密码不为空。");
        return false;
      }
      if (password1.length < 3) {
        alert("密码长度至少要3位。");
        return false;
      }

      var password2 = document.getElementById("password2").value;
      if (password1 != password2) {
        alert("两次输入的密码不一致。");
        return false;
      }

      var email = document.getElementById("email").value;
      if (email.indexOf(".com") == -1 & email.indexOf(".cn") == -1) {
        alert("邮箱格式不对。");
        return false;
      }
      if (email.indexOf("@") == -1) {
        alert("邮箱格式不对。");
        return false;
      }
      return true;
    }


  </script>
</head>

<body>
  <jsp:include flush="true" page="head.jsp"></jsp:include>

  <div class="pubWidth">
    <table width="90%" border="0" align="center">
      <form method="post" action="RegServlet">
        <tr>
          <td>
            <table width="60%" border="1" align="center">
              <tr>
                <td colspan="2" bgcolor="#FFFFFF" class="tablehead">请填写注册信息:</td>
              </tr>
              <tr>
                <td height="20" class="txthead">用户名*</td>
                <td class="txthead"><input type="text" name="userName" id="userName" /></td>
              </tr>
              <tr>
                <td class="txthead">密码*</td>
                <td class="txthead"><input type="password" name="password1" id="password1" /></td>
              </tr>
              <tr>
                <td class="txthead">确认密码*</td>
                <td class="txthead"><input type="password" name="password2" id="password2" /></td>
              </tr>
              <tr>
                <td class="txthead">性别</td>
                <td class="txthead"><input type="radio" name="sex" value="男" checked="" />
                  男
                  <input type="radio" name="sex" value="女" />
                  女</td>
              </tr>
              <tr>
                <td class="txthead">Email</td>
                <td class="txthead"><input type="text" name="email" id="email" /></td>
              </tr>
              <tr>
                <td colspan="2" class="txthead"><input class="button gray" type="submit" name="Submit" value="提交"
                    onclick="return check()" />
                  <input class="button gray" type="reset" name="Submit2" value="重置" /></td>
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