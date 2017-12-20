<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <!-- 1497702039 -->
    <script>
        var pageName = 'www/article/detail';
        var slug = "";
        var articleId = '100370142';

        var articleUserStatusUrl = "http://www.xinli001.com/ajax/article-user-status.json";
        var articleListPage = "http://www.xinli001.com/info";
        var jubaoCommentUrl = "http://www.xinli001.com/ajax/article-comment-jubao.json";
        var toggleArticleZanUrl = "http://www.xinli001.com/ajax/article-like-toggle.json";
        var toggleArticleFavoriteUrl = "http://www.xinli001.com/ajax/article-fav-toggle.json";
        var articleCommentListUrl = "http://www.xinli001.com/ajax/article-comment-list.json";
        var toggleCommentZanUrl = "http://www.xinli001.com/ajax/article-comment-like-toggle.json";
        var toggleXiangZixunUrl = 'http://www.xinli001.com/ajax/user-zixun-toggle.json';

    </script>
    <meta charset="utf-8">
    <base target="_self">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=yes">
    <title>心理咨询师写给女婿的信：我不会让你一定要对女儿好 - 壹心理</title>
    <meta name="keywords" content="心理咨询师写给女婿的信：我不会让你一定要对女儿好">
    <meta property="qc:admins" content="21604337436016410016375"/>
    <!-- 上一次最新css website_1529ce5a97.css-->
    <link rel="stylesheet" href="${contextPath}/css/website_66f1bdbc64.css">
    
    <script src="${contextPath}/js/article/website_231cc9327a.js"></script>
    <!--html5shiv让ie678支持html5，respond_min让ie支持css3 query-->
    <!--[if lt IE 9 ]>
    <script src="js/article/html5shiv.min.js"></script>
    <script src="js/article/respond.min.js"></script>    <![endif]-->

    <script src="${contextPath}/js/article/gt.js"></script>
    <link rel="stylesheet" href="${contextPath}/css/article/article.editor.min.css">
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="page2">
    <div class="main2">
        <div class="details">
            <div class="details-head">
                <div class="curr">
                    <a href="${contextPath}/index.do">首页</a>
                    <span>&gt;</span>
                    <a href="${contextPath}/articleServlet?categoryId=${article.catergory.id}" class="selected">${article.catergory.categoryName}列表</a>
                    <span>&gt;</span>
                    <span>文章详情</span>
                </div>
                <div class="title">
                    <h1>${article.title}</h1>
                </div>
                <div class="attr" style="overflow: hidden">
                    <dl style="float:left">
                        <dd><a id="viewnum" class="ico-view">${article.views}</a></dd>
                        <dd><a id="commentnum" class="ico-com">${article.comments}</a></dd>
                    </dl>
                    <div style="float: right;width:auto;">
                    	<span style="margin-right: 20px;"><i>作者：</i>${article.user.username}</span>
                    	<span>发表于<fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate> </span>
                    </div>
                </div>
            </div>
            <div class="texts">
                <div class="ql-snow">
                    <div class="ql-editor">
                        ${article.content}
                    </div>
                </div>
                <div id="copyright">
                    <p>用户在壹心理上发表的全部原创内容（包括但不仅限于回答、文章和评论），著作权均归用户本人所有。独家文章转载，请联系邮箱：<a href='mailto:chenny@chenny3.cn'>chenny@chenny3.cn</a>
                    </p>
                </div>
                <div id="zan-btn" class="digg">
                    <a id="zannum" href="javascript:;">${article.praises}</a>
                </div>
            </div>
           
            <div class="action">
                <div id="fav-btn" class="fav">
                    <a id="btn-toggle-favorite" href="javascript:;" class="btn"></a>
                    <span>共<span id="favnum">0</span>人</span>
                </div>
                <div class="share bdsharebuttonbox" data-tag="share_1">
                    <span>分享到：</span>
                    <a href="javascript:;" class="bds_weixin" data-cmd="weixin"></a>
                    <a href="javascript:;" class="bds_tsina" data-cmd="tsina"></a>
                    <a href="javascript:;" class="bds_douban" data-cmd="douban"></a>
                </div>
            </div>
        </div>

       
        
        <div class="detail-pl">
            <form class="comment-form" action="http://www.xinli001.com/ajax/article-comment-add.json" method="post">
                <div class="head">
                    评论（<span id="commentnum_dibu">${article.comments}</span>）
                </div>
                <div class="body">
                    <input type="hidden" name="object_id" value="100370142">
                    <input type="hidden" name="reply_object_id" value="0">
                    <textarea name="content" rows="" cols=""></textarea>
                </div>
                <div class="foot">
                    <input type="submit" value="发布"/>
                </div>
            </form>
        </div>
        <div class="detail-plist" style="display:none">
            <ul id="comment-list">

                <li style="display:none">
                    <div class="img">
                        <a target="_blank" href="http://www.xinli001.com/user"><img
                                src="images/article/9fe4842afb2c58c2200a1b9ae7a68ca9.png"></a>
                    </div>
                    <div class="text">
                        <h2>蝶食</h2>
                        <p>真好啊，真的，我希望自己也可以像他那样，</p>
                        <div class="meta">
                            <dl class="info">
                                <dd>1月前</dd>
                                <dd>
                                    <span class="line"></span>
                                </dd>
                                <dd>
                                    <a href="#" class="ico-jubao" data-pk="746916">举报</a>
                                </dd>
                            </dl>
                            <dl class="acts">
                                <dd>
                                    <a href="#" class="ico-zan" data-pk="746916"><span>0</span> 赞</a>
                                </dd>
                                <dd>
                                    <span class="line"></span>
                                </dd>
                                <dd>
                                    <a href="#" class="ico-com">&nbsp;</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="form" style="display: none">
                            <form class="reply-form" action="http://www.xinli001.com/ajax/article-comment-add.json"
                                  method="post">
                                <div class="text-wrap">
                                    <input type="hidden" name="object_id" value="100370142">
                                    <input type="hidden" name="reply_object_id" value="0">
                                    <textarea name="content" rows="" cols=""></textarea>
                                </div>
                                <div class="btns">
                                    <input type="button" value="取消">
                                    <input type="submit" class="btn-submit" value="评论">
                                </div>
                            </form>
                        </div>
                    </div>
                </li>
                <li style="display:none">
                    <div class="img">
                        <a target="_blank" href="http://www.xinli001.com/user"><img
                                src="images/article/e8685fdfb7ce29187e333a6a352c632f.jpg"></a>
                    </div>
                    <div class="text">
                        <h2>乐见朱颜记</h2>
                        <p>一个不是岳父的人，装深沉写这样的教育文章，不怎么样。</p>
                        <div class="meta">
                            <dl class="info">
                                <dd>1月前</dd>
                                <dd>
                                    <span class="line"></span>
                                </dd>
                                <dd>
                                    <a href="#" class="ico-jubao" data-pk="746916">举报</a>
                                </dd>
                            </dl>
                            <dl class="acts">
                                <dd>
                                    <a href="#" class="ico-zan" data-pk="746916"><span>0</span> 赞</a>
                                </dd>
                                <dd>
                                    <span class="line"></span>
                                </dd>
                                <dd>
                                    <a href="#" class="ico-com">&nbsp;</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="form" style="display: none">
                            <form class="reply-form" action="http://www.xinli001.com/ajax/article-comment-add.json"
                                  method="post">
                                <div class="text-wrap">
                                    <input type="hidden" name="object_id" value="100370142">
                                    <input type="hidden" name="reply_object_id" value="0">
                                    <textarea name="content" rows="" cols=""></textarea>
                                </div>
                                <div class="btns">
                                    <input type="button" value="取消">
                                    <input type="submit" class="btn-submit" value="评论">
                                </div>
                            </form>
                        </div>
                    </div>
                </li>

            </ul>
            <div class="more">
                <a href="javascript:;" data-page="1">查看更多评论</a>
            </div>
        </div>
    </div>
    <div class="aside2"></div>
    <!--//aside2-->
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>





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
<script>
    window._bd_share_config = {
        share: [{
            "tag": "share_1",
            "bdSize": 0
        }]
    };
    with (document)0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>
<script>
    (function () {
        var bp = document.createElement('script');
        bp.src = '//push.zhanzhang.baidu.com/push.js';
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
</body>
</html>

