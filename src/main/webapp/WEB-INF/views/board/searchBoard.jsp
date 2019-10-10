<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
 <!-- Begin Page Content -->
<% 
	pageContext.setAttribute("searchType", request.getParameter("searchType"));
	pageContext.setAttribute("keyword", request.getParameter("keyword"));
%>
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
	#header{
		width: 500px;
	    text-align: center;
	    margin: 0 auto;
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
		#header{
			width:360px;
			font-size: 14px;
		}
		.timelineDiv div{
			padding: 1px;
		}
		
		#profileImg{
			width:100px;
			height: 100px;
		}
		 .boardList img{
			width:100px;
			height: 100px;
			margin: 5px;
		}
		figure.snip1384 i {
		  position: absolute;
		  padding: 20px 25px;
		  width:10px;
		  text-align:center;
		  font-size: 13px;
		  opacity: 0;
		  -webkit-transform: translateX(-10px);
		  transform: translateX(-10px);
		}
		figure.snip1384 figcaption {
		  z-index: 1;
		  padding: 20px;
		}
		figure.snip1384 i.fa-heart{
		 bottom: 5px;
		 left: 8px;
		}
		figure.snip1384 i.fa-comment{
		  bottom: 5px;
		  right: 18px;
		}
		figure.snip1384 {
		  font-family: 'Raleway', Arial, sans-serif;
		  position: relative;
		  overflow: hidden;
		  color: #ffffff;
		  text-align: left;
		  float:left;
		  font-size: 13px;
		}
	
		
	}


</style>


<script type="text/javascript">
var startPage=1;
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
	
	var searchType="${searchType}";
	var keyword="${keyword}";
	
	
	$(window).scroll(function() { // 스크롤 이벤트가 발생할 때마다 인식
		
		/* 오차떄문에 올림을 해줌 오차발생 모르겟음 */		
/* 		console.log(Math.ceil($(window).scrollTop()))
		console.log($(document).height() - $(window).height())
 */				
		if (Math.ceil($(window).scrollTop()) == $(document).height() - $(window).height() || $(window).scrollTop() == $(document).height() - $(window).height()) {
			
			startPage+=1;
			$.ajax({
				url:"${pageContext.request.contextPath}/board/searchBoard",
				type:"post",
				data: {page:startPage,searchType:searchType,keyword:keyword},
				dataType:"json",
				success:function(res){
					console.log(res);
					
					$(res).each(function(i,obj){
						var time = new Date(obj.fDate);
						obj.fDate=time.format("yyyy-MM-dd HH:mm");
					})
					
					var source=$("#addTimeLine").html();
					var fn = Handlebars.compile(source);
					var str = fn(res);
					$(".boardList").append(str);		
				}
				
			})
			
	    }
	
	
	
	});
</script>
<script id="addTimeLine" type="text/x-handlebars-template">
	{{#each.}}
   		<figure class="snip1384" data-toggle="modal" data-target="#myModal3">
   	  	 <img src="${pageContext.request.contextPath }/upload/displayFile?filename={{contents.[0].cImage}}" >
   	   		<figcaption data-bNo="{{bNo}}" class="boardDetail">
		    <h3>{{bTitle}}</h3>
			<p>{{bPlace}}</p><!-- <i class="ion-ios-arrow-right"></i> -->
				<i class="fas fa-heart"> {{board.bGood}}</i><i class="fas fa-comment"> {{replyCount}}</i>
			
			<p></p>
		  </figcaption>
		</figure>
   	{{/each}}
</script>
<div class="container-fluid">


  <!-- Page Heading -->
  <div class="align-items-center justify-content-between mb-4">
  	<div class="form-group row" id="header">
  		<div class="col-4">
	  	</div>
	  	<%-- <div class="col-6">
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
	  	</div> --%>
	  	  	
	</div>
    
    
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
		    	   		<figcaption data-bNo="${board.bNo }" class="boardDetail">
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

</div>
<!-- /.container-fluid -->

<%@ include file="../include/footer.jsp" %>