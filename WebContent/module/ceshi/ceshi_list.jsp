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
    <title>心理测试_心理测试题_答案_大全-壹心理</title>
    <meta name="keywords" content="心理测试,心理测试题及答案,心理测试题,心理测试大全">
    <meta name="description" content="壹心理心理测试频道，这里有爱情测试、性格测试、能力测试、会员测试、精选测试、专业测评，包含了心理测试题及答案。">

    <link rel="stylesheet" href="${contextPath}/css/ceshi_list/index.min.css">
    <script src="js/ceshi_list/jquery-1.11.2.min.js"></script>
    <script src="js/ceshi_list/common.min.js"></script>
    <script src="js/ceshi_list/website-addons.min.js"></script>
    <script src="js/ceshi_list/zhuge.sdk.js"></script>
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

                

            </ul>

        </div>
        
    </div>

</div>
<!-- header end -->

<div class="infos-wrap">
    <div class="fish-left main-left">
        <div class="category">
            <h2 class="title"><a href="http://www.xinli001.com/ceshi/amor">爱情测试</a></h2>
            <div class="lists">
                <div class="parts">
                    <dl>
                        <dt>
                        <p class="pbox"><a href="http://www.xinli001.com/ceshi/1672">
                            <img class="lazyload" src="images/ceshi_list/f36c04152d279803ed559719f0b97630.jpg!120x80"
                                 width="120" height="80" alt="你的前任后悔分手了吗？" hover="true"/>
                        </a></p>
                        <p class="cinfo">
                            <a href="http://www.xinli001.com/ceshi/1672" title="你的前任后悔分手了吗？">你的前任后悔分手了吗？</a><br>
                            形成一段亲密关系并不容易，从一段亲密关系中抽身出来也不... <span class="testers">441126人测试</span>
                        </p>
                        </dt>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/453" title="测试你的恋爱模式">测试你的恋爱模式</a>
                            <span class="testers">72513人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/1651" title="测你当下的爱情观">测你当下的爱情观</a>
                            <span class="testers">737119人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/133" title="你的爱情公式是什么？">你的爱情公式是什么？</a>
                            <span class="testers">30780人测试</span>
                        </dd>
                    </dl>
                </div>
                <div class="parts">
                    <dl>
                        <dt>
                        <p class="pbox"><a href="http://www.xinli001.com/ceshi/532">
                            <img class="lazyload" src="images/ceshi_list/ce19b322dfd729ba62c359abd11cd1e1.jpg!120x80"
                                 width="120" height="80" alt="测测下半年的感情运势是好是坏 " hover="true"/>
                        </a></p>
                        <p class="cinfo">
                            <a href="http://www.xinli001.com/ceshi/532" title="测测下半年的感情运势是好是坏 ">测测下半年的感情运势是好是坏 </a><br>
                            下半年你的感情会出现什么转折？会桃花胜放还是小有波折呢？... <span class="testers">44123人测试</span>
                        </p>
                        </dt>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/708" title="嘘！测测你的爱情禁语是什么">嘘！测测你的爱情禁语是什么</a>
                            <span class="testers">44578人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/19" title="1道题测出你爱情的潜在威胁是什么！">1道题测出你爱情的潜在威胁是什么！</a>
                            <span class="testers">25940人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/195" title="异地恋，你能坚持多久？">异地恋，你能坚持多久？</a>
                            <span class="testers">39863人测试</span>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>

        <div class="category">
            <h2 class="title"><a href="http://www.xinli001.com/ceshi/personality">性格测试</a></h2>
            <div class="lists">
                <div class="parts">
                    <dl>
                        <dt>
                        <p class="pbox"><a href="http://www.xinli001.com/ceshi/99897706">
                            <img class="lazyload" src="images/ceshi_list/43a8c403716fbc70986d4f24173ecae2.jpg!120x80"
                                 width="120" height="80" alt="测你是《楚乔传》里的谁" hover="true"/>
                        </a></p>
                        <p class="cinfo">
                            <a href="http://www.xinli001.com/ceshi/99897706" title="测你是《楚乔传》里的谁">测你是《楚乔传》里的谁</a><br>
                            西魏年间乱世混战，大批平民在战乱中沦为奴隶，命如草芥。你... <span class="testers">1792人测试</span>
                        </p>
                        </dt>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/55" title="解密你性格中的阴暗面">解密你性格中的阴暗面</a>
                            <span class="testers">221833人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/1410" title="测测你潜在的性格">测测你潜在的性格</a>
                            <span class="testers">560876人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/1676" title="潜意识自测：你是怎样自欺欺人的？">潜意识自测：你是怎样自欺欺人的？</a>
                            <span class="testers">136987人测试</span>
                        </dd>
                    </dl>
                </div>
                <div class="parts">
                    <dl>
                        <dt>
                        <p class="pbox"><a href="http://www.xinli001.com/ceshi/1549">
                            <img class="lazyload" src="images/ceshi_list/1d7b0fc3a0bb5b1336e903a7cd936b5a.jpg!120x80"
                                 width="120" height="80" alt="测试你拥有怎样的英雄DNA" hover="true"/>
                        </a></p>
                        <p class="cinfo">
                            <a href="http://www.xinli001.com/ceshi/1549" title="测试你拥有怎样的英雄DNA">测试你拥有怎样的英雄DNA</a><br>
                            你小时候有过英雄梦吗？观看超人电影时会不会肾上腺素飙升？... <span class="testers">69723人测试</span>
                        </p>
                        </dt>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/370" title="儿童节测试：测你是哪种卡通人物">儿童节测试：测你是哪种卡通人物</a>
                            <span class="testers">111671人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/837" title="端午测试：你是哪一类型的粽子？">端午测试：你是哪一类型的粽子？</a>
                            <span class="testers">231436人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/2450" title="测你单身旅行时的失身指数">测你单身旅行时的失身指数</a>
                            <span class="testers">89405人测试</span>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>

        <div class="category">
            <h2 class="title"><a href="http://www.xinli001.com/ceshi/vocational">能力测试</a></h2>
            <div class="lists">
                <div class="parts">
                    <dl>
                        <dt>
                        <p class="pbox"><a href="http://www.xinli001.com/ceshi/515">
                            <img class="lazyload" src="images/ceshi_list/9cc439d7beab354c7ae9b63cf5be37ed.jpg!120x80"
                                 width="120" height="80" alt="21道题测试你的衰老速度" hover="true"/>
                        </a></p>
                        <p class="cinfo">
                            <a href="http://www.xinli001.com/ceshi/515" title="21道题测试你的衰老速度">21道题测试你的衰老速度</a><br>
                            现代生活，大家都注重养生，希望延迟衰老，特别是各位女性，... <span class="testers">48973人测试</span>
                        </p>
                        </dt>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/694" title="一测便知你人缘好还是坏">一测便知你人缘好还是坏</a>
                            <span class="testers">51322人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/521" title="心理测试：捕捉你的人生">心理测试：捕捉你的人生</a>
                            <span class="testers">21954人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/371" title="你的健康余额剩多少？">你的健康余额剩多少？</a>
                            <span class="testers">67734人测试</span>
                        </dd>
                    </dl>
                </div>
                <div class="parts">
                    <dl>
                        <dt>
                        <p class="pbox"><a href="http://www.xinli001.com/ceshi/99897452">
                            <img class="lazyload" src="images/ceshi_list/5362f38484c6801e4b90eb78f32f9eb9.jpg!120x80"
                                 width="120" height="80" alt="测你更有同性缘还是异性缘？" hover="true"/>
                        </a></p>
                        <p class="cinfo">
                            <a href="http://www.xinli001.com/ceshi/99897452" title="测你更有同性缘还是异性缘？">测你更有同性缘还是异性缘？</a><br>
                            在生活中，有些人的人缘很好，但身边大多数都是同性的朋友；... <span class="testers">244976人测试</span>
                        </p>
                        </dt>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/621" title="读书日：测最适合你的读书方法是什么">读书日：测最适合你的读书方法是什么</a>
                            <span class="testers">54001人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/177" title="测测你的气场有多强？">测测你的气场有多强？</a>
                            <span class="testers">231528人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/1581" title="测你春节能收到多大红包？">测你春节能收到多大红包？</a>
                            <span class="testers">191735人测试</span>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>

        <div class="category">
            <h2 class="title"><a href="http://www.xinli001.com/ceshi/member">会员测试</a></h2>
            <div class="lists">
                <div class="parts">
                    <dl>
                        <dt>
                        <p class="pbox"><a href="http://www.xinli001.com/ceshi/362">
                            <img class="lazyload" src="images/ceshi_list/075300tqnqi6688wv3f3dd.jpg!120x80" width="120"
                                 height="80" alt="深度揭秘：看看你有多黑暗！" hover="true"/>
                        </a></p>
                        <p class="cinfo">
                            <a href="http://www.xinli001.com/ceshi/362" title="深度揭秘：看看你有多黑暗！">深度揭秘：看看你有多黑暗！</a><br>
                            测试前提：这是一个梦。灰色而压抑的梦境。当然，你身处梦中... <span class="testers">229263人测试</span>
                        </p>
                        </dt>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/2120" title="测你是哪位超级英雄">测你是哪位超级英雄</a>
                            <span class="testers">150400人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/99897551" title="你的内心到底有多孤独？">你的内心到底有多孤独？</a>
                            <span class="testers">112931人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/99897547" title="谁是最适合你的另一半">谁是最适合你的另一半</a>
                            <span class="testers">124219人测试</span>
                        </dd>
                    </dl>
                </div>
                <div class="parts">
                    <dl>
                        <dt>
                        <p class="pbox"><a href="http://www.xinli001.com/ceshi/99897533">
                            <img class="lazyload" src="images/ceshi_list/112454y8201zcualdga9zt.jpg!120x80" width="120"
                                 height="80" alt="色彩错觉测试丨不要相信你的眼睛" hover="true"/>
                        </a></p>
                        <p class="cinfo">
                            <a href="http://www.xinli001.com/ceshi/99897533" title="色彩错觉测试丨不要相信你的眼睛">色彩错觉测试丨不要相信你的眼睛</a><br>
                            当视觉受到周围环境色彩的影响时，就会产生对色彩的错觉现象... <span class="testers">148722人测试</span>
                        </p>
                        </dt>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/99897532" title="测测你的恋爱智商有多高">测测你的恋爱智商有多高</a>
                            <span class="testers">172066人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/99897524" title="测你在异性眼中的第一印象">测你在异性眼中的第一印象</a>
                            <span class="testers">166817人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/99897523" title="测测你不为人知的的缺点是什么？">测测你不为人知的的缺点是什么？</a>
                            <span class="testers">122607人测试</span>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>

        <div class="category nobor">
            <h2 class="title"><a href="http://www.xinli001.com/ceshi/professional">精选测试</a></h2>
            <div class="lists">
                <div class="parts">
                    <dl>
                        <dt>
                        <p class="pbox"><a href="http://www.xinli001.com/ceshi/495">
                            <img class="lazyload" src="images/ceshi_list/02232890pm9d9ml580x9b9.jpg!120x80" width="120"
                                 height="80" alt="孤独感测试" hover="true"/>
                        </a></p>
                        <p class="cinfo">
                            <a href="http://www.xinli001.com/ceshi/495" title="孤独感测试">孤独感测试</a><br>
                            孤独量表评价由于对社会交往的渴望与实际水平的差距而产生的... <span class="testers">177226人测试</span>
                        </p>
                        </dt>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/499" title="标准情商（EQ）测试">标准情商（EQ）测试</a>
                            <span class="testers">1004166人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/2057" title="爱情依恋模式测评">爱情依恋模式测评</a>
                            <span class="testers">143603人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/395" title="心理年龄测试">心理年龄测试</a>
                            <span class="testers">426675人测试</span>
                        </dd>
                    </dl>
                </div>
                <div class="parts">
                    <dl>
                        <dt>
                        <p class="pbox"><a href="http://www.xinli001.com/ceshi/39">
                            <img class="lazyload" src="images/ceshi_list/20111031090940-44.jpg!120x80" width="120"
                                 height="80" alt="菲尔人格测试" hover="true"/>
                        </a></p>
                        <p class="cinfo">
                            <a href="http://www.xinli001.com/ceshi/39" title="菲尔人格测试">菲尔人格测试</a><br>
                            这是一个目前很多大公司人事部门实际采用的测试。

                            <span class="testers">243811人测试</span>
                        </p>
                        </dt>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/99897477"
                               title="如何交朋友？先测下自己的交友能力吧">如何交朋友？先测下自己的交友能力吧</a>
                            <span class="testers">163044人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/470" title="拖延症测试：你拖延到什么程度了？">拖延症测试：你拖延到什么程度了？</a>
                            <span class="testers">126343人测试</span>
                        </dd>
                        <dd>
                            <span class="fcn">·</span>
                            <a href="http://www.xinli001.com/ceshi/513" title="自信心测试：你有多自信？">自信心测试：你有多自信？</a>
                            <span class="testers">71823人测试</span>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
    <!--left-->
    <div class="fish-left main-right">
        <div class="multi_ads fixed">
            <div class="mt"><strong>编辑推荐<span class="mq">：</span><span class="ms">······ </span></strong></div>
            <dl>
                <dd>
                    <a href="http://www.xinli001.com/ceshi/99897646?from=ceshigg" title="内耗指数评估（测评）" target="_blank">
                        <img src="images/ceshi_list/c5245e7fb9f421c59bedce5b2938008a.png" width="135" height="135"
                             hover="true" title="内耗指数评估（测评）" alt="内耗指数评估（测评）">
                    </a>
                </dd>

                <dd>
                    <a href="http://www.xinli001.com/ceshi/99897526?from=ceshigg" title="心理需求测评" target="_blank">
                        <img src="images/ceshi_list/030954q4tnzb0jb0nyq06s.jpg" width="135" height="135" hover="true"
                             title="心理需求测评" alt="心理需求测评">
                    </a>
                </dd>

                <dt>
                    <a href="http://www.xinli001.com/ceshi/99897500?from=ceshigg" title="专业爱情测评" target="_blank">
                        <img src="images/ceshi_list/a4ef61d2c2b0582f329005589a0279b1.png" width="280" height="135"
                             hover="true" title="专业爱情测评" alt="专业爱情测评">
                    </a>
                </dt>
                <br class="clear">
            </dl>
        </div>
        <div class="test_rmd_list fixed">
            <div class="st rbor"><span class="fb">热门测试 ：</span>
                <span class="more">
			<!-- <a href="javascript:void(0)" data-page="2" data-url="http://www.xinli001.com/ceshi/hot-ceshis"
               onclick="changeHotCeshi(this)">换一换</a> -->
		</span>
            </div>
            <dl id="id_hot_ceshi_list">
                <dd>
                    <p class="pbox fl">
                        <a href="http://www.xinli001.com/ceshi/422">
                            <img src="images/ceshi_list/022811jqm9odk4b73huws9.jpg!90x60" width="90" height="60"
                                 hover="true" alt="精选测试：MBTI职业性格测试"/>
                        </a>
                    </p>
                    <p class="tinfo fl">
                        <a href="http://www.xinli001.com/ceshi/422">精选测试：MBTI职业性格测试</a>
                        <span class="total"><span class="icons" title="测试人数"></span>1747119人测试过</span>
                    </p>
                </dd>
                <dd class="rlists">
                    <p class="items">
                        <span class="fcn">·</span><a href="http://www.xinli001.com/ceshi/1822">测你性格最真实的一面</a>
                        <span class="total"><span class="icons" title="测试人数"></span>1666772人</span>
                    </p>
                    <p class="items">
                        <span class="fcn">·</span><a href="http://www.xinli001.com/ceshi/385">测测你的同性恋潜质</a>
                        <span class="total"><span class="icons" title="测试人数"></span>1512940人</span>
                    </p>
                    <p class="items">
                        <span class="fcn">·</span><a href="http://www.xinli001.com/ceshi/99897392">测你恋爱时有多投入？</a>
                        <span class="total"><span class="icons" title="测试人数"></span>1502619人</span>
                    </p>
                    <p class="items">
                        <span class="fcn">·</span><a href="http://www.xinli001.com/ceshi/99897391">测你最容易有哪种负面情绪？</a>
                        <span class="total"><span class="icons" title="测试人数"></span>1396397人</span>
                    </p>
                    <p class="items">
                        <span class="fcn">·</span><a
                            href="http://www.xinli001.com/ceshi/99897397">超准职业测试：测你最适合干什么样的工作？</a>
                        <span class="total"><span class="icons" title="测试人数"></span>1318283人</span>
                    </p>
                    <p class="items">
                        <span class="fcn">·</span><a href="http://www.xinli001.com/ceshi/99897393">弗洛伊德性格测试</a>
                        <span class="total"><span class="icons" title="测试人数"></span>1312437人</span>
                    </p>
                </dd>
            </dl>
        </div>
       
    </div>
    <!--right-->
</div>

<div class="footer">
    <div class="wrap">
        <div class="flinks">
            <a href="about">关于我们</a>
            <a href="join">加入我们</a>
            <a href="contact">联系我们</a>
            <a href="copyright">免责声明</a>
            <a href="friendlink">友情链接</a>
            <a href="sitemap.html">网站地图</a>
            <a href="">手机版</a>
            <a href="http://app.xinli001.com/mobile/">手机应用</a>
        </div>
        <div class="footer">
            <div class="links">
                <dl>
                    <dt>友情链接：</dt>
                    <dt><a target="_blank" href="http://xingzuo.piaoliang.com/">星座运势</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c218">深圳心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c168">郑州心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c151">青岛心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c84">南京心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c82">上海心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c43">沈阳心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c2">北京心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c259">成都心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c186">武汉心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.xinli001.com/zx/c98">杭州心理咨询</a></dt>
                    <dt><a target="_blank" href="http://www.woniu8.com/">心理测试</a></dt>
                </dl>
            </div>
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

<div style="display: none">
    <div id="login_popup" class="lpcont">
        <h2>登录壹心理</h2>
        <p class="words">开始心理测试，收听FM，用心理学改变自己！</p>
        <div class="lpbox">
            <div class="lpart">
                <form id="lp_form" action="login-jsonp/" method="post">
                    <p class="eml">
                        <label for="email">邮箱</label>
                        <input type="text" id="lp_username" name="username" class="area">
                    </p>
                    <p class="psw">
                        <label for="password">密码</label>
                        <input type="password" id="lp_password" name="password" class="area">
                    </p>
                    <input id="lp_submit" type="submit" class="log_btn" value="登 录">
                    <br>
                    <a href="forgetpwd/" class="forget" target="_blank">忘记密码</a>
                    <a href="register/" class="signup" target="_blank">没有账号，去注册＞</a>
                </form>
            </div>
            <div class="rpart">
                <span>使用其它账号登录</span>
                <a href="qwb/login/" class="qq" target="_blank">使用腾讯账号登录</a>
                <a href="xwb/login/" class="wb" target="_blank">使用微博账号登录</a>
                <a href="renren/login/" class="rr" target="_blank">使用人人账号登录</a>
            </div>
            <br style="clear:both">
        </div>
    </div>
</div>

<div id="background"></div>
<style>
    .footer .links {
        text-align: center;
        padding: 15px 30px;
        line-height: 22px;
    }

    .footer .links dt {
        color: #999999;
        display: inline;
        margin: 0 10px;
        font-weight: normal;
        font-size: 12px;
    }

    .footer a {
        color: #999;
    }
</style>

<script>
    var userinfoUrl = 'http://www.xinli001.com/userinfo/';
</script>

<script src="${contextPath}/js/ceshi_list/index.min.js"></script>

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