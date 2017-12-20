<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <title>心理问答 - 在线免费心理咨询平台 - 壹心理</title>

    <meta name="keywords" content="心理问答,心理咨询,心理问答频道"/>
    <meta name="description" content="免费、专业心理咨询平台，提供专业的在线免费心理咨询服务，让心理咨询师为困扰在你心底的问题找到答案。"/>

    <link href="${contextPath}/css/index.min.css" rel="stylesheet" type="text/css"/>
    <link href="${contextPath}/css/question/index-qa.min.css" rel="stylesheet" type="text/css"/>

    <script src="${contextPath}/js/question/jquery-1.8.3.min.js"></script>
    <script src="${contextPath}/js/common.min.js"></script>

</head>
<body>


<jsp:include page="/common/header.jsp"></jsp:include>
<!-- header end -->


<div class="infos-wrap">
    <div class="fish-left main-left">


        <div class="focus fixed">
            <h2>聚焦推荐问题 ：</h2>

            <div id="focus_img" class="fl focus_img">
                <dl class="focus_box">
                    <dt>

                      <c:forEach var="hotQuestion" items="${hotQuestions}">
                          <a href="${contextPath}/questionServlet?action=info&id=${hotQuestion.id}">
                              <img src="${contextPath}/images/question/hot/${hotQuestion.img}" width="200"
                                   height="140" alt="${hotQuestion.name}">
                          </a>
                      </c:forEach>



                    </dt>
                    <dd></dd>
                </dl>
            </div>
            <div id="focus_links" class="fl focus_links">
                <ul>

                   <c:forEach var="hotQuestion" items="${hotQuestions}">
                       <li class="act">
                           <span class="square"></span><a href="${contextPath}/questionServlet?action=info&id=${hotQuestion.id}">${hotQuestion.name}</a>
                           <!--<a href="http://qa.xinli001.com/children/" class="category">[亲子教育]</a>-->
                           <span class="answers">${hotQuestion.answerNum}回答</span>
                       </li>
                   </c:forEach>



                </ul>
            </div>
        </div>

        <div class="ask_sels" id="id_qanav">
            <a href="${contextPath}/questionServlet?flag=-1&categoryId=${categoryId}" type="all" class="qas act" target="_self">所有问题</a> &nbsp; &nbsp; | &nbsp; &nbsp;
            <a href="${contextPath}/questionServlet?flag=0&categoryId=${categoryId}" type="wait" class="qas" target="_self">等待解决的问题</a> &nbsp; &nbsp; | &nbsp; &nbsp;
            <a href="${contextPath}/questionServlet?flag=1&categoryId=${categoryId}" type="done" class="qas" target="_self">已解决的问题</a> &nbsp; &nbsp; | &nbsp; &nbsp;
            <a href="http://www.xinli001.com/user#tw">我的问答</a>
        </div>


        <div class="ask_lists" id="id_q_list">


           <c:forEach var="question" items="${pageTool.contents}">
               <div class="items fixed">
                   <div class="pbox">
                       <a href="">
                           <img src="${contextPath}/images/user_info/user_img/${question.user.img}" width="50" height="50"
                                alt="" hover="true">
                       </a>
                   </div>
                   <div class="ask_show">
                       <a href="${contextPath}/questionServlet?action=info&id=${question.id}">${question.name}</a><br>
                       ${fn:substring(question.content,5,80 )}
                       <span class="fgrey">(<a href="${contextPath}/questionServlet?action=info&id=${question.id}">${question.answerNum}回答</a>)</span>
                       <p class="tool">来自 &nbsp;
                           <a href="${contextPath}/userServlet?action=info&id=${question.user.id}">${question.user.username}</a> &nbsp;
                           <a href="${contextPath}/questionServlet?action=info&id=${question.id}" class="answer">我来回答</a>
                       </p>
                   </div>
               </div>

           </c:forEach>
            <!--items-->

        </div>


        <div class="pagebar" id="pages">
            <c:choose>
                <c:when test="${(pageTool.curPage eq 1)&&(pageTool.curPage eq pageTool.lastPage) }">
                  <span>首页</span> |
                  <span>上一页</span>  |
                  <span>当前页：${pageTool.curPage}/总页数：${pageTool.lastPage}</span>  |
                  <span>下一页</span>  |
                  <span>尾页</span>  |
                </c:when>
                <c:when test="${(pageTool.curPage eq 1)&&(pageTool.curPage ne pageTool.lastPage) }">
                    <span>首页</span> |
                    <span>上一页</span> |
                    <span>当前页：${pageTool.curPage}/总页数：${pageTool.lastPage}</span> |
                    <a href="${contextPath}/questionServlet?curPage=${pageTool.nextPage}&categoryId=${categoryId}" target="_self">下一页</a> |
                    <a href="${contextPath}/questionServlet?curPage=${pageTool.lastPage}&categoryId=${categoryId}" target="_self">尾页</a> |
                </c:when>
                <c:when test="${(pageTool.curPage ne 1)&&(pageTool.curPage ne pageTool.lastPage) }">
                    <a href="${contextPath}/questionServlet?curPage=${pageTool.firstPage}&categoryId=${categoryId}" target="_self">首页</a>|
                    <a href="${contextPath}/questionServlet?curPage=${pageTool.prePage}&categoryId=${categoryId}" target="_self">上一页</a> |
                    <span>当前页：${pageTool.curPage}/总页数：${pageTool.lastPage}</span> |
                    <a href="${contextPath}/questionServlet?curPage=${pageTool.nextPage}&categoryId=${categoryId}" target="_self">下一页</a> |
                    <a href="${contextPath}/questionServlet?curPage=${pageTool.lastPage}&categoryId=${categoryId}" target="_self">尾页</a> |
                </c:when>
                <c:otherwise>
                    <a href="${contextPath}/questionServlet?curPage=${pageTool.firstPage}&categoryId=${categoryId}" target="_self">首页</a>|
                    <a href="${contextPath}/questionServlet?curPage=${pageTool.prePage}&categoryId=${categoryId}" target="_self">上一页</a> |
                    <span>当前页：${pageTool.curPage}/总页数：${pageTool.lastPage}</span> |
                    <span>下一页</span> |
                    <span>尾页</span> |
                </c:otherwise>
            </c:choose>
        </div>


    </div>


    <div class="fish-left main-right">
        <div id="id_user_info_div"></div>
        <div class="ask_submit mt20">
            <p>心理问答，有问必答！</p>
            <p>有心事就要说出来，总有一个答案让你豁然开朗。这里聚集了国内外有爱的心理咨询师，和心理学专业的朋友，为你解答内心困惑。</p>
            <p class="pbtns"><c:choose><c:when test="${user ne null}"><a href="${contextPath}/questionServlet?action=goAdd" class="start2">开始提问</a></c:when><c:otherwise><a href="javascript:alert('请先登录')" class="start2">开始提问</a></c:otherwise></c:choose></p>
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

    </div>

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


<script src="${contextPath}/js/question/show.js"></script>
<script>
    $(function () {
        setFocusSlid('#focus_links', '#focus_img', 140);
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

<!-- Baidu Button BEGIN -->

<script>window._bd_share_config = {
    "common": {
        "bdSnsKey": {"tsina": "2165055798"},
        "bdText": "",
        "bdMini": "2",
        "bdMiniList": false,
        "bdPic": "",
        "bdStyle": "0",
        "bdSize": "16"
    }, "slide": {"type": "slide", "bdImg": "6", "bdPos": "right", "bdTop": "100"}
};
with (document)0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
<!-- Baidu Button END -->

</body>
</html>