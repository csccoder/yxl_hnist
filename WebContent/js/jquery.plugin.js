;(function($) {
	$.fn.watermark=function(){
		var val=$.trim($(this).val());
		if(val==''){
			$(this).val($(this).attr('tip'));
			$(this).addClass('fgrey');
		}
		$(this).focus(function(){
			var tip=$(this).attr('tip');
			var val=$.trim($(this).val());
			if(val==tip){
				$(this).val('');
			}
			$(this).removeClass('fgrey');
		}).blur(function(){
			var tip=$(this).attr('tip');
			var val=$.trim($(this).val());
			if(val==''){
				$(this).val(tip);
				$(this).addClass('fgrey');
			}
		});
		return this;
	}
	$.fn.checkinput=function(el){
		var emailReg = /[\w-]+@[\w\.]+/;
		var nullmsg=$(this).attr('nullmsg');
		var errormsg=$(this).attr('errormsg');
		var datatype=$(this).attr('datatype');
		var val=$.trim($(this).val());
		var tip=$(this).attr('tip');
		var h,t,min=max=0;
		var result=false;
		if(!el) el=$(this);
		var setmsg=function(msg) {
			var id=el.attr('id'),$msg=$('#'+id+'_msg');
			if($msg.length > 0){
				$msg.html(msg);
			}else{
				el.addClass('ein');
				el.attr('title', msg);
			}
		}
		var removemsg=function() {
			var id=el.attr('id'),$msg=$('#'+id+'_msg');
			if($msg.length > 0){
				$msg.html('');
			}else{
				el.removeClass('ein');
				el.attr('title', '');
			}
		}
		if(nullmsg){
			if(val==''||val==tip){
				setmsg(nullmsg);
				return false;
			}else{
				removemsg();
			}
		}
		var validlength=function(){
			if(max>min){
				if(val.length>=min&&val.length<=max){
					removemsg();
				}else{
					setmsg(errormsg);
					return false;
				}
			}
			return true;
		}
		var validemail=function(){
			if(emailReg.test(val)){
				removemsg();
			}else{
				setmsg(errormsg);
				return false;
			}
			return true;
		}
		var validrecheck=function(){
			var recheck=el.attr('recheck');
			var val1=$.trim($(recheck).val());
			if(val!=val1){
				setmsg(errormsg);
				return false;
			}else{
				removemsg();
			}
			return true;
		}
		var validregex=function(){
			var regex=eval(el.attr('regex'));
			if(regex.test(val)){
				removemsg();
			}else{
				setmsg(errormsg);
				return false;
			}
			return true;
		}
		var validimage=function(){
			var index=val.lastIndexOf('.');
			var ext=val.slice(index+1).toLowerCase();
			if(!ext||'jpg,png,jpeg,gif'.indexOf(ext)<0){
				setmsg(errormsg);
				return false;
			}else{
				removemsg();
			}
			return true;
		}
		if(val&&errormsg){
			if(datatype=='email'){
				return validemail();
			}
			if(datatype=='recheck'){
				return validrecheck();
			}
			if(datatype=='regex'){
				return validregex();
			}
			if(datatype=='image'){
				return validimage();
			}
			h=datatype.charAt(0);
			t=datatype.substring(1);
			if(t.length>0){
				var a=t.split('-');
				min=parseInt(a[0]),max=parseInt(a[1]);
			}
			switch(h){
				case 's':
					result=validlength();
					break;
			}
			return result;
		}
		return true;
	}
	$.fn.showerror=function(msg){
		var el=$(this),id=el.attr('id'),$msg=$('#'+id+'_msg');
		if($msg.length > 0){
			$msg.html(msg);
		}else{
			el.addClass('ein');
			el.attr('title', msg);
		}
	}
	$.fn.removeerror=function() {
		var el=$(this),id=el.attr('id'),$msg=$('#'+id+'_msg');
		if($msg.length > 0){
			$msg.html('');
		}else{
			el.removeClass('ein');
			el.attr('title', '');
		}
	}
	$.fn.disable=function(){
		$(this).attr('disabled', true);
	}
	$.fn.enable=function(){
		$(this).attr('disabled', false);
	}
})(jQuery);