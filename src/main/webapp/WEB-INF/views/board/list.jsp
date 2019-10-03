<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
	.bxslider2{
		position: relative;
	}
	.bxslider2 .divText{
		position: absolute;
		bottom: 0px;
		height:auto;
		width:100%;
	}
	.icons i{
		font-size:1.5rem;
		margin-right: 10px;
	}
	
	.reply-text textarea{
		margin-left: 25px;
	}
	.reply-text button{
		margin-right: 10px;
		border:1px solid #d1d3e2
	}
	div.replys div.reply{
		display: block;
		clear: both;
	}
	div.replys div.reply label.id{
		display:inline-block;
		width:auto;
		float: left;
	}
	div.replys div.reply span.text{
		display:inline-block;
		width:80%;
		float: left;
	}
	div.replys div.divAddReply{
		clear: both;
		display: block;
	}
	div.container-fluid{
		margin-top:120px;
	}
	ul.pagination{
		clear: both;
	}
	div.pagination a{
		cursor: pointer;
	}
	div#includeMap{
		position: fixed;
		right: 0;
		top:200px;
	}
	span.date{
		font-size: 10px;
	}
	.guestImg{
		border-radius: 50% 50% 50% 50%;
		border:1px solid #ccc;
		width:50px;
		height: 50px;
		margin-right:10px;
		cursor: pointer;
	}
	.guestInfo a{
		text-decoration: none;
		color: #858796;
	}
	.guestInfo a:hover{
		font-size: 1.2rem;
	}
	
</style>

<script src="${pageContext.request.contextPath }/resources/js/reply.js"></script>

<script>
var mySlider2 = [];
var startPage=1;

$(function(){
	$('.bxslider2').each(function(i, obj){
		var bx = $(obj).bxSlider({
			  auto: false,
			  autoControls: false,
			  stopAutoOnClick: false,
			  pager: true,
			  pagerType : 'short',
			  slideWidth: 900,
			  touchEnabled:false,
	
			});
		mySlider2.push(bx);
	})
  	

	imgLoading();
	
	
	var lodingTime;

	function imgLoading() {
		lodingTime= setInterval(alertFunc, 10);
	}

	function alertFunc() {
        for(var i = 0; i<mySlider2.length; i++){
   			mySlider2[i].reloadSlider();	
   		}
        clearInterval(lodingTime);
	}
	
	
	
	
	
	
	
	
	$(window).scroll(function() { // 스크롤 이벤트가 발생할 때마다 인식
		/* 오차떄문에 올림을 해줌 오차발생 모르겟음 */		
/* 		console.log(Math.ceil($(window).scrollTop()))
		console.log($(document).height() - $(window).height())
 */				
		if (Math.ceil($(window).scrollTop()) == $(document).height() - $(window).height() || $(window).scrollTop() == $(document).height() - $(window).height()) {
			startPage+=1;
			$.ajax({
				url:"${pageContext.request.contextPath}/board/listAdd",
				type:"get",
				data: {page:startPage},
				dataType:"json",
				success:function(res){
					console.log(res);
					$(res).each(function(i,obj){
						
						var $divBxSlider2=$("<div>").addClass("bxslider2");
						$(obj.contents).each(function(j,content){
							var $divImg=$("<div>").addClass("divImg").css({"float":"left","list-style":"none","position":"relative","width":"710px"});
							var $img = $("<img>").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+content.cImage);
							var $pContents = $("<p>").addClass("form-control").append(content.cContents); 
							var $divText = $("<div>").addClass("divText").append($pContents);
							$divImg.append($img).append($divText);
							$divBxSlider2.append($divImg);
						})
											
						/* .attr("aria-live","polite").css({"width":"100%","height":"300px","overflow":"hidden","position":"relative"}). */
						var $divBxViewPort=$("<div>").addClass("bx-viewport").attr("aria-live","polite").css({"width":"100%","overflow":"hidden","position":"relative"}).append($divBxSlider2);
						var $divBxWrapper=$("<div>").addClass("bx-wrapper").append($divBxViewPort);
						var $divSlideHidden2=$("<div>").addClass("slideHidden2").append($divBxWrapper);
						var $divTextCenter=$("<div>").addClass("text-center").append($divSlideHidden2);
							var iHeart = $("<i>").addClass("fas fa-heart");
							var iHeart2 = $("<i>").addClass("far fa-heart");
							var iComment = $("<i>").addClass("far fa-comment");
							var iShare = $("<i>").addClass("far fa-share-square");
						var $pWhoLike = $("<p>").addClass("whoLike").append("??님 외 ?명이 좋아합니다.");
						var $pIcons = $("<p>").addClass("icons").append(iHeart).append(iHeart2).append(iComment).append(iShare);
						var $h6Title=$("<h6>").addClass("font-weight-bold").append(obj.bTitle);
						var $pContents = $("<p>").addClass("bContents").append(obj.bContents);
						var $pHash = $("<p>").addClass("bHash").append(obj.bHash);
						
						var $divReplysList=$("<div>").addClass("replysList");
						
						$(obj.replys).each(function(i,r){
							console.log(r)
							var $labelId = $("<label>").addClass("id").append(r.rGNo.gId+":");
							var $spanWritetime = $("<span>").append(r.rWritetime).addClass("date");
							var $spanText = $("<span>").addClass("text").append(r.rContent).append($spanWritetime);		
							var $divReply = $("<div>").addClass("reply").append($labelId).append($spanText);
							$divReplysList.append($divReply);
						})
						if(obj.replyCount>5){
							var $aAddReply = $("<a>").addClass("addReply").attr("data-bNo",obj.bNo).append("더보기...");
							var $divAddReply = $("<div>").addClass("divAddReply").append($aAddReply);
							$divReplysList.append($divAddReply);
						}
						var $ulPagination = $("<ul>").addClass("pagination justify-content-center").attr("data-bNo",obj.bNo);
						var $divReplys = $("<div>").addClass("replys").append($divReplysList).append($ulPagination);
						
						var $divCardBody=$("<div>").addClass("card-body").append($divTextCenter).append($pIcons).append($pWhoLike).append($h6Title).append($pContents).append($pHash).append($divReplys);
								var imgSrc = obj.bGNo.gImage;
								var leftSrc = imgSrc.slice(0,21);
								var rightSrc = imgSrc.slice(23,imgSrc.length)
								var $imgGuest = $("<img>").addClass("guestImg").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+leftSrc+"s_"+rightSrc);
							var $h6Id = $("<h6>").append($imgGuest).append(obj.bGNo.gId).addClass("font-weight-bold");
							var $h6bPlace = $("<h6>").append(obj.bPlace).addClass("font-weight-bold"); 
						var $divCardHeader1=$("<div>").addClass("card-header py-3").append($h6Id);
						var $divCardHeader2=$("<div>").addClass("card-header py-3").append($h6bPlace);
						
						var $divCard = $("<div>");
						
						if('${Auth.userid}'!=null){
							var $textAreaReply = $("<textarea>").attr("rows",2).addClass("reply-textArea form-control col-sm-10").attr("data-bno",obj.bNo);
							var $buttonReply = $("<button>").addClass("reply-addBtn btn btn-default active col-sm-1").append("게시").attr("type","button").attr("data-gNo",obj.bGNo.gNo);
							var $divReplyText = $("<div>").addClass("reply-text row").append($textAreaReply).append($buttonReply);
							
							$divCard.addClass("card shadow mb-4").append($divCardHeader1).append($divCardHeader2).append($divCardBody).append($divReplyText);
						}else{
							$divCard.addClass("card shadow mb-4").append($divCardHeader).append($divCardBody);	
						}
						
						var $divCol=$("<div>").addClass("col-lg-12 mb-4").append($divCard);
						
						
						$("#mainScroll").append($divCol);
						
						
						var bx = $($divBxSlider2).bxSlider({
							  auto: false,
							  autoControls: false,
							  stopAutoOnClick: false,
							  pager: true,
							  pagerType : 'short',
							  slideWidth: 900,
							  touchEnabled:false,
					
							});
						mySlider2.push(bx);
					})
					
					imgLoading();
				}
				
			})
			
	    }

	});
	
	$(".guestImg").click(function(){
		var href = $(this).next();
		location.href=$(href).attr("href");
	})
	
})


</script>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4" id="header">
            <%-- <a href="${pageContext.request.contextPath }/board/write" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i>스마트에디터글쓰기</a> --%>
            
          </div>
		  <div class="row ">
          <div class="col-lg-7" id="mainScroll">

            <!-- Content Column -->
            
			<c:forEach var="board" items="${boards }" >
	            <div class="col-lg-12 mb-4">
	              <!-- Illustrations -->
	              <div class="card shadow mb-4">
	                <div class="card-header py-3">
	                <%-- <c:set var="img" value="${board.contents[0].cImage }"/>
		    		<c:set var="imglength" value="${fn:length(img) }"/>
		    	  	 <img src="${pageContext.request.contextPath }/upload/displayFile?filename=${fn:substring(img,0,20)}s_${fn:substring(img,22,imglength) }" > --%>
	                
	                
	                  
	                  <c:if test="${board.bGNo.gImage!=null}">
	                  	<c:set var="gImg" value="${board.bGNo.gImage}"/>
	                  	<c:set var="imglength" value="${fn:length(gImg)}"/>
	                  	<h6 class="font-weight-bold guestInfo"><img src="${pageContext.request.contextPath }/upload/displayFile?filename=${fn:substring(gImg,0,21)}s_${fn:substring(gImg,23,imglength) }" class="guestImg"><a href="${pageContext.request.contextPath }/board/timeLine?gNo=${board.bGNo.gNo}">${board.bGNo.gId }</a></h6>
	                  </c:if>
	                  <c:if test="${board.bGNo.gImage==null}">
	                  	<h6 class="font-weight-bold guestInfo"><img src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg"><a href="${pageContext.request.contextPath }/board/timeLine?gNo=${board.bGNo.gNo}">${board.bGNo.gId }</a></h6>
	                  </c:if>
	                </div>
	                <div class="card-header py-3">
	                  <h6 class="font-weight-bold">${board.bPlace }</h6>
	                </div>
	                
	                <div class="card-body">
	                  <div class="text-center">
	                  <!-- style="visibility:hidden;opacity:0" -->
	                  	<div class="slideHidden2">
		                  <div class="bxslider2">
		                    	<c:forEach var="c" items="${board.contents }">
		                    	<div>
		                    		<div class="divImg">
				                    	<img src="${pageContext.request.contextPath }/upload/displayFile?filename=${c.cImage }">
				                    	
				                    </div>
				                    <div class="divText">
				                    	<p class="form-control">${c.cContents }</p>
				                    </div>
				                </div>
				                </c:forEach>
			              </div>
		                </div>
	                  </div>
					<p class="icons"><i class="fas fa-heart"></i><i class="far fa-heart"></i><i class="far fa-comment"></i><i class="far fa-share-square"></i></p>
					<p class="whoLike">??님 외 ?명이 좋아합니다.</p>
	                <h6 class="font-weight-bold">${board.bTitle }</h6>
					<p class="bContents">${board.bContents }</p>
					<p class="bHash">${board.bHash }</p>
					<div class="replys">
						<div class="replysList">
							<c:if test="${board.replys[0].rNo!=0 }">
								<c:forEach var="r" items="${board.replys }" step="1" begin="0" end="4">
									<div class="reply">
										<label class="id">${r.rGNo.gId } : </label><span class="text">${r.rContent } <span class="date"><fmt:formatDate value="${r.rWritetime }" pattern="yy-MM-dd hh:mm"/></span></span>
									</div>
								</c:forEach>
								<c:if test="${board.replyCount>5}">
								<div class="divAddReply">
									<a class="addReply" data-bNo="${board.bNo}" data-gno="${Auth.userno }">더보기...</a>
								</div>
								</c:if>
							</c:if>
						</div>	
						<ul class="pagination justify-content-center" data-bNo="${board.bNo }">
							
						</ul>
						
					</div>
	                </div>
	                <c:if test="${Auth!=null }">
	                	<div class="reply-text row">
	                		<textarea rows="2" cols="" class="reply-textArea form-control col-sm-10" data-bno="${board.bNo }"></textarea>
	                		<button type="button" class="reply-addBtn btn btn-default active col-sm-1" data-gNo=${Auth.userno }>게시</button>
	                	</div>
                	</c:if>
	              </div>
	
	            </div>
	         </c:forEach>
          </div>
			  <%-- <div id="includeMap">
			  	<%@ include file="../../../resources/SouthKoreaDrillDownMetroDongRegion.jsp" %>
			  </div> --%>
		  </div>
        </div>
        <!-- /.container-fluid -->




<%@ include file="../include/footer.jsp" %>