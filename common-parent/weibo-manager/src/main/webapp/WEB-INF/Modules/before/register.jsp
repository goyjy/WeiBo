<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <title>微博注册</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
    <!--font-awesome 核心我CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{background: url("../assets/images/timg.jpg") no-repeat;background-size:cover;font-size: 16px;}
        .form{background: rgba(255,255,255,0.2);width:400px;margin:100px auto;}
        #register_form{display: block;}
        .fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
        input[type="text"],input[type="password"]{padding-left:26px;}
        #info{
            color: dimgrey;
            font-size: medium;
        }
        .title{
            color: dimgray;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" action="../after/register.do" method="post">
            <h3 class="form-title title">欢迎注册微博账号</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" id="username" type="text" placeholder="请输入用户名" name="username"  autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" id="nickname" type="text" placeholder="请输入昵称" name="nickname"  autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" id="password" type="password" placeholder="请输入密码" name="password" maxlength="8"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" id="repassword" type="password" placeholder="请确认密码" name="repassword" maxlength="12"/>
                </div>
                <div class="form-group">
                    <label id="info">${error}</label>
                </div>
                <div class="form-group">
                    <input type="button" class="btn btn-success pull-right" id="register" value="注册" />
                    <input type="reset" class="btn btn-danger pull-right" value="重置 "/>
                </div>
                <div class="form-group">
                    <a href="/before/login.do" class="text-warning">点击登录</a>
                </div>
            </div>
        </form>
    </div>

</div>
<script type="text/javascript" >
    $("#register").click(function(){
        var username = document.getElementById("username").value;
        var nickname = document.getElementById("nickname").value;
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;
        if(username.length<6||username.length>12){
            document.getElementById("info").innerText= "用户名大小6-12";
            return;
        }
        if(nickname==""){
            document.getElementById("info").innerText= "昵称不能为空";
            return;
        }
        if(password.length<6||password.length>18){
            document.getElementById("info").innerText= "密码大小6-12";
            return;
        }

        if(password!=repassword){
            document.getElementById("info").innerText= "两次输入的密码不相同";
            return;
        }

        document.getElementById("register_form").submit();
    });
</script>
</body>
</html>

