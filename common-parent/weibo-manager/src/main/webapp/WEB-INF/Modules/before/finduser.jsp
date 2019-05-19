<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/holder.min.js"></script>
    <style>
        body{
            background: #a6e1ec;
        }
        .na{
            opacity:0.75;
        }
        .media{
            padding:15px;
        }
        .color{
            color:orange;
            font-weight: bolder;
        }
       .weak{
           font-size: small;
           font-family: 新宋体;
       }
    </style>
<title>发现</title>
</head>
<body>
<div class="container">
        <nav class=" na navbar navbar-fixed-top navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <a href="#" class="navbar-brand"><img src="../assets/images/weibo_logo.png" height="30" width="60" ></a>
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mynavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div id="mynavbar" class="collapse navbar-collapse">
                <div class="row">
                    <div class="col-md-4">
                        <form class="navbar-form navbar-left" action="/before/finduserbynickname.do" method="get">
                            <div class="form-group">
                                <input type="text" class="form-control" name="nickname" placeholder="输入关键字">
                            </div>
                            <button type="submit" class="btn btn-default">搜索</button>
                        </form>
                    </div>
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <ul class="nav navbar-nav">
                            <li><a href="homePage.do">首页</a></li>
                            <li><a href="finduser.do">发现</a></li>
                            <li><a href="/before/login.do">登录</a></li>
                            <li><a href="/before/register.do">注册</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
        <div class="page-header">
            <br>
            <br>
            <br>
            <h1 class="text-warning text-center"><strong>快来找新朋友吧！</strong></h1>
        </div>
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
                <ul class="list-group">
                	<c:forEach items="${userlist }" var="user">
                    <li class="list-group-item">
                        <div class="media">
                            <div class="media-left">
                                <a href="#"><img class="img-circle"src="/pic/${user.headimage }" height="60" width="60"></a>
                            </div>
                            <div class="media-body">
                                <h4><strong>${user.nickname }</strong></h4>
                                <p class="weak">地区：${user.address }</p>
                                <p class="weak">个性签名：${user.personalname }</p>
                            </div>
                            <div class="media-right">
                                <a class="btn btn-default" href="#" disabled="disabled"><em class="color">+ </em>关注</a>
                            </div>
                        </div>
                    </li>
					</c:forEach>
                </ul>
            </div>
            <div class="col-lg-2"></div>
        </div>
    </div>
    <footer class="bg-info">
            <br>
            <br>
            <h1 class="text-center">欢迎来到微博</h1>
            <br>
            <br>
    </footer>
</body>
</html>