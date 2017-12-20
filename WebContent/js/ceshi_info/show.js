function favorite(el){
	$(el).attr('disabled', true);
	$.get(el.href, {t:$.now()}, function(resp){
		$(el).attr('disabled', false);
		switch(resp.code){
			case 0:
				alert("收藏成功");
				break;
			case -1:
				alert('你已经收藏过了哦');
				break;
			default:
				showLoginPopup();
				window.loginSuccess = function() {
					favorite(el);
				};
				break;
		}
	});
	return false;
}
function doReply(el) {
	var $this = $(el), $parent = $this.parent();
	var nickname = $parent.find('a.ua').text();
	var content = $parent.find('span.hcontent').text();
	var comment = $('#id_comment_content');
	var t = comment.val() + '[quote]引用@' + nickname + ' : ' + content + '[/quote]';
	comment.val('');
	comment.focus();
	comment.val(t);
	return false;
}
function initCommentForm(){
	$('#id_comment_form').submit(checkCommentForm);
	$('#id_form_loading').hide();
	$('#id_comment_form').show();
}
function checkCommentForm(){
	var check1=$('#id_comment_content').checkinput();
	if(check1) {
		$('#id_comment_submit').disable();
	}
	return check1;
}
function addCommentByAjax(){
	var check1=$('#id_comment_content').checkinput();
	if(check1) {
		$('#id_comment_submit').disable();
		var url = $('#id_comment_form').attr('action');
		var data = $('#id_comment_form').serialize();
		$.post(url, data, function(resp) {
			$('#id_comment_submit').enable();
			if(resp.code == -1) {
				showLoginPanel();
				window.loginSuccess = function() {
					$.fishbox.close();
					addCommentByAjax();
				};
			}
			if(resp.code == 0) {
				$('#id_no_comments').remove();
				$('#comments_list').prepend(resp.data);
				$('#id_comment_content').val('');
			}
		});
	}
	return false;
}
function bindCopydeny() {
	$('body').bind('copy', function() {
		if(_isstaff) return true;
		$('<a href="#copydeny"></a>').fancybox().click();
		return false;
	});
}
function doCommentReply() {
	var pk = $(this).data('pk');
	var id = '#id_comment_'+pk;
	var content = $(id).find('div.cshow').html();
	content = '<div class="quote"><span class="lq"></span>'+content+'</div><br>';
	editors[0].html(content);
	return false;
}
function rmCommentReply() {
	$('#quoteBox .quote_txt').html('');
	$('#quoteBox a.close').hide();
	$('#id_comment_quote').val('');
	$('#id_comment_quote_user').val('');
	return false;
}
function addCommentReply() {
	rmCommentReply();
	var pk = $(this).data('pk');
	var user = $(this).data('user');
	var id = '#id_comment_'+pk;
	var content = $(id).find('div.cshow').html();
	content = '<div class="quote"><span class="lq"></span>'+content+'</div>';
	$('#quoteBox .quote_txt').html(content);
	$('#id_comment_quote').val(content);
	$('#id_comment_quote_user').val(user);
	$('#quoteBox a.close').show();
	return false;
}
function postCommentByAjax(){
	var check1=$('#id_comment_content').checkinput();
	if(!check1) {
		return false;
	}

	$('#id_comment_submit').val('提交中...');
	$('#id_comment_submit').disable();
	var url = $('#id_comment_form').attr('action');
	var data = $('#id_comment_form').serialize();
	
	$.post(url, data, function(resp) {
		$('#id_comment_submit').val('发表留言');
		$('#id_comment_submit').enable();
		switch(resp.code) {
			case -7:
				showEmailActivePanel(resp.content);
				break;
			case -1:
				showLoginPopup();
				window.loginSuccess = function() {
					postCommentByAjax();
				};
				break;
			case -99:
				alert('不要发表重复的评论哦');
				break;
			case -98:
				alert('由于系统的防护机制，你已经不小心触雷了');
				break;
			case 0:
				$('#id_no_comments').remove();
				$('#comments_list').prepend(resp.data);
				$('#id_comment_content').val('');
				$('#comments_list .reply').click(addCommentReply);
				rmCommentReply();
				$('#id_comment_content').val('');
				break;
		}
	});

	return false;
}
function deleteComment(el, id){
	var url=el.href+'?t='+$.now();
	$.get(url, function(data){
		if(data.code == 0 || data.code == -1){
			$('#id_comment_'+id).remove();
		}
	});
	return false;
}
function getMoreQuestions(){
	page++;
	getQuestions();
}
function addMoreQuestionBar(){
	var items=$('#id_q_list div.items');
	if(items.length>=page*per_page){
		$('#id_q_list').append('<div id="id_get_more">获取更多提问...</div>');
		$('#id_get_more').click(getMoreQuestions);
	}
}
function getQuestions(){
	$('#id_get_more').remove();
	$('#id_q_list').append('<div id="id_q_loading" class="loading"><span>加载列表中...</span></div>');
	var url=listUrl+'?type='+type+'&page='+page+'&per_page='+per_page;
	$.get(url, function(data){
		$('#id_q_loading').remove();
		if($.trim(data)){
			$('#id_q_list').append(data);
			addMoreQuestionBar();
		}
	});
}
function loadTopicReplys(page){
	var list=$('#id_topic_reply_list');
	list.html('<p class="loading"><span>正在载入回应...</span></p>');
	var url=listUrl+"?page="+page+"&per_page="+per_page+'&t='+(new Date()).getTime();
	$.get(url, function(data){
		list.html(data);
		imgHover();
		list.find('div.items:odd').addClass('ablue');
	});
}
function checkTalkReplyForm(){
	var check1=$('#id_comment_content').checkinput();
	if(check1){
		$('#id_reply_submit').attr('disabled', 'disabled');
	}
	return check1;
}
function checkTodayTopicReplyForm(){
	var check1 = $('#id_reply_content').checkinput();
	if(check1) {
		var url=$(this).attr('action');
		var data=$(this).serialize();
		$('#id_reply_submit').attr('disabled', 'disabled');
		$.post(url, data, function(data){
			$('#id_reply_submit').attr('disabled', false);
			$('#id_reply_content').val('');
			alert('回应成功');
			incrhtml('#id_replynum');
			$('#id_lastreply_div').html(data);
		});
	}
	return false;
}
function setTalkSelected(){
	$('#id_talknav a.topics').removeClass('act');
	$('#id_talknav a.topics[type='+type+']').addClass('act');
}
function delquestion(el, id){
	var url=el.href+'?t='+$.now();
	$.ajax({
		url:url,
		dataType: 'jsonp',
		success:function(data){
			if(data.status){
				location.href='/qa/';
			}
		}
	});
	return false;
}
function delanswer(el, id){
	var url=el.href+'?t='+$.now();
	$.ajax({
		url:url,
		dataType: 'jsonp',
		success:function(data){
			if(data.status){
				$('#id_answer_'+id).slideUp('fast', function(){
					$(this).remove();
				});
				decrhtml('#id_answernum_'+data.qpk);
			}
		}
	});
	return false;
}
function pleased(el) {
	var url=el.href+'?t='+(new Date()).getTime();
	$.get(url, function(data){
		if(data.status){
			$('#id_answer_list').find('a.set-pleased').hide();
			$(el).find('span').attr('class', 'pleased');
			$(el).show();
		}
	});
	return false;
}
function showNoRecommendTopic(el){
	if(hasPerm){
		if(el){
			var dels=$(el).find('p.norecommend');
			dels.show();
			return;
		}
		var dels=$('#id_topic_list p.norecommend');
		dels.show();
	}
}
function norecommendTopic(el, id){
	var url=$(el).attr('href')+'?t='+(new Date()).getTime();
	$.get(url, function(data){
		$('#id_topic_'+id).slideUp('fast', function(){
			$('#id_topic_'+id).remove();
		});
	});
	return false;
}
function showRecommendTopic(el){
	if(hasPerm){
		if(el){
			var dels=$(el).find('p.recommend');
			dels.show();
			return;
		}
		var dels=$('#id_topic_list p.recommend');
		dels.show();
	}
}
function recommendTopic(el, id){
	var url=$(el).attr('href')+'?t='+(new Date()).getTime();
	$.get(url, function(data){
		if(data.status){
			alert('推荐成功');
		}else{
			alert('已经推荐过了哦');
		}
	});
	return false;
}
function getRandomTopics(el){
	var url=$(el).attr('href')+'?per_page=5&t='+(new Date()).getTime();
	$.get(url, function(data){
		$('#id_random_topics').html(data);
	});
	return false;
}
function deltopic(el, id){
	var url=el.href+'?t='+(new Date()).getTime();
	$.get(url, function(data){
		if(data.status){
			location.href='/talk/';
		}
	});
	return false;
}
function deltopicreply(el, id){
	var url=el.href+'?t='+(new Date()).getTime();
	$.get(url, function(data){
		if(data.status){
			$('#id_reply_'+id).slideUp('fast', function(){
				$(this).remove();
				$('#id_topic_reply_list div.items').removeClass('ablue');
				$('#id_topic_reply_list div.items:odd').addClass('ablue');
			});
			decrhtml('#id_replynum');
			decrhtml('#id_replynum_'+data.qpk);
		}
	});
	return false;
}
function getTopics(){
	setTalkSelected();
	$('#id_get_more').remove();
	$('#id_topic_list').append('<div id="id_topic_loading" class="loading"><span>加载列表中...</span></div>');
	var url=listUrl+'?type='+type+'&page='+page+'&per_page='+per_page;
	$.get(url, function(data){
		$('#id_topic_loading').remove();
		if($.trim(data)){
			$('#id_topic_list').append(data);
			addMoreTopicBar();
		}
		if(type=='lastest'){
			showRecommendTopic();
		}
		if(type=='hot'){
			showNoRecommendTopic();
		}
		setShowEditTopic();
	});
}
function getMoreTopics(){
	page++;
	getTopics();
}
function addMoreTopicBar(){
	var items=$('#id_topic_list div.items');
	if(items.length>=page*per_page){
		$('#id_topic_list').append('<div id="id_get_more">获取更多话题...</div>');
		$('#id_get_more').click(getMoreTopics);
	}
}
function checkTopicForm(){
	var check1=$('#id_title').checkinput();
	var check2=$('#id_content').checkinput();
	var check3=$('#id_cover').checkinput();
	// var check4=$('#id_secanswer').checkinput();
	var check=check1&&check2&&check3;
	if(check) {
		$('#id_topic_submit').disable();
		$('#id_topic_submit').val('提交中');
	}
	return check;
	if(check){
		var form = $(this);
		var action = form.attr('action');
		var data = form.serialize();
		$('#id_topic_submit').disable();
		$('#id_topic_submit').val('提交中');
		var ajaxLoader = $.post(action, data, function(resp) {
			$('#id_topic_submit').enable();
			$('#id_topic_submit').val('提交');
			switch(resp.code) {
				case -7:
					showEmailActivePanel(resp.content);
					break;
				case -1:
					alert('验证问答不正确');
					getValidImg();
					break;
				case -2:
					alert('你已经被系统禁言了，如有疑问，请与管理员联系');
					break;
				case -3:
					alert('你发布的内容包含敏感词，已经被系统禁言，如有疑问，请与管理员联系');
					break;
				case -4:
					alert('表单填写不完整');
					break;
				default:
					alert('发表成功');
					location.href = resp.url;
					break;
			}
		});
	}
	return false;
}
var hasPerm=false;
function logindone(){
	$('#id_user_info_div').html(loginuser.userinfo);
	hasPerm=isLogined&&(loginuser.is_superuser||loginuser.is_manager);
}
function checkTopicAjax(){
	var check1=$('#id_title').checkinput();
	var check2=$('#id_content').checkinput();
	var check3=$('#id_cover').checkinput();
	if(check1&&check2&check3){
		$.florabox.showActivity();
		$('#id_topic_submit').attr('disabled', 'disabled');
		return true;
	}
	else{
		return false;
	}
}
function postDoneTopic(){
	$.florabox.hideActivity();
	$('#id_topic_submit').attr('disabled', false);
	alert('话题提交成功');
}
function setShowEditTopic(){
	if(!hasPerm){
		return false;
	}
	var items=$('div.items a.topic-edit');
	items.florabox({
		'width': 940,
		'draggable': true,
		'onComplete':function(){
			$('#id_topic_form').submit(checkTopicAjax);
		},
		'onStart':function(a, i, o){
			if(!hasPerm){
				o.href=$('#id_user_popuplogin').attr('href');
			}
		}
	});
	items.show();
}
// 投稿表单验证
function checkDraftForm(){
	var check1=$('#id_title').checkinput();
	//var check2=$('#id_content').checkinput();
	var check4=$('#id_author').checkinput();
	var check5=$('#id_chuchu').checkinput();
	var result = check1&&check4&&check5;
	if(!ue.hasContents()) {
		alert('请输入内容');
		result = false;
	}
	if(result){
		$('#id_submit').attr('disabled', true);
	}
	return result;
}
function uploadFileOnSelectFile(name) {
	$('input:submit').attr('disabled', true);
	if(name == 'cover') {
		$('#id_cover').removeerror();
		$('#id_uploading_bar').show();
		$('#id_uploading_pos').width(0);
	}
}
function uploadFileOnTooBig(name, size) {
	$('#id_cover').showerror('图片大小不能超过1M，请压缩后再上传');
}
function uploadFileOnProgress(name, loaded, total) {
	// var percent = parseInt(loaded / total);
	if(name == 'cover') {
		$('#id_uploading_pos').width(loaded / total * 400);
	}
}
function uploadFileOnUploadCompleteData(name, url) {
	var urltarget, msgtarget;
	if(name == 'cover') {
		urltarget = $('#id_cover');
	}
	urltarget.val(url);
	$('#id_uploading_bar').hide();
	$('input:submit').attr('disabled', false);
}
function uploadFileOnReady(name) {
	var button;
	if(name == 'cover') {
		button = $('#id_upload_button');
	}
	button.show();
}
function getItemsByPage(page) {
	var data = {t:$.now(), page:page};
	$.get(pageUrl, data, function(resp) {
		$('#id_comment_page').html(resp);
	});
	return false;
}
function onCeshiFormSubmit() {
	var $form = $('#id_form');
	var action = $form.attr('action');
	$('#id_pre_link').disable();
	$('#id_show_result').val('提交中');
	var data = $form.serialize();
	var ajaxLoader = $.post(action, data, function(resp) {
		switch(resp.code) {
			case -1:
				showLoginPopup();
				window.loginSuccess = function() {
					onCeshiFormSubmit.call($form);
				};
				break;
			case -2:
				alert(resp.msg);
				break;
			case 0:
				window.location = resp.next;
				break;
		}
	});
	return false;
}
function voteup(el){
	$(el).attr('disabled', true);
	$.get(el.href, {t:$.now()}, function(resp){
		$(el).attr('disabled', false);
		switch(resp.status){
			case 0:
				alert("投票成功");
				incrhtml('#id_up_span');
				break;
			case -1:
				alert('你已经投票了哦');
				break;
			case -2:
				alert('该测试不存在');
				break;
			case -3:
				showLoginPopup();
				window.loginSuccess = function() {
					voteup(el);
				};
				break;
		}
	});
	return false;
}
function votedown(el){
	$(el).attr('disabled', true);
	$.get(el.href, {t:$.now()}, function(resp){
		$(el).attr('disabled', false);
		switch(resp.status){
			case 0:
				alert("投票成功");
				incrhtml('#id_down_span');
				break;
			case -1:
				alert('你已经投票了哦');
				break;
			case -2:
				alert('该测试不存在');
				break;
			case -3:
				showLoginPopup();
				window.loginSuccess = function() {
					votedown(el);
				};
				break;
		}
	});
	return false;
}
function checkAskForm(){
	var check1=$('#id_title').checkinput();
	var check2=$('#id_content').checkinput();
	var checkeds=$('input:checked');
	var check3 = true;
	if(checkeds.length==0) {
		$('#id_category').showerror('请选择问答类别');
		check3=false;
	}
	var check4=$('#id_secanswer').checkinput();
	var check = check1&&check2&&check3;
	if(check) {
		var form = $('#id_ask_form');
		var action = form.attr('action');
		var data = form.serialize();
		$('#id_ask_submit').disable();
		$('#id_ask_submit').val('提交中');
		// $.fishbox.showActivity('提交中，请稍后...');
		var ajaxLoader = $.post(action, data, function(resp) {
			// $.fishbox.hideActivity();
			$('#id_ask_submit').enable();
			$('#id_ask_submit').val('提交');
			switch(resp.code) {
				case -7:
					showEmailActivePanel(resp.content);
					break;
				case -1:
					alert('验证问答不正确');
					getValidQuestion();
					break;
				case -2:
					alert('你已经被系统禁言了，如有疑问，请与管理员联系');
					break;
				case -3:
					alert('你发布的内容包含敏感词，已经被系统禁言，如有疑问，请与管理员联系');
					break;
				case -4:
					alert('表单填写不完整');
					break;
				case -99:
					alert('已经提问成功了，请不要重复提问哦');
					break;
				default:
					alert('发表成功');
					location.href = resp.url;
					break;
			}
		});
	}
	return false;
}
function checkQaAnswerForm(){
	var check1=$('#id_content').checkinput();
	if (!check1) {
		return false;
	}
	$('#id_answer_submit').attr('disabled', true);
	$('#id_answer_submit').val('提交中');
	var data = $('#id_answer_form').serialize();
	var url = $('#id_answer_form').attr('action');
	$.post(url, data, function(resp) {
		$('#id_answer_submit').attr('disabled', false);
		$('#id_answer_submit').val('提交');
		switch(resp.code) {
			case -7:
				showEmailActivePanel(resp.content);
				break;
			case -1:
				showLoginPopup();
				window.loginSuccess = function() {
					checkQaAnswerForm();
				};
				break;
			case -5:
				alert('操作太频繁了，休息一下');
				break;
			case -98:
				alert('你已经被禁言了');
				break;
			case -99:
				alert('已经发表成功了，请不要重复提交');
				break;
			case -4:
				alert('提交的内容含有敏感词，已被屏蔽');
				break;
			case -1:
				alert('请输入回答内容');
				break;
			case 0:
				$('#id_content').val('');
				$('#id_no_comments').remove();
				$('#id_answer_list').prepend(resp.data);
				break;
		}
	});
	return false;
}
function loadQaAnswers(page){
	var list=$('#id_answer_list');
	list.html('<p class="loading"><span>正在载入回答...</span></p>');
	var url=listUrl+"?page="+page+"&per_page="+per_page+'&t='+(new Date()).getTime();
	$.get(url, function(data){
		list.html(data);
		// encodeatnickname(list);
		imgHover();
		list.find('div.items:odd').addClass('ablue');
	});
}