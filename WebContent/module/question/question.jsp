<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <title>${question.name} - 在线心理咨询 - 壹心理</title>

    <meta name="keywords" content="${question.name}"/>
    <meta name="description"
          content="${fn:substring(question.content,5 ,-1 )}"/>

    <link href="${contextPath}/css/index.min.css" rel="stylesheet" type="text/css"/>
    <link href="${contextPath}/css/question/index-qa.min.css" rel="stylesheet" type="text/css"/>
    <style>
        input.ein, textarea.ein {
            border: 1px solid red !important;
        }

        span.inputmsg {
            color: red;
        }

        span.xinlilaiyuan {
            color: #f6f6f6;
        }
    </style>

    <script src="${contextPath}/js/question/jquery-1.8.3.min.js"></script>
    <script src="${contextPath}/js/common.min.js"></script>

</head>
<body>


<jsp:include page="/common/header.jsp"></jsp:include>
<!-- nav end -->


<div class="header cleara">
    <div class="wrap">
        <div class="lf_header">
            <a href="${contextPath}/questionServlet" class="headerlogo">心理问答</a>
        </div>
    </div>

</div>
<!-- header end -->


<div class="infos-wrap">
    <div class="fish-left main-left">
        <div class="show_ask">
            <h2>${question.name}</h2>
            <div class="ask_infos fixed">
                <div class="face">
                    <a href="http://www.xinli001.com/user/1004910747/" target="_blank">
                        <img src="${contextPath}/images/user_info/user_img/${question.user.img}" width="50" height="50"
                             hover="true" alt="实习生">
                    </a>
                </div>
                <div class="descs"><fmt:formatDate value="${question.createTime}" pattern="yyyy-MM-dd hh:mm:ss" var="date"></fmt:formatDate>
                    <span class="fgrey" style="overflow: hidden"><span style="padding-right: 20px; float: left">发布时间:${date} </span><span style="float: right">分类：<a href="">${question.category.categoryName}</a></span></span>
                    ${fn:substring(question.content,5 ,-1 )}

                </div>
            </div>


            <div class="share">

                <div id="bdshare" class="bdsharebuttonbox bdshare_t bds_tools get-codes-bdshare">
                    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_qzone"
                                                                                          data-cmd="qzone"
                                                                                          title="分享到QQ空间"></a><a
                        href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_douban"
                                                                                           data-cmd="douban"
                                                                                           title="分享到豆瓣网"></a><a
                        href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a class="bds_count"
                                                                                            data-cmd="count"></a><a
                        href="#" class="bds_more" data-cmd="more"></a>
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
                        "share": {},
                        "image": {
                            "viewList": ["weixin", "qzone", "tsina", "douban", "tqq"],
                            "viewText": "分享到：",
                            "viewSize": "16"
                        }
                    };
                    with (document)
                        0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89343201.js?cdnversion=' + ~(-new Date() / 36e5)];
                </script>

            </div>
        </div>
        <!--问题-->
        <h2 class="title">所有回答 ：<a href="#comments" class="answer">我来回答</a></h2>
        <a name="answers"></a>
        <div id="id_answer_list" class="answer_list">
            <c:choose>
                <c:when test="${question.answers eq null || question.answers.size() eq 0 }">
                    <p id="id_no_comments">
                        还没有留言，<a href="#comments">抢沙发</a>
                    </p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="answer" items="${question.answers}">
                        <div id="id_answer_${answer.id}" class="items fixed">
                            <div class="face"><a href="${contextPath}/userServlet?action=info&id=${answer.user.id}">
                                <img src="${contextPath}/images/user_info/user_img/${answer.user.img}" width="50" height="50" hover="true" alt="${answer.user.username}" data-bd-imgshare-binded="1">
                            </a>
                            </div>
                            <div class="answer_box">
                                <div class="utool"><fmt:formatDate value="${answer.createTime}" pattern="yyyy-MM-dd hh:mm:ss" var="date"></fmt:formatDate>
                                    <a href="${contextPath}/userServlet?action=info&id=${answer.user.id}">${answer.user.username}</a> &nbsp;${date}
                                    <!--     		<span class="floor">3楼</span> -->
                                </div>
                                    ${answer.answerContent}

                                <!---新加入分隔线-->
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

            <!--items-->


        </div>
        <h2 class="title">我来回答 ：<a name="comments"></a></h2>
        <form id="id_answer_form" action="${contextPath}/questionServlet?action=addComment" method="post"
              class="answer_form">
            <textarea id="id_content" name="content" class="ins txt" nullmsg="请输入回答"></textarea>
            <input type="hidden" name="id" value="${question.id}">
            <input type="hidden" name="userId" value="${user.id}">
            <p class="cbtns">
                <input  type="button" class="btns" value="提交" onclick="submitComment()"/>
            </p>
        </form>
    </div>
    <script>
        function submitComment(){
            var userId = $("#id_answer_form input[name=userId]").val();
            var content=$("#id_content").val();
            if(content==null||content.trim()==""){
                alert("输入的内容不能为空");
                return;
            }
            if(userId==null||userId==""){
                alert("请先登录");
                return;
            }
            document.forms[0].submit();
        }
    </script>

    <div class="fish-left main-right">
        <div id="id_user_info_div"></div>
        <div class="ask_submit mt20">
            有问题？！现在就提问吧》 &nbsp;<c:choose><c:when test="${user ne null}"><a href="${contextPath}/questionServlet?action=goAdd" class="start">开始提问</a></c:when><c:otherwise><a href="javascript:alert('请先登录')" class="start">开始提问</a></c:otherwise></c:choose>
        </div>
        <!--开始提问-->
        <div class="tags fixed">
            <div class="st"><span class="fb">问答分类 ：</span></div>
            <ul>
                <c:forEach items="${questionCategories}" var="questionCategory">
                    <li class="fl"><a href="${contextPath}/questionServlet?categoryId=${questionCategory.id}">${questionCategory.categoryName}</a></li>
                </c:forEach>
            </ul>
        </div>
        <!--分类-->
        <%--<div class="lastest_ask fixed">
            <div class="st rbor"><span class="fb">最新问答 ：</span><a href="/" class="more">更多</a></div>
            <dl>


                <dd>
                    <a href="http://qa.xinli001.com/100049626/" class="fa">面试的问题求助</a><span class="answers"></span><br>
                    来自 <a href=""></a>
                </dd>

                <dd>
                    <a href="http://qa.xinli001.com/100049625/" class="fa">八二法则是真的吗？</a><span
                        class="answers"></span><br>
                    来自 <a href=""></a>
                </dd>

                <dd>
                    <a href="http://qa.xinli001.com/100049624/" class="fa">我真的做错了吗？</a><span class="answers"></span><br>
                    来自 <a href=""></a>
                </dd>

                <dd>
                    <a href="http://qa.xinli001.com/100049623/" class="fa">不合群</a><span class="answers"></span><br>
                    来自 <a href=""></a>
                </dd>

                <dd>
                    <a href="http://qa.xinli001.com/100049622/" class="fa">猫咪和电梯 求解一下梦</a><span
                        class="answers"></span><br>
                    来自 <a href=""></a>
                </dd>

            </dl>
        </div>--%>
    </div>
    <!--right-->
</div>


<div class="footer">
    <div class="wrap">
        <div class="flinks">
            <a href="http://www.xinli001.com/about/">关于我们</a>
            <a href="http://www.xinli001.com/join/">加入我们</a>
            <a href="http://www.xinli001.com/contact/">联系我们</a>
            <a href="http://www.xinli001.com/copyright/">免责声明</a>
            <a href="http://www.xinli001.com/friendlink/">友情链接</a>
            <a href="http://www.xinli001.com/sitemap.html">网站地图</a>
            <a href="http://m.xinli001.com/">手机版</a>
            <a href="http://app.xinli001.com/mobile/">手机应用</a>
            <a href="http://www.xinli001.com/contri/draft-post/">投稿</a>
        </div>


        <p class="copy_right">
            © 2005－2014 &nbsp;xinli001.com &nbsp;All Rights Reserved. &nbsp; <a href="http://www.miibeian.gov.cn/"
                                                                                class="copy" rel="nofollow">粤ICP备12051153号</a>&nbsp;
            <a logo_size="124x47" logo_type="realname" href="http://www.anquan.org">
                <script src="http://static.anquan.org/static/outer/js/aq_auth.js"></script>
            </a>
            <a logo_size="124x47" logo_type="business" href="http://www.anquan.org">
                <script src="http://static.anquan.org/static/outer/js/aq_auth.js"></script>
            </a>
        </p>
    </div>

</div>


<div id="background"></div>

<script>
    var userinfoUrl = 'http://www.xinli001.com/userinfo/';
</script>

<script src="${contextPath}/js/index.min.js"></script>


<script src="${contextPath}/js/jquery.plugin.js"></script>
<script src="${contextPath}/js/question/show.js"></script>
<script>
    function toggleReply(el) {
        var $div = $(el).parent().find('div.topic_list');
        $div.toggle();
        return false;
    }
    function doVote(el) {
        var url = el.href, data = {t: $.now()};
        $.get(url, data, function (data) {
            switch (data.code) {
                case 0:
                    alert('投票成功');
                    var span = $(el).find('span');
                    incrhtml(span);
                    $(el).removeClass('fgrey');
                    break;
                case -1:
                    alert('你还没有登录哦');
                    break;
                case -2:
                    alert('你已经投过了');
                    break;
            }
        });
        return false;
    }
    function doReply(el) {
        var url = el.action;
        var content = $(el).find('textarea');
        var check = content.checkinput();
        if (check) {
            var submit = $(el).find('input:submit');
            submit.disable();
            var data = $(el).serialize();
            $.post(url, data, function (data) {
                if (data.code == 0) {
                    $(el).parent().parent().prepend(data.content);
                }
                var $span = $(el).parent().parent().parent().parent().find('a.addtopic').find('span');
                incrhtml($span);
                submit.enable();
                content.val('');
            });
        }
        return false;
    }
    function deleteReply(el) {
        var url = el.href;
        var data = {t: $.now()};
        $.get(url, data, function (data) {
            var $span = $(el).parent().parent().parent().parent().find('a.addtopic').find('span');
            $(el).parent().remove();
            decrhtml($span);
        });
        return false;
    }
    $(function () {
        $('#id_answer_form').submit(checkQaAnswerForm);
    });
</script>


<script>
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    //document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd64469e9d7bdbf03af6f074dffe7f9b5' type='text/javascript'%3E%3C/script%3E"));
    var _bdurl = unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd64469e9d7bdbf03af6f074dffe7f9b5' type='text/javascript'%3E%3C/script%3E");
    //var _lzurl = '<script src="http://js.tongji.linezing.com/2646296/tongji.js"><\/script>';
    //document.write(_lzurl);
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

    ga('create', 'UA-74218902-3', 'auto');
    ga('send', 'pageview');
</script>


<script type="text/javascript">
    $(function () {
        $(".new-header .nav li").hover(function () {
            $(this).hasClass("droplist") && $(this).find("dl").show()
        }, function () {
            $(this).hasClass("droplist") && $(this).find("dl").hide()
        });

        $("#new-header-auth-user-div").delegate('li', 'mouseover', function () {
            $(this).addClass('selected');
        });

        $("#new-header-auth-user-div").delegate('li', 'mouseout', function () {
            $(this).removeClass('selected');
        });

        $(".new-header .info li").hover(function () {
            $(this).addClass("selected")
        }, function () {
            $(this).removeClass("selected")
        });

        $('.new-header .text').focus(function () {
            if ($(this).val() == '搜索') {
                $(this).val('');
            }
            $(this).parent().parent().addClass('sear-selected');
        })

        $('.new-header .text').blur(function () {
            if ($(this).val() == '') {
                $(this).val('搜索');
            }
            $(this).parent().parent().removeClass('sear-selected');
        })
    })
</script>

</body>
</html>