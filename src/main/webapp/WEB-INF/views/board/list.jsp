<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style>
</style>
<script>
var mySlider2;

$(function(){
	$('.bxslider2').bxSlider({
		  auto: false,
		  autoControls: false,
		  stopAutoOnClick: false,
		  pager: false,
		  pagerType : 'short',
		  slideWidth: 600,
		  touchEnabled:false,
		  onSliderLoad: function(){ 
			  $(".slideHidden2").css("visibility", "visible").animate({opacity:1}); 
		  }

		});
   
   	$("#testButton").click(function(){
   		imgLoading2();
   	})

   	var boardLodingTime;

	function imgLoading2() {
		boardLodingTime= setInterval(alertFunc2, 2000);
	}
	function alertFunc2() {
		$(".slideHidden2").show();
        mySlider2.reloadSlider();
        clearInterval(boardLodingTime);
	}
	
})
</script>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4" id="header">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <%-- <a href="${pageContext.request.contextPath }/board/write" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i>스마트에디터글쓰기</a> --%>
            
          </div>

		
				 		
          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            

            <!-- Earnings (Monthly) Card Example -->
            

            <!-- Earnings (Monthly) Card Example -->
            

            <!-- Pending Requests Card Example -->
            
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            

            <!-- Pie Chart -->
        <!--     <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                Card Header - Dropdown
                
              </div>
            </div> -->
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            
			<button id="testButton">샹</button>
			<c:forEach var="board" items="${boards }" >
	            <div class="col-lg-6 mb-4">
	              <!-- Illustrations -->
	              <div class="card shadow mb-4">
	                <div class="card-header py-3">
	                  <h6 class="m-0 font-weight-bold text-primary">${board.bTitle }</h6>
	                </div>
	                
	                <div class="card-body">
	                  <div class="text-center">
	                  	<div class="slideHidden2" style="visibility:hidden;opacity:0">
		                  <div class="bxslider2">
		                    	<c:forEach var="c" items="${board.contents }">
				                    	<img src="${pageContext.request.contextPath }/upload/displayFile?filename=${c.cImage }">
				                </c:forEach>
			              </div>
		                
		                </div>
	                  </div>
	                </div>
	                
	              </div>
	
	            </div>
	         </c:forEach>
          </div>

        </div>
        <!-- /.container-fluid -->




<%@ include file="../include/footer.jsp" %>