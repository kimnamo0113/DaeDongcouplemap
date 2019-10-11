<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
 <!-- Begin Page Content -->

<style>
	#profileImg{
		cursor: pointer;
	}
	#proFileUpdate label,#proFileUpdate li{
		cursor: pointer;
	}
	#modalProfile{
		max-height: 700px;
		top:100px;
	}
	
	div.container-fluid{
		margin-top:120px;
	}
	
	
	.reply-text button{
		border:1px solid #d1d3e2
	}
	figure{
		cursor: pointer;
	}
	#header{
		width: 500px;
	    text-align: center;
	    margin: 0 auto;
	}
	#divCenter{
		margin: 0 auto;
		width:680px;
	}
	
	#dReplys{
		height: 250px;
		overflow: auto;
	}
	.divImg img{
		max-width : auto;
		max-height : 400px;
	}
	
	.divImg{
		padding-bottom: 0px;
	}
	span.date{
		font-size: 10px;
	}
	label{ 
		cursor: pointer;
	}
	.icons i{
		font-size:1.5rem;
		margin-right: 10px;
	}
	.boardList img{
		width:180px;
		height: 180px;
		margin: 10px;
	}


	
	
	/* mouseover이벤트 */
	
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
figure.snip1384 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  color: #ffffff;
  text-align: left;
  float:left;
  font-size: 16px;
}
figure.snip1384 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1384 img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1384:after,
figure.snip1384 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1384:after {
  content: '';
  background-color: rgba(0, 0, 0, 0.65);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1384 figcaption {
  z-index: 1;
  padding: 40px;
}
figure.snip1384 h3,
figure.snip1384 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}
figure.snip1384 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.0em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1384 p {
  font-size: 0.8em;
  font-weight: 300;
  letter-spacing: 1px;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1384 i {
  position: absolute;
  padding: 20px 25px;
  width:10px;
  text-align:center;
  font-size: 20px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1384 i.fa-heart{
 bottom: 10px;
 left: 20px;
}
figure.snip1384 i.fa-comment{
  bottom: 10px;
  right: 50px;
}
figure.snip1384 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1384:hover img,
figure.snip1384.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1384:hover:after,
figure.snip1384.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1384:hover h3,
figure.snip1384.hover h3,
figure.snip1384:hover p,
figure.snip1384.hover p,
figure.snip1384:hover i,
figure.snip1384.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}
	@media (max-width: 768px) {
		 .boardList img{
			width:150px;
			height: 150px;
			margin: 10px;
		}
	}
	@media (max-width: 550px) {
		#header{
			width:360px;
			font-size: 14px;
		}
		.timelineDiv div{
			padding: 1px;
		}
		
		#profileImg{
			width:100px;
			height: 100px;
		}
		 .boardList img{
			width:100px;
			height: 100px;
			margin: 5px;
		}
		figure.snip1384 i {
		  position: absolute;
		  padding: 20px 25px;
		  width:10px;
		  text-align:center;
		  font-size: 13px;
		  opacity: 0;
		  -webkit-transform: translateX(-10px);
		  transform: translateX(-10px);
		}
		figure.snip1384 figcaption {
		  z-index: 1;
		  padding: 20px;
		}
		figure.snip1384 i.fa-heart{
		 bottom: 5px;
		 left: 8px;
		}
		figure.snip1384 i.fa-comment{
		  bottom: 5px;
		  right: 18px;
		}
		figure.snip1384 {
		  font-family: 'Raleway', Arial, sans-serif;
		  position: relative;
		  overflow: hidden;
		  color: #ffffff;
		  text-align: left;
		  float:left;
		  font-size: 13px;
		}
	
		
	}
</style>



<script type="text/javascript">
var startPage=0;
	var mySlider3;
	$(function() {
		
		$(".hover").mouseleave(function () {
		    $(this).removeClass("hover");
		});	
		
		
		
		$('#myModal3').on('hidden.bs.modal', function () {
			  
			  $(".bxslider3").empty();
			  $("#dBPlace").empty();
			  $("#dBTitle").empty();
			 /*  $("#dReplys").empty();
			  $h5Title = $("<h5>").attr("id","dBTitle")
			  $pContent = $("<dBContents>").attr("id","dBcontents");
			  $("#dReplys").append($h5Title).append($pContent); */
			  
		})
		
			
		$("#profileImg").click(function(){
						
			if($(this).attr("data-gNo") == '${Auth.userno}')
				return true;	
			else
				return false;
		})
		//flag 버튼 = 0:관계x(팔로우) 1:요청됨 2:요청 수락 3:팔로잉
		var flag = '${flag}';
		
		if(flag==0){
			$("#follow").attr("data-fRead",0).find("span").text("팔로우");	
		}
		else if(flag==1){
			$("#follow").attr("data-fRead",1).find("span").text("요청됨");
		}
		else if(flag==2){
			$("#follow").attr("data-fRead",2).find("span").text("요청 수락");
		}
		else if(flag==3){
			$("#follow").attr("data-fRead",3).find("span").text("팔로잉");
		}
		
		
		
		$(document).on("click",".follow",function(){
			
			
			
			var follow = '${Auth.userno}'; 
			var follower = $(this).attr("data-gNo");
			
			var span = $(this).find("span");
			var spanStr = $(span).text();
			
			if(spanStr=='나'){
				return false;
			}
			
			
			
			var followCount = $("#followCount").text(); 
			var followerCount = $("#followerCount").text();  
			
			var fReadFlag = $(this).attr("data-fRead");
			
			
			var check;
			if(fReadFlag==0){
				check=confirm("팔로우 요청을 하시겠습니까?");
			}else if(fReadFlag==1){
				check=confirm("팔로우 요청을 취소 하시겠습니까?");
			}else if(fReadFlag==2){
				check=confirm("팔로우 요청을 수락하시겠습니까?");
			}else{
				check=confirm("팔로우를 취소 하시겠습니까?");
			}
			if(check==false){
				return;
			}
			$(span).text("").addClass("spinner-border text-primary");
			
			
			/* 팔로우 */
			if(fReadFlag==0){
				$.ajax({
					url : "/daedong/friend/follow",
					type : "post",
					data : {follow:follow,follower:follower},
					dataType : "json",
					success : function(res){
						console.log(res);
						$(span).removeClass("spinner-border text-primary");
						if(res==true){
							
							
							if('${guest.gNo}' == '${Auth.userno}'){
								$(span).text("요청됨").parent().attr("data-fRead",1).removeClass("btn-outline-primary").addClass("btn-primary");
								$("#followCount").text(Number(followCount)+1);	
							}else if(follower=='${guest.gNo}'){
								$(span).text("요청됨").parent().attr("data-fRead",3).removeClass("btn-outline-primary").addClass("btn-primary");
								$("#followerCount").text(Number(followerCount)+1);
							}
							else if(follow=='${Auth.userno}'){
								$(span).text("요청됨").parent().attr("data-fRead",3).removeClass("btn-outline-primary").addClass("btn-primary");	
							}else{
								$(span).text("요청됨").parent().attr("data-fRead",3).removeClass("btn-outline-primary").addClass("btn-primary");
								$("#followerCount").text(Number(followerCount)+1);
							}
							
							
						}
						
					}
				})		
			}else if(fReadFlag==2){ /* 요청수락 */
				$.ajax({
					url : "/daedong/friend/followAccept",
					type : "post",
					data : {follow:follow,follower:follower,fRead:3},
					dataType : "json",
					success : function(res){
						console.log(res);
						$(span).removeClass("spinner-border text-primary");
						if(res==true){
							
							$(span).text("팔로잉");
							$(span).parent().attr("data-fRead",3).removeClass("btn-primary").addClass("btn-outline-primary");
							if('${guest.gNo}' == '${Auth.userno}'){
								$("#followCount").text(Number(followCount)+1);
							}else if(follower=='${guest.gNo}'){
								$("#followerCount").text(Number(followerCount)+1);
							}else if(follow=='${Auth.userno}'){
								
							}else{
								$("#followerCount").text(Number(followerCount)+1);
								
							}
						}
						
					}
				})		
			}else{			/* 팔로잉/요청됨 */
				$.ajax({
					url : "/daedong/friend/request",
					type : "post",
					data : {follow:follow,follower:follower},
					dataType : "json",
					success : function(res){
						console.log(res);
						$(span).removeClass("spinner-border text-primary");
						if(res==true){
							if(spanStr=="요청됨"){

								$(span).text("팔로우").parent().attr("data-fRead",0).removeClass("btn-outline-primary").addClass("btn-primary");
								if('${guest.gNo}' == '${Auth.userno}'){
									$("#followCount").text(Number(followCount)-1);	
								}else if(follower=='${guest.gNo}'){
									$("#followerCount").text(Number(followerCount)-1);
								}
								else if(follow=='${Auth.userno}'){
								}
								else{
									$("#followerCount").text(Number(followerCount)-1);
								}
								
							}else{
								
								if('${guest.gNo}' == '${Auth.userno}'){
									$(span).text("팔로우").parent().attr("data-fRead",2).removeClass("btn-outline-primary").addClass("btn-primary");
									$("#followCount").text(Number(followCount)-1);
								}else if(follower=='${guest.gNo}'){
									$(span).text("요청 수락").parent().attr("data-fRead",2).removeClass("btn-outline-primary").addClass("btn-primary");
									$("#followerCount").text(Number(followerCount)-1);
								}
								else if(follow=='${Auth.userno}'){
									$(span).text("요청 수락").parent().attr("data-fRead",2).removeClass("btn-outline-primary").addClass("btn-primary");
								}
								else{
									$(span).text("요청 수락").parent().attr("data-fRead",2).removeClass("btn-outline-primary").addClass("btn-primary");
									$("#followerCount").text(Number(followerCount)-1);	
								}
								
							}
						}
					}
				})
			}
			return false;
		})
		
		
		$("#labelFollowCount").click(function(){
			$("#followCount").click();
		})
		
		$("#labelFollowerCount").click(function(){
			$("#followerCount").click();
		})
		
		$("#followCount").click(function(){
			$(".followScroll").empty();
			$.ajax({
				url:"/daedong/friend/followList",
				type:"post",
				data:{gNo:$(this).attr("data-gNo")},
				dataType:"json",
				success:function(res){
					console.log(res);
					
					$(res).each(function(i,obj){
						var time = new Date(obj.fDate);
						obj.fDate=time.format("yyyy-MM-dd HH:mm");
						
					})
					
					var source=$("#followListTemp").html();
					var fn = Handlebars.compile(source);
					var str = fn(res);
					$(".followScroll").append(str);
				}
			})
		})
		$("#followerCount").click(function(){
			$(".followerScroll").empty();
			$.ajax({
				url:"/daedong/friend/followerList",
				type:"post",
				data:{gNo:$(this).attr("data-gNo")},
				dataType:"json",
				success:function(res){
					console.log(res);
					
					$(res).each(function(i,obj){
						var time = new Date(obj.fDate);
						obj.fDate=time.format("yyyy-MM-dd HH:mm");
						
					})
					
					var source=$("#followerListTemp").html();
					var fn = Handlebars.compile(source);
					var str = fn(res);
					$(".followerScroll").append(str);
				}
			})
		})
		
		
		$(document).on("click",".guestImg",function(){
			var href = $(this).next();
			location.href=$(href).attr("href");
		})
		
		
		
		
		
		
	})
	
	$(window).scroll(function() { // 스크롤 이벤트가 발생할 때마다 인식
		
		/* 오차떄문에 올림을 해줌 오차발생 모르겟음 */		
/* 		console.log(Math.ceil($(window).scrollTop()))
		console.log($(document).height() - $(window).height())
 */				
		if (Math.ceil($(window).scrollTop()) == $(document).height() - $(window).height() || $(window).scrollTop() == $(document).height() - $(window).height()) {
			
			startPage+=24;
			$.ajax({
				url:"${pageContext.request.contextPath}/board/timelineListAdd",
				type:"get",
				data: {page:startPage,gNo:"${boards[0].bGNo.gNo}"},
				dataType:"json",
				success:function(res){
					console.log(res);
					
					$(res).each(function(i,obj){
						var time = new Date(obj.fDate);
						obj.fDate=time.format("yyyy-MM-dd HH:mm");
					})
					
					var source=$("#addTimeLine").html();
					var fn = Handlebars.compile(source);
					var str = fn(res);
					$(".boardList").append(str);					
				}
				
			})
			
	    }
	});
</script>
<script id="addTimeLine" type="text/x-handlebars-template">
	{{#each.}}
   		<figure class="snip1384" data-toggle="modal" data-target="#myModal3">
   	  	 <img src="${pageContext.request.contextPath }/upload/displayFile?filename={{contents.[0].cImage}}" >
   	   		<figcaption data-bNo="{{bNo}}" class="boardDetail">
		    <h3>{{bTitle}}</h3>
			<p>{{bPlace}}</p><!-- <i class="ion-ios-arrow-right"></i> -->
				<i class="fas fa-heart"> {{board.bGood}}</i><i class="fas fa-comment"> {{replyCount}}</i>
			
			<p></p>
		  </figcaption>
		</figure>
   	{{/each}}
</script>


<div class="container-fluid">


  <!-- Page Heading -->
  <div class="align-items-center justify-content-between mb-4">
  	<div class="form-group row" id="header">
  		<div class="col-4">
			<c:if test="${guest.gImage!=null }">
				<img id="profileImg" src="${pageContext.request.contextPath }/upload/displayFile?filename=${guest.gImage }" data-gNo="${guest.gNo }"  class="img-circle profileImg" data-toggle="modal" data-target="#myModal2" width="150" height="150">
			</c:if>  	
		  	<c:if test="${guest.gImage==null }">
		  		<img id="profileImg" src="${pageContext.request.contextPath }/resources/images/boy.png" data-gNo="${guest.gNo }" class="img-circle profileImg"  data-toggle="modal" data-target="#myModal2">
		  	</c:if>
	  	</div>
	  	<div class="col-6">
	  		<h1 class="h5 mb-0 text-gray-800">${guest.gId}
	  			<!-- flag 버튼 = 0:관계x(팔로워) 1:요청됨 2:팔로워 3:팔로잉 -->
	  			<c:if test="${Auth!=null }">
			  		<c:if test="${Auth.userno!=guest.gNo }">
			  			<button class="btn btn-outline-primary follow" id="follow" data-gNo="${guest.gNo }"><span></span></button>
			  		</c:if>
		  		</c:if>
	  		</h1>
	  		<br>
	  		<div class="row timelineDiv">
	  		<div class="col-4">
	  			<label>게시글</label><br>
	  		</div>
	  		<div class="col-4">
	  			<label id="labelFollowCount">팔로우</label><br>
	  		</div>
	  		<div class="col-4">
	  			<label id="labelFollowerCount">팔로워</label><br>
	  		</div>
	  		</div>
	  		<div class="row">
	  		<div class="col-4">
	  			<label id="boardCount">${bCount }</label><br>
	  		</div>
	  		<div class="col-4">
	  			<label id="followCount" data-toggle="modal" data-target="#followModal" data-gNo="${guest.gNo }">${followCount }</label><br>
	  		</div>
	  		<div class="col-4">
	  			<label id="followerCount" data-toggle="modal" data-target="#followerModal" data-gNo="${guest.gNo }">${followerCount }</label><br>
	  		</div>
	  		</div>
	  	</div>
	  	  	
	</div>
    
    
  </div>

  <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" id="modalProfile">
        <div class="modal-header">
          <h4 class="modal-title">프로필 사진 수정</h4>
          
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form enctype="multipart/form-data">
	        <div id="proFileUpdate">
	        	
			  		<label for="uploadProfileImg" class="list-group-item">업로드<span id="proFileSpinner"></span></label>
					<input type="file" name="file" id="uploadProfileImg"  data-gNo="${guest.gNo }"s style="display:none">
					<label class="list-group-item">사진 내리기</label>		  		
			  	
	        </div>
		    <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
        </form>
      </div>
      
    </div>
  </div>
  

  <div class="row">

    <!-- Area Chart -->
    

    <!-- Pie Chart -->
  </div>

  <!-- Content Row -->
  <div class="row">

    <!-- Content Column -->
    <div id="divCenter">
	    <div>
	    	<div class="boardList">
		    	<c:forEach var="board" items="${boards}">
		    		<figure class="snip1384" data-toggle="modal" data-target="#myModal3">
		    		<c:set var="img" value="${board.contents[0].cImage }"/>
		    		<c:set var="imglength" value="${fn:length(img) }"/>
		    	  	 <img src="${pageContext.request.contextPath }/upload/displayFile?filename=${fn:substring(img,0,20)}s_${fn:substring(img,22,imglength) }" >
		    	   		<figcaption data-bNo="${board.bNo }" class="boardDetail">
					    <h3>${board.bTitle }</h3>
						<p>${board.bPlace }</p><!-- <i class="ion-ios-arrow-right"></i> -->
 						<i class="fas fa-heart"> ${board.bGood }</i><i class="fas fa-comment"> ${board.replyCount }</i>
						
						<p></p>
					  </figcaption>
					</figure>
		    	</c:forEach>
			</div>
	    </div>
	 </div>
  </div>
  
  
  
  
   <!-- follow Modal -->
  <div class="modal fade" id="followModal" role="dialog" >
	<div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content" id="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title">Follow</h5><br>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	         <div class="modal-body row">
	          <div class="col-12 followScroll">
		         
	          </div>
	          
        </div>
        
		    <div class="modal-footer">
	        </div>
      </div>
      
    </div>
  </div>
    <c:if test="${Auth!=null }">
  		<c:if test="${Auth.userno==guest.gNo }">
  			<script id="followListTemp" type="text/x-handlebars-template">
				{{#each.}}
	 			<a class="d-flex" href="${pageContext.request.contextPath }/board/timeLine?gNo={{follower.gNo}}">
	             <div class="mr-2">
					 {{#if follower.gImage null}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg">					
				  	 {{else}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/upload/displayFile?filename={{follower.gImage}}" class="guestImg">
				     {{/if}}
	             </div>
	             <div class="col-5">
	               <div class="small text-gray-500">{{fDate}}</div>
	               <p class="font-weight-bold">{{follower.gId}}</p>
	             </div>
	             <div class="col-5 text-center">
					{{#if fRead 0}}
						<button class="btn btn-primary follow" data-gNo="{{follower.gNo}}" data-fRead="1" ><span>요청됨</span></button>
					{{/if}}
					{{#if fRead 1}}
						<button class="btn btn-primary follow" data-gNo="{{follower.gNo}}" data-fRead="1" ><span>요청됨</span></button>
					{{/if}}
					{{#if fRead 2}}
						<button class="btn btn-primary follow" data-gNo="{{follower.gNo}}" data-fRead="1" ><span>요청됨</span></button>
					{{/if}}
					{{#if fRead 3}}
						<button class="btn btn-outline-primary follow" data-gNo="{{follower.gNo}}" data-fRead="3" ><span>팔로잉</span></button>
					{{/if}}
					{{#if fRead 4}}
	             		<button class="btn btn-outline-primary follow" data-gNo="{{follower.gNo}}" data-fRead="3" ><span>팔로잉</span></button>
					{{/if}}
					{{#if fRead 5}}
	             		<button class="btn btn-outline-primary follow" data-gNo="{{follower.gNo}}" data-fRead="" ><span>나</span></button>
					{{/if}}
	             </div>

	           </a>
				{{/each}}
	</script>
  		</c:if>
  		<c:if test="${Auth.userno!=guest.gNo }">
  			<script id="followListTemp" type="text/x-handlebars-template">
				{{#each.}}
	 			<a class="d-flex" href="${pageContext.request.contextPath }/board/timeLine?gNo={{follower.gNo}}">
	             <div class="mr-2">
					 {{#if follower.gImage null}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg">					
				  	 {{else}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/upload/displayFile?filename={{follower.gImage}}" class="guestImg">
				     {{/if}}
	             </div>
	             <div class="col-5">
	               <div class="small text-gray-500">{{fDate}}</div>
	               <p class="font-weight-bold">{{follower.gId}}</p>
	             </div>
	             <div class="col-5 text-center">
					{{#if fRead 0}}
						<button class="btn btn-primary follow" data-gNo="{{follower.gNo}}" data-fRead="0" ><span>팔로우</span></button>
					{{/if}}
					{{#if fRead 1}}
						<button class="btn btn-primary follow" data-gNo="{{follower.gNo}}" data-fRead="2" ><span>요청 수락</span></button>
					{{/if}}
					{{#if fRead 2}}
						<button class="btn btn-primary follow" data-gNo="{{follower.gNo}}" data-fRead="3" ><span>요청됨</span></button>
					{{/if}}
					{{#if fRead 3}}
						<button class="btn btn-outline-primary follow" data-gNo="{{follower.gNo}}" data-fRead="3" ><span>팔로잉</span></button>
					{{/if}}
					{{#if fRead 4}}
	             		<button class="btn btn-outline-primary follow" data-gNo="{{follower.gNo}}" data-fRead="3" ><span>팔로잉</span></button>
					{{/if}}
					{{#if fRead 5}}
	             		<button class="btn btn-outline-primary follow" data-gNo="{{follower.gNo}}" data-fRead="" ><span>나</span></button>

					{{/if}}
	             </div>

	           </a>
				{{/each}}
	</script>
  		</c:if>
  	</c:if>
  	<c:if test="${Auth==null }">
  		<script id="followListTemp" type="text/x-handlebars-template">
				{{#each.}}
	 			<a class="d-flex" href="${pageContext.request.contextPath }/board/timeLine?gNo={{follower.gNo}}">
	             <div class="mr-2">
					 {{#if follower.gImage null}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg">					
				  	 {{else}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/upload/displayFile?filename={{follower.gImage}}" class="guestImg">
				     {{/if}}
	             </div>
	             <div class="col-5">
	               <div class="small text-gray-500">{{fDate}}</div>
	               <p class="font-weight-bold">{{follower.gId}}</p>
	             </div>
	             <div class="col-5 text-center">
	             </div>

	           </a>
				{{/each}}
	</script>
  	</c:if>
  
  
  
  
  
  
  
  
  <!-- follower Modal -->
  <div class="modal fade" id="followerModal" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" id="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Follower</h5><br>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
         <div class="modal-body row">
          <div class="col-12 followerScroll">
	         
          </div>
          
        </div>
        
		    <div class="modal-footer">
	        </div>
      </div>
      
    </div>
  </div>
  
  <c:if test="${Auth!=null }">
  	<c:if test="${Auth.userno==guest.gNo }">
  		<script id="followerListTemp" type="text/x-handlebars-template">
				{{#each.}}
	 			<a class="d-flex" href="${pageContext.request.contextPath }/board/timeLine?gNo={{follow.gNo}}">
	             <div class="mr-2">
					 {{#if follow.gImage null}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg">					
				  	 {{else}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/upload/displayFile?filename={{follow.gImage}}" class="guestImg">
				     {{/if}}
	             </div>
	             <div class="col-5">
	               <div class="small text-gray-500">{{fDate}}</div>
	               <p class="font-weight-bold">{{follow.gId}}</p>
	             </div>
	             <div class="col-5 text-center">
					{{#if fRead 0}}
						<button class="btn btn-primary follow" data-gNo="{{follow.gNo}}" data-fRead="2" ><span>팔로우</span></button>
					{{/if}}
					{{#if fRead 1}}
						<button class="btn btn-primary follow" data-gNo="{{follow.gNo}}" data-fRead="2" ><span>팔로우</span></button>
					{{/if}}
					{{#if fRead 2}}
						<button class="btn btn-primary follow" data-gNo="{{follow.gNo}}" data-fRead="2" ><span>팔로우</span></button>
					{{/if}}
					{{#if fRead 3}}
						<button class="btn btn-outline-primary follow" data-gNo="{{follow.gNo}}" data-fRead="3" ><span>팔로잉</span></button>
					{{/if}}
					{{#if fRead 4}}
	             		<button class="btn btn-outline-primary follow" data-gNo="{{follow.gNo}}" data-fRead="3" ><span>팔로잉</span></button>
					{{/if}}				
					{{#if fRead 5}}
	             		<button class="btn btn-outline-primary follow" data-gNo="{{follower.gNo}}" data-fRead="" ><span>나</span></button>
					{{/if}}	
	             </div>

	           </a>
				{{/each}}
		</script>
  	</c:if>
  	<c:if test="${Auth.userno!=guest.gNo }">
  		<script id="followerListTemp" type="text/x-handlebars-template">
				{{#each.}}
	 			<a class="d-flex" href="${pageContext.request.contextPath }/board/timeLine?gNo={{follow.gNo}}">
	             <div class="mr-2">
					 {{#if follow.gImage null}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg">					
				  	 {{else}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/upload/displayFile?filename={{follow.gImage}}" class="guestImg">
				     {{/if}}
	             </div>
	             <div class="col-5">
	               <div class="small text-gray-500">{{fDate}}</div>
	               <p class="font-weight-bold">{{follow.gId}}</p>
	             </div>
	             <div class="col-5 text-center">
					{{#if fRead 0}}
						<button class="btn btn-primary follow" data-gNo="{{follow.gNo}}" data-fRead="0" ><span>팔로우</span></button>
					{{/if}}
					{{#if fRead 1}}
						<button class="btn btn-primary follow" data-gNo="{{follow.gNo}}" data-fRead="2" ><span>요청 수락</span></button>
					{{/if}}
					{{#if fRead 2}}
						<button class="btn btn-primary follow" data-gNo="{{follow.gNo}}" data-fRead="3" ><span>요청됨</span></button>
					{{/if}}
					{{#if fRead 3}}
						<button class="btn btn-outline-primary follow" data-gNo="{{follow.gNo}}" data-fRead="3" ><span>팔로잉</span></button>
					{{/if}}
					{{#if fRead 4}}
	             		<button class="btn btn-outline-primary follow" data-gNo="{{follow.gNo}}" data-fRead="3" ><span>팔로잉</span></button>
					{{/if}}				
					{{#if fRead 5}}
	             		<button class="btn btn-outline-primary follow" data-gNo="{{follower.gNo}}" data-fRead="" ><span>나</span></button>
					{{/if}}	
	             </div>

	           </a>
				{{/each}}
		</script>
  	</c:if>
  	  
  </c:if>
  <c:if test="${Auth==null }">
  	  <script id="followerListTemp" type="text/x-handlebars-template">
				{{#each.}}
	 			<a class="d-flex" href="${pageContext.request.contextPath }/board/timeLine?gNo={{follow.gNo}}">
	             <div class="mr-2">
					 {{#if follow.gImage null}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg">					
				  	 {{else}}
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/upload/displayFile?filename={{follow.gImage}}" class="guestImg">
				     {{/if}}
	             </div>
	             <div class="col-5">
	               <div class="small text-gray-500">{{fDate}}</div>
	               <p class="font-weight-bold">{{follow.gId}}</p>
	             </div>
	             <div class="col-5 text-center">
								
						
	             </div>

	           </a>
				{{/each}}
		</script>
  </c:if>

  
  
  
  
  
</div>
<!-- /.container-fluid -->

<%@ include file="../include/footer.jsp" %>