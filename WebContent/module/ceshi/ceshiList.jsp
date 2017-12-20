<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="">
    <meta name="format-detection" content="telephone=no">
    <title>心理测试_心理测试题_答案_大全-壹心理</title>
    <meta name="keywords" content="心理测试,心理测试题及答案,心理测试题,心理测试大全">
    <meta name="description" content="壹心理心理测试频道，这里有爱情测试、性格测试、能力测试、会员测试、精选测试、专业测评，包含了心理测试题及答案。">

    <link rel="stylesheet" href="${contextPath}/css/ceshi_list/index.min.css">
    <script src="js/ceshi_list/jquery-1.11.2.min.js"></script>
    <script src="js/ceshi_list/common.min.js"></script>
    <script src="js/ceshi_list/website-addons.min.js"></script>
    <script src="js/ceshi_list/zhuge.sdk.js"></script>
    <script>
        var headerAuthUserUrl = "http://www.xinli001.com/ajax/header-auth-user-div.json";
        //设置cooperation cookie
        $(function () {
            setCooperationCookie();
        });

        function getCookie(name) {
            var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
            if (arr = document.cookie.match(reg))
                return unescape(arr[2]);
            else
                return null;
        }
        function setCooperationCookie() {
            //cookie不存在或channel值不相等都要重新设置cookie
            var channel_name = '';
            var channel_id = '';
            var urldomain = '.xinli001.com';
            var cooperation = getCookie('cooperation');
            var setcookie = false;
            if (cooperation) {
                var cookiedata = JSON.parse(cooperation);
                var old_channel_id = cookiedata.channel_id;
                if (channel_id && old_channel_id != channel_id) {
                    setcookie = true;
                } else {
                    setcookie = false;
                }
            } else {
                setcookie = true;
            }
            if (setcookie == true) {
                var url = encodeURI(window.location.href);
                var cookievalue = {"channel_id": channel_id, "url": url};
                var cookiestr = JSON.stringify(cookievalue);
                //渠道名
                if (channel_id) {
                    var domain = "domain=" + urldomain;
                    document.cookie = "cooperation=" + cookiestr + ";path=/;" + domain;
                    zhuge.track('测评_PC渠道_访问次数', {'channel_id': channel_id, 'channel_name': channel_name});
                }
            }
        }
    </script>

</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<!-- nav end -->
<div class="header cleara">
    <div class="wrap">
        <div class="lf_header">
            <a href="http://www.xinli001.com/ceshi" class="headerlogo">心理测试</a>
            <ul class="hd_menu infos-menu">
               <c:forEach items="${moduleList}" var="module">
                   	<li><a href="${contextPath}/suiteServlet?moduleId=${module.module_code}">${module.module_name}</a></li>
               </c:forEach>
            </ul>
        </div>

    </div>

</div>
<!-- header end -->

<div class="infos-wrap">
<div class="fish-left main-left">
	<div class="list_rmd">
    	<div class="title bor_bot">爱情测试人气推荐</div>
        <div class="lists bor_top fixed">
        	<ul>
       			<c:forEach items="${hotSuiteList}" var="suite" varStatus="status">
                       	<li class="fl payTest">
                       		<a href="${contextPath}/suiteServlet?action=info&id=${suite.suiteCode}" title="${suite.title}">
                       		<img src="${contextPath}/images/ceshi_info/${suite.photo}" width="180" height="120" hover="true" alt="${suite.title }"></a>
                       		<p>${suite.title}</p>
                      		</li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!--推荐-->
  <h2 class="list_title">爱情测试：</h2>
    <div class="list_show">
    	<dl>
    		 <c:forEach items="${suiteList}" var="suite" varStatus="status">
    		 	<dd class="fixed">
            		<p class="pbox fl"><a href="${contextPath}/suiteServlet?action=info&id=${suite.suiteCode}">
            			<img class="lazyload" src="${contextPath}/images/ceshi_info/${suite.suiteCode}.jpg" width="120" height="80" alt="${suite.title}" hover="true" /></a>
            		</p>
                	<p class="linfo fl">
                		<a href="${contextPath}/suiteServlet?action=info&id=${suite.suiteCode}">${suite.title}</a><br />
                   		${suite.description}<br />
                   	 	<span class="total"><span class="icons" title="测试人数"></span>${suite.testnum}人测试过</span>
                	</p>
                </dd>
              </c:forEach>
         </dl>
    </div>
    <!--列表-->
    <div class="pagebar" id="pages">
		<span>1</span> |<a href="http://www.xinli001.com/ceshi/amor?page=2" target="_self">2</a> |<a href="http://www.xinli001.com/ceshi/amor?page=3" target="_self">3</a> |<a href="http://www.xinli001.com/ceshi/amor?page=4" target="_self">4</a> |<a href="http://www.xinli001.com/ceshi/amor?page=5" target="_self">5</a> |<a href="http://www.xinli001.com/ceshi/amor?page=6" target="_self">6</a> |<a href="http://www.xinli001.com/ceshi/amor?page=7" target="_self">7</a> |<a href="http://www.xinli001.com/ceshi/amor?page=8" target="_self">8</a> |<span>...</span> |<a href="http://www.xinli001.com/ceshi/amor?page=48" target="_self">48</a> |<a href="http://www.xinli001.com/ceshi/amor?page=49" target="_self">49</a> |<a href="http://www.xinli001.com/ceshi/amor?page=2" class="next" target="_self">下一页</a></div>
</div>
<!--left-->
<%--<div class="fish-left main-right">
		<div class="multi_ads fixed">
	<div class="mt"><strong>编辑推荐<span class="mq">：</span><span class="ms">······ </span></strong></div>
    <dl>
    	        <dd>
        	<a href="http://www.xinli001.com/ceshi/99897646?from=ceshigg" title="内耗指数评估（测评）" target="_blank">
                <img src="http://ossimg.xinli001.com/20170618/64ffc23c7620300f9b0f242e697783bb.jpg" width="135" height="135" hover="true" title="内耗指数评估（测评）" alt="内耗指数评估（测评）">
            </a>
        </dd>

               <dd>
        	<a href="http://www.xinli001.com/ceshi/99897499?from=ceshigg" title="心理需求测评" target="_blank">
                <img src="http://ossimg.xinli001.com/20170618/f412241a3bc150a3776429f865942f7f.jpg" width="135" height="135" hover="true" title="心理需求测评" alt="心理需求测评">
            </a>
        </dd>

                <dt>
        	<a href="http://www.xinli001.com/ceshi/99897500?from=ceshigg" title="专业爱情测评" target="_blank">
                <img src="http://ossimg.xinli001.com/20170502/a4ef61d2c2b0582f329005589a0279b1.png" width="280" height="135" hover="true" title="专业爱情测评" alt="专业爱情测评">
            </a>
        </dt>
        <br class="clear">
    </dl>
</div>--%>
	<!-- 1-->
<%--<div class="test_rmd_list fixed">
	<div class="st rbor"><span class="fb">爱情测试推荐 ：</span><span class="more"><a href="/ceshi">更多&raquo;</a></span></div>
	<dl>
				    	<dd>
        	<p class="pbox fl">
        		<a href="http://www.xinli001.com/ceshi/435">
            		<img src="http://ossimg.xinli001.com/20170614/a18dfeac1cb015702b5bd81242ae4da9.jpg!90x60" width="90" height="60" hover="true" alt="你会收获怎样的爱情结局？" />
				</a></p>
            <p class="tinfo fl">
            	<a href="http://www.xinli001.com/ceshi/435">你会收获怎样的爱情结局？</a>
                <span class="total"><span class="icons" title="测试人数"></span>51130人测试过</span>
            </p>
        </dd>
            	<dd>
        	<p class="pbox fl">
        		<a href="http://www.xinli001.com/ceshi/1672">
            		<img src="http://ossimg.xinli001.com/20170608/f36c04152d279803ed559719f0b97630.jpg!90x60" width="90" height="60" hover="true" alt="你的前任后悔分手了吗？" />
				</a></p>
            <p class="tinfo fl">
            	<a href="http://www.xinli001.com/ceshi/1672">你的前任后悔分手了吗？</a>
                <span class="total"><span class="icons" title="测试人数"></span>442150人测试过</span>
            </p>
        </dd>
            	<dd>
        	<p class="pbox fl">
        		<a href="http://www.xinli001.com/ceshi/453">
            		<img src="http://ossimg.xinli001.com/20161229/eb612a639d835d60132ee3252f297056.jpg!90x60" width="90" height="60" hover="true" alt="测试你的恋爱模式" />
				</a></p>
            <p class="tinfo fl">
            	<a href="http://www.xinli001.com/ceshi/453">测试你的恋爱模式</a>
                <span class="total"><span class="icons" title="测试人数"></span>73249人测试过</span>
            </p>
        </dd>
            	<dd>
        	<p class="pbox fl">
        		<a href="http://www.xinli001.com/ceshi/1651">
            		<img src="http://ossimg.xinli001.com/20170606/3c64d512f7389792faf8fade5894993e.jpg!90x60" width="90" height="60" hover="true" alt="测你当下的爱情观" />
				</a></p>
            <p class="tinfo fl">
            	<a href="http://www.xinli001.com/ceshi/1651">测你当下的爱情观</a>
                <span class="total"><span class="icons" title="测试人数"></span>737541人测试过</span>
            </p>
        </dd>
            	<dd>
        	<p class="pbox fl">
        		<a href="http://www.xinli001.com/ceshi/133">
            		<img src="http://ossimg.xinli001.com/20161221/664b06fdc2ce6016c9c6121206526ae5.jpg!90x60" width="90" height="60" hover="true" alt="你的爱情公式是什么？" />
				</a></p>
            <p class="tinfo fl">
            	<a href="http://www.xinli001.com/ceshi/133">你的爱情公式是什么？</a>
                <span class="total"><span class="icons" title="测试人数"></span>31015人测试过</span>
            </p>
        </dd>
            </dl>
</div>
	<div class="tags fixed">
	<div class="st rbor"><span class="fb">热门标签 ：</span></div>
    <ul>
    	    	        <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E6%80%A7%E6%A0%BC%E6%B5%8B%E8%AF%95">性格测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E7%88%B1%E6%83%85%E6%B5%8B%E8%AF%95">爱情测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E8%83%BD%E5%8A%9B%E6%B5%8B%E8%AF%95">能力测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E5%BF%83%E7%90%86%E6%B5%8B%E8%AF%95">心理测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E8%B6%A3%E5%91%B3%E6%B5%8B%E8%AF%95">趣味测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E4%B8%93%E4%B8%9A%E6%B5%8B%E8%AF%95">专业测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E5%A7%BB%E7%BC%98%E6%B5%8B%E8%AF%95">姻缘测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E6%B5%8B%E8%AF%95%E7%88%B1%E6%83%85">测试爱情</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E8%81%8C%E4%B8%9A%E6%B5%8B%E8%AF%95">职业测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E9%A2%84%E8%A8%80%E6%B5%8B%E8%AF%95">预言测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E4%BC%9A%E5%91%98%E6%B5%8B%E8%AF%95">会员测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E7%88%B1%E6%83%85">爱情</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E7%BF%BB%E8%AF%91%E6%B5%8B%E8%AF%95">翻译测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E4%B8%93%E4%B8%9A%E9%87%8F%E8%A1%A8">专业量表</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E6%BD%9C%E6%84%8F%E8%AF%86%E6%B5%8B%E8%AF%95">潜意识测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E5%A4%96%E5%9B%BD%E6%B5%8B%E8%AF%95">外国测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E6%80%A7%E6%A0%BC">性格</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E8%81%8C%E5%9C%BA%E6%B5%8B%E8%AF%95">职场测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E5%81%A5%E5%BA%B7%E6%B5%8B%E8%AF%95">健康测试</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E5%BF%83%E7%90%86%E5%81%A5%E5%BA%B7">心理健康</a></li>
                <li class="fl"><a href="http://www.xinli001.com/ceshi/tag?name=%E6%81%8B%E7%88%B1">恋爱</a></li>
            </ul>
</div>
    <!--标签-->
</div>
<!--right-->--%>
</div>


<div class="footer">
    <div class="wrap">
        <div class="flinks">
            <a href="about">关于我们</a>
            <a href="join">加入我们</a>
            <a href="contact">联系我们</a>
            <a href="copyright">免责声明</a>
            <a href="friendlink">友情链接</a>
            <a href="sitemap.html">网站地图</a>
            <a href="">手机版</a>
            <a href="http://app.xinli001.com/mobile/">手机应用</a>
        </div>
        <div class="footer">
            <div class="links">
                <dl>
                    <dt>友情链接：</dt>
                    <dt><a target="_blank" href="http://xingzuo.piaoliang.com/">星座运势</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c218">深圳心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c168">郑州心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c151">青岛心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c84">南京心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c82">上海心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c43">沈阳心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c2">北京心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c259">成都心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c186">武汉心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c98">杭州心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.woniu8.com/">心理测试</a></dt>
                </dl>
            </div>
        </div>
        <p class="copy_right">
            © 2005－2014 &nbsp;xinli001.com &nbsp;All Rights Reserved. &nbsp; <a href="http://www.miibeian.gov.cn/"
                                                                                class="copy" rel="nofollow">粤ICP备12051153号</a>&nbsp;
            <a key="549261433b05a3da0fbcb548" logo_size="83x30" logo_type="business" href="http://www.anquan.org"
               target="_blank">
                <script src="http://static.anquan.org/static/outer/js/aq_auth.js"></script>
            </a>

        </p>
    </div>

</div>

<div style="display: none">
    <div id="login_popup" class="lpcont">
        <h2>登录壹心理</h2>
        <p class="words">开始心理测试，收听FM，用心理学改变自己！</p>
        <div class="lpbox">
            <div class="lpart">
                <form id="lp_form" action="login-jsonp/" method="post">
                    <p class="eml">
                        <label for="email">邮箱</label>
                        <input type="text" id="lp_username" name="username" class="area">
                    </p>
                    <p class="psw">
                        <label for="password">密码</label>
                        <input type="password" id="lp_password" name="password" class="area">
                    </p>
                    <input id="lp_submit" type="submit" class="log_btn" value="登 录">
                    <br>
                    <a href="forgetpwd/" class="forget" target="_blank">忘记密码</a>
                    <a href="register/" class="signup" target="_blank">没有账号，去注册＞</a>
                </form>
            </div>
            <div class="rpart">
                <span>使用其它账号登录</span>
                <a href="qwb/login/" class="qq" target="_blank">使用腾讯账号登录</a>
                <a href="xwb/login/" class="wb" target="_blank">使用微博账号登录</a>
                <a href="renren/login/" class="rr" target="_blank">使用人人账号登录</a>
            </div>
            <br style="clear:both">
        </div>
    </div>
</div>

<div id="background"></div>
<style>
    .footer .links {
        text-align: center;
        padding: 15px 30px;
        line-height: 22px;
    }

    .footer .links dt {
        color: #999999;
        display: inline;
        margin: 0 10px;
        font-weight: normal;
        font-size: 12px;
    }

    .footer a {
        color: #999;
    }
</style>

<script>
    var userinfoUrl = 'http://www.xinli001.com/userinfo/';
</script>

<script src="${contextPath}/js/ceshi_list/index.min.js"></script>

<script>
    $(function () {
        setFocusSlid('#roll_sels', '#rolls_imgs', 229);
        $.get(headerAuthUserUrl, function (resp) {
            $('#header-auth-user-div').html(resp);
        });
    });
</script>


<script>
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    //document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd64469e9d7bdbf03af6f074dffe7f9b5' type='text/javascript'%3E%3C/script%3E"));
    var _bdurl = unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd64469e9d7bdbf03af6f074dffe7f9b5' type='text/javascript'%3E%3C/script%3E");
    document.write(_bdurl);
</script>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-74218902-1', 'auto');
    ga('send', 'pageview');
</script>

</html>