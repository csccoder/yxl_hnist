<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <base target="_self">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=yes">
    <title></title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta property="qc:admins" content="21604337436016410016375"/>
    <!-- 上一次最新css website_1529ce5a97.css-->
    <link rel="stylesheet" href="css/login/website_66f1bdbc64.css">

    <script src="js/login/gt.js"></script>
    <style>
        .login .login-box .login-form .tabcont {
            margin: 30px 25px 0 25px;
        }

        #login_agree.error .is_agree-tip {
            display: block !important;
            color: #F1625D;
        }

        .thirdParty {
            margin: 17px 0;
        }

        .login .login-box .login-form .thirdParty .thirdParty-cont {
            height: auto;
            margin-top: 17px;
        }

    </style>
</head>
<body>
<div class="login">
    <!-- logo 和 slogen -->
    <div class="logoNslogen">
        <i class="logo"></i>
        <p class="slogen"></p>
    </div>
    <!-- logo 和 slogen -->
    <!-- 登陆框 -->
    <div class="login-box">
        <div class="login-form">
            <div class="head">
                <div class="tabs">
                    <div class="tab selected js-tab">注册/登录</div>
                    <div class="tab  js-tab"><a href="login.jsp">账号密码登录</a></div>
                </div>
            </div>
            <div class="body">
                <div class="tabconts">
                    <!-- 注册板块 -->
                    <div class="tabcont selected  js-tabcont">
                        <form id="form1" method="post" action="${contextPath}/userServlet?action=register">

                            <div class="input-group">
                                <label>输入用户名</label>
                                <input type="text" name="username" class="input_full" placeholder="请输入用户名"
                                       id="login_phone">
                                <p class="tip" id="login_username-tip"></p>
                            </div>

                            <div class="input-group">
                                <label>输入密码</label>
                                <input type="password" name="password" class="input_full" placeholder="请输入密码"
                                       id="login_pwd_validcode">
                                <p class="tip" id="login_phone-tip"></p>
                            </div>

                            <div class="input-group" id="validi">
                                <label>输入年龄</label>
                                <input type="number" name="age" class="input_full" placeholder="请输入年龄"
                                       id="login_age_validcode">
                                <p class="tip" id="login_id-tip"></p>
                            </div>

                            <div class="input-group" id="validi">
                                <label>输入性别</label>
                                <select name="sex" class="input_full">
                                    <option value="男" selected="selected">男</option>
                                    <option value="女">女</option>
                                </select>
                                <p class="tip" id="login_sex-tip"></p>
                            </div>
                            <input type="hidden" name="img" value="avatar.jpg">
                            <div id="popup-captcha"></div>
                            <div class="submit-group">
                                <input class="js-submit_phone btn_blue" value="注册" type="submit">
                            </div>

                        </form>
                    </div>

                    <div class="thirdParty">

                    </div>
                </div>
            </div>

        </div>
        <!-- 登陆框 -->

    </div>
</body>
</html>