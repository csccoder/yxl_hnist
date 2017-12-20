<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/19
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <title>心理问答 - 壹心理</title>

    <meta name="keywords" content="心理杂志,心理杂志频道"/>
    <meta name="description"
          content="本网心理杂志频道是一个集两性心理、职场发展、情绪管理、心灵探索、心理百科、社会热点的实用心理杂志频道，我们拒绝枯燥、拒绝陈腐，将心理杂志通过通过有趣的、多媒体等方式帮助大家改变、成长……"/>

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
            <a href="${contexntPath}/articleServlet" class="headerlogo">心理问答</a>
        </div>
    </div>

</div>
<!-- header end -->

<div class="infos-wrap">
    <div class="fish-left main-left">
        <div class="show_ask">

            <h2 class="add_ask">提问题 ：<span class="fgrey">*为必填</span></h2>
            <form id="id_ask_form" action="${contextPath}/questionServlet?action=addQuestion" class="ask_form" method="post">
                <p class="fields fgrey">
                    <span class="items">标题 ：</span>
                    <input type="text" id="id_title" name="name" value="" maxlength="30" class="ins long"
                            nullmsg="请输入问题标题" errormsg="问题标题不能超过30个字符">
                    *30字符以内
                </p>
                <p class="fields fgrey">
                    <span class="items">内容 ：</span>
                    <textarea id="id_content" name="content" class="ins txt" datatype="s0-400" nullmsg="请输入问题内容"
                              errormsg="问题内容不能超过400个字符"></textarea><br>
                    <span class="tips"></span>
                </p>
                <p class="fields fgrey">
                    <span class="items" id="id_category">类别 ：</span>
                    <c:forEach items="${questionCategories}" var="category" varStatus="status">
                        <input type="radio" name="categoryId" id="id_category_${status.index}" value="${category.id}">
                        <label for="id_category_${status.index}">${category.categoryName}</label> &nbsp;
                    </c:forEach>
                    <br>
                    <span id="id_category_msg" class="inputmsg"></span>
                </p>
                <p class="fields fgrey">
                    <!-- 这里需要完善-->
                    <input type="hidden" name="userId" id="userId" value="${user.id}">
                    <input type="hidden" name="userName" value="${user.username}">
                    <input id="id_ask_submit" type="button" class="btns" value="提交" onclick="commit_ask()">
                </p>
            </form>

        </div>
        <!--问题-->
    </div>
    <!--right-->
</div>
<script>

    function commit_ask() {
        var userId = document.getElementById("userId").value;
        if(userId==null||userId==""){
            alert("请登录后再发表文章");
            window.location.href="${contextPath}/login.jsp";
        }else{
            document.forms[0].submit();
        }

    }
</script>

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

</body>
</html>