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
    <title>个人主页</title>
    <style>
        body{
            background: #a6e1ec;
        }
        .head{
            background: white;
            padding-bottom: 16px;
            border-radius: 3px;
            border: 1px solid #eee;
        }

        .clear:after{
            display: block;
            content: '';
            clear: both;
        }
        .lmlblog-member-menu {
            background-color: #fff;
            clear: both;
            position: relative;
            margin-bottom: 16px;
            padding: 3px 50px 0px;
            text-align: center;
        }
        .lmlblog-member-menu li {
            width: 100px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            position: relative;
            color: #555;
            display: inline-block;
            height: 45px;
            line-height: 45px;
        }
        .lmlblog-member-menu li.on {
            background-color: #f1f1f1;
        }
        .lmlblog-member-menu li.on:after {
            position: absolute;
            left: 0;
            top: 0;
            content: '';
            width: 100%;
            border-bottom-color: #fff;
            box-sizing: border-box;
            pointer-events: none;
            border: none;
            border-radius: 0;
            height: 45px;
            border-bottom: 2px solid #eb7350;
        }
        .lmlblog-member-content {
            padding: 40px 0;
            width: 1024px;
            margin: auto;
            min-height: 40px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10  head">
                <div class="row" >
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <br>
                        <a href="" ><p class="text-center"><img src="/pic/${d.headimage}" class="img-circle" height="100" width="100"></p></a>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h3 class="text-danger text-center"><strong>${d.nickname}</strong></h3>
                        <h4 class="text-center">${d.personalname}</h4>
                    </div>
                    <div class="col-md-4"></div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>
    <div class="lmlblog-member-content">
        <div class="lmlblog-member-menu clear">
            <li class="on" id="main">主页</li>
            <li class="" id="personal">个人信息</li>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <ul class="list-group">
                        <c:forEach items="${weiboList }" var="weibo">
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <a href="#"><img class="img-circle"src="/pic/${weibo.headimage}" height="60" width="60"></a>
                                    </div>
                                    <div class="media-body">
                                        <button class="btn btn-warning pull-right">删除</button>
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
</body>
<script>
    $("#personal").click(function(){
        $(location).attr('href', '/after/personalInfo.do?user_id=${d.user_id}')
    });

    $("#main").click(function(){
        $(location).attr('href', '/after/personalPage.do?user_id=${d.user_id}');
    });
</script>
</html>
