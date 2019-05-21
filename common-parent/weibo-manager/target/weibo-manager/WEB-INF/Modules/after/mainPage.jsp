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
        body{
            background: #a6e1ec;
        }

        .media{
            padding: 15px;
        }
        .container_bg{

            padding-bottom: 30px;
        }
        .na{
            opacity:0.75;
        }
        #edit_form{
            background: #dca7a7;
            padding-bottom: 8px;
            border-radius: 3px;
            border: 1px solid #eee;
        }

        #weibo_form{
            background: #dca7a7;
            padding-bottom: 8px;
            border-radius: 3px;
            border: 1px solid #eee;
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
                        <form class="navbar-form navbar-left" action="/after/findweibo.do" method="get">
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
                            <li><a href="/after/mainPage.do">首页</a></li>
                            <li><a href="/after/findUser.do">发现</a></li>
                        </ul>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li class=""><a href="/after/personalPage.do?user_id=${description.user_id}" target="_blank"><strong class="text-warning">${description.nickname}</strong></a></li>
                        <li><a href="/after/cancel.do"><strong class="text-warning">注销</strong></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div class="page-header">
        <br>
        <br>
    </div>
    <div class="container container_bg">
        <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="row"  id="edit_form">
                <span class="pull-left" style="margin:15px;">编写新鲜事</span>
                <span class="tips pull-right" style="margin:15px;"></span>
                <form id="weibo"  style="margin-top: 50px;" action="writeWeibo.do" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <textarea class="form-control" rows="3" name="content" id="content"></textarea>
                            </div>
                        </div>
                        <div class="col-sm-12" style="margin-top: 12px;">
                            <div class="form-group">
                                <input type="file" name="picture" >
                            </div>
                            <div class="form-group">
                                <input type="button" id="send" class="btn btn-warning pull-right " value="发布">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
        <div class="row" >
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="row" id="weibo_form">
                <div class="col-md-2"></div>
                <div class=" col-md-8">
                    <ul class="list-group">
                        <c:forEach items="${weiboList }" var="weibo">
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <a href="/after/personalPage.do?user_id=${weibo.user_id}" target="_blank"><img class="img-circle"src="/pic/${weibo.headimage}" height="60" width="60"></a>
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
                                                <form method="post" action="/after/comment.do" target="_blank">
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
<script >

    $("#send").click(function(){
        var textarea = document.getElementById("content").value;

        if(textarea==""){
            alert("内容不能为空!");
            return;
        }

        document.getElementById("weibo").submit();
    });

</script>
</html>
