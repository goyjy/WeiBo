<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/holder.min.js"></script>
<title>微博评论</title>
    <style>
        body{
            background: #a6e1ec;
        }
        .col{
            background-color: whitesmoke;
        }
        .na{
            opacity:0.75;
        }
        .na_text{
            padding:30px;
        }
        .media_weibo{
            background-color: white;
            padding:15px;
        }
        .headimg{
            padding: 15px;
        }
        .content{
            padding: 15px;
        }
        .media-bottom{
            margin-left: 60px;
            
        }
        .reply{
            background-color: #f8f8f8;
            
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
                        <form class="navbar-form navbar-left">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="输入关键字">
                            </div>
                            <button type="submit" class="btn btn-default" disabled="disabled">
                                	搜索
                            </button>
                        </form>
                    </div>
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <ul class="nav navbar-nav">
                            <li><a href="#">首页</a></li>
                            <li><a href="#">发现</a></li>
                            <li><a href="#">登录</a></li>
                            <li><a href="#">注册</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        </nav>
        <div class="na_text page-header">
        	
    	</div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col col-md-8">
                    <div class="media_weibo media">
                        <div class="media-left">
                            <a href="#"><img class="img-circle"src="/pic/${weibo.headimage }" height="60" width="60"></a>
                        </div>
                        <div class="media-body">
                            <h4><strong>${weibo.nickname }</strong></h4>
                            <label class="text-info"><fmt:formatDate value="${weibo.datetime}" pattern="yyyy年MM月dd日 HH:mm:ss"/></label>
                            <p>
                               	${weibo.content }
                            </p>
                            <img src="/pic/${weibo.image }" width="250" height="250">
                        </div>
                    </div>
                    <div class="media_weibo media">
                        <div class="media-left">
                                <br>
                                <a href="#">
                                    <img src="/pic/${weibo.headimage }" width="40" height="40">
                                </a>
                        </div>
                        <div class="media-body">
                                <div class="form-group">
                                    <br>
                                    <input type="text" class="form-control center-block">
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-warning pull-right" disabled="disabled">评论</button>
                                </div>
                        </div>
                    </div>
                    <ul class="list-group">
                    <c:forEach items="${commentList }" var="comment">
    					<li class="list-group-item">
    				    <div class="comment media">
                        <div class="headimg media-left">
                            <br>
                            <a href="#">
                                <img src="/pic/${comment.headimage }" class="img-circle" width="40" height="40">
                            </a>
                        </div>
                        <div class="content media-body">
                            <br>
                            <h4><a class="text-info" href="#">${comment.nickname }：</a>${comment.content }</h4>
                            <p class="small">
                                <fmt:formatDate value="${comment.datetime}" pattern="yyyy年MM月dd日 HH:mm:ss"/>
                                <button class="btn btn-default btn-sm pull-right">点赞</button>
                                <button class="btn btn-default btn-sm pull-right">回复</button>
                            </p>
                           
                        </div>
                        <div class="media-bottom">
                        	<ul class="list-group">
                        	<c:forEach items="${comment.replyUserList }" var="reply">
                            	<li class="list-group-item reply">
                            	<div class="media">
                                <div class="headimg media-left">
                                    <br>
                                	<a href="#">
                                    	<img src="/pic/${reply.fromheadimage }" class="img-circle" width="40" height="40">
                                    </a>
                                </div>
                                <div class="content media-body">
                                	<br>
                                    <c:choose>
                                    <c:when test="${reply.reply_type=='comment' }">
                                    	<h4><a class="text-info" href="#">${reply.fromnickname }：</a>${reply.content }</h4>
                                    </c:when>
                                    <c:otherwise>
                                        <h4><a class="text-info" href="#">${reply.fromnickname }</a> 回复 <a class="text-info" href="#"> ${reply.tonickname }：</a>${reply.content }</h4>
                                    </c:otherwise>
                                    </c:choose>
                                    <p class="small">
                                    	<fmt:formatDate value="${reply.datetime}" pattern="yyyy年MM月dd日 HH:mm:ss"/>
                                    	<button class="btn btn-default btn-sm pull-right">点赞</button>
                                    	<button class="btn btn-default btn-sm pull-right">回复</button>
                                    </p> 
                            	</div>
                            </div>
                            	</li>
                            </c:forEach>
                            </ul>
                        </div>
                        </div>
    					</li>
                    </c:forEach>
                    </ul>
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