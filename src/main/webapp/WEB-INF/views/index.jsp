<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="include/header.jsp" %>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style>
	#slideHidden{
		display: none;
	}
	.bx-next, .bx-prev{
		display: none;
	}
	.divImg img{
		margin:0 auto;
	}
	.divImg img{
		max-width : 100%;
		max-height : 100%;
		
	}
	.divImg{
		height: 300px;
	}
	.divText textarea{
		height: 100%;
	}
	.divText{
		height: 100px;
	}
		
	div#hashResult p{
		display: inline-block;
		background-color: #f2f2f2;
		margin-left: 10px;
	}
	
	div#hashResult span img{
		margin-left: 5px;
	    width:10px;
	    height: 10px;
	}
	
</style>

<script>
//서버로 보낼 데이터를 담을 공간
	var formData = new FormData();
//Img bx슬라이드 옵션 정보 담는곳	
	var mySlider;
	
    $(function(){
    	
    	
    	mySlider=$('.bxslider').bxSlider({
    		  auto: false,
    		  autoControls: false,
    		  stopAutoOnClick: false,
    		  pager: true,
    		  pagerType : 'short',
    		  slideWidth: 600,
    		});
    	
/* 글쓰기에서 이미지 업로드시 */    	
    	$("#imgFile").change(function(){
        	console.log($(this))
			$($(this)[0].files).each(function(i,obj){
				var reader = new FileReader();
				reader.onload = function(e){
					var $div = $("<div>");
					var $divImg = $("<div>").addClass("divImg");
					
					var $img =$("<img>").attr("src",e.target.result);
					var $divText = $("<div>").addClass("divText");
					var $textArea =$("<textarea>").addClass("form-control");
					
					$divImg.append($img);
					$divText.append($textArea);
					
					$div.append($divImg).append($divText);
					$(".bxslider").append($div);
					console.log($div)
					formData.append("files",obj);
				}
				reader.readAsDataURL(obj);
				
				
			});
        	imgLoading();
    	})
    	
    	
    	var lodingTime;

    	function imgLoading() {
    		lodingTime= setInterval(alertFunc, 2000);
    	}

    	function alertFunc() {
    		$("#slideHidden").show();
            mySlider.reloadSlider();
            clearInterval(lodingTime);
    	}
    	
    	
/* bx슬라이드 좌우 태그 show/hide */ 
         $(document).on({
       	    mouseenter: function () {
       	    	 $(".bx-next").stop().fadeIn(500);
           		 $(".bx-prev").stop().fadeIn(500);
       	    },
       	    mouseleave: function () {
       	    	 $(".bx-next").stop().fadeOut(500);
            	 $(".bx-prev").stop().fadeOut(500);
       	    }
       	}, ".bx-viewport"); 
         
         $(document).on("mouseover",".bx-next, .bx-prev",function(){
        	 $(".bx-next").stop().fadeIn(500);
       		 $(".bx-prev").stop().fadeIn(500);
         })
/*  */         
         
/* 해시태그 이벤트 */
         function hashPut(){
         	var text=$("#hashTag").val();
         	var $span = $("<span>").html("<img src='${pageContext.request.contextPath}/resources/images/x.png'>");
         	var $p = $("<p>").text("#"+text);
         	
         	
         	
         	$("#hashResult").append($p).append($span);
         	
         	$("#hashTag").val("");
         }
         /* hashTag에서 엔트 */
         $("#hashTag").keydown(function(key) {

         	if (key.keyCode == 13) {
         		hashPut();
         	}

         });
 
     	$(document).on("click","#hashResult span",function(){
			$(this).prev().remove();
			$(this).remove();
		})
/*  */         

/* Enter시 submit되는걸 막기위한 모든 event no */		
         document.addEventListener('keydown', function(event) {
        	  if (event.keyCode === 13) {
        	    event.preventDefault();
        	  };
        	}, true);
    
/*      */
		$(document).on("click","#test",function(){
			console.log(formData);
			for(var item of formData.entries()) {
			  console.log(item[0]); // key, value를 각각 출력
			  console.log(item[1]); // key, value를 각각 출력
			}
		})		
 		$("#f1").submit(function(){
 			e.preventDefault(); //ajax로 처리하므로, submit 안되게 막음
			formData.append("userid",$("input[name='userid']").val());
			$.ajax({
				url:"insertBoard2",
				type:"post",
				data:formData,
				processData:false, //FormData 를 보낼 경우 processData:false, contentType:false처리 필요
				contentType:false,
				success:function(res){
					console.log(res);
					formData = new FormData();
					
				}
			})
 			
 		})
    });
  </script>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <c:if test="${Auth!=null }">
            	
  
            </c:if>
            	<a href="${pageContext.request.contextPath }/board/write" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i>스마트에디터글쓰기</a>
                <a href="#" id="write" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#myModal"><i class="fas fa-download fa-sm text-white-50"></i>글쓰기</a>
                
          </div>

		<!-- Modal -->
		  <div class="modal fade" id="myModal" role="dialog">

		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
	
			        <div id="proFileUpdate">
			        
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