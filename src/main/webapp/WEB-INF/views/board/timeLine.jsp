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
	#modal-content{
		height: 300px;
		top:100px;
	}
	div.container-fluid{
		margin-top:120px;
	}
	.boardList img{
		width:180px;
		height: 180px;
		margin: 10px;
	}
	#header{
		width: 600px;
	    text-align: center;
	    margin: 0 auto;
	}
	#divCenter{
		margin: 0 auto;
		width:680px;
	}
	
	
	
	/* mouseover이벤트 */
	
		@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
figure.snip1384 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  width: 200px;
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
  font-size: 24px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1384 i.fa-heart{
 bottom: 10px;
  right: 100px;
}
figure.snip1384 i.fa-comment{
 bottom: 10px;
  right: 40px;
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
</style>
<script type="text/javascript">
var startPage=0;

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
		
		
		$(".hover").mouseleave(function () {
		    $(this).removeClass("hover");
		});	
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
												
					})
					
				}
				
			})
			
	    }

	});
</script>

<div class="container-fluid">


  <!-- Page Heading -->
  <div class="align-items-center justify-content-between mb-4">
  	<div class="form-group row" id="header">
  		<div class="col-sm-4">
			<c:if test="${guest.gImage!=null }">
				<img id="profileImg" src="${pageContext.request.contextPath }/upload/displayFile?filename=${guest.gImage }"  class="img-circle profileImg" data-toggle="modal" data-target="#myModal2" width="150" height="150">
			</c:if>  	
		  	<c:if test="${guest.gImage==null }">
		  		<img id="profileImg" src="${pageContext.request.contextPath }/resources/images/boy.png" class="img-circle profileImg" data-toggle="modal" data-target="#myModal2">
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
  <div class="modal fade" id="myModal2" role="dialog">
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
		    		<figure class="snip1384">
		    		<c:set var="img" value="${board.contents[0].cImage }"/>
		    		<c:set var="imglength" value="${fn:length(img) }"/>
		    	  	 <img src="${pageContext.request.contextPath }/upload/displayFile?filename=${fn:substring(img,0,20)}s_${fn:substring(img,22,imglength) }" >
		    	   		<figcaption>
					    <h3>${board.bTitle }</h3>
						<p>${board.bPlace }</p><!-- <i class="ion-ios-arrow-right"></i> -->
						<i class="fas fa-heart"> ${board.replyCount }</i><i class="fas fa-comment"> ${board.bGood }</i>
						<p></p>
					  </figcaption>
					</figure>
		    	</c:forEach>
			</div>
	    </div>
	 </div>
  </div>

</div>
<!-- /.container-fluid -->

<%@ include file="../include/footer.jsp" %>