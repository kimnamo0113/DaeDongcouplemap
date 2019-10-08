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
	.boardList img{
		width:180px;
		height: 180px;
		margin: 10px;
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
		.modalBodyLeft{
			-webkit-box-flex: 0 !important;
		    -ms-flex: 0 0 100% !important;
		    flex: 0 0 100% !important;
		    max-width: 100% !important;
		}
		.modalBodyRight{
			-webkit-box-flex: 0 !important;
		    -ms-flex: 0 0 100% !important;
		    flex: 0 0 100% !important;
		    max-width: 100% !important;
		}
		#modal-content{
			min-height:1000px; 
		}
		.divText{
			height: 50px;
			overflow: auto;
		}
	#header {
		width:500px;
	}
	.col-1 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 8.33333%;
    flex: 0 0 8.33333%;
    max-width: 8.33333%;
  }
  .col-2 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 16.66667%;
    flex: 0 0 16.66667%;
    max-width: 16.66667%;
  }
  .col-3 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 25%;
    flex: 0 0 25%;
    max-width: 25%;
  }
  .col-4 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 33.33333%;
    flex: 0 0 33.33333%;
    max-width: 33.33333%;
  }
  .col-5 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 41.66667%;
    flex: 0 0 41.66667%;
    max-width: 41.66667%;
  }
  .col-6 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 50%;
    flex: 0 0 50%;
    max-width: 50%;
  }
  .col-7 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 58.33333%;
    flex: 0 0 58.33333%;
    max-width: 58.33333%;
  }
  .col-8 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 66.66667%;
    flex: 0 0 66.66667%;
    max-width: 66.66667%;
  }
  .col-9 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 75%;
    flex: 0 0 75%;
    max-width: 75%;
  }
  .col-10 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 83.33333%;
    flex: 0 0 83.33333%;
    max-width: 83.33333%;
  }
  .col-11 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 91.66667%;
    flex: 0 0 91.66667%;
    max-width: 91.66667%;
  }
  .col-12 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 100%;
  }
}
@media (max-width: 768px) {
	figcaption h3{
		display: none;
	}

	figure.snip1384 i.fa-heart{
	 bottom: 5px;
	 left: 10px;
	}
	figure.snip1384 i.fa-comment{
	  bottom: 5px;
	  right: 40px;
	}
		figure.snip1384 figcaption {
	  z-index: 1;
	  padding: 20px;
	}
}
@media (max-width: 576px) {
	.reply-text{
		margin: 25px;
	}
}
@media (max-width: 550px) {
	 .boardList img{
			width:130px;
			height: 130px;
			margin: 10px;
		}
}



</style>

<script src="${pageContext.request.contextPath }/resources/js/reply.js"></script>

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
  		<div class="col-4">
	  	</div>
	  	<div class="col-6">
	  		<h1 class="h5 mb-0 text-gray-800">${guest.gId}
	  			<!-- flag 버튼 = 0:관계x(팔로워) 1:요청됨 2:팔로워 3:팔로잉 -->
		  		
	  		</h1>
	  		<br>
	  		<div class="row">
	  		<div class="col-4">
	  			<label>게시글</label><br>
	  		</div>
	  		<div class="col-4">
	  			<label>팔로우</label><br>
	  		</div>
	  		<div class="col-4">
	  			<label>팔로워</label><br>
	  		</div>
	  		</div>
	  		<div class="row">
	  		<div class="col-4">
	  			<label id="boardCount">${bCount }</label><br>
	  		</div>
	  		<div class="col-4">
	  			<label id="followCount">${followCount }</label><br>
	  		</div>
	  		<div class="col-4">
	  			<label id="followerCount">${followerCount }</label><br>
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
		    	   		<figcaption data-bNo="${board.bNo }">
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
  <div class="modal fade" id="myModal3" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" id="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="dBPlace"></h4><br>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
         <div class="modal-body row">
          <div class="col-8 modalBodyLeft">
	          <div class="bxslider3">
	          	
	          </div>
          </div>
          
          <div class="col-4 modalBodyRight">
          	<div>
        		<h5 id="dBTitle"></h5>
	          	<p id="dBContents"></p>
	          	<div id="dReplys" class="replysList form-control">
			          	
				</div>
				
				
				<ul class="pagination justify-content-center">
					</ul>
          	</div>
          	
          	<c:if test="${Auth!=null }">
              	<div class="reply-text row">
              		<textarea rows="2" cols="" class="reply-textArea form-control col-sm-10" data-bNo="${board.bNo }"></textarea>
              		<button type="button" class="reply-addBtn btn btn-default active col-sm-1" data-gNo=${Auth.userno }>게시</button>
              	</div>
            </c:if>
          </div>
        </div>
        
		    <div class="modal-footer">
	        </div>
      </div>
      
    </div>
  </div>
</div>
<!-- /.container-fluid -->

<%@ include file="../include/footer.jsp" %>