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
    		  slideWidth: 600,
    		});
    	
/* 글쓰기에서 이미지 업로드시 */    	
    	$("#imgFile").change(function(){
        	console.log($(this))
			$($(this)[0].files).each(function(i,obj){
				var reader = new FileReader();
				reader.onload = function(e){
					var $div = $("<div>");
					var $divImg = $("<div>").addClass("divImg");
					
					var $img =$("<img>").attr("src",e.target.result);
					var $divText = $("<div>").addClass("divText");
					var $textArea =$("<textarea>").addClass("form-control");
					
					$divImg.append($img);
					$divText.append($textArea);
					
					$div.append($divImg).append($divText);
					$(".bxslider").append($div);
					console.log($div)
					formData.append("files",obj);
				}
				reader.readAsDataURL(obj);
				
				
			});
        	imgLoading();
    	})
    	
    	
    	var lodingTime;

    	function imgLoading() {
    		lodingTime= setInterval(alertFunc, 2000);
    	}

    	function alertFunc() {
    		$("#slideHidden").show();
            mySlider.reloadSlider();
            clearInterval(lodingTime);
    	}
    	
    	
/* bx슬라이드 좌우 태그 show/hide */ 
         $(document).on({
       	    mouseenter: function () {
       	    	 $(".bx-next").stop().fadeIn(500);
           		 $(".bx-prev").stop().fadeIn(500);
       	    },
       	    mouseleave: function () {
       	    	 $(".bx-next").stop().fadeOut(500);
            	 $(".bx-prev").stop().fadeOut(500);
       	    }
       	}, ".bx-viewport"); 
         
         $(document).on("mouseover",".bx-next, .bx-prev",function(){
        	 $(".bx-next").stop().fadeIn(500);
       		 $(".bx-prev").stop().fadeIn(500);
         })
/*  */         
         
/* 해시태그 이벤트 */
         function hashPut(){
         	var text=$("#hashTag").val();
         	var $span = $("<span>").html("<img src='${pageContext.request.contextPath}/resources/images/x.png'>");
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
 
     	$(document).on("click","#hashResult span",function(){
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
			for(var item of formData.entries()) {
			  console.log(item[0]); // key, value를 각각 출력
			  console.log(item[1]); // key, value를 각각 출력
			}
		})		
 		$("#f1").submit(function(){
 			e.preventDefault(); //ajax로 처리하므로, submit 안되게 막음
 			alert("hi")
			formData.append("userid",$("input[name='userid']").val());
			$.ajax({
				url:"insertBoard2",
				type:"post",
				data:formData,
				processData:false, //FormData 를 보낼 경우 processData:false, contentType:false처리 필요
				contentType:false,
				success:function(res){
					console.log(res);
					formData = new FormData();
					
				}
			})
 			
 		})
    });