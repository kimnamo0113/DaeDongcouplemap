<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
	.bxslider2{
		position: relative;
	}
	
	.icons i{
		font-size:1.5rem;
		margin-right: 10px;
	}
	
	.reply-text{
		margin: 25px;
	}
	
	
	.reply-text button{
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
	
	.guestInfo a{
		text-decoration: none;
		color: #858796;
	}
	.guestInfo a:hover{
		font-size: 1.2rem;
	}
	.addReply{
		cursor: pointer;
	}
	.divImg img{
		cursor: pointer;
	}
	
	.floatRight{
		float: right;
		line-height: 60px;
	}
</style>



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
	
	
	
	$('#myModal3').on('hidden.bs.modal', function () {
		  
		  $(".bxslider3").empty();
		  $("#dBPlace").empty();
		  $("#dBTitle").empty();
		 /*  $("#dReplys").empty();
		  $h5Title = $("<h5>").attr("id","dBTitle")
		  $pContent = $("<dBContents>").attr("id","dBcontents");
		  $("#dReplys").append($h5Title).append($pContent); */
		  
	})
	
	
	
	
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
					console.log(res)
					if(res.boards.length==0){
						startPage-=1;
						return;
					}					
					$(res.boards).each(function(i,obj){
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
							
						var iHeart;
							if(res.likeList[i]!=null){
								iHeart= $("<i>").addClass("fas fa-heart deleteHeart").attr("data-bNo",obj.bNo);	
							}else{
								iHeart= $("<i>").addClass("far fa-heart insertHeart").attr("data-bNo",obj.bNo);
							}
							
							var iComment = $("<i>").addClass("far fa-comment boardDetail").attr("data-toggle","modal").attr("data-target","#myModal3").attr("data-bno",obj.bNo);
							var iShare = $("<i>").addClass("far fa-share-square");
						var $pWhoLike = $("<p>").addClass("whoLike").append("<span>"+obj.bGood+"</span>명이 좋아합니다.").attr("data-bNo",obj.bNo);
						var $pIcons = $("<p>").addClass("icons").append(iHeart).append(iComment).append(iShare);
						/*  */
						var $h6Title=$("<h6>").addClass("font-weight-bold").append(obj.bTitle);
						var $pContents = $("<p>").addClass("bContents").append(obj.bContents);
						var $pHash = $("<p>")
							var beforeHash = obj.bHash;
							var afterHash = beforeHash.split('#');
							for(var i=0; i<afterHash.length; i++){
								var $aHash = $("<a>").addClass("bHash").append(i==0?"":"#"+afterHash[i]).attr("href","/daedong/board/searchBoard?page=1&searchType=all&keyword="+afterHash[i]);
								$pHash.append($aHash);
							}
						
						
						var $divReplysList=$("<div>").addClass("replysList");
						
						$(obj.replys).each(function(i,r){
							var $imgGuest=$("<img>");				
							
							if(r.rGNo.gImage!=null){
								var imgSrc = r.rGNo.gImage;
								var leftSrc = imgSrc.slice(0,21);
								var rightSrc = imgSrc.slice(23,imgSrc.length)
								$imgGuest.addClass("guestImg").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+leftSrc+"s_"+rightSrc);
									
							}else{
								$imgGuest.addClass("guestImg").attr("src","${pageContext.request.contextPath }/resources/images/boy.png");
							}
							var $aId = $("<a>").addClass("id").attr("href","${pageContext.request.contextPath }/board/timeLine?gNo="+r.rGNo.gNo).append(r.rGNo.gId+":");
							
							var $spanWritetime = $("<span>").append(r.rWritetime).addClass("date");
							var $spanText = $("<span>").addClass("text").append(r.rContent).append($spanWritetime);		
							var $divReply = $("<div>").addClass("reply").append($imgGuest).append($aId).append($spanText);
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
							var $imgGuest=$("<img>");
							if(obj.bGNo.gImage!=null){
								var imgSrc = obj.bGNo.gImage;
								var leftSrc = imgSrc.slice(0,21);
								var rightSrc = imgSrc.slice(23,imgSrc.length)
								$imgGuest.addClass("guestImg").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+leftSrc+"s_"+rightSrc);
									
							}else{
								$imgGuest.addClass("guestImg").attr("src","${pageContext.request.contextPath }/resources/images/boy.png");
							}
							var $aId = $("<a>").attr("href","${pageContext.request.contextPath }/board/timeLine?gNo="+obj.bGNo.gNo).append(obj.bGNo.gId);
								
								var $spanWritetime = $("<span>").append((obj.bWritetime+"").slice(0,-5)).addClass("floatRight");
								var $h6Id = $("<h6>").append($imgGuest).append($aId).addClass("font-weight-bold").append($spanWritetime);
							var $h6bPlace = $("<h6>").append(obj.bPlace).addClass("font-weight-bold"); 
						var $divCardHeader1=$("<div>").addClass("card-header py-3").append($h6Id);
						var $divCardHeader2=$("<div>").addClass("card-header py-3").append($h6bPlace);
						
						var $divCard = $("<div>");
						if('${Auth.userid}'!=''){
							var $textAreaReply = $("<textarea>").attr("rows",2).addClass("reply-textArea form-control col-10").attr("data-bno",obj.bNo);
							var $buttonReply = $("<button>").addClass("reply-addBtn btn btn-default active col-1").append("게시").attr("type","button").attr("data-gNo",obj.bGNo.gNo);
							var $divReplyText = $("<div>").addClass("reply-text row").append($textAreaReply).append($buttonReply);
							
							$divCard.addClass("card shadow mb-4").append($divCardHeader1).append($divCardHeader2).append($divCardBody).append($divReplyText);
						}else{
							$divCard.addClass("card shadow mb-4").append($divCardHeader1).append($divCardHeader2).append($divCardBody);	
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
	
	$(document).on("click",".guestImg",function(){
		var href = $(this).next();
		location.href=$(href).attr("href");
	})
	
	
	
	
})


</script>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-flex align-items-center justify-content-between mb-4" id="header">
            <%-- <a href="${pageContext.request.contextPath }/board/write" class="d-none d-inline-block btn btn btn-primary shadow"><i class="fas fa-download fa text-white-50"></i>스마트에디터글쓰기</a> --%>
            
          </div>
		  <div class="row ">
          <div class="col-lg-7" id="mainScroll">

            <!-- Content Column -->
            
			<c:forEach var="board" items="${boards }" varStatus="status">
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
	                  	<h6 class="font-weight-bold guestInfo">
	                  		<img src="${pageContext.request.contextPath }/upload/displayFile?filename=${fn:substring(gImg,0,21)}s_${fn:substring(gImg,23,imglength) }" class="guestImg"><a href="${pageContext.request.contextPath }/board/timeLine?gNo=${board.bGNo.gNo}">${board.bGNo.gId }</a>
	                  		<span class="floatRight">${fn:substring(board.bWritetime,0,16) }</span>
	                  	</h6>
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
	                  
					<p class="icons">
						<c:if test="${likeList[status.count-1]!=null }">
							<i class="fas fa-heart deleteHeart" data-bNo="${board.bNo}"></i>
						</c:if>
						<c:if test="${likeList[status.count-1]==null }">
							<i class="far fa-heart insertHeart" data-bNo="${board.bNo}"></i>
						</c:if>
						<i class="far fa-comment boardDetail" data-toggle="modal" data-target="#myModal3" data-bNo="${board.bNo }"></i>
						<i class="far fa-share-square"></i>
					</p>
					
					<p class="whoLike" data-bNo="${board.bNo }" class="btn"><span>${board.bGood }</span>명이 좋아합니다.</p>
	                <h6 class="font-weight-bold">${board.bTitle }</h6>
					<p class="bContents">${board.bContents }</p>
					
					
					<c:set var="hashs" value="${fn:split(board.bHash,'#')}" />
					<p class="bHashs">
						<c:forEach var="hash" items="${hashs}" varStatus="g">
							<a class="bHash" href="/daedong/board/searchBoard?page=1&searchType=all&keyword=${hash }"">#${hash }</a>	
						</c:forEach> 
					</p>
					
					<div class="replys">
						<div class="replysList">
							<c:if test="${board.replys[0].rNo!=0 }">
								<c:forEach var="r" items="${board.replys }" step="1" begin="0" end="4">
									<div class="reply">
										<span class="text">
											<c:if test="${r.rGNo.gImage!=null}">
												<img src="${pageContext.request.contextPath }/upload/displayFile?filename=${r.rGNo.gImage}" class="guestImg">
											</c:if>
											<c:if test="${r.rGNo.gImage==null}">
												<img src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg">
											</c:if>
											<a href="${pageContext.request.contextPath }/board/timeLine?gNo=${r.rGNo.gNo}">${r.rGNo.gId }</a> :
											${r.rContent } 
												<span class="date"><fmt:formatDate value="${r.rWritetime }" pattern="yy-MM-dd hh:mm"/></span>
											</span> 
										
										
									
										
									</div>
								</c:forEach>
								<c:if test="${board.replyCount>5}">
								<div class="divAddReply">
									<a class="addReply" data-bNo="${board.bNo}" data-gno="${Auth.userno }">더보기...</a>
								</div>
								</c:if>
							</c:if>
						</div>	
						<ul class="pagination justify-content-center ulReply" data-bNo="${board.bNo }">
							
						</ul>
						
					</div>
	                </div>
	                <c:if test="${Auth!=null }">
	                	<div class="reply-text row">
	                		<textarea rows="2" cols="" class="reply-textArea form-control col-10" data-bno="${board.bNo }"></textarea>
	                		<button type="button" class="reply-addBtn btn btn-default active col-2" data-gNo=${Auth.userno }>게시</button>
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