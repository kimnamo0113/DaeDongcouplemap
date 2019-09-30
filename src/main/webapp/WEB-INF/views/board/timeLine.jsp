<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
 <!-- Begin Page Content -->
 

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style>
	#profileImg{
		cursor: pointer;
	}
	#proFileUpdate label,#proFileUpdate li{
		cursor: pointer;
	}
	#modal-content{
		height: 500px;
	}
	div.container-fluid{
		margin-top:120px;
	}
	.boardList img{
		width:180px;
		height: 180px;
	}
	#header{
		width: 600px;
	    text-align: center;
	    margin: 0 auto;
	}
</style>
<script type="text/javascript">
	
	$(function() {
		$("#uploadProfileImg").change(function(){
			if($(this)[0].files[0]==null){
				return;
			};
			var formData = new FormData();//서버로 보낼 데이터를 담을 공간
			formData.append("file",$(this)[0].files[0]);
			
			console.log(formData)
			$.ajax({
				url:"${pageContext.request.contextPath}/upload/updateProfileImg",
				type:"post",
				data:formData,
				processData:false, //FormData 를 보낼 경우 processData:false, contentType:false처리 필요
				contentType:false,
				success:function(res){
					console.log(res);
					$(".profileImg").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+res);
					$("button.close").click();
				}
			})
			
			
		})
		
	})
</script>

<div class="container-fluid">


  <!-- Page Heading -->
  <div class="align-items-center justify-content-between mb-4">
  	<div class="form-group row" id="header">
  		<div class="col-sm-4">
			<c:if test="${guest.gImage!='' }">
				<img id="profileImg" src="${pageContext.request.contextPath }/upload/displayFile?filename=${guest.gImage }"  class="img-circle profileImg" data-toggle="modal" data-target="#myModal" width="150" height="150">
			</c:if>  	
		  	<c:if test="${guest.gImage=='' }">
		  		<img id="profileImg" src="${pageContext.request.contextPath }/resources/images/boy.png" class="img-circle profileImg" data-toggle="modal" data-target="#myModal">
		  	</c:if>
	  	</div>
	  	<div class="col-sm-6">
	  		<h1 class="h5 mb-0 text-gray-800">${Auth.userid}</h1><br>
	  		<div class="row">
	  		<div class="col-sm-4">
	  			<label>게시글</label><br>
	  		</div>
	  		<div class="col-sm-4">
	  			<label>팔로워</label><br>
	  		</div>
	  		<div class="col-sm-4">
	  			<label>팔로우</label><br>
	  		</div>
	  		</div>
	  		<div class="row">
	  		<div class="col-sm-4">
	  			<label>${bCount }</label><br>
	  		</div>
	  		<div class="col-sm-4">
	  			<label>팔로워</label><br>
	  		</div>
	  		<div class="col-sm-4">
	  			<label>팔로우</label><br>
	  		</div>
	  		</div>
	  	</div>
	  	  	
	</div>
    
    
  </div>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" id="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">프로필 사진 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form enctype="multipart/form-data">
	        <div id="proFileUpdate">
	        	
			  		<label for="uploadProfileImg" class="list-group-item">업로드</label>
					<input type="file" name="file" id="uploadProfileImg" style="display:none">
					<label class="list-group-item">사진 내리기</label>		  		
			  	
	        </div>
		    <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
        </form>
      </div>
      
    </div>
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
		        
		        
		       		<form id="f1" action="insertBoard2" method="post" enctype="multipart/form-data">
			        	  <div id="slideHidden"><div class="bxslider"></div></div>
					  		<label for="imgFile" class="list-group-item">업로드</label>
							<input type="file" name="file" id="imgFile" style="display:none" multiple="multiple">
							<input type="text" class="form-control list-group-item" placeholder="친구 태그하기">
					  		<input type="text" id="hashTag" class="form-control list-group-item" placeholder="검색 키워드">
					  		<div id="hashResult" class="form-contorl"></div><br>
			        </div>
				    <div class="modal-footer">
				   		<button type="button" id="test">test</button>
			          	<button type="submit" class="btn btn-default" data-dismiss="modal">Write</button>
			          	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
		        </form>
		      </div>
		      
		    </div>
		  </div>




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
    	<div class="boardList">
	    	<c:forEach var="board" items="${boards}">
	    	   <img src="${pageContext.request.contextPath }/upload/displayFile?filename=${board.contents[0].cImage}">
	    	</c:forEach>
		</div>
    </div>
  </div>

</div>
<!-- /.container-fluid -->

<%@ include file="../include/footer.jsp" %>