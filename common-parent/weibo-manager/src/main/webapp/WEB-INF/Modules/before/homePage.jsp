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
    <title>微博首页</title>
    <style>
        .col{
           background-color: #e0e0e0;
        }
        .na{
            opacity:0.75;
        }
        .na_text{
            padding:30px;
        }
        .media{
            background-color: white;
            padding:15px;
        }
        .weibo_bottom{
            padding:8px;
        }
    </style>
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
                            <form class="navbar-form navbar-left" action="/before/findweibo.do" method="get">
                                <div class="form-group">
                                    <input type="text" name="content" class="form-control" placeholder="输入关键字" value="${content }">
                                </div>
                                <div class="form-group">
                                	<button type="submit" class="btn btn-default">
                                    	搜索
                                	</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <ul class="nav navbar-nav">
                                <li><a href="/before/homePage.do">首页</a></li>
                                <li><a href="/before/finduser.do">发现</a></li>
                                <li><a href="/before/login.do">登录</a></li>
                                <li><a href="/before/register.do">注册</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <div class="na_text page-header">
            <h1 class="text-info text-center"><strong>发现新鲜事</strong></h1>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col col-md-8">
                    	<ul class="list-group">
                    	<c:forEach items="${weiboList }" var="weibo">
                    		<li class="list-group-item">
                    			<div class="media">
                            <div class="media-left">
                                <a href="#"><img class="img-circle"src="/pic/${weibo.headimage}" height="60" width="60"></a>
                            </div>
                            <div class="media-body">
                                <h4><strong>${weibo.nickname }</strong></h4>
                                <label class="text-info"> <fmt:formatDate value="${weibo.datetime}" type="both" pattern="yyyy年MM月dd日 HH:mm:ss"/></label>
                                <p>
                                   	${weibo.content }
                                </p>
                                <img src="/pic/${weibo.image }" width="250" height="250">
                            </div>
                            <div class="weibo_bottom media-bottom">
                                <div class="btn-group btn-group-justified" role="group">
                                    <div class="btn-group" role="group">
                                        <button type="button" class="btn btn-default">转发</button>
                                    </div>
                                    <div class="btn-group" role="group">
                                    	<form method="post" action="/before/comment.do" target="_blank">
                                    		<input type="text" name="id" value="${weibo.id }" hidden="hidden"> 
                                    		<button type="submit" class="btn btn-default comment">评论</button>
                                    	</form>
                                    </div>
                                    <div class="btn-group" role="group">
                                        <button type="button" class="btn btn-default">点赞 ${weibo.count }</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    		</li>
                    	</c:forEach>
                    	</ul>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
            <div class="col-md-2"></div>
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