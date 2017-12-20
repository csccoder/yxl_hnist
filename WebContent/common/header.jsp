<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath=request.getContextPath();
	request.setAttribute("contextPath", contextPath);
%>
<link href="${contextPath }/css/header.css" rel="stylesheet" type="text/css" />
<div class="new-header">
	<div class="wrapper">
		<div class="logo">
			<a href="${contextPath}/index.do"><img src="${contextPath }/images/logo.png"/></a>
		</div>
		<div class="nav">
			<ul>
				<li><a href="${contextPath }/index.do" class="tit">首页</a></li>
				<li><a href="${contextPath }/articleServlet" class="tit">文章</a></li>
				<li><a href="${contextPath }/questionServlet" class="tit">问答</a></li>
				<!-- <li><a href="http://www.xinli001.com/zx/" class="tit">咨询</a></li> -->
				<li ><a href="${contextPath }/suiteServlet" class="tit isNew">测试<span class="newBrand"></span></a></li>
				<!--<li class="selected"><a href="ceshi_list.jsp" class="tit isNew">测试<span class="newBrand"></span></a></li>-->
				<!-- <li><a href="http://fm.xinli001.com/" class="tit">心理FM</a></li>
				<li><a href="http://xy.xinli001.com/" class="tit">课程</a></li> -->
				<!-- <li class="droplist">
					<a href="#" class="tit tit-more">更多</a>
					<dl>
						<dd><a href="http://www.xinli001.com/oxygen/">心灵氧吧</a></dd>
						<dd><a href="http://www.xinli001.com/site/">心理圈</a></dd>
						<dd><a href="http://group.xinli001.com/">小组</a></dd>
						<dd><a href="http://app.xinli001.com/">心理应用</a></dd>
						<dd><a href="http://www.xinli001.com/daka/">打卡学习</a></dd>
						<dd><a href="http://www.xinli001.com/dream/">每日一梦</a></dd>
					</dl>
				</li> -->
			</ul>
		</div>
		<div id="header-auth-user-div">
			<c:choose>
				<c:when test="${user eq null}">
					<div class="reg">
						<ul>
							<li><a href="${contextPath }/login.jsp" target="_self">登录</a></li>
							<li><span class="line"></span></li>
							<li><a href="${contextPath }/register.jsp" target="_self">注册</a></li>
						</ul>
					</div>
				</c:when>
				<c:otherwise>
					<div class="info">
						<ul>
							<li class="">
								<a class="tit" target="_blank" href="${contextPath}/userServlet?action=info&id=${user.id}">
									<img class="userimage" src="${contextPath}/images/user_info/user_img/${user.img}" width="30" height="30">
								</a>
								<div class="sub userinfo">
									<span class="arrow"></span>
									<dl>
										<dd><a href="${contextPath}/userServlet?action=info&id=${user.id}">个人中心</a></dd>
										<dd><a href="${contextPath}/userServlet?action=info&id=${user.id}">我的文章</a></dd>
										<dd><a href="${contextPath}/userServlet?action=info&id=${user.id}">我的提问</a></dd>
										<dd><a href="${contextPath}/userServlet?action=info&id=${user.id}">我的测试</a></dd>

										<dd class="last"><a href="${contextPath}/userServlet?action=logout" target="_self">退出</a></dd>
									</dl>
								</div>
							</li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- <div class="sear">
			<form target="_blank" action="http://so.xinli001.com/cse/search" method="get">
				
				<input type="hidden" name="s" value="11434743956290276987">
				
				<input type="hidden" name="s" value="14517920152699641259">
				<input type="hidden" name="nsid" value="0">
				<input type="text" class="text" name="q" placeholder="搜索" />
				<input type="submit" class="submit" value=""/>
			</form>
		</div> -->
	</div>
</div>