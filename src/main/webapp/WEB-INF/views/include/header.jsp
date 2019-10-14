<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">


  <title>대동연애지도</title>
  
    
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.2.0/handlebars.min.js"></script>


  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/resources/bootTemplate/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  
  <link href="${pageContext.request.contextPath }/resources/bootTemplate/css/sb-admin-2.css" rel="stylesheet">
  
  
<script src="${pageContext.request.contextPath }/resources/js/writeBtn.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/areaChoice.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/writeBtn.css">

<script src="${pageContext.request.contextPath }/resources/js/reply.js"></script>
<style type="text/css">
	i{
		cursor: pointer;
	}
	a{
		color:black;
		cursor: pointer;
		text-decoration: none;
	}
	
	a:hover{
		text-decoration: none;
	}
	#likeModal{
		z-index: 1000000;
	}
	#likeModal{
		top:100px;
	}
	#likeModal .modal-dialog{
		width:250px;
		margin: 0 auto;
	}
	#likeModal .modal-body{
		max-height: 300px;
		overflow: auto;
	}
	.dropdown-item{
		cursor: pointer;
	}
	.whoLike span{
		font-weight: bold;
	}
	.whoLike{
		cursor: pointer;
		height: 30px;
		display: inline-block;
	}
	.whoLike:hover{
		font-size: 1.2rem;
	}
	.text a { 
		color:black;
		text-decoration: none;
	}
	
	/* timeLine과 list의 공용 소스 modal3안에꺼*/
	
	#myModal3 #modal-content{
			min-height:1000px; 
	}
	#myModal3 .modal-dialog{
		max-width:100%;
	}
	.divText{
			height: 60px;
			overflow: auto;
		}
	#header {
		width:500px;
	}
	
	#followModal #modal-content,#followerModal #modal-content{
		height:600px;
		width: 370px !important;
		margin:0 auto;
	}
	.followScroll, .followerScroll{
		overflow: auto;
		height: 500px;
		width: 360px;
	}
	#dReplys{
		height: 250px;
		overflow: auto;
	}
	/*  */
	
	
	#hanbandoImg{
		width:50px;
		height:50px;
		cursor: pointer;
	}
	#logoutToggle li a{
		text-decoration: none;
	}
	#logoutToggle li:hover{
		font-size: 20px;
	}
	#map{
		z-index:99999;
		position: absolute;
		top:100px;
		left: 100px;
		display: none;
	}
	.profileImg{
		border-radius: 50% 50% 50% 50%;
		border:1px solid #ccc;
	}
	
	nav.navbar{
		position: fixed;
		top:0;
		z-index:10000;
	}
	ul.sidebar{
		z-index:10001;
		
	}
	.topbar .nav-item .nav-link{
		padding:0.5rem;
	}
	#searchText2{
		max-width: 130px !importants;
	}
	#right{
		width:400px;
		float: right;
	}
	#searchType{
		flex:0.3 0.3 auto;
		margin-right:2px;
	}
	#friendAlarmDropDownDiv{
		left:-200px;
	}
	#boardAlarmDropDownDiv{
		left:-200px;
	}
	
	.unreadBackGround{
		background: #BEEFFF;
	}
	
	.divAlarmList{
		max-height:400px;
		width:100%;
		overflow: auto;
	}	

	.searchText{
		height: auto;
	}
	.guestImg{
		border-radius: 50% 50% 50% 50%;
		border:1px solid #ccc;
		width:50px;
		height: 50px;
		margin-right:10px;
		cursor: pointer;
		margin-bottom: 10px;
	}
	
	
	#logoutToggle{
		margin-right:300px !important;
	}
	#writeModal{
		left:10%;
	}

	form.navbar-search{
		margin-left:auto !important;
		margin-right:10px !important;
	}
	#friendSearchList{
		width: 100%;
    	left: 0px;
    	height: 300px;
    	overflow: auto;
	}
	#friendSearchList2{
		width: 100%;
		left:0px;
    	height: 300px;
    	overflow: auto;
	}
	#searchDropdown select{
		width: 10px;
	}
	#searchDropdown{
		width:280px;
	}

	
	.friendsList{
		color: white;
		text-decoration: none;
	}
	.friendsList:hover{
		color: white;
		text-decoration: none;
	}
	ul#accordionSidebar{
		position: fixed;
	}
	
	li#liFriendsList{
		height: 300px;
		overflow-y:scroll;
 
	}
	li#liFriendsList::-webkit-scrollbar {
	    display: none;
	}
	
	#writeModal::-webkit-scrollbar {
	    display: none;
	}
	
	#liFriendsList p{
		margin-bottom: 0px;
		padding-top:0px;
		padding-bottom:0px;
	}	
	.sidebar-heading{
		margin-bottom:10px;
	}
	nav.navbar{
		-webkit-box-flex:0;
		-ms-flex:0 0 100%;
		flex:0 0 100%;
		max-width:100%;
		width:100%;
	}
	#dBRow{
		height: 30px;
		margin-bottom:10px;
	}

	@media (max-width: 1299px) {
		nav.navbar{
			-webkit-box-flex:0;
			-ms-flex:0 0 100%;
			flex:0 0 100%;
			max-width:102%;
			width:102%;
		}
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
	
	}
		@media (min-width: 769px) {
		nav.navbar{
			-webkit-box-flex:0;
			-ms-flex:0 0 100%;
			flex:0 0 100%;
			max-width:100%;
			width:95%;
		}
		#myModal3 .modal-dialog{
			width:60%;
			margin: 1.75rem 200px;
		}
		#writeModal{
			width:80%;
			margin: 1.75rem 50px;
		}
	}
	@media (max-width:700px){
		#logoutToggle{
			margin-right:100px !important;
		}	
		#writeModal{
			width100%;
			left:0;
		}		
	}
	@media (max-width: 576px) {
		.reply-text{
			margin: 25px;
		}
		#searchDropdown{
			left:0px;
		}
	}
@media (max-width: 550px) {
 	.boardList img{
		width:130px;
		height: 130px;
		margin: 10px;
	}
	.dropdown-menu {
		left: 30px !important;
	}
	.dropdown-list {
		left: 30px !important;
	}
	.topbar .dropdown-list {
   		left:30 !important;
  	}
	#followModal #modal-content,#followerModal #modal-content{
		height:600px;
		width: 80% !important;
		margin:0 auto;
	}
	.followScroll, .followerScroll{
		overflow: auto;
		height: 500px;
		width: 80%;
	}

}
	.bx-wrapper{
		margin-bottom:20px;
	}

	
</style>
<!-- Bootstrap core JavaScript-->

<script id="friendTemp" type="text/x-handlebars-template">
		<h6 class="dropdown-header">
	    	Friend Alarm
	    </h6>
		<div class="divAlarmList">
		{{#each.}}
			{{#if fRead 0}}
			    <a class="checkFriendMessage unreadBackGround dropdown-item d-flex align-items-center" href="timeLine?gNo={{follow.gNo}}" data-fRead="1" data-gNo="{{follow.gNo}}">
			{{/if}}
			{{#if fRead 1}}
				<a class="dropdown-item d-flex align-items-center" href="timeLine?gNo={{follow.gNo}}">
			{{/if}}
			{{#if fRead 3}}
				<a class="checkFriendMessage unreadBackGround dropdown-item d-flex align-items-center" href="timeLine?gNo={{follow.gNo}}" data-fRead="4" data-gNo="{{follow.gNo}}">
			{{/if}}
			  
			  <div class="mr-3">
			    <div>
				  {{#if follow.gImage null}}
					<img id="profileImgSmall" src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg">					
				  {{else}}
					<img src="${pageContext.request.contextPath }/upload/displayFile?filename={{follow.gImage}}" class="guestImg">
				  {{/if}}
			    </div>
			  </div>
			  <div>
			    <div class="small text-gray-500" row>{{fDate}}</div>
					{{#if fRead 0}}
			    		<span class="font-weight-bold">{{follow.gId}}</span>님이 회원님을 팔로우 하셨습니다.</span>
						<div>
							<button class="btn btn-primary btn friendAccept" data-gNo="{{follow.gNo}}" data-fRead="0">수락</button>
							<button class="btn btn-light btn friendRemove" data-gNo="{{follow.gNo}}" data-fRead="2">삭제</button>
						</div>
					{{/if}}
					{{#if fRead 1}}
			    		<span class="font-weight-bold">{{follow.gId}}</span>님이 회원님을 팔로우 하셨습니다.
						<div>
							<button class="btn btn-primary btn friendAccept" data-gNo="{{follow.gNo}}" data-fRead="1">수락</button>
							<button class="btn btn-light btn friendRemove" data-gNo="{{follow.gNo}}" data-fRead="2">삭제</button>
						</div>
					{{/if}}
					
					{{#if fRead 3}}
			    		<span class=" font-weight-bold">{{follow.gId}}</span>님이 팔로우요청을 수락 하셨습니다.
					{{/if}}
				
			  </div>
			</a>
		{{/each}}
		<div>
		<p class="dropdown-item text-center small text-gray-500" id="addFriendAlarmList">Show Add Alerts</p>
	</script>
	
	
	
<!-- 종 알림 -->
<script id="boardTemp" type="text/x-handlebars-template">
	{{#each.}}
		{{#if rContent 'l'}}
			{{#if rRead 0}}
			    <a class="checkBoardMessage boardDetail unreadBackGround dropdown-item d-flex align-items-center"  data-read="{{rRead}}" data-bNo="{{rBNo.bNo}}" data-upRead="1" data-flag="{{rContent}}" data-rNo="{{rNo}}" data-gNo="{{rGNo.gNo}}" data-toggle="modal" data-target="#myModal3" href="">
			{{/if}}
			{{#if rRead 1}}
				<a class="boardDetail dropdown-item d-flex align-items-center" data-rNo="{{rNo}}" data-flag="{{rContent}}" data-bNo="{{rBNo.bNo}}" data-gNo="{{rGNo.gNo}}" data-toggle="modal" data-target="#myModal3" href="">
			{{/if}}
		{{/if}}
		{{#if rContent 'r'}}
			{{#if rRead 0}}
			    <a class="checkBoardMessage boardDetail unreadBackGround dropdown-item d-flex align-items-center"  data-read="{{rRead}}" data-bNo="{{rBNo.bNo}}" data-upRead="1" data-flag="{{rContent}}" data-rNo="{{rNo}}" data-gNo="{{rGNo.gNo}}" data-toggle="modal" data-target="#myModal3" href="">
			{{/if}}
			{{#if rRead 1}}
				<a class="dropdown-item boardDetail d-flex align-items-center" data-rNo="{{rNo}}" data-flag="{{rContent}}" data-gNo="{{rGNo.gNo}}" data-bNo="{{rBNo.bNo}}" data-toggle="modal" data-target="#myModal3" href="">
			{{/if}}
		{{/if}}
			  <div class="mr-3">
			    <div>
				  {{#if rGNo.gImage null}}
					<img id="profileImgSmall" src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg">					
				  {{else}}
					<img src="${pageContext.request.contextPath }/upload/displayFile?filename={{rGNo.gImage}}" class="guestImg">
				  {{/if}}
			    </div>
			  </div>
			  <div class="row">
			    <div class="col-12 small text-gray-500">{{rWritetime}}</div>
					{{#if rContent 'r'}}
			    		<div class="col-9"><span class="font-weight-bold">{{rGNo.gId}}</span>님이 <span class="font-weight-bold">{{rBNo.bTitle}}</span>글에 댓글을 달았습니다.</div>
						<div class="col-3">
							<button class="btn btn-light btn checkBoardMessage" data-read="{{rRead}}" data-upRead="2" data-flag="{{rContent}}" data-rNo="{{rNo}}">삭제</button>
						</div>
					{{/if}}
					{{#if rContent 'l'}}
			    		<div class="col-9"><span class="font-weight-bold">{{rGNo.gId}}</span>님이 <span class="font-weight-bold">{{rBNo.bTitle}}</span>글을 좋아합니다.</div>
						<div class="col-3">
							<button class="btn btn-light btn checkBoardMessage" data-read="{{rRead}}" data-upRead="2" data-flag="{{rContent}}" data-rNo="{{rNo}}"">삭제</button>
						</div>
					{{/if}}
				
			  </div>
			</a>
	{{/each}}
</script>

	
	
<script type="text/javascript">
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
 
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};



	var test="";
	
	Handlebars.registerHelper('if', function(v1, v2, options) {
		  if(v1 == v2) {
		    return options.fn(this);
		  }
		  return options.inverse(this);
		});
	

	
	$(function() {
		
		var width_size = window.outerWidth-16;
		 if ($(".sidebar").hasClass("toggled")) {
		      $('.sidebar .collapse').collapse('hide');
		      
		      if(width_size <= 767){
		    	  	$("#page-top").addClass("sidebar-toggled");
					$("#accordionSidebar").addClass("toggled");
					$("#content").css("margin-left","0px");
			  }else{
					$("#content").css("margin-left","110px");
			}
		 }else{
		      if(width_size <= 767){
		    	  	$("#page-top").addClass("sidebar-toggled");
					$("#accordionSidebar").addClass("toggled");
					$("#content").css("margin-left","0px");
			 }else{
					$("#content").css("margin-left","220px");
			 }
		 }
		
		$(window).resize(function(){
			width_size = window.outerWidth-16;
			 if ($(".sidebar").hasClass("toggled")) {
			      $('.sidebar .collapse').collapse('hide');
			      
			      if(width_size <= 767){
			    	  	$("#page-top").addClass("sidebar-toggled");
						$("#accordionSidebar").addClass("toggled");
						$("#content").css("margin-left","0px");
					}else{
						$("#content").css("margin-left","110px");
					}
			    }else{
			      if(width_size <= 767){
			    	  	$("#page-top").addClass("sidebar-toggled");
						$("#accordionSidebar").addClass("toggled");
						$("#content").css("margin-left","0px");
					}else{
						$("#content").css("margin-left","220px");
					}
			    }
		})
		
		$("#sidebarToggleTop").click(function(){
			var length = $(".bxslider2").length;
			for(var i=0; i<length; i++){
				mySlider2[i].reloadSlider();
			}
		})
		
		
		$("#hanbandoImg").click(function(){
			/* var scX = window.screenLeft;
			var scY = window.screenTop;
			var position=$(this).offset(); */
			/* window.open("http://www.naver.net", "네이버새창", "top="+position.top+",left="+position.left+"  width=500, height=500,left=300,top=300, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); */
			/* window.open('http://localhost:8080/daedong/map', '네이버', "location=no,width=500, height=500, left=" + Number(scX+position.left+80)+ ", top=" + Number(scY+position.top)); */
			
			$("#map").toggle();
			$("#map").empty();
			$("#map").load("${pageContext.request.contextPath}/resources/SouthKoreaDrillDownMetroDongRegion.jsp");
		})
		
		
		$("#test").click(function(){
			alert(test);
		})

		
		function searchFunc(){
			var select = $("select[name='searchType']").val();
			var keyword=$("#searchText").val();
			if(select=='friend'){
				
			}else{
				location.href="searchBoard?page=1&searchType="+select+"&keyword="+keyword;	
			}
			
		}
		
		$("#searchType").change(function(){
			var searchType = $(this).val();
			if(searchType=='friend'){
				$("#searchText").addClass("searchFriend");
				
			}else{
				$("#searchText").removeClass("searchFriend");
				$("#friendSearchList").removeClass("show");
			}
			
		})
		$("#searchType2").change(function(){
			var searchType = $(this).val();
			if(searchType=='friend'){
				$("#searchText2").addClass("searchFriend2");
				
			}else{
				$("#searchText2").removeClass("searchFriend2");
				$("#friendSearchList2").removeClass("show");
			}
			
		})
		
		
		$("#friendSearchList").mouseleave(function(){
			if($(this).hasClass("show")){
				$(this).removeClass("show");
			}
		})
		$("#friendSearchList2").mouseleave(function(){
			if($(this).hasClass("show")){
				$(this).removeClass("show");
			}
		})
		
        /*  $(document).on({mouseenter: function () {
         },
         mouseleave: function () {
        	if($(this).hasClass("show")){
 				$(this).removeClass("show");
 			}
         }
         }, "#friendSearchList"); 
		 */
		
		
		$(document).on("propertychange change keyup paste input",".searchFriend",function(){
			
			var select = $("select[name='searchType']").val();
			var keyword=$(this).val();
			$("#friendSearchList").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/member/searchFriend",
				type:"get",
				dataType:"json",
				data:{page:1,keyword:keyword},
				success:function(res){
					console.log(res)
					$("#friendSearchList").addClass("show");
					$(res).each(function(i,obj){
						
						var $img;
						if(obj.gImage!=null){
							$img = $("<img>").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+obj.gImage).addClass("guestImg");	
						}else{
							$img = $("<img>").attr("src","${pageContext.request.contextPath }/resources/images/boy.png").addClass("guestImg");
						}
						
						var $aId = $("<a>").append($img).append(obj.gId).attr("href","${pageContext.request.contextPath }/board/timeLine?gNo="+obj.gNo);		
						var $p = $("<p>").append($aId);
						$("#friendSearchList").append($p);	
					})
					
					
				}
			})
			
		})
		$(document).on("propertychange change keyup paste input",".searchFriend2",function(){
			
			var select = $("select[name='searchType2']").val();
			var keyword=$(this).val();
			$("#friendSearchList2").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/member/searchFriend",
				type:"get",
				dataType:"json",
				data:{page:1,keyword:keyword},
				success:function(res){
					console.log(res)
					$("#friendSearchList2").addClass("show");
					$(res).each(function(i,obj){
						
						var $img;
						if(obj.gImage!=null){
							$img = $("<img>").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+obj.gImage).addClass("guestImg");	
						}else{
							$img = $("<img>").attr("src","${pageContext.request.contextPath }/resources/images/boy.png").addClass("guestImg");
						}
						
						var $aId = $("<a>").append($img).append(obj.gId).attr("href","${pageContext.request.contextPath }/board/timeLine?gNo="+obj.gNo);		
						var $p = $("<p>").append($aId);
						$("#friendSearchList2").append($p);	
					})
					
					
				}
			})
			
		})
		
		$("#searchBtn").click(function(){
			searchFunc()
		})
		
		$("#searchText").keydown(function(key) {

	      	if (key.keyCode == 13) {
	      		searchFunc();
	       	}

	    });
		function searchFunc2(){
			var select = $("select[name='searchType2']").val();
			var keyword=$("#searchText2").val();
			location.href="searchBoard?page=1&searchType="+select+"&keyword="+keyword;
		}
		
		$("#searchBtn2").click(function(){
			searchFunc2()
		})
		
		$("#searchText2").keydown(function(key) {

	      	if (key.keyCode == 13) {
	      		searchFunc2();
	       	}

	    });
		
		
		var startPage=1;
		
		$(".dropdown").on("hide.bs.dropdown", function() {
			startPage=1;
		});
		
		$("#friendAlarmDropdown").click(function(){
			$("#friendAlarmDropDownDiv").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/friend/alarmList",
				type:"post",
				dataType:"json",
				data:{gNo:'${Auth.userno}',page:1},
				success:function(res){
					console.log(res)
					
					$(res).each(function(i,obj){
						var time = new Date(obj.fDate);
						obj.fDate=time.format("yyyy-MM-dd HH:mm");
						
					})
					var source=$("#friendTemp").html();
					var fn = Handlebars.compile(source);
					var str = fn(res);
					$("#friendAlarmDropDownDiv").append(str);
					
				}
			})
		})
		$("#addFriendAlarmList").click(function(){
			startPage++;
			$.ajax({
				url:"${pageContext.request.contextPath}/friend/alarmList",
				type:"post",
				dataType:"json",
				data:{gNo:"${Auth.userno}",page:startPage},
				success:function(res){
					console.log(res)
					
					$(res).each(function(i,obj){
						var time = new Date(obj.fDate);
						obj.fDate=time.format("yyyy-MM-dd HH:mm");
						
					})
					var source=$("#friendTemp").html();
					var fn = Handlebars.compile(source);
					var str = fn(res);
					$("#friendAlarmDropDownDiv").append(str);
					
				}
			})
			
		})
		
		
		
		
		/* 종 알람 */
		$("#boardAlarmDropdown").click(function(){
			$("#boardAlarmList").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/board/alarmList",
				type:"post",
				dataType:"json",
				data:{gNo:"${Auth.userno}",page:1},
				success:function(res){
					console.log(res)
					
					$(res).each(function(i,obj){
						var time = new Date(obj.rWritetime);
						obj.rWritetime=time.format("yyyy-MM-dd HH:mm");
						
					})
					var source=$("#boardTemp").html();
					var fn = Handlebars.compile(source);
					var str = fn(res);
					$("#boardAlarmList").append(str);
					
				}
			})
		})
	
		$("#addBoardAlarmList").click(function(){
			startPage++;
			$.ajax({
				url:"${pageContext.request.contextPath}/board/alarmList",
				type:"post",
				dataType:"json",
				data:{gNo:"${Auth.userno}",page:startPage},
				success:function(res){
					console.log(res)
					
					$(res).each(function(i,obj){
						var time = new Date(obj.rWritetime);
						obj.rWritetime=time.format("yyyy-MM-dd HH:mm");
						
					})
					var source=$("#boardTemp").html();
					var fn = Handlebars.compile(source);
					var str = fn(res);
					$("#boardAlarmList").append(str);
					
				}
			})
			return false;
		})
		
	/*  $('#boardAlarmList').scroll(function () {
       
	      //스크롤 끝까지 닿으면 새로운 데이터 50개를 불러온다       
	      var dh = $('#boardAlarmEnd').height();
	      var wt = $('#boardAlarmList').scrollTop();
	 		
	      console.log("dh:"+dh);
	      console.log("wt:"+wt);
	      if (dh == (wt+133)) {
	         alert("??")
      	  }
	 }) */
		
		
		
		$(document).on("click",".friendAccept",function(){
			
			$.ajax({
				url:"/daedong/friend/followAccept",
				type:"post",
				data:{follow:'${Auth.userno}',follower: $(this).attr("data-gNo"),fRead:$(this).attr("data-fRead")},
				dataType:"text",
				success:function(res){
					console.log(res);
				}
				
			})
			location.reload()
			return false;
		})
		$(document).on("click",".friendRemove",function(){
			$.ajax({
				url:"/daedong/friend/followUpdate",
				type:"post",
				data:{follow:'${Auth.userno}',follower:$(this).attr("data-gNo"),fRead:$(this).attr("data-fRead")},
				dataType:"text",
				success:function(res){
					console.log(res);
					
				}
			})
			location.reload()
			return false;
		})
		
		
		$(document).on("click",".checkFriendMessage",function(){
			$.ajax({
				url:"/daedong/friend/followUpdate",
				type:"post",
				data:{follow:'${Auth.userno}',follower:$(this).attr("data-gNo"),fRead:$(this).attr("data-fRead")},
				dataType:"text",
				success:function(res){
					console.log(res);
					
				}
			})
		})
		$(document).on("click",".checkBoardMessage",function(){
			/* rNo로 하였지만 r이나 l 둘다 rNo로 저장하고 flag로 구별 */
			var rNo = $(this).attr("data-rNo");
			var flag = $(this).attr("data-flag");
			var read = $(this).attr("data-read");
			var upRead = $(this).attr("data-upRead");
			if(flag=="l"){
				$.ajax({
					url:"/daedong/board/likeRead",
					type:"post",
					data:{lNo:rNo,read:upRead},
					dataType:"text",
					success:function(res){
						console.log(res);
						
					}
					
				})	
			}else{
				$.ajax({
					url:"/daedong/board/replyRead",
					type:"post",
					data:{rNo:rNo,read:upRead},
					dataType:"text",
					success:function(res){
						console.log(res);
						
					}
					
				})
			}
			
			/* read 0 upRead 1,2 */
			if(read==0 && (upRead==1 || upRead==2)){
				var boardAlarmCount = $("#boardAlarmCount").text();
				$("#boardAlarmCount").text(Number(boardAlarmCount)-1);	
			}
			
			if(upRead==2){
				$(this).closest(".dropdown-item").remove();
				return false;
			}
			
			
			
			
		})
		
		/* setInterval(function() {
	    var elem = document.getElementById('accordionSidebar');
		    if (elem.classList.contains("toggled")) {
		    	$("div#content").css("margin-left","110px");
		    }else{
		    	$("div#content").css("margin-left","230px");
		    }
		}, 500); */
		
		
		$(document).on("click",".insertHeart",function(){
			var bNo = $(this).attr("data-bNo");
			if('${Auth}'==''){
				alert("로그인을 해주세요.")
				return ;
			}
			
			var $thisObj = this;
			$.ajax({
				url:"/daedong/board/insertHeart",
				type:"post",
				data: {bNo:bNo,gNo:'${Auth.userno}'},
				dataType:"text",
				success:function(res){
					$($thisObj).removeClass("far insertHeart").addClass("fas deleteHeart");
					$(".icons .fa-heart[data-bNo="+bNo+"]").removeClass("far insertHeart").addClass("fas deleteHeart");
					var bGood = $($thisObj).parent().next().find("span").text();
					bGood = Number(bGood)+1;
					$($thisObj).parent().next().find("span").text(bGood);
					$(".whoLike[data-bNo="+bNo+"]").find("span").text(bGood);
				}
			})	
		})
		$(document).on("click",".deleteHeart",function(){
			var bNo = $(this).attr("data-bNo");
			var $thisObj = this;
			$.ajax({
				url:"/daedong/board/deleteHeart",
				type:"post",
				data: {bNo:bNo,gNo:'${Auth.userno}'},
				dataType:"text",
				success:function(res){
					$($thisObj).removeClass("fas deleteHeart").addClass("far insertHeart");
					$(".icons .fa-heart[data-bNo="+bNo+"]").removeClass("fas deleteHeart").addClass("far insertHeart");
					var bGood = $($thisObj).parent().next().find("span").text();
					bGood = Number(bGood)-1;
					$($thisObj).parent().next().find("span").text(bGood);
					$(".whoLike[data-bNo="+bNo+"]").find("span").text(bGood);
				}
			})
		})
		var startLikePage=1;
		$(document).on("click",".whoLike",function(){
			var bNo=$(this).attr("data-bNo");
			$("#likeModal").show();
			$.ajax({
				url:"/daedong/board/likeListLimit10",
				type:"post",
				data: {bNo:bNo,page:1},
				dataType:"json",
				success:function(res){
					console.log(res)
					$("#addLikeList").attr("data-bNo",bNo);
					$(res).each(function(i,obj){
						var $imgGuest=$("<img>");
						if(obj.lGNo.gImage!=null){
							var imgSrc = obj.lGNo.gImage;
							var leftSrc = imgSrc.slice(0,21);
							var rightSrc = imgSrc.slice(23,imgSrc.length)
							$imgGuest.addClass("guestImg").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+leftSrc+"s_"+rightSrc);
								
						}else{
							$imgGuest.addClass("guestImg").attr("src","${pageContext.request.contextPath }/resources/images/boy.png");
						}
						var $aId = $("<a>").attr("href","${pageContext.request.contextPath }/board/timeLine?gNo="+obj.lGNo.gNo).append(obj.lGNo.gId);
						var $h6Id = $("<h6>").append($imgGuest).append($aId).addClass("font-weight-bold");
						
						$("#likeModal .modal-body").append($h6Id);
					})
					
				}
			})
		})
		$("#addLikeList").click(function(){
			startLikePage++;
			var bNo=$(this).attr("data-bNo");
			$("#likeModal").show();
			$.ajax({
				url:"/daedong/board/likeListLimit10",
				type:"post",
				data: {bNo:bNo,page:startLikePage},
				dataType:"json",
				success:function(res){
					console.log(res)
					var $imgGuest;
					$(res).each(function(i,obj){
						var $imgGuest=$("<img>");
						if(obj.lGNo.gImage!=null){
							var imgSrc = obj.lGNo.gImage;
							var leftSrc = imgSrc.slice(0,21);
							var rightSrc = imgSrc.slice(23,imgSrc.length)
							$imgGuest.addClass("guestImg").attr("src","${pageContext.request.contextPath }/upload/displayFile?filename="+leftSrc+"s_"+rightSrc);
								
						}else{
							$imgGuest.addClass("guestImg").attr("src","${pageContext.request.contextPath }/resources/images/boy.png");
						}
						var $aId = $("<a>").attr("href","${pageContext.request.contextPath }/board/timeLine?gNo="+obj.lGNo.gNo).append(obj.lGNo.gId);
						var $h6Id = $("<h6>").append($imgGuest).append($aId).addClass("font-weight-bold");
						
						$("#likeModal .modal-body").append($h6Id);
					})
					
					startLikePage=1;
				}
			})
		})
		
		$("#likeModal .close").click(function(){
			$("#likeModal").hide();
			$("#likeModal .modal-body").empty();
		})
		
	/* 	 $(document).on('mousewheel DOMMouseScroll',"html, body", function(e) {
                var E = e.originalEvent;
                delta = 0;
                if (E.deltaY==100) {
                	$(".navbar").stop().slideUp(300);
                }else{
                	$(".navbar").stop().slideDown(300);
                };
            });
		
		var this_scroll = 0;
		
		$("#wrapper").on('touchmove', function(e) {
		  	if(e.view.scrollY>=this_scroll){
		  		$(".navbar").stop().slideUp(300);
		  		this_scroll=e.view.scrollY;
		  	}else{
		  		$(".navbar").stop().slideDown(300);
		  		this_scroll=e.view.scrollY;
		  	}
		}); */
		
	})
</script>  

<body id="page-top">

 
 <div class="modal" id="likeModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">좋아요</h4>
          <button type="button" class="close">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          
        </div>
        
        <p class="dropdown-item text-center small text-gray-500" id="addLikeList">Show Add Alerts</p>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger close">Close</button>
        </div>
        
      </div>
    </div>
  </div>




  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	
      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/daedong">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">대동연애지도<sup style="color:red">♥</sup></div>
      </a>



      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="/daedong">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Main</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="">Buttons</a>
            <a class="collapse-item" href="">Cards</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="">Colors</a>
            <a class="collapse-item" href="">Borders</a>
            <a class="collapse-item" href="">Animations</a>
            <a class="collapse-item" href="">Other</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Friends
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item" id="liFriendsList">
		      <c:forEach var="friend" items="${friends}">
		     	 <p class="nav-link collapsed" href="#">
		     	 <c:if test="${friend.follower.gImage==null }">
		     	 	<img src="${pageContext.request.contextPath }/resources/images/boy.png" class="guestImg">	
		     	 </c:if>
		     	 <c:if test="${friend.follower.gImage!=null }">
		     	  	<img src="${pageContext.request.contextPath }/upload/displayFile?filename=${friend.follower.gImage}" class="guestImg">
		     	 </c:if>
		         
		          <a class="friendsList" href="${pageContext.request.contextPath }/board/timeLine?gNo=${friend.follower.gNo}">${friend.follower.gId }</a>
		        </p>
		      </c:forEach>
      </li>

      <!-- Nav Item - Charts -->
      <!-- <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li> -->

      <!-- Nav Item - Tables -->
     <!--  <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li> -->

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <div class="row">
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow col-sm-10">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
			
			<img src="${pageContext.request.contextPath }/resources/images/hanbando.png" id="hanbandoImg">	
          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group dropdown">
           		<select class="form-control" name="searchType" id="searchType">
               		<option value="all" ${cri.searchType==null?'selected':'' }>All</option>
               		<option value="area" ${cri.searchType=='area'?'selected':'' }>Area</option>
               		<option value="title" ${cri.searchType=='title'?'selected':'' }>Title</option>
               		<option value="contents" ${cri.searchType=='content'?'selected':'' }>Contents</option>
               		<option value="friend" ${cri.searchType=='friend'?'selected':'' }>Friend</option>
               		<option value="hash" ${cri.searchType=='hash'?'selected':'' }>Hash</option>
               	</select>
               	
              <input type="text" class="form-control bg-light border-0 small searchText dropdown-toggle" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" id="searchText">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button" id="searchBtn">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
              <div class="dropdown-menu" id="friendSearchList">
			    </div>
            </div>
          </form>
          
            <ul class="navbar-nav ml-auto">
		            
		          <li class="nav-item dropdown no-arrow d-sm-none">
			            
		              <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                <i class="fas fa-search fa-fw"></i>
		              </a>
		              
		              <!-- Dropdown - Messages -->
		              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown" id="searchDropdown">
		                <form class="form-inline mr-auto w-100 navbar-search">
		                  <div class="input-group">
		                  <!-- max width 수정 -->
		                  	<select class="form-control" name="searchType2" id="searchType2">
			               		<option value="all" ${cri.searchType==null?'selected':'' }>All</option>
			               		<option value="area" ${cri.searchType=='area'?'selected':'' }>Area</option>
			               		<option value="title" ${cri.searchType=='title'?'selected':'' }>Title</option>
			               		<option value="contents" ${cri.searchType=='content'?'selected':'' }>Contents</option>
			               		<option value="friend" ${cri.searchType=='friend'?'selected':'' }>Friend</option>
			               		<option value="hash" ${cri.searchType=='hash'?'selected':'' }>Hash</option>
			               	</select>
		                    <input id="searchText2" type="text" class="form-control bg-light border-0 small searchText dropdown-toggle" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
		                    
		                    <div class="input-group-append">
		                      <button class="btn btn-primary" type="button" id="searchBtn2">
		                        <i class="fas fa-search fa-sm"></i>
		                      </button>
		                    </div>
		                    <div class="dropdown-menu" id="friendSearchList2">
						    </div>
		                    
		                    
		                  </div>
		                </form>
		              </div>
		              
		            </li>
		  </ul>
          
          

          <!-- Topbar Navbar -->
          <c:if test="${Auth==null}">
	          <ul class="navbar-nav ml-auto" id="logoutToggle">
	          	<li class="nav-item dropdown no-arrow mx-1">
	              <a href="${pageContext.request.contextPath }/member/login">
	                <i>login</i>
	              </a>
	              <!-- Dropdown - Alerts -->
	            </li>
	          	<li class="nav-item dropdown no-arrow mx-1">
	              <a href="${pageContext.request.contextPath }/member/join">
	                <i>join</i>
	              </a>
	              <!-- Dropdown - Alerts -->
	            </li>
	          </ul>
          </c:if>
          
         
          
          <!-- 글쓰기 모달 -->
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
			       				<input type="text" id="bTitle" class="form-control list-group-item" placeholder="제목">
				        <div id="slideHidden"><div class="bxslider"></div></div>
				        		
						  		<label for="imgFile" class="list-group-item">업로드 <span>(10개)</span><span id="boardUploadSpinner"></span></label>
								<input type="file" name="file" id="imgFile" style="display:none" multiple="multiple">
								<textarea id="bContents" class="form-control list-group-item" placeholder="내용"></textarea>
								<input type="text" class="form-control list-group-item" placeholder="친구 태그하기">
						  		<input type="text" id="hashTag" class="form-control list-group-item" placeholder="검색 키워드(해시태그)">
						  		
						  		<div id="hashResult" class="form-contorl"></div><br>
						  		
				        		<input type="hidden" name="userno" value="${Auth.userno }">
					    <div class="modal-footer">
					   		<!-- <button type="button" id="test">test</button> -->
				          	<input type="submit" class="btn btn-default" value="Write">
				          	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
			        </form>
			      </div>
			      
			    </div>
			  </div>
          
           
          
          
          
          <c:if test="${Auth!=null }">
          <!-- class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" -->
          	<div class="input-group-append d-none d-sm-inline-block form-inline mr-auto">
                <button class="btn btn-primary" type="button" id="writeBtn" data-toggle="modal" data-target="#writeModal">
                  <i class="fas fa-pen fa-sm"></i> 글쓰기
                </button>
              </div>
          	<div id="right">
	          <ul class="navbar-nav ml-auto">
		            
          
	            	<li class="nav-item dropdown no-arrow d-sm-none">
					<a href="#" id="write" class="nav-link" data-toggle="modal" data-target="#writeModal" aria-haspopup="true" aria-expanded="false">
			          	<i class="fas fa-pen fa-fw">
			          	</i>
		          	</a>
		         </li>
	            
	            <!-- 친구 알림 -->
	            <li class="nav-item dropdown no-arrow mx-1">
	              <a class="nav-link dropdown-toggle" href="#" id="friendAlarmDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-user fa-fw"></i>
	                <!-- Counter - Alerts -->
	                <span class="badge badge-danger badge-counter">${Auth.friendAlarm }</span>
	              </a>
	              <!-- Dropdown - Alerts -->
	              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown" id="friendAlarmDropDownDiv">

	              </div>
	            </li>
	            
	            <!-- 종 알림 -->
	            <li class="nav-item dropdown no-arrow mx-1">
	              <a class="nav-link dropdown-toggle" href="#" id="boardAlarmDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-bell fa-fw"></i>
	                <!-- Counter - Alerts -->
	                <span class="badge badge-danger badge-counter" id="boardAlarmCount">${Auth.boardAlarm }</span>
	              </a>
	              <!-- Dropdown - Alerts -->
	              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown" id="boardAlarmDropDownDiv">
	              	<h6 class="dropdown-header">
				      Board Alarm
				    </h6>
				    <div class="divAlarmList" id="boardAlarmList">
	           			<!-- boardAlarm temp -->
                	</div>
	                    <p class="dropdown-item text-center small text-gray-500" id="addBoardAlarmList">Show Add Alerts</p>
	              </div>
	            </li>
	            
	            
	            
	           
	
	            <div class="topbar-divider d-none d-sm-block"></div>
	
	            <!-- Nav Item - User Information -->
	            <li class="nav-item dropdown no-arrow">
	              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <span class="mr-2 d-lg-inline text-gray-600 small">${Auth.username }</span>
	                <c:if test="${Auth.userimage!=null }">
						<img id="profileImgSmall" src="${pageContext.request.contextPath }/upload/displayFile?filename=${Auth.userimage}"  class="img-profile rounded-circle profileImg" data-toggle="modal" data-target="#myModal">
					</c:if>
					<c:if test="${Auth.userimage==null }">
				  		<img id="profileImgSmall" src="${pageContext.request.contextPath }/resources/images/boy.png" class="img-profile rounded-circle profileImg" data-toggle="modal" data-target="#myModal">
	                </c:if>
	                
	                
	                
	              </a>
	              <!-- Dropdown - User Information -->
	              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
	                <a class="dropdown-item" href="${pageContext.request.contextPath }/board/timeLine?gNo=${Auth.userno}">
	                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
	                  Time Line
	                </a>
	                <a class="dropdown-item" href="${pageContext.request.contextPath }/member/updatePassword">
	                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
	                  Profile
	                </a>
	                <a class="dropdown-item" href="${pageContext.request.contextPath }/board/activityLog">
	                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
	                  Activity Log
	                </a>
	                <div class="dropdown-divider"></div>
	                <a class="dropdown-item" href="${pageContext.request.contextPath }/member/logout">
	                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
	                  Logout
	                </a>
	              </div>
	            </li>
	
	          </ul>
	          </div>
	          </c:if>
        </nav>
        </div>
        <!-- End of Topbar -->
        <div id="map">
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
          <div class="col-7 modalBodyLeft">
	          <div class="bxslider3">
	          	
	          </div>
          </div>
          
          <div class="col-5 modalBodyRight">
          	<div>
          		
          		<a id="dBGId"></a>
          		<div id="dBRow">
	          	<span class="icons">
          			
	          	</span>
          		<span class="whoLike" id="whoLike" class="btn"><span></span>명이 좋아합니다.</span>
          		</div>
          		
        		<h5 id="dBTitle"></h5>
	          	<p id="dBContents"></p>
	          	
          		<div id="dBHash"></div>
	          	<div id="dReplys" class="replysList form-control">
			          	
				</div>
				
				
				<ul class="pagination justify-content-center ulReply">
				
				</ul>
          	</div>
          	
          	<c:if test="${Auth!=null }">
              	<div class="reply-text row">
              		<textarea rows="2" cols="" class="reply-textArea form-control col-sm-10" data-bNo="${board.bNo }"></textarea>
              		<button type="button" class="reply-addBtn btn btn-default active col-sm-2" data-gNo=${Auth.userno }>게시</button>
              	</div>
            </c:if>
          </div>
        </div>
        
		    <div class="modal-footer">
	        </div>
      </div>
      
    </div>
   
    
  </div>
  
  
  
   
        
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/js/sb-admin-2.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/js/demo/chart-pie-demo.js"></script>
	