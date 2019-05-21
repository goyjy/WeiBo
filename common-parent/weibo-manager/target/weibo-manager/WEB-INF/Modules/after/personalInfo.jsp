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
            <li class="" id="main">主页</li>
            <li class="on" id="personal">个人信息</li>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-lg-10 head">
            <h4><strong>基本信息</strong></h4>
            <form enctype="multipart/form-data" id="personal_form" action="/after/save.do" method="post">
                <div class="form-group">
                    <label class="text">头像：<img class="img-rounded" src="/pic/${d.headimage}" height="100" width="100"></label>
                    <input type="text" name="headimage" value="${d.headimage}" hidden="">
                    <input type="file" name="picture" >
                    <label class="text">登录名：${user.username} <a href="#">修改密码</a></label><br>
                    <label class="text">
                        昵称：<input type="text" name="nickname" id="nickname" value="${d.nickname}">
                    </label><br>
                    <label class="text">
                        性别：<input type="text" name="sex" value="${d.sex}" id="sex"><label class="text">写'男'或'女'</label>
                    </label><br>
                    <label class="text">
                        生日：
                        <input type="date" id="birthday" name="birth" value="<fmt:formatDate value="${d.birthday}" type="both" pattern="yyyy-MM-dd"/>">
                    </label><br>
                    <label class="text">
                        联系电话：<input type="text" name="phonenumber" value="${d.phonenumber}">
                    </label><br>
                    <label class="text">
                        邮箱地址：<input type="text" name="email" value="${d.email}">
                    </label><br>
                    <label class="text">
                        个性签名：<textarea class="form-control" name="personalname" rows="3">${d.personalname}</textarea>
                    </label><br>
                    <label class="text">
                        所在地：<input type="text" name="address" value="${d.address}"><label class="text">省份+城市，比如'广东深圳'</label>
                    </label><br>
                </div>
                <div class="form-group">
                    <input type="button" class="btn btn-warning pull-right" id="save" value="保存">
                </div>
            </form>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
</body>
<script>
    $("#save").click(function(){
        var nickname = document.getElementById("nickname").value;
        var birthday = document.getElementById("birthday").value;
        var sex = document.getElementById("sex").value;
        if(nickname==""){
            alert("昵称不能为空");
            return;
        }

        if(sex!='男'&&sex!='女'){
            alert("性别填写有误！");
            return;
        }

        if(birthday==""){
            alert("生日不能为空！");
            return;
        }

        document.getElementById("personal_form").submit();
    });

    $("#personal").click(function(){
        $(location).attr('href', '/after/personalInfo.do?user_id=${d.user_id}')
    });

    $("#main").click(function(){
        $(location).attr('href', '/after/personalPage.do?user_id=${d.user_id}');
    });
</script>
</html>