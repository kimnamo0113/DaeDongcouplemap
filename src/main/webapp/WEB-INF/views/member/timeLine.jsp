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
</style>
<script type="text/javascript">
	
	$(function() {
		$("#imgFile").change(function(){
			var formData = new FormData();//서버로 보낼 데이터를 담을 공간
			formData.append("files",$(this));	
			
			$.ajax({
				url:"updateProfileImg",
				type:"post",
				data:formData,
				processData:false, //FormData 를 보낼 경우 processData:false, contentType:false처리 필요
				contentType:false,
				success:function(res){
					console.log(res);
					
				}
			})
			
		})
		
	})
</script>
<div class="container-fluid">

  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
  	<img id="profileImg" src="${pageContext.request.contextPath }/resources/images/boy.png" class="img-circle" data-toggle="modal" data-target="#myModal">
    <h1 class="h5 mb-0 text-gray-800">${Auth.username }</h1>
    <a href="${pageContext.request.contextPath }/board/write" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i>글쓰기</a>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">프로필 사진 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div id="proFileUpdate">
        	<form enctype="multipart/form-data">
		  		<label for="imgFile" class="list-group-item">업로드</label>
				<input type="file" name="file" id="imgFile" style="display:none">		  		
		  	</form>
		  <label class="list-group-item">사진 내리기</label>
        </div>
        <div id="imgBox"></div>
        <div class="modal-footer">
        	
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
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

<%@ include file="../include/footer.jsp" %>