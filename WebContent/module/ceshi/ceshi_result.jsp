<%@ page language="java" pageEncoding="UTF-8"%>
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
    <title></title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="stylesheet" href="${contextPath}/css/ceshi_result/index.min.css">
    <script src="${contextPath}/js/jsmin/jquery-1.11.2.min.js"></script>
    <script src="${contextPath}/js/jsmin/common.min.js"></script>
    <script src="${contextPath}/js/jsmin/website-addons.min.js"></script>
    <script src="${contextPath}/js/zhuge.sdk.js"></script>


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
<script src="${contextPath}/js/ceshi_resut/wbase.min.js"></script>
<link rel="stylesheet" href="${contextPath}/css/ceshi_result/result.css">
<style>
    .infos-wrap .main-left .qcShareQQDiv {
        position: inherit;
        margin-left: 100px;
        margin-top: -38px;
        display: block;
    }

    .infos-wrap .main-left .btn {
        text-align: center;
        margin-top: 20px;
    }

    .infos-wrap .main-left .btn a {
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

    <div class="fish-left main-left">
        <div class="mbox tshow_index tshow_result">
            <div class="tshow">
                <div class="title" style="position: relative">
                    <a href="http://www.xinli001.com/ceshi/532">
                    	<span>${result.suite.title} </span>
                    </a>
                </div>
                <div class="t_result">
                    <span class="rs">我的结果 : ${result.resultDesc}</span>
                    <p class="pbox">
                    	<img src="images/ceshi_result/f662d32e92d8d5b944007768a109abdd.png!600" alt="A、下半年可能会恢复单身">
                    </p>
                    <span class="desc">
                        ${result.miaoshu}
					</span>

                </div>


                <div class="shares nshares">
                    <span class="icons fav"></span>
                    <a href="http://www.xinli001.com/ceshi/532/favorite" class="add_fav"
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
            </div>

        </div>

        <!--分享-->
        <div class="mbox comments_show" id="comments_area">
            <h2>发表留言 ：<a name="comments"></a></h2>
            <form id="id_comment_form" class="comments_form" style="display: none"
                  action="http://www.xinli001.com/ceshi/532/comment" method="post" onsubmit="return false">
                <textarea id="id_comment_content" class="txt" name="content" nullmsg="请输入留言内容"></textarea>
                <p class="cbtns">
                    <span id="id_comment_content_msg" class="inputmsg"></span>
                    <input id="id_comment_submit" type="submit" class="btns" value="发表留言"/>
                </p>
            </form>
        </div>

        <!-- 评论列表 -->
        <div id="id_comment_page">
            <div class="mbox comments_list fixed" id="comments_list">
                <div class="items" id="id_comment_3182032">
                    <div class="ct">
                        <span class="arrow"></span>
                        <a href="http://www.xinli001.com/user/1004904183" class="nickname ua">xinli_2635</a>
                        ：[2017-06-17 16:46:28]
                    </div>
                    <div class="c_contents fixed">
                        <div class="pbox fl">
                            <a href="http://www.xinli001.com/user/1004904183">
                                <img src="images/ceshi_result/9fe4842afb2c58c2200a1b9ae7a68ca9.png!50" alt="xinli_2635"
                                     width="50" height="50" hover="true"/>
                            </a>
                        </div>
                        <div class="cshow">
                            A，继续形单影只的生活。😂😂😂
                        </div>
                    </div>
                </div>
                <div class="items" id="id_comment_3181549">
                    <div class="ct">
                        <span class="arrow"></span>
                        <a href="http://www.xinli001.com/user/1004909470" class="nickname ua">xinli_1493</a>
                        ：[2017-06-16 12:12:37]
                    </div>
                    <div class="c_contents fixed">
                        <div class="pbox fl">
                            <a href="http://www.xinli001.com/user/1004909470">
                                <img src="images/ceshi_result/9fe4842afb2c58c2200a1b9ae7a68ca9.png!50" alt="xinli_1493"
                                     width="50" height="50" hover="true"/>
                            </a>
                        </div>
                        <div class="cshow">
                            C😂😂😭
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
                    href="#" onclick="return getItemsByPage(2)" class="next" target="_self">下一页</a></div>

        </div>
        <!--评论列表-->
    </div>
    <!--left-->

    <!--right-->
</div>


<div id="background"></div>

<script>
    var userinfoUrl = 'http://www.xinli001.com/userinfo/';
</script>

<script src="${contextPath}/js//index.min.js"></script>

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
<script src="${contextPath}/js/jquery.plugin.js"></script>

<script>
    function getItemsByPage(page) {
        var data = {t: $.now(), page: page};
        $.get(pageUrl, data, function (resp) {
            $('#id_comment_page').html(resp);
        });
        return false;
    }
    var pageUrl = 'http://www.xinli001.com/ceshi/532/comment';
    $(function () {
        $('#quoteBox a.close').click(rmCommentReply);
        $('.items .reply').click(addCommentReply);
        $('#id_comment_form').submit(postCommentByAjax);
        $('#id_comment_form').show();
    });
    $('#invitea').click(function () {
        ui.dialog($('#ceshi-invite')).effect('slide').modal().overlay().show();
        return false;
    });
    $as = $('#ceshi-invite .share a');
    $as.click(function (e) {
        sharetobaidusns(e, this.className, '测测下半年的感情运势是好是坏 ', 'http://www.xinli001.com/ceshi/532', '「测测下半年的感情运势是好是坏 」下半年你的感情会出现什么转折？会桃花胜放还是小有波折呢？准备好的话，测试开始啦。（图片来源：pixabay）');
        return;
    });
</script>
