	//서버로 보낼 데이터를 담을 공간
	var formData = new FormData();
	//Img bx슬라이드 옵션 정보 담는곳	
	var mySlider;
$(function(){
    	mySlider=$('.bxslider').bxSlider({
    		  auto: false,
    		  autoControls: false,
    		  stopAutoOnClick: false,
    		  pager: true,
    		  pagerType : 'short',
    		  slideWidth: 1100,
    		  touchEnabled:false
    		});
    	
    	
    	
    	
/* 글쓰기에서 이미지 업로드시 */    	
    	$("#imgFile").change(function(){
        	if(formData.getAll("files").length+$(this)[0].files.length >10){
        		alert("이미지 파일을 10개 이하로만 올려주세요.");
        		return ;
        	};
        	$("#boardUploadSpinner").addClass("spinner-border text-primary");
        	
			$($(this)[0].files).each(function(i,obj){
				var reader = new FileReader();
				reader.onload = function(e){
					var $div = $("<div>");
					var $divImg = $("<div>").addClass("divImg");
					
					var $img =$("<img>").attr("src",e.target.result);
					var $divText = $("<div>").addClass("divText");
					var $textArea =$("<textarea>").addClass("form-control imgTextAreaContents").attr("placeholder","세부 내용");
					
					$divImg.append($img);
					$divText.append($textArea);
					
					$div.append($divImg).append($divText);
					$(".bxslider").append($div);
					formData.append("files",obj);
				}
				reader.readAsDataURL(obj);
				
			});
        	imgLoading();
        	
    	})
    	
    	
    	var lodingTime;

    	function imgLoading() {
    		lodingTime= setInterval(alertFunc, 500);
    	}
    	
    	

    	function alertFunc() {
    		$("#slideHidden").show();
            mySlider.reloadSlider();
            clearInterval(lodingTime);
            $("#boardUploadSpinner").removeClass("spinner-border text-primary");
    	}
    	
    	
    	
/* bx슬라이드 좌우 태그 show/hide */ 
         /*$(document).on({	    mouseenter: function () {
       	    	 $(".bx-next").stop().fadeIn(500);
           		 $(".bx-prev").stop().fadeIn(500);
       	    },
       	    mouseleave: function () {
       	    	 $(".bx-next").stop().fadeOut(500);
            	 $(".bx-prev").stop().fadeOut(500);
       	    }
       	}, ".bx-viewport");*/ 
    	
    	
    	
         $(document).on({mouseenter: function () {
        	 $(this).next().find(".bx-next").stop().fadeIn(500);
        	 $(this).next().find(".bx-prev").stop().fadeIn(500);
         },
         mouseleave: function () {
        	 $(this).next().find(".bx-next").stop().fadeOut(500);
        	 $(this).next().find(".bx-prev").stop().fadeOut(500);
         }
         }, ".bx-viewport"); 
         
         $(document).on("mouseover",".bx-next, .bx-prev",function(){
        	 $(this).stop().fadeIn(500);
         })
/*  */         
         
/* 해시태그 이벤트 */
         function hashPut(){
         	var text=$("#hashTag").val();
         	var $span = $("<span>").html("<img src='/daedong/resources/images/x.png'>");
         	var $p = $("<p>").text("#"+text);
         	
         	
         	
         	$("#hashResult").append($p).append($span);
         	
         	$("#hashTag").val("");
         }
         /* hashTag에서 엔트 */
         $("#hashTag").keydown(function(key) {

         	if (key.keyCode == 13) {
         		hashPut();
         	}

         });
         
         $(document).on("click","#frinedTagList p",function(){
 			$("#frinedTagList").hide();
 			$("#friendTag").val("");
 			var friendName=$(this).find("span").text();
 			var $p=$("<p>").attr("data-gNo",$(this).attr("data-gNo")).append("@"+friendName).addClass("friendTags");
 			var $span = $("<span>").html("<img src='/daedong/resources/images/x.png'>");
 			$("#friendTagResult").append($p).append($span);
 		})
         
         $(document).on("propertychange change keyup paste input","#friendTag",function(){
        	 var gNo = $(this).attr("data-gNo");
        	 var name = $(this).val();
        	 
        	 $("#frinedTagList").show();
        	 $("#frinedTagList").empty();
        	 $.ajax({
        		 url:"/daedong/friend/selectFrinedTag",
        		 type:"post",
        		 data:{gNo:gNo,name:name},
        		 dataType:"json",
        		 success:function(res){
        			 console.log(res);
        			 $(res).each(function(i,obj){
 						var $img;
 						if(obj.follow.gImage!=null){
 							$img = $("<img>").attr("src","/daedong/upload/displayFile?filename="+obj.follow.gImage).addClass("guestImgNoHref");	
 						}else{
 							$img = $("<img>").attr("src","/daedong/resources/images/boy.png").addClass("guestImgNoHref");
 						}
 						
 						var $spanId = $("<span>").append($img).append(obj.follow.gName).attr("href","");		
 						var $p = $("<p>").append($spanId).attr("data-gNo",obj.follow.gNo);
 						$("#frinedTagList").append($p);	
 					})
        			 
        			 
        		 }
        		 
        	 })
         })
         
         
     	$(document).on("click","#hashResult span,#friendTagResult span",function(){
			$(this).prev().remove();
			$(this).remove();
		})
/*  */         

/* Enter시 submit되는걸 막기위한 모든 event no */		
         document.addEventListener('keydown', function(event) {
        	  if (event.keyCode === 13) {
        	    event.preventDefault();
        	  };
        	}, true);
    
/*      */
		$(document).on("click","#test",function(){
			console.log(formData);
			/*for(var item of formData.entries()) {
			  console.log(item[0]); // key, value를 각각 출력
			  console.log(item[1]); // key, value를 각각 출력
			}*/
		})		
		
		
		$("#writeForm").submit(function(e){
			
			if(formData.has("files")==false){
				alert("이미지를 올려주세요.");
				return false;
			}
			
			e.preventDefault();
			formData.append("bGNo.gNo",$("input[name='userno']").val());
			/*formData.append("bGNo.gNo",1);//test용
*/			var hashResult=$("#hashResult").text();
			var bContents=$("#bContents").val();
			var bTitle=$("#bTitle").val();
			
			var area = $("#area").val();
			var province = $("#province").val();
			var gu = $("#gu").val();
			var dong = $("#dong").val();
			
			if(area=='지역선택'||area==null){
				area="";
			}
			if(province=='지역선택'||province==null){
				province="";
			}
			if(gu=='지역선택'||gu==null){
				gu="";
			}
			if(dong=='지역선택'||dong==null){
				dong="";
			}
			
			
			formData.append("bHash",hashResult);
			formData.append("bContents",bContents);
			formData.append("bTitle",bTitle);
			formData.append("bPlace",area+" "+province+" "+gu+" "+dong);
			
			for(var i=1; i<$(".imgTextAreaContents").length-1; i++){
				var textArea=$(".imgTextAreaContents").eq(i);
				formData.append("cContents",textArea.val());
				console.log(textArea.val());
			}
			var friends = [];
			for(var i=0; i<$(".friendTags").length; i++){
				var fTag = $(".friendTags").eq(i);
				formData.append("friendsGNo",$(fTag).attr("data-gNo"));
			}
			formData.append("cContents","List로 보내기위해서");
			$.ajax({
				url:"/daedong/upload/insertBoard2",
				type:"post",
				data:formData,
				processData:false, //FormData 를 보낼 경우 processData:false, contentType:false처리 필요
				contentType:false,
				success:function(res){
					console.log(res);
					formData = new FormData();
					$(".close").click();
					
					/*location.href="/daedong/board/list";*/
				}
			
			})
		})
		
		
		
		$('#writeModal').on('hidden.bs.modal', function () {
			 /* $("select[name=area]").val("지역선택");
			  $("select[name=province]").val("지역선택");
			  $("select[name=province]").hide();
			  $("select[name=gu]").val("지역선택");
			  $("select[name=gu]").hide();
			  $("select[name=dong]").val("지역선택");
			  $("select[name=dong]").hide();
			  
			  formData = new FormData();
			  */
			  location.reload();
		})
		
    });






