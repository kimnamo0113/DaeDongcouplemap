
var mySlider3;
$(function(){
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	 
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};


	
	
	
	mySlider3=$('.bxslider3').bxSlider({
		  auto: false,
		  autoControls: false,
		  stopAutoOnClick: false,
		  pager: true,
		  pagerType : 'short',
		  slideWidth: 700,
		  touchEnabled:false
	});
	
	
	
	
    /* 댓글달기 */
	$(document).on("click",".reply-addBtn",function(){
		var rContent = $(this).prev();
		var bNo = $(this).prev().attr("data-bNo");
		var gNo = $(this).attr("data-gNo");
		var json = {
				rContent:rContent.val(),
				rBNo:{bNo:bNo},
				rGNo:{gNo:gNo}
			};
		var data = JSON.stringify(json)
		rContent.val("");
		$.ajax({
			url:"/daedong/board/insertReply",
			type:"post",
			data:data,
			dataType:"json",
			headers:{
				"Content-Type":"application/json"
			},
			jsonp: false,
			success:function(res){
				var ulObj=$(rContent).parent().prev().find("ul.pagination");
				var page=1;
				getReplyListAll(bNo,page,ulObj);
			}
			
		})
	})
	/* 댓글달기에서 enter key */	
	$(document).on("keydown",".reply-textArea",function(key){
		if (key.keyCode == 13) {
     		$(this).next().click();
     	}
	})
		
	$(document).on("click",".addReply",function(){
		
		var ulObj=$(this).parent().parent().parent().find(".pagination");
		
		var bNo=$(this).attr("data-bNo");
		var page=1;
		$(this).hide();
		getReplyListAll(bNo,page,ulObj);
		
	})
	
	function getReplyListAll(bNo,page,ulObj){
		var addDivreplysList=$(ulObj).parent().find(".replysList");
		$(addDivreplysList).empty();
		$.ajax({
			url:"/daedong/board/selectReply",
			type:"post",
			data:{bNo:bNo,page:page},
			dataType:"json",
			success:function(res){
				
				
				
				
				console.log(res)
				$(res.replys).each(function(i,obj){
					var $labelId = $("<label>").addClass("id").append(obj.rGNo.gId+" : ");
					
					var $spanText = $("<span>").addClass("text").append(obj.rContent);
					var time = new Date(obj.rWritetime);
					/*(time.getFullYear()+"").slice(-2)*/
					var $spanTime = $("<span>").append(" "+time.format("yy-MM-dd HH:mm")).addClass("date");
					/* yy-MM-dd hh:mm */
					$spanText.append($spanTime);
					
					var $divReply = $("<div>").addClass("reply").append($labelId).append($spanText);
					$(addDivreplysList).append($divReply);
				})
				printPaging(res,ulObj);
			}
		})
	}
	
	function printPaging(res,ulObj){
		$(ulObj).empty();
		for(var i=res.pageMaker.startPage; i<=res.pageMaker.endPage; i++){
			var $li = $("<li>").addClass("page-item");
			var $a = $("<a>").text(i).addClass("page-link");
			
			if(res.pageMaker.cri.page == i){
				$li.addClass("active");
			}
			
			$li.append($a);
			$(ulObj).append($li);
		}
	}
	
	
	

	$(document).on("click", ".pagination a", function(e){
		e.preventDefault();
		var page = $(this).text();
		var ulObj=$(this).parent().parent();
		var bNo=$(ulObj).attr("data-bNo");
		
		getReplyListAll(bNo,page,ulObj);
	})
	
	
	
	$("figcaption").click(function(){
			var bNo=$(this).attr("data-bNo");
			$(".pagination").attr("data-bNo",bNo);
			$(".reply-textArea").attr("data-bNo",bNo);
			
			  $(".bxslider3").empty();
			  $("#dBPlace").empty();
			$.ajax({
				url:"/daedong/board/boardDetail",
				type:"post",
				data: {bNo:bNo},
				dataType:"json",
				success:function(res){
					console.log(res)
					$("#dBPlace").append(res.bPlace);
					$("#dBTitle").append(res.bTitle);
					$("#dBContents").append(res.bContents);
					$divReply = $("<div>").addClass("replys");
					
					$(res.replys).each(function(i,obj){
						var id = obj.rGNo.gId;
						var text = obj.rContent;
						$divReply.append(id+" : ").append(text+"<br>");
					})
					$("#dReplys").append($divReply);
					$(res.contents).each(function(i,obj){
						var $div = $("<div>");
						
						var $img = $("<img>").attr("src","/daedong/upload/displayFile?filename="+obj.cImage);
						var $divImg = $("<div>").append($img).addClass("divImg");
						
						var $pText = $("<p>").append(obj.cContents);
						var $divText = $("<div>").append($pText).addClass("divText form-control");
						
						$div.append($divImg).append($divText);
						$(".bxslider3").append($div);
					})
					
					imgLoading();
					
					getReplyListAll(res.bNo,1,$(".pagination"))
				}
				
			})
		})
		
		
		$("#uploadProfileImg").change(function(){
			var bNo = $(this).attr("data-gNo"); 
			if($(this)[0].files[0]==null){
				return;
			};
			$("#proFileSpinner").addClass("spinner-border text-primary");
			
			var formData = new FormData();//서버로 보낼 데이터를 담을 공간
			formData.append("file",$(this)[0].files[0]);
			console.log(formData)
			$.ajax({
				url:"/daedong/upload/updateProfileImg",
				type:"post",
				data:formData,
				processData:false, //FormData 를 보낼 경우 processData:false, contentType:false처리 필요
				contentType:false,
				success:function(res){
					console.log(res);
/* 					$(".profileImg").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+res);
					$("button.close").click();
 */					$("#proFileSpinner").removeClass("spinner-border text-primary");
 					location.href="/daedong/board/timeLine?gNo="+bNo;
				}
			})
			
			
		})
		var lodingTime;
		
		
		function imgLoading() {
    		lodingTime= setInterval(alertFunc, 200);
    	}
		function alertFunc() {
            mySlider3.reloadSlider();
            clearInterval(lodingTime);
    	}
})