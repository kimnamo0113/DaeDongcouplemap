<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>    
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
	#icons i{
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
		width:80px;
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
	
	
</style>


<script>
var mySlider2 = [];
var startPage=0;

$(function(){
	$('.bxslider2').each(function(i, obj){
		var bx = $(obj).bxSlider({
			  auto: false,
			  autoControls: false,
			  stopAutoOnClick: false,
			  pager: true,
			  pagerType : 'short',
			  slideWidth: 980,
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
		console.log(mySlider2.length);
        for(var i = 0; i<mySlider2.length; i++){
   			mySlider2[i].reloadSlider();	
   		}
        clearInterval(lodingTime);
	}
	
	
	
	$(document).on("click",".reply-addBtn",function(){
		var rContent=$(this).prev();
		var bNo=$(this).prev().attr("data-bno");
		
		var json = {
				rContent:rContent.val(),
				rBNo:{bNo:bNo},
				rGNo:{gNo:"${Auth.userno}"}
			};
		var data = JSON.stringify(json)
		
		$.ajax({
			url:"${pageContext.request.contextPath}/board/insertReply",
			type:"post",
			data:data,
			dataType:"json",
			headers:{
				"Content-Type":"application/json"
			},
			jsonp: false,
			success:function(res){
				console.log(res);
				var ulObj=$(rContent).parent().prev().find("ul.pagination");
				console.log(ulObj);
				var page=1;
				getReplyListAll(bNo,page,ulObj);
			}
			
		})
	})
	
	
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
		console.log(ulObj);
		var addDivreplysList=$(ulObj).parent().find(".replysList");
		$(addDivreplysList).empty();
		$.ajax({
			url:"${pageContext.request.contextPath}/board/selectReply",
			type:"post",
			data:{bNo:bNo,page:page},
			dataType:"json",
			success:function(res){
				console.log(res);
				
				
				$(res.replys).each(function(i,obj){
					var $labelId = $("<label>").addClass("id").append(obj.rGNo.gId);
					
					var $spanText = $("<span>").addClass("text").append(obj.rContent);
					
					var $spanTime = $("<span>").append(obj.rWritetime);
					$spanText.append($spanTime);
					
					var $divReply = $("<div>").addClass("reply").append($labelId).append($spanText);
					$(addDivreplysList).append($divReply);
					console.log(addDivreplysList.text())
				})
				printPaging(res,ulObj);
			}
		})
	}
	
	function printPaging(res,ulObj){
		$(ulObj).empty();
		console.log(ulObj);
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
	
	
	
	
	
	$(window).scroll(function() { // 스크롤 이벤트가 발생할 때마다 인식
		/* 오차떄문에 올림을 해줌 오차발생 모르겟음 */		
		console.log(Math.ceil($(window).scrollTop()))
		console.log($(document).height() - $(window).height())
				
		if (Math.ceil($(window).scrollTop()) == $(document).height() - $(window).height() || $(window).scrollTop() == $(document).height() - $(window).height()) {
			alert("???");
			startPage+=10;
			$.ajax({
				url:"${pageContext.request.contextPath}/board/listAdd",
				type:"get",
				data: {startPage:startPage},
				dataType:"json",
				success:function(res){
					$(res).each(function(i,obj){
						
						var $divBxSlider2=$("<div>").addClass("bxslider2");
						$(obj.contents).each(function(j,content){
							console.log(content.cImage)			
							var $divImg=$("<div>").addClass("divImg").css({"float":"left","list-style":"none","position":"relative","width":"710px"});
							var $img = $("<img>").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+content.cImage);
							$divImg.append($img);
							$divBxSlider2.append($divImg);
						})
						
					
											
						/* .attr("aria-live","polite").css({"width":"100%","height":"300px","overflow":"hidden","position":"relative"}). */
						var $divBxViewPort=$("<div>").addClass("bx-viewport").attr("aria-live","polite").css({"width":"100%","overflow":"hidden","position":"relative"}).append($divBxSlider2);
						var $divBxWrapper=$("<div>").addClass("bx-wrapper").css("max-width","720px").append($divBxViewPort);
						var $divSlideHidden2=$("<div>").addClass("slideHidden2").append($divBxWrapper);
						var $divTextCenter=$("<div>").addClass("text-center").append($divSlideHidden2);
						var $divCardBody=$("<div>").addClass("card-body").append($divTextCenter);
						
						var $h6Title=$("<h6>").addClass("m-0 font-weight-bold text-primary").append(obj.bTitle);
						var $divCardHeader=$("<div>").addClass("card-header py-3").append($h6Title);
						
						var $divCard=$("<div>").addClass("card shadow mb-4").append($divCardHeader).append($divCardBody);
						
						var $divCol=$("<div>").addClass("col-lg-12 mb-4").append($divCard);
						
						
						$("#mainScroll").append($divCol);
						
						
						var bx = $($divBxSlider2).bxSlider({
							  auto: false,
							  autoControls: false,
							  stopAutoOnClick: false,
							  pager: true,
							  pagerType : 'short',
							  slideWidth: 850,
							  touchEnabled:false,
					
							});
						mySlider2.push(bx);
					})
					
					imgLoading();
				}
				
			})
			
	    }

	});
})


</script>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4" id="header">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <%-- <a href="${pageContext.request.contextPath }/board/write" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i>스마트에디터글쓰기</a> --%>
            
          </div>
		  
          <div class="row col-lg-8" id="mainScroll">

            <!-- Content Column -->
            
			<c:forEach var="board" items="${boards }" >
	            <div class="col-lg-12 mb-4">
	              <!-- Illustrations -->
	              <div class="card shadow mb-4">
	                <div class="card-header py-3">
	                  <h6 class="m-0 font-weight-bold text-primary">${board.bTitle }</h6>
	                </div>
	                
	                <div class="card-body">
	                  <div class="text-center">
	                  <!-- style="visibility:hidden;opacity:0" -->
	                  	<div class="slideHidden2" >
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
					<p id="icons"><i class="fas fa-heart"></i><i class="far fa-heart"></i><i class="far fa-comment"></i><i class="far fa-share-square"></i></p>
					??님 외 ?명이 좋아합니다.
					<p class="bContents">${board.bContents }</p>
					<p class="bHash">${board.bHash }</p>
					<div class="replys">
						<div class="replysList">
							<c:if test="${board.replys[0].rNo!=0 }">
								<c:forEach var="r" items="${board.replys }" step="1" begin="0" end="4">
									<div class="reply">
										<label class="id">${r.rGNo.gId } :</label><span class="text">${r.rContent } <span><fmt:formatDate value="${r.rWritetime }" pattern="yy-MM-dd hh:mm"/></span></span>
									</div>
								</c:forEach>
								<c:if test="${board.replyCount>5}">
								<div class="divAddReply">
									<a class="addReply" data-bNo="${board.bNo}">더보기...</a>
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
	                		<button type="button" class="reply-addBtn btn btn-default active col-sm-1">게시</button>
	                	</div>
                	</c:if>
	              </div>
	
	            </div>
	         </c:forEach>
          </div>

        </div>
        <!-- /.container-fluid -->




<%@ include file="../include/footer.jsp" %>