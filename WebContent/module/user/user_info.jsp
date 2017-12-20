<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <base target="_self">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=yes">
    <title>weibo_fjljOHBK-壹心理</title>
    <meta name="keywords" content="weibo_fjljOHBK">
    <meta name="description" content="weibo_fjljOHBK个人首页，介绍了weibo_fjljOHBK的资料，还有weibo_fjljOHBK的文章，活动，问答。">
    <meta property="qc:admins" content="21604337436016410016375"/>
    <!-- 上一次最新css website_1529ce5a97.css-->
    <link rel="stylesheet" href="${contextPath}/css/website_66f1bdbc64.css">
    <script>
        var headerAuthUserUrl = "http://www.xinli001.com/ajax/header-auth-user-div.json";

    </script>
    <script src="${contextPath}/js/website_231cc9327a.js"></script>
    <!--html5shiv让ie678支持html5，respond_min让ie支持css3 query-->
    <!--[if lt IE 9 ]>
    <script src="${contextPath}/js/user_info/html5shiv.min.js"></script>
    <script src="${contextPath}/js/user_info/respond.min.js"></script>    <![endif]-->
    <script src="${contextPath}/js/jquery-1.11.2.min.js"></script>

    <script src="${contextPath}/js/gt.js"></script>
</head>
<body>

<jsp:include page="/common/header.jsp"></jsp:include>


<div class="page2">
    <div class="main2">
        <div class="jg-view">
            <div class="view">
                <div class="img">
                    <a target="_blank" href="#">
                        <img src="${contextPath}/images/user_info/user_img/${userDetailInfo.img}"/>
                    </a>
                </div>
                <ul>
                    <li>
                        <h4>${articlesCount}</h4>
                        <h2>文章</h2>
                    </li>
                    <li>
                        <h4>${questionsCount}</h4>
                        <h2>提问</h2>
                    </li>
                    <li>
                        <h4>${answersCount}</h4>
                        <h2>回答</h2>
                    </li>

                </ul>
            </div>
            <div class="desc desc-edit">

                <ul>
                    <li class="fs16">
                        <i><img src="${contextPath}/images/user_info/img39.png"
                                align="absmiddle"/></i>${userDetailInfo.username}
                    </li>
                    <li>
                        <i><img src="${contextPath}/images/user_info/img40.png"
                                align="absmiddle"/></i>${userDetailInfo.sex}
                        <div class="city-edit">
                            <span class="content"></span>
                        </div>
                    </li>
                    <li>
                        <i><img src="${contextPath}/images/user_info/img41.png"
                                align="absmiddle"/></i>${userDetailInfo.age}
                        <div class="introduce-edit">
                            <span class="content"></span>
                        </div>
                    </li>
                    <li class="jj selected">
                        <div class="brief-edit">
                            <span class="content" style="height:20px"></span>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="foot">

                <div class="share bdsharebuttonbox" data-tag="share_1" id="btn-share-user">
                    <span>推荐到：</span>
                    <a href="javascript:;" class="bds_weixin" data-cmd="weixin"></a>
                    <a href="javascript:;" class="bds_tsina" data-cmd="tsina"></a>
                    <a href="javascript:;" class="bds_douban" data-cmd="douban"></a>
                </div>
            </div>
        </div>
        <!--jg-view-->
        <script>
            var articleCurPage = 1;
            var questionCurPage = 1;
            var answerCurpage = 1;
            $(function () {
                loadArticle();
                loadQuestion();
                loadAnswer();
            });
            function loadAnswer() {
                asyncRequestAnswerData(answerCurpage, 5, "/yxl_hnist/questionServlet?action=selectAnswersByUserId&userId=${userDetailInfo.id}", '#hd');
                answerCurpage++;
            }
            function loadArticle() {
                asyncRequestArticleData(articleCurPage, 5, "/yxl_hnist/articleServlet?action=selectUserArticles&userId=${userDetailInfo.id}", '#wz');
                articleCurPage++;
            }
            function loadQuestion() {
                asyncRequestQuestionData(questionCurPage, 5, "/yxl_hnist/questionServlet?action=selectQuestionsByUserId&userId=${userDetailInfo.id}", '#tw');
                questionCurPage++;
            }
            function asyncRequestAnswerData(curPage, pageSize, url, div) {
                $.ajax({
                        type: "post",
                        url: url,
                        data: {curPage: curPage, pageSize: pageSize},
                        success: function (json) {
                            if (json != null) {
                                if (json.count > 0) {
                                    if ($(div).text().trim() == "暂无内容") {
                                        $(div).html("<div class='body' style='padding-top: 20px;'><ul></ul><h2 style='text-align: center'><a href='javascript:void(0)' class='more' onclick='loadAnswer()'>查看更多</a></h2></div>")
                                    }
                                    for (var i = 0; i < json.contents.length; i++) {
                                        console.log($(div + ' .body>ul').html());
                                        $(div + ' .body>ul').append("<li><h2><a target='_blank' href='${contextPath}/questionServlet?action=info&id=" + json.contents[i].question.id + "'>回答：" + json.contents[i].answerContent + "</a></h2><div class='desc'>问题：" + json.contents[i].question.name + "</div></li>")
                                    }
                                    if (curPage == json.lastPage) {
                                        $(div + ' .more').display = false;
                                    }

                                } else {
                                    console.log('未查到任何数据');
                                }
                            }


                        }
                    }
                )
            };
            function asyncRequestQuestionData(curPage, pageSize, url, div) {
                $.ajax({
                        type: "post",
                        url: url,
                        data: {curPage: curPage, pageSize: pageSize},
                        success: function (json) {
                            if (json != null) {
                                if (json.count > 0) {
                                    if ($(div).text().trim() == "暂无内容") {

                                        $(div).html("<div class='body' style='padding-top: 20px;'><ul></ul><h2 style='text-align: center'><a href='javascript:void(0)' class='more'  onclick='loadQuestion()'>查看更多</a></h2></div>")
                                    }
                                    for (var i = 0; i < json.contents.length; i++) {
                                        console.log($(div + ' .body>ul').html());
                                        $(div + ' .body>ul').append("<li><h2><a target='_blank' href='${contextPath}/questionServlet?action=info&id=" + json.contents[i].id + "'>" + json.contents[i].name + "</a></h2></li>")
                                    }
                                    if (curPage == json.lastPage) {
                                        $(div + ' .more').display = false;
                                    }
                                }
                            } else {
                                console.log('未查到任何数据');
                            }
                        }
                    }
                )
            };


            function asyncRequestArticleData(curPage, pageSize, url, div) {
                $.ajax({
                    type: "post",
                    url: url,
                    data: {curPage: curPage, pageSize: pageSize},
                    success: function (json) {
                        if (json != null) {
                            if (json.count > 0) {

                                if ($(div).text().trim() == "暂无内容") {

                                    $(div).html("<div class='body' style='padding-top: 20px;'><ul></ul><h2 style='text-align: center'><a href='javascript:void(0)' class='more'  onclick='loadArticle()'>查看更多</a></h2></div>")
                                }
                                for (var i = 0; i < json.contents.length; i++) {
                                    console.log($(div + ' .body>ul').html());
                                    $(div + ' .body>ul').append("<li><h2><a target='_blank' href='${contextPath}/articleServlet?action=info&id=" + json.contents[i].id + "'>" + json.contents[i].title + "</a></h2></li>")
                                }
                                if (curPage == json.lastPage) {
                                    $(div + ' .more').display = false;
                                }
                            }
                        } else {
                            console.log('未查到任何数据');
                        }
                    }
                }
                )
            }

        </script>


        <div class="body" style="padding-top: 20px;">
            <ul>

            </ul>
        </div>


        <div class="jg-nav">
            <ul>
                <li class="selected"><a href="#wz">文章</a></li>
                <li><a href="#tw">提问</a></li>
                <li><a href="#hd">回答</a></li>
               <%-- <li><a href="#sc">收藏</a></li>--%>
            </ul>
        </div>
        <!-- TAB：首页 start -->
        <!-- TAB: 文章 start -->
        <div class="jg-mod  jghd2 jghd" id="wz">
            <div class="img">
                <img src="images/user_info/img63.png">
            </div>
            <h2 class="empty">暂无内容</h2>
        </div>
        <!-- TAB: 文章 end -->

        <!-- TAB: 活动 start -->
        <!-- TAB: 活动 end -->

        <!-- TAB: 提问 start -->
        <div class="jg-mod jghd2 jghd" id="tw" style="display: none;">
            <div class="img">
                <img src="images/user_info/img63.png">
            </div>
            <h2 class="empty">暂无内容</h2>
        </div>
        <!-- TAB: 提问 end -->

        <!-- TAB: 回答 start -->
        <div class="jghd jg-mod jghd2" id="hd" style="display: none;">
            <div class="img">
                <img src="images/user_info/img63.png">
            </div>
            <h2 class="empty">暂无内容</h2>
        </div>
        <!-- TAB: 回答 end -->


        <!-- TAB: 咨询 start -->
        <div class="jg-mod jg-unfinded jgzx" id="zx" style="display: none;">
            <div class="img">
                <img src="images/user_info/img63.png">
            </div>
            <h2>暂无</h2>
        </div>
        <!-- TAB: 咨询 end -->

        <!-- TAB: 收藏 start -->
        <%--<div class="jg-wz jg-mod jg-sc" id="sc" style="display: none;">
            <div class="head">
                <h2 class="bc-yellow">收藏</h2>
                <dl>
                    <dd class="selected"><a href="javascript:;">文章</a></dd>
                    <dd><a href="javascript:;">测试</a></dd>
                    <dd><a href="javascript:;">心理FM</a></dd>
                </dl>
            </div>


            <div class="body article">
                <ul>
                </ul>
            </div>
            <div class="foot">
            </div>

            <div class="body ceshi_ceshi" style="display: none;">
                <ul>
                </ul>
            </div>
            <div class="foot" style="display: none;">
            </div>

            <div class="body fm_broadcast" style="display: none;">
                <ul>
                </ul>
            </div>
            <div class="foot" style="display: none;">
            </div>
        </div>--%>
        <!-- TAB: 收藏 end -->
    </div>
    <div class="aside2">
        <!-- @remark 自己查看（咨询师、机构） -->

        <!-- @remark 咨询师 -->


        <!-- @remark 机构 -->

        <!-- @remark 普通用户 -->


        <div id="jin-btn-div" style="margin-top: 40px;text-align: center;font-size: 16px; display:none">
            <a href="http://www.xinli001.com/user/1004909856/feng" style="color: red;">封了它</a>
        </div>
    </div>
</div>

<div class="footer">
    <div class="wrapper">
        <div class="nav">
            <ul>
                <li><a href="http://www.xinli001.com/about">关于我们</a></li>
                <li><a href="http://www.xinli001.com/join">加入我们</a></li>
                <li><a href="http://www.xinli001.com/contact">联系我们</a></li>
                <li><a href="http://www.xinli001.com/copyright">免责声明</a></li>
                <li><a href="http://www.xinli001.com/friendlink">友情链接</a></li>
                <li><a href="http://www.xinli001.com/sitemap">网站地图</a></li>
                <li><a href="http://m.xinli001.com/">手机版</a></li>
                <li><a href="http://app.xinli001.com/mobile/">手机应用</a></li>
                <li><a href="http://www.xinli001.com/contri/draft-post" style="display: none">投稿</a></li>
            </ul>
        </div>
        <div class="copyright">
            <div class="text">
                &copy;" 2005－2014 xinli001.com All Rights Reserved. <a target="_blank"
                                                                       href="http://www.miibeian.gov.cn/">粤ICP备12051153号</a>
            </div>
            <div class="img">
                <a key="549261433b05a3da0fbcb548" logo_size="83x30" logo_type="business" href="http://www.anquan.org"
                   target="_blank">
                    <script src="http://static.anquan.org/static/outer/js/aq_auth.js"></script>
                </a>
            </div>
        </div>
    </div>
</div>


<div style="display: none">
    <div id="fk-form" class="fk-box">
        <div class="hd">
            <h2>问题反馈</h2>
        </div>
        <div class="bd">
            <textarea name="content" class="text"></textarea>
        </div>
        <div class="ft">
            <input name="phone" type="text" placeholder="留下你的手机邮箱"/>
            <!-- 			<span>还可以输入400/400个字符</span> -->
        </div>
    </div>
</div>

<script>
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    //document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd64469e9d7bdbf03af6f074dffe7f9b5' type='text/javascript'%3E%3C/script%3E"));
    var _bdurl = unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd64469e9d7bdbf03af6f074dffe7f9b5' type='text/javascript'%3E%3C/script%3E");
    document.write(_bdurl);
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


<body>
</html>
