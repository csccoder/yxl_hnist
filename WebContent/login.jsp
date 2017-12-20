<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <!-- 1497706445 -->
        <script>
        var pageName = 'account/login';
        var channel_name = '';
        var channel_id = '';
        var getGeetestUrl = 'http://account.xinli001.com/ajax/get-geetest-code';
        var checkGeetestUrl = 'http://account.xinli001.com/ajax/validate-geetest';
    </script>
    <meta charset="utf-8">
<base target="_self">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=yes">
<title></title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta property="qc:admins" content="21604337436016410016375" />
	<!-- 上一次最新css website_1529ce5a97.css-->
    <link rel="stylesheet" href="css/login/website_66f1bdbc64.css"><script>
            var headerAuthUserUrl = "";
    
</script>
    <!-- <script src="js/website_231cc9327a.js" ></script> -->    <!--html5shiv让ie678支持html5，respond_min让ie支持css3 query-->
    <!--[if lt IE 9 ]>
    <script src="js/login/html5shiv.min.js"></script><script src="js/login/respond.min.js"></script>    <![endif]-->

<script src="js/login/gt.js"></script>
    <style>
        .login .login-box .login-form .tabcont{
            margin: 30px 25px 0 25px;
        }
        #login_agree.error .is_agree-tip{
            display: block !important;
            color:#F1625D;
        }

        .thirdParty{
            margin: 17px 0;
        }
        .login .login-box .login-form .thirdParty .thirdParty-cont{
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
                    <div class="tab  js-tab"><a href="register.jsp">注册/登录</a></div>
                    <div class="tab selected js-tab">账号密码登录</div>
                </div>
            </div>
            <div class="body">
                <div class="tabconts">
                	
                    <!-- 登陆板块 -->
                    <div class="tabcont selected js-tabcont ">
                        <form id="form2" method="post" action="${contextPath}/userServlet?action=login">
                        <div class="input-group">
                            <input type="text" name="username" class="input_full" placeholder="账号" id="login_username">
                            <p class="tip" id="login_username-tip"></p>
                        </div>
                        <div class="input-group">
                            <input type="password" name="password" class="input_full" placeholder="密码" id="login_password">
                           
                            <p class="tip fl" id="login_password-tip"></p>
                        </div>
                        <div class="submit-group">
                            <input type="submit" class="js-submit_accout btn_blue"  value="登录"/>
                        </div>
                        </form>
                    </div>
                </div>

                <div class="thirdParty">
                    
                </div>
            </div>
        </div>
        
    </div>
    <!-- 登陆框 -->

</div>
<script>
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
//document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd64469e9d7bdbf03af6f074dffe7f9b5' type='text/javascript'%3E%3C/script%3E"));
var _bdurl = unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd64469e9d7bdbf03af6f074dffe7f9b5' type='text/javascript'%3E%3C/script%3E");
document.write(_bdurl);
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-74218902-1', 'auto');
ga('send', 'pageview');
</script>

</body>
</html>