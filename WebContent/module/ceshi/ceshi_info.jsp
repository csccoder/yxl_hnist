<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>你的前任后悔分手了吗？ - 壹心理</title>
    <meta name="keywords" content="你的前任后悔分手了吗？">
    <meta name="description" content=":content">

    <link rel="stylesheet" href="${contextPath}/css/index.min.css">
    <script src="${contextPath}/js/jsmin/jquery-1.11.2.min.js"></script>
    <script src="${contextPath}/js/jsmin/common.min.js"></script>
    <script src="${contextPath}/js/jsmin/website-addons.min.js"></script>
    <script src="${contextPath}/js/jsmin/zhuge.sdk.js"></script>
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

                <li><a href="http://www.xinli001.com/ceshi/amor">爱情测试</a></li>

                <li><a href="http://www.xinli001.com/ceshi/personality">性格测试</a></li>

                <li><a href="http://www.xinli001.com/ceshi/vocational">能力测试</a></li>

                <li><a href="http://www.xinli001.com/ceshi/member">会员测试</a></li>

                <li><a href="http://www.xinli001.com/ceshi/professional">精选测试</a></li>

                <li class="isNew"><a href="http://www.xinli001.com/ceshi/fufei">专业测试</a>
                    <span class="newBrand"></span></li>

            </ul>

        </div>

    </div>

</div>
<!-- header end -->
<style>
    .mleft .qcShareQQDiv {
        position: inherit;
        margin-left: 100px;
        margin-top: -38px;
        display: block;
    }

    .mleft .btn {
        text-align: center;
        margin-top: 20px;
    }

    .mleft .btn a {
        color: #FFFFFF;
        font-size: 14px;
        padding: 10px 50px;
        background: #88BD58;
        border-radius: 3px;
        margin-right: 30px;
        text-decoration: none;
    }
</style>

<div class="infos-wrap">
    <div >
        <div class="mbox tshow_index">
            <div class="title bor_bot fixed">
                <p class="items fl" title="心理测试"></p>
                <div class="tinfo fl">
                    <h2>${suite.title}</h2>
                    <span class="icons" title="测试人数"></span>${suite.testnum}人测试过 &nbsp;
                    <span class="icons fav" title="收藏次数"></span>1次收藏 &nbsp;
                    <span class="icons tdates" title="发布时间"></span><fmt:formatDate value="${suite.creatTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate> &nbsp;
                    <span class="icons comments" title="评论数"></span> <a href="#comments">380条评论</a>
                    <span class="total">本测试共 <span class="fgreen fb">${suite.questionCount}</span> &nbsp;题</span>
                </div>
            </div>
            <div class="tshow bor_top">
                <p class="pbox"><img src="images/ceshi_info/${suite.photo}" width="400" style="margin: 0 auto;display: block; width: 400px"
                                     alt="${suite.title}"></p>
                <p class="tdesc">
                    ${suite.description}</p>
                <p class="tbtns">
                    <a href="${contextPath}/suiteServlet?action=start&id=${suite.suiteCode}" class="test_btn" target="_self">开始测试</a>
                </p>

                <p class="test_tips"><span class="fgrey">此测试仅供娱乐，不做专业指导！</span></p>
            </div>
        </div>
        <!--测试显示首页-->
        <div class="shares nshares">
            <span class="icons fav"></span>
            <a href="http://www.xinli001.com/ceshi/1672/favorite" class="add_fav"
               onclick="return favorite(this)">喜欢？！收藏</a>
            <div class="bdsharebuttonbox sbar">
                <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
                <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                <a href="#" class="bds_douban" data-cmd="douban" title="分享到豆瓣网"></a>
                <a class="bds_count" data-cmd="count"></a>
                <a href="#" class="bds_more" data-cmd="more"></a>
            </div>
            <script>
                window._bd_share_config = {
                    "common": {
                        "bdSnsKey": {},
                        "bdText": "",
                        "bdMini": "1",
                        "bdMiniList": false,
                        "bdPic": "",
                        "bdStyle": "0",
                        "bdSize": "24"
                    },
                    "share": {}
                };
                with (document)
                    0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89343201.js?cdnversion=' + ~(-new Date() / 36e5)];
            </script>
        </div>


        <div class="mbox comments_show" id="comments_area">
            <h2>发表留言 ：<a name="comments"></a></h2>
            <form id="id_comment_form" class="comments_form" style="display:none"
                  action="http://www.xinli001.com/ceshi/1672/comment" method="post" onsubmit="return false">
                <textarea id="id_comment_content" class="txt" name="content" nullmsg="请输入留言内容"></textarea>
                <p class="cbtns">
                    <span id="id_comment_content_msg" class="inputmsg"></span>
                    <input id="id_comment_submit" type="submit" class="btns" value="发表留言"/>
                </p>
            </form>
        </div>
        <div id="id_comment_page">
            <div class="mbox comments_list fixed" id="comments_list">
                <div class="items" id="id_comment_3182016">
                    <div class="ct">
                        <span class="arrow"></span>
                        <a href="http://www.xinli001.com/user/1004904183" class="nickname ua">xinli_2635</a>
                        ：[2017-06-17 15:55:42]
                    </div>
                    <div class="c_contents fixed">
                        <div class="pbox fl">
                            <a href="http://www.xinli001.com/user/1004904183">
                                <img src="images/ceshi_info/9fe4842afb2c58c2200a1b9ae7a68ca9.png!50" alt="xinli_2635"
                                     width="50" height="50" hover="true"/>
                            </a>
                        </div>
                        <div class="cshow">
                            不准，
                        </div>
                    </div>
                </div>
                
                
               
                <div class="items" id="id_comment_153845">
                    <div class="ct">
                        <span class="arrow"></span>
                        <a href="" class="nickname ua">健康专栏·壹心理</a>
                        ：[2014-03-20 11:07:52]
                    </div>
                    <div class="c_contents fixed">
                        <div class="pbox fl">
                            <a href="">
                                <img src="images/ceshi_info/e0efe935b5dae3ff324c307eebcd3cb7.png!50" alt="健康专栏·壹心理"
                                     width="50" height="50" hover="true"/>
                            </a>
                        </div>
                        <div class="cshow">
                            B、Ta看得轻，拿得起放得下。
                        </div>
                    </div>
                </div>
                <!--items-->
            </div>
            <!--end-->
            <!--留言列表-->
            <div class="pagebar" id="pages">
                <span>1</span> |<a href="#" onclick="return getItemsByPage(2)" target="_self">2</a> |<a href="#"
                                                                                                        onclick="return getItemsByPage(3)"
                                                                                                        target="_self">3</a>
                |<a href="#" onclick="return getItemsByPage(4)" target="_self">4</a> |<a href="#"
                                                                                         onclick="return getItemsByPage(5)"
                                                                                         target="_self">5</a> |<a
                    href="#" onclick="return getItemsByPage(6)" target="_self">6</a> |<a href="#"
                                                                                         onclick="return getItemsByPage(7)"
                                                                                         target="_self">7</a> |<a
                    href="#" onclick="return getItemsByPage(8)" target="_self">8</a> |<span>...</span> |<a href="#"
                                                                                                           onclick="return getItemsByPage(18)"
                                                                                                           target="_self">18</a>
                |<a href="#" onclick="return getItemsByPage(19)" target="_self">19</a> |<a href="#"
                                                                                           onclick="return getItemsByPage(2)"
                                                                                           class="next" target="_self">下一页</a>
            </div>

        </div>
    </div>
    <!--left-->

    <!--right-->
</div>





<div id="background"></div>
<%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>
<script>
    var userinfoUrl = 'http://www.xinli001.com/userinfo/';
</script>

<script src="${contextPath}/js/ceshi_info/index.min.js"></script>

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


</html>
<script src="${contextPath}/js/ceshi_info/jquery.plugin.js"></script>
<script src="${contextPath}/js/ceshi_info/show.js"></script>
<script>
    var pageUrl = 'http://www.xinli001.com/ceshi/1672/comment';
    $(function () {
        $('#quoteBox a.close').click(rmCommentReply);
        $('.items .reply').click(addCommentReply);
        $('#id_comment_form').submit(postCommentByAjax);
        $('#id_comment_form').show();
    });
</script>
