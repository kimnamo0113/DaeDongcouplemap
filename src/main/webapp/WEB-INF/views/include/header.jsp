<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">


  <title>SB Admin 2 - Dashboard</title>
  
    
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>



  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/resources/bootTemplate/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  
  <link href="${pageContext.request.contextPath }/resources/bootTemplate/css/sb-admin-2.css" rel="stylesheet">
  
  
<script src="${pageContext.request.contextPath }/resources/js/writeBtn.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/areaChoice.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/writeBtn.css">
<style type="text/css">
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
</style>

<!-- Bootstrap core JavaScript-->

<script type="text/javascript">
	var test="";
	
	$(function() {
		
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
			location.href="list?page=1&searchType="+select+"&keyword="+keyword;
		}
		
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
			location.href="list?page=1&searchType="+select+"&keyword="+keyword;
		}
		
		$("#searchBtn2").click(function(){
			searchFunc2()
		})
		
		$("#searchText2").keydown(function(key) {

	      	if (key.keyCode == 13) {
	      		searchFunc2();
	       	}

	    });
		
		
		
		
	})
	

</script>  

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	
      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/daedong">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">대동연애지도<sup>ㅎ</sup></div>
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
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="buttons.html">Buttons</a>
            <a class="collapse-item" href="cards.html">Cards</a>
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
            <a class="collapse-item" href="utilities-color.html">Colors</a>
            <a class="collapse-item" href="utilities-border.html">Borders</a>
            <a class="collapse-item" href="utilities-animation.html">Animations</a>
            <a class="collapse-item" href="utilities-other.html">Other</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>

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
            <div class="input-group">
           		<select class="form-control" name="searchType" id="searchType">
               		<option value="all" ${cri.searchType==null?'selected':'' }>All</option>
               		<option value="aera" ${cri.searchType=='aera'?'selected':'' }>Area</option>
               		<option value="title" ${cri.searchType=='title'?'selected':'' }>Title</option>
               		<option value="contents" ${cri.searchType=='content'?'selected':'' }>Contents</option>
               		<option value="friend" ${cri.searchType=='friend'?'selected':'' }>Friend</option>
               		<option value="hash" ${cri.searchType=='hash'?'selected':'' }>Hash</option>
               	</select>
               	
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" id="searchText">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button" id="searchBtn">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>
          

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
	            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
	            <li class="nav-item dropdown no-arrow d-sm-none">
	            
	              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-search fa-fw"></i>
	              </a>
	              
	              
	              
	              <!-- Dropdown - Messages -->
	              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
	                <form class="form-inline mr-auto w-100 navbar-search">
	                  <div class="input-group">
	                  <!-- max width 수정 -->
	                  	<select class="form-control" name="searchType2" id="searchType2">
		               		<option value="all" ${cri.searchType==null?'selected':'' }>All</option>
		               		<option value="aera" ${cri.searchType=='aera'?'selected':'' }>Area</option>
		               		<option value="title" ${cri.searchType=='title'?'selected':'' }>Title</option>
		               		<option value="contents" ${cri.searchType=='content'?'selected':'' }>Contents</option>
		               		<option value="friend" ${cri.searchType=='friend'?'selected':'' }>Friend</option>
		               		<option value="hash" ${cri.searchType=='hash'?'selected':'' }>Hash</option>
		               	</select>
	                    <input id="searchText2" type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
	                    
	                    <div class="input-group-append">
	                      <button class="btn btn-primary" type="button" id="searchBtn2">
	                        <i class="fas fa-search fa-sm"></i>
	                      </button>
	                    </div>
	                  </div>
	                </form>
	              </div>
	            </li>
				
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
			   <!--  -->
	            <!-- Nav Item - Alerts -->
	            <li class="nav-item dropdown no-arrow mx-1">
	              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-user fa-fw"></i>
	                <!-- Counter - Alerts -->
	                <span class="badge badge-danger badge-counter">3+</span>
	              </a>
	              <!-- Dropdown - Alerts -->
	              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
	                <h6 class="dropdown-header">
	                  Alerts Center
	                </h6>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-primary">
	                      <i class="fas fa-file-alt text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">December 12, 2019</div>
	                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-success">
	                      <i class="fas fa-donate text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">December 7, 2019</div>
	                    $290.29 has been deposited into your account!
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-warning">
	                      <i class="fas fa-exclamation-triangle text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">December 2, 2019</div>
	                    Spending Alert: We've noticed unusually high spending for your account.
	                  </div>
	                </a>
	                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
	              </div>
	            </li>
	            <li class="nav-item dropdown no-arrow mx-1">
	              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-bell fa-fw"></i>
	                <!-- Counter - Alerts -->
	                <span class="badge badge-danger badge-counter">3+</span>
	              </a>
	              <!-- Dropdown - Alerts -->
	              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
	                <h6 class="dropdown-header">
	                  Alerts Center
	                </h6>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-primary">
	                      <i class="fas fa-file-alt text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">December 12, 2019</div>
	                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-success">
	                      <i class="fas fa-donate text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">December 7, 2019</div>
	                    $290.29 has been deposited into your account!
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-warning">
	                      <i class="fas fa-exclamation-triangle text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">December 2, 2019</div>
	                    Spending Alert: We've noticed unusually high spending for your account.
	                  </div>
	                </a>
	                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
	              </div>
	            </li>
	
	            <!-- Nav Item - Messages -->
	            <li class="nav-item dropdown no-arrow mx-1">
	              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-envelope fa-fw"></i>
	                <!-- Counter - Messages -->
	                <span class="badge badge-danger badge-counter">7</span>
	              </a>
	              <!-- Dropdown - Messages -->
	              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
	                <h6 class="dropdown-header">
	                  Message Center
	                </h6>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
	                    <div class="status-indicator bg-success"></div>
	                  </div>
	                  <div class="font-weight-bold">
	                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
	                    <div class="small text-gray-500">Emily Fowler · 58m</div>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
	                    <div class="status-indicator"></div>
	                  </div>
	                  <div>
	                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
	                    <div class="small text-gray-500">Jae Chun · 1d</div>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
	                    <div class="status-indicator bg-warning"></div>
	                  </div>
	                  <div>
	                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
	                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
	                    <div class="status-indicator bg-success"></div>
	                  </div>
	                  <div>
	                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
	                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
	                  </div>
	                </a>
	                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
	              </div>
	            </li>
	
	            <div class="topbar-divider d-none d-sm-block"></div>
	
	            <!-- Nav Item - User Information -->
	            <li class="nav-item dropdown no-arrow">
	              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${Auth.username }</span>
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
	                <a class="dropdown-item" href="#">
	                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
	                  Profile
	                </a>
	                <a class="dropdown-item" href="#">
	                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
	                  Activity Log
	                </a>
	                <div class="dropdown-divider"></div>
	                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
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
        
        
        
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/js/demo/chart-pie-demo.js"></script>
	