<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>${suite.title} - 壹心理</title>
    <meta name="keywords" content="你的前任后悔分手了吗？">
    <meta name="description" content=":content">

    <link rel="stylesheet" href="${contextPath}/css/index.min.css">
    <script src="${contextPath}/js/jsmin/jquery-1.11.2.min.js"></script>
    <script src="${contextPath}/js/jsmin/common.min.js"></script>
    <script src="${contextPath}/js/jsmin/website-addons.min.js"></script>
    <script src="${contextPath}/js/zhuge.sdk.js"></script>

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

<div class="infos-wrap">

    <div class="fish-left main-left">
        <div class="mbox tshow_index">
            <div class="title bor_bot fixed">
                <p class="items fl" title="心理测试"></p>
                <div class="tinfo fl">
                    <h2>${suite.title}</h2>
                    <span class="icons" title="测试人数"></span>${suite.testnum}人测试过 &nbsp;
                    <span class="icons fav" title="收藏次数"></span>1次收藏 &nbsp;
                    <span class="icons tdates" title="发布时间"></span><fmt:formatDate value="${suite.creatTime}"
                                                                                   pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate>
                    &nbsp;
                    <span class="icons comments" title="评论数"></span> 380条评论

                </div>
            </div>
            <div class="ctest bor_top">当前第 <span class="fgreen fb" id="id_cur_index">1</span> &nbsp;题
                <span class="total">本测试共 <span class="fgreen fb">${suite.questionCount}</span> &nbsp;题</span>
            </div>
        </div>
        <!--测试内容头部-->

        <form id='id_form' action="${contextPath}/suiteServlet?action=done&suiteId=${suite.suiteCode}" method="post">
            <c:forEach varStatus="status" var="question" items="${suite.suiteQuestions}">
                <div id="id_question_${question.questionCode}" class="test_contents" style="display: none" index="${status.index+1}">
                    <p class="descs fb">
                            ${question.title}:${question.questionCode} </p>
                    <div class="sels_list">
                        <!--单选测试-->
                       <c:forEach items="${question.options}" var="option" varStatus="i">
                           <div class="items">
                               <p class="i_top"></p>
                               <p class="i_mid">
                                    <span class="sels">
                                        <input type="radio" name="${option.questionCode}" value="${option.optionCode}"
                                               question="${option.questionCode}" <c:choose><c:when test="${option.nextQuestion ne null && option.nextQuestion ne ''}">qid="${option.nextQuestion}" rid="0"</c:when><c:otherwise>qid="" rid="1" </c:otherwise></c:choose> index="${i.index}" />
                                    </span>${option.title}:${option.optionCode}
                               </p>
                               <p class="i_bot"></p>
                           </div>
                       </c:forEach>
                    </div>
                </div>
            </c:forEach>

            <input type="hidden" name="choice" id="id_choice"/>
            <p class="tbtns">
                <a id="id_pre_link" style="display: none" href="javascript:void(0)" class="test_btn"
                   onclick="return do_prev()">上一题</a>
                &nbsp;&nbsp;
                <input id="id_show_result" style="display: none" type="submit" class="btns" value="提 交"/>
            </p>
        </form>
        <!--测试内容-->
    </div>
    <!--left-->
    <script src="${contextPath}/js/ceshi/show.js"></script>

    <script>
        var questionLength = ${suite.questionCount};
        var brotherCheckedNodeIndex=-1;
        function setTestSels(ele, clickfun) {
            var items = $(ele);
            items.hover(function () {
                $(this).addClass('hover');
            }, function () {
                $(this).removeClass('hover');
            }).click(function () {
                items.removeClass('act');
                var radio = $(this).find(':radio');
                console.log("点击前"+brotherCheckedNodeIndex);
                if (radio.length > 0) {
                    if(brotherCheckedNodeIndex!=-1) {//不为-1，说明这道题有其他的选项选中;
                        console.log( $($(this).parent().find(".items")[brotherCheckedNodeIndex]));
                        $(this).parent().find(".items")[brotherCheckedNodeIndex].removeAttribute("checked");
                    }
                    $(this).addClass('act');
                    radio.attr('checked', 'checked');//点击某个items，就给的子input=radio 加上checked状态
                    if (clickfun) {
                        brotherCheckedNodeIndex=radio.attr("index");
                        console.log("当前选中的index"+brotherCheckedNodeIndex);
                        checked_optionIndex.push(brotherCheckedNodeIndex);
                        console.log("index栈中情况"+checked_optionIndex);
                        brotherCheckedNodeIndex=-1;
                        console.log(brotherCheckedNodeIndex);
                        clickfun(this); //执行点击调用的函数
                    }
                }
            });
        }
        var pre_qids = new Array();
        var cur_qids = new Array();
        var checked_optionIndex=new Array();
        function do_prev() {
            brotherCheckedNodeIndex=checked_optionIndex.pop();
            console.log("当前执行的是返回上一题操作");
            console.log("出栈前两个栈的请况");
            console.log(pre_qids);
            console.log(cur_qids);
            var pre_qid = pre_qids.pop();
            var cur_qid = cur_qids.pop();
            console.log("出栈后两个栈的请况");
            console.log(pre_qids);
            console.log(cur_qids);
            $('#id_show_result').hide();
            $('#id_question_' + pre_qid).show();
            $('#id_question_' + cur_qid).hide();
            var index = $('#id_question_' + pre_qid).attr('index');
            $('#id_cur_index').html(index);
            if (index == 1) {
                $('#id_pre_link').hide();
            }
        }
        function do_next(el) {// el当前点击的items对象

            $('#id_show_result').hide();//提交按钮隐藏
            $('#id_pre_link').show();//显示返回上一题按钮
            var radio = $($(el).find('input:checked')[0]);//找到items第一个设置了checked状态的radio表单元素
            console.log("radio:"+radio);
            var rid = radio.attr('rid');//获取rid
            var qid = radio.attr('qid');//获取qid
            if (qid !='') { //如果qid>0 即存在下一题。
                var question = radio.attr('question');
                console.log("当前执行的是下一题操作");
                console.log("入栈前两个栈的请况");
                console.log(pre_qids);
                console.log(cur_qids);
                pre_qids.push(question);//把当前入栈 ,pre_qids栈用来保存上一题，主要是为了实现点击上一题的功能 例如:[Q001,Q008,....]
                cur_qids.push(qid);//把要跳转的下一题入当前题栈
                console.log("入栈后两个栈的请况");
                console.log(pre_qids);
                console.log(cur_qids);

                console.log("question:"+question);
                $('#id_question_' + question).hide();//隐藏当前题
                $('#id_question_' + qid).show();//显示下一题
                var index = $('#id_question_' + qid).attr('index');
                $('#id_cur_index').html(index);
            }
            if (rid > 0) {
                $('#id_choice').val(radio.val());
                $('#id_show_result').show();
            }
        }
        $(function () {
            setTestSels('.sels_list .items', do_next);//给每个.item div加一个跳转到下一题的点击事件
            $('.test_contents:first').show();
        });
       /* $(function () {
            $('#id_show_result').click(onCeshiFormSubmit);
        });*/
    </script>

    <div class="fish-left main-right">


    </div>
    <!--right-->
</div>


<div class="footer">
    <div class="wrap">
        <div class="flinks">
            <a href="http://www.xinli001.com/about">关于我们</a>
            <a href="http://www.xinli001.com/join">加入我们</a>
            <a href="http://www.xinli001.com/contact">联系我们</a>
            <a href="http://www.xinli001.com/copyright">免责声明</a>
            <a href="http://www.xinli001.com/friendlink">友情链接</a>
            <a href="http://www.xinli001.com/sitemap.html">网站地图</a>
            <a href="http://m.xinli001.com/">手机版</a>
            <a href="http://app.xinli001.com/mobile/">手机应用</a>
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

<div id="background"></div>

<script>
    var userinfoUrl = 'http://www.xinli001.com/userinfo/';
</script>

<script src="${contextPath}/js/index.min.js"></script>

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