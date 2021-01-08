<%-- 
    Document   : head
    Created on : 2019-10-11, 17:03:46
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>菜鸟IT技术论坛</title>

    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.12.4.js"></script>
    <script>
        function openLogin() {
            document.getElementById("win").style.display = "block";

        }
        function closeLogin() {
            document.getElementById("win").style.display = "none";
        }
    </script>
    <style>

    </style>
</head>

<body>
    <div class="top">
        <nav class="pubWidth">
            <div>
                <div class="logo">
                    <img src="images/logo_s.png" alt="logo" height="70">
                </div>
                <div class="welcome">
                    <marquee behavior="scroll">
                        <font color="white" size="+3">欢迎来到菜鸟IT论坛</font>
                    </marquee>
                </div>
                <div class="nav_search" align="center">
                    <form action="SearchServlet">
                        <input align="middle" type="text" name="searchthing" id="searchthing" />
                        <input class="button gray" type="submit" name="search" value="搜索" />
                    </form>
                </div>
                <ul>
                    <li class="nav-tab active"><a href="index.jsp">首页</a></li>
                    <li class="nav-tab"><a href="topic.jsp">发帖</a></li>
                    <li class="nav-tab"><a href="top.jsp">热搜榜</a></li>
                    <li class="nav-tab"><a href="person.jsp">个人空间</a></li>
                    <li class="nav-tab"><a href="#">联系我们</a></li>
                    <li class="nav-tab">
                        <form action="login.jsp">
                            <a href="javascript:openLogin();">登录</a>
                        </form>
                    </li>
                    <li class="nav-tab">
                        <form action="reg.jsp">
                            <a href="reg.jsp">注册</a>
                        </form>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <blockquote>&nbsp; </blockquote>

    <div id="win" class="win" style="display:none">
        <form action="LoginServlet" method="post">

            <span style="font-size: 20px;">登陆</span> <br />
            <label class="label"> 用户名：</label> <input type="text" class="input" id="user" name="userName" /> <br />
            <label class="label"> 密　码：</label> <input type="password" class="input" id="psw" name="password" /> <br />
            
            <input type="submit" value="登录" class="input2" />
            <input type="button" value="退出" class="input3" onclick="closeLogin();" />

        </form>

    </div>

    <audio id="music" autoplay="autoplay" loop="loop" preload="preload" src="music/music.mp3"></audio>
        <a id="switch" class="music-on"></a>

        <script>
            var music = document.getElementById("music");

            var music_button = document.getElementById("switch");

            music_button.onclick = function () {
                if (this.className == "music-on") {
                    music.pause();
                    this.className = "music-off";
                }
                else {
                    music.play();
                    this.className = "music-on";
                }

            }

    </script>

</body>

</html>