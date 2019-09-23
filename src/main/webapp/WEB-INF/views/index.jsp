<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/writeBtn.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/areaChoice.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/writeBtn.css">
<style>
	.user-up1{
		padding-left: 12px;
		padding-right: 12px;
	}
</style>
<script>
$(function(){

})

  </script>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <c:if test="${Auth!=null }">
            	
  
            </c:if>
            	<a href="${pageContext.request.contextPath }/board/write" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i>스마트에디터글쓰기</a>
                <a href="#" id="write" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#writeModal"><i class="fas fa-download fa-sm text-white-50"></i>글쓰기</a>
                
          </div>

		<!-- Modal -->
		  <div class="modal fade" id="writeModal" role="dialog">

		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
	
			        <div>
			        
				        <div class="modal-header">
				          <h4 class="modal-title">글쓰기</h4>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        <div class="row user-up1">
					        <select name="area" id="area" class="form-control">
					    		<option>지역선택</option>
					    	</select>
					    	<select name="province" id="province" class="form-control"></select>
					    	<select name="gu" id="gu" class="form-control"></select>
					    	<select name="dong" id="dong" class="form-control"></select>
				    	</div>
		        </div>
		        
		       	<form id="writeForm" action="insertBoard2" method="post" enctype="multipart/form-data">
			        <div id="slideHidden"><div class="bxslider"></div></div>
					  		<label for="imgFile" class="list-group-item">업로드</label>
							<input type="file" name="file" id="imgFile" style="display:none" multiple="multiple">
							<input type="text" class="form-control list-group-item" placeholder="친구 태그하기">
					  		<input type="text" id="hashTag" class="form-control list-group-item" placeholder="검색 키워드">
					  		<div id="hashResult" class="form-contorl"></div><br>
			        		<input type="hidden" name="userno" value="${Auth.userno }">
				    <div class="modal-footer">
				   		<button type="button" id="test">test</button>
			          	<input type="submit" class="btn btn-default" value="Write">
			          	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
		        </form>
		      </div>
		      
		    </div>
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
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                
              </div>
            </div>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            


            <div class="col-lg-6 mb-4">

              <!-- Illustrations -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
                </div>
                <div class="card-body">
                  <div class="text-center">
                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="${pageContext.request.contextPath}/resources/bootTemplate/img/undraw_posting_photo.svg" alt="">
                  </div>
                  <p>Add some quality, svg illustrations to your project courtesy of <a target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a constantly updated collection of beautiful svg images that you can use completely free and without attribution!</p>
                  <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on unDraw &rarr;</a>
                </div>
              </div>

              <!-- Approach -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                </div>
                <div class="card-body">
                  <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce CSS bloat and poor page performance. Custom CSS classes are used to create custom components and custom utility classes.</p>
                  <p class="mb-0">Before working with this theme, you should become familiar with the Bootstrap framework, especially the utility classes.</p>
                </div>
              </div>

            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

   


<%@ include file="include/footer.jsp" %>