
$(function(){
	
	
	mySlider3=$('.bxslider3').bxSlider({
		  auto: false,
		  autoControls: false,
		  stopAutoOnClick: false,
		  pager: true,
		  pagerType : 'short',
		  slideWidth: 1100,
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
					var $imgGuest;
					if(obj.rGNo.gImage!=null){
						$imgGuest = $("<img>").attr("src","/daedong/upload/displayFile?filename="+obj.rGNo.gImage).addClass("guestImg");
					}else{
						$imgGuest = $("<img>").attr("src","/daedong/resources/images/boy.png").addClass("guestImg");
					}
					var $aId = $("<a>").addClass("id").append(obj.rGNo.gId+" : ").attr("href","/daedong/board/timeLine?gNo="+obj.rGNo.gNo);
					
					var $spanText = $("<span>").append($imgGuest).append($aId).addClass("text").append(obj.rContent);
					var time = new Date(obj.rWritetime);
					/*(time.getFullYear()+"").slice(-2)*/
					var $spanTime = $("<span>").append(" "+time.format("yy-MM-dd HH:mm")).addClass("date");
					/* yy-MM-dd hh:mm */
					$spanText.append($spanTime);
					
					var $divReply = $("<div>").addClass("reply").append($spanText);
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
	
	
	
	$(document).on("click",".boardDetail",function(){
			var bNo=$(this).attr("data-bNo");
			$(".pagination").attr("data-bNo",bNo);
			$(".reply-textArea").attr("data-bNo",bNo);
			var rNo = $(this).attr("data-rNo");
			if(rNo==null){
				rNo=0;
			}			
			
			  $(".bxslider3").empty();
			  $("#dBPlace").empty();
			  $("#dBGId").empty();
			$.ajax({
				url:"/daedong/board/boardDetail",
				type:"post",
				data: {bNo:bNo,rNo:rNo},
				dataType:"json",
				success:function(res){
					console.log(res);
						var $imgGuest;
						if(res.board.bGNo.gImage!=null){
							$imgGuest = $("<img>").attr("src","/daedong/upload/displayFile?filename="+res.board.bGNo.gImage).addClass("guestImg");
						}else{
							$imgGuest = $("<img>").attr("src","/daedong/resources/images/boy.png").addClass("guestImg");
						}
						
					$("#dBGId").attr("href","/daedong/board/timeLine?gNo="+res.board.bGNo.gNo).append($imgGuest).append(res.board.bGNo.gId);
					
					$("#dBPlace").append(res.board.bPlace);
					$("#dBTitle").append(res.board.bTitle);
					$("#dBContents").append(res.board.bContents);
					var $divReply = $("<div>").addClass("replys");
					
					$(res.board.replys).each(function(i,obj){
						console.log("여기 어디고")
						console.log(obj)
						var id = obj.rGNo.gId;
						var text = obj.rContent;
						$divReply.append(id+" : ").append(text+"<br>");
					})
					$("#dReplys").append($divReply);
					$(res.board.contents).each(function(i,obj){
						var $div = $("<div>");
						
						var $img = $("<img>").attr("src","/daedong/upload/displayFile?filename="+obj.cImage);
						var $divImg = $("<div>").append($img).addClass("divImg");
						
						var $pText = $("<p>").append(obj.cContents);
						var $divText = $("<div>").append($pText).addClass("divText form-control");
						
						$div.append($divImg).append($divText);
						$(".bxslider3").append($div);
					})
					
					imgLoading();
					getReplyListAll(res.board.bNo,res.cri.page,$(".pagination"))
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