<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
	<script>
	var pageName = 'www/index';
	var indexAuthUserUrl = "${contextPath}/ajax/index-auth-user-div.json";
	</script>
    <meta charset="utf-8">
    <base target="_blank">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=yes">
    <title>壹心理 - 心理学从这里开始</title>
    <meta name="keywords" content="壹心理，心理网，心理测试，心理学，心理咨询，爱情测试，心理课程">
    <meta name="description"
          content="壹心理网 - 心理学从这里开始，国内最大的心理学网络服务平台。提供专业、完善的心理健康服务，包括心理咨询、心理课程培训、心理测试、心理杂志等频道，涵盖了职场心理、亲子家庭、两性心理、情绪管理、心灵探索、心理科普等领域。">
    <meta property="qc:admins" content="21604337436016410016375"/>
    <!-- 上一次最新css website_1529ce5a97.css-->
    <link rel="stylesheet" href="css/index/website_66f1bdbc64.css">
    <script>
        var headerAuthUserUrl = "http://www.xinli001.com/ajax/header-auth-user-div.json";

    </script>
    <script src="${contextPath}/js/website_231cc9327a.js"></script>    <!--html5shiv让ie678支持html5，respond_min让ie支持css3 query-->
    <!--[if lt IE 9 ]>
    <script src="${contextPath}/js/index/html5shiv.min.js"></script>
    <script src="${contextPath}/js/index/respond.min.js"></script>    <![endif]-->

    <script src="${contextPath}/js/index/gt.js"></script>
    <style>
        .activity-title {
            display: -webkit-box;
            display: -moz-box;
            overflow: hidden;
            -webkit-line-clamp: 2;
            height: 41px;
            /* color: #444; */
            text-align: justify;
            text-overflow: ellipsis;
            word-break: break-all;
            -webkit-box-orient: vertical;
        }
    </style>
</head>
<body>

<jsp:include page="/common/header.jsp"></jsp:include>
<div class="wrapper page">
    <div class="main">
        <div class="hslide-wrap">
            <div class="hslide">
                <ul class="slides">
                	<c:forEach items="${indexSlides}" var="indexSlide">
                		<li class="slide">
                        <a href="${contextPath}/articleServlet?action=info&id=${indexSlide.id}" target="_blank">
                            <div class="img">
                                <img src="${contextPath}/images/article/article_${indexSlide.id }.jpg"/>
                            </div>
                            <div class="tip">
                               ${indexSlide.title }
                            </div>
                        </a>
                    </li>
                	</c:forEach>
                </ul>
            </div>
            <div class="hzxtj">
                <div class="head">
                    <h1>一周热文</h1>
                </div>
                <div class="body">
                    <ul>
                       <c:forEach var="recentWeekArticle" items="${recentWeekArticles}">
                           <li><a href="${contextPath}/articleServlet?action=info&id=${recentWeekArticle.id}" target="_blank">${recentWeekArticle.title}</a></li>
                       </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div class="hblock">
            <div class="head">
                <h2>看文章</h2>
                <div class="btn btn-xwz">
                    <nofollow>
                        <a id="btn-write" href="${contextPath}/articleServlet"></a>
                    </nofollow>
                </div>
                <ul class="nav" style="margin-bottom: 33px;">
                    <li class="selected">
                        <a href="${contextPath}/articleServlet?categoryId=0">全部</a>
                    </li>
                    <c:forEach items="${articleCategories}" var="articleCategory" >
                        <li>
                            <a href="${contextPath}/articleServlet?categoryId=${articleCategory.id}">${articleCategory.categoryName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <c:forEach items="${articles}" var="entry" varStatus="status">
                <c:choose>
                    <c:when test="${status.index eq 0}">
                        <c:set var="display" value="style=\"display:block;\""></c:set>
                    </c:when>
                    <c:otherwise>
                        <c:set var="display" value="style=\"display:none;\""></c:set>
                    </c:otherwise>
                </c:choose>

                <div class="body" ${display}>
                    <ul class="hkwz">
                        <c:forEach items="${entry.value}" var="article">
                            <li>
                                <div class="img">
                                    <a target="_blank" href="${contextPath}/articleServlet?action=info&id=${article.id}">
                                        <img src="images/article/${article.img}"/>
                                    </a>
                                </div>
                                <div class="text">
                                    <h2><a target="_blank" href="${contextPath}/articleServlet?action=info&id=${article.id}">${article.title}</a>
                                    </h2>
                                    <div class="name">
                                        <a target="_blank" href="${contextPath}/userServlet?action=info&id=${article.user.id}">${article.user.username}</a>
                                    </div>
                                    <div class="view">
                                        <span>${article.views}</span>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="foot" ${display}>
                    <nofollow>
                        <a href="${contextPath}/articleServlet?categoryId=${entry.key.id}">更多${entry.key.categoryName}文章</a>
                    </nofollow>
                </div>
            </c:forEach>

        </div>
        <!--//hblock-->


        <div class="hblock">
            <div class="head">
                <h2>提问题</h2>
                <ul class="nav" style="display: none;">
                    <li class="selected">
                        <a href="http://qa.xinli001.com/">全部</a>
                    </li>
                    <li>
                        <a href="http://qa.xinli001.com/amor">爱情测试</a>
                    </li>
                    <li>
                        <a href="http://qa.xinli001.com/personality">性格测试</a>
                    </li>
                    <li>
                        <a href="http://qa.xinli001.com/vocational">能力测试</a>
                    </li>
                    <li>
                        <a href="http://qa.xinli001.com/member">会员测试</a>
                    </li>
                </ul>
                <div class="btn btn-tw">
                    <nofollow>
                        <a id="btn-qa" href="${contextPath}/questionServlet?action=goAdd"></a>
                    </nofollow>
                </div>
            </div>
            <div class="body">
                <ul class="htwt">
                    <c:forEach items="${questions}" var="question" varStatus="status">
                        <li>
                            <h2>
                                <nofollow>
                                    <a href="${contextPath}/questionServlet?action=info&id=${question.id}">${status.index+1}. ${question.name}</a>
                                </nofollow>
                            </h2>
                            <h4><%--<c:if test="${question.answers ne null}">${question.answers[0].user.username}等专家${question.answerName}人回答了</c:if>--%> </h4>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="foot">
                <nofollow>
                    <a target="_blank" href="${contextPath}/questionServlet">更多全部提问</a>
                </nofollow>
            </div>

            <!--//body-->
        </div>
        <!--//hblock-->


        <div class="hblock">
            <div class="head">
                <h2>做测试</h2>
            </div>
            <div class="body">
                <ul class="hxlcs">
                   <c:forEach var="hotSuite" items="${hotSuiteList}">
                       <li>
                           <div class="img">
                               <a href="${contextPath}/suiteServlet?action=info&id=${hotSuite.suiteCode}" target="_blank">
                                   <img src="${contextPath}/images/ceshi_info/${hotSuite.photo}" width="200"
                                        height="134"/>
                               </a>
                           </div>
                           <h2>
                               <a href="${contextPath}/suiteServlet?action=info&id=${hotSuite.suiteCode}" target="_blank">
                                   ${hotSuite.title} </a>
                           </h2>
                           <div class="hits">
                               <span>${hotSuite.testnum}</span>
                           </div>
                       </li>
                   </c:forEach>

                </ul>
            </div>
            <div class="foot">
                <a href="${contextPath}/suiteServlet">更多心理测试</a>
            </div>
        </div>
        <!--//hblock-->


        <!--//hblock-->
    </div>
    <div class="aside">
        <div id="index-auth-user-div" class="huser huser-sign">
            <div class="info">
                <c:choose>
                    <c:when test="${user ne null}">
                        <div class="img">
                            <a href="${contextPath}/userServlet?action=info&id=${user.id}"><img src="${contextPath}/images/user_info/user_img/${user.img}"></a>
                        </div>
                        <div class="text">
                            欢迎登录用户：<a href="${contextPath}/userServlet?action=info&id=${user.id}">${user.username}</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="img">
                            <a href="${contextPath}/login.jsp"><img src="${contextPath}/images/index/img44.jpg"></a>
                        </div>
                        <div class="text">
                            <a href="${contextPath}/login.jsp" class="btn">登录</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="nav">
                <dl>
                    <dd>
                        <a href="javascript:;">
                            <h2>0</h2>
                            <h4>文章</h4>
                        </a>
                    </dd>
                    <dd>
                        <a href="javascript:;">
                            <h2>0</h2>
                            <h4>提问</h4>
                        </a>
                    </dd>
                    <dd>
                        <a href="javascript:;">
                            <h2>0</h2>
                            <h4>回答</h4>
                        </a>
                    </dd>
                    <dd class="last">
                        <a href="javascript:;">
                            <h2>0</h2>
                            <h4>收藏</h4>
                        </a>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
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
</body>
</html>
