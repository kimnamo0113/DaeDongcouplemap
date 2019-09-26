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
			  slideWidth: 720,
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
	
	$(window).scroll(
			function() { // 스크롤 이벤트가 발생할 때마다 인식
				if ( $(window).scrollTop() == $(document).height() - $(window).height() ) {
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
									  slideWidth: 720,
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
		  
          <div class="row col-lg-6" id="mainScroll">

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
					<p id="bContents">${board.bContents }</p>
					<p id="bHash">${board.bHash }</p>
					<p id="replys">
						
					</p>
	                </div>
                	<div class="reply-text row">
                		<textarea rows="2" cols="" class="form-control col-sm-10"></textarea>
                		<button type="button" class="btn btn-default active col-sm-1">게시</button>
                	</div>
	              </div>
	
	            </div>
	         </c:forEach>
          </div>

        </div>
        <!-- /.container-fluid -->




<%@ include file="../include/footer.jsp" %>