<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
   
    <meta charset="utf-8">
    <base target="_self">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=yes">
    <title>心理杂志 - 每天学点心理学与生活 - 壹心理</title>
    <meta name="keywords" content="心理杂志，心理月刊，心理学与生活">
    <meta name="description" content="壹心理网 - 心理杂志频道分享婚恋两性心理、亲子心理、职场管理心理、心理健康、心理科普等领域文章。">
    <meta property="qc:admins" content="21604337436016410016375"/>
    <!-- 上一次最新css website_1529ce5a97.css-->
    <link rel="stylesheet" href="${contextPath}/css/website_66f1bdbc64.css">
    <script src="${contextPath}/js/jquery-1.11.2.min.js"></script>
    <script src="${contextPath}/js/jqPaginator.js"></script>
    <script src="${contextPath}/js/website_231cc9327a.js"></script>
    <!--html5shiv让ie678支持html5，respond_min让ie支持css3 query-->
    <!--[if lt IE 9 ]>
    <script src="js/articleList/html5shiv.min.js"></script>
    <script src="js/articleList/respond.min.js"></script>    <![endif]-->

    <!-- <script src="js/articleList/gt.js"></script> -->
</head>

<body>

<jsp:include page="/common/header.jsp"></jsp:include>
<div class="page2">
    <div class="main2">
        <div class="artype">
            <div class="head">
                <ul class="nav">
                    <c:forEach items="${articleCategories}" var="articleCategory">
                        <li <c:if test="${categoryId eq articleCategory.id}">class="selected"</c:if>>
                            <a href="${contextPath}/articleServlet?categoryId=${articleCategory.id}">${articleCategory.categoryName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="arlist">
            <form id="selector-form" action="" method="get" style="display:none">
                <!--				<input type="hidden" name="tag" value="--><!--">-->
            </form>
            <div class="nav">
                <ul>
                    <c:if test="${orderKey eq 'article_views'}">
                        <li class="selected" data-index='0'><a href="${contextPath}/articleServlet?orderKey=article_views&categoryId=${categoryId}">最热</a></li>
                        <li class="nojs"><span></span></li>
                        <li data-index='1'><a href="${contextPath}/articleServlet?orderKey=article_create_time&categoryId=${categoryId}">最新</a></li>
                    </c:if>
                    <c:if test="${orderKey eq 'article_create_time'}">
                        <li  data-index='0'><a href="${contextPath}/articleServlet?orderKey=article_views&categoryId=${categoryId}">最热</a></li>
                        <li class="nojs"><span></span></li>
                        <li class="selected" data-index='1'><a href="${contextPath}/articleServlet?orderKey=article_create_time&categoryId=${categoryId}">最新</a></li>
                    </c:if>
                </ul>
            </div>
            <div id="hot-list" class="list list2">
                <ul>
                    <c:forEach items="${pageTool.contents}" var="article">
                        <li>
                            <div class="img">
                                <a href="${contextPath}/articleServlet?action=info&id=${article.id}" target="_blank"><img
                                        src="${contextPath}/images/article/${article.img}"/></a>
                            </div>
                            <div class="text">
                                <h2><a href="${contextPath}/articleServlet?action=info&id=${article.id}" target="_blank">${article.title}</a>
                                </h2>
                                <div class="attr">
                                    <h4>
                                        <a href="${contextPath}/userServlet?id=${article.user.id}" target="_blank">
                                            ${article.user.username}</a>
                                    </h4>
                                    <dl class="hit">
                                        <dd><a class="ico-view">${article.views}</a></dd>
                                        <dd><a class="ico-digg">${article.praises}</a></dd>
                                    </dl>
                                </div>

                            </div>
                        </li>
                    </c:forEach>
               
                </ul>
                <ul class="pagination">
                    <li><a href="${contextPath}/articleServlet?curPage=${pageTool.firstPage}&categoryId=${categoryId}&orderKey=${orderKey}">首页<a/></li>
                    <li><a href="${contextPath}/articleServlet?curPage=${pageTool.prePage}&categoryId=${categoryId}&orderKey=${orderKey}">上一页</a></li>
                    <li class="active"><span>当前页：${pageTool.curPage}/总页数：${pageTool.lastPage}</span></li>
                    <li><a href="${contextPath}/articleServlet?curPage=${pageTool.nextPage}&categoryId=${categoryId}&orderKey=${orderKey}">下一页</a></li>
                    <li><a href="${contextPath}/articleServlet?curPage=${pageTool.lastPage}&categoryId=${categoryId}&orderKey=${orderKey}">尾页</a></li>
                </ul>

            </div>
        </div>
    </div>
  
    <!--//aside2-->
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>

</body>
</html>