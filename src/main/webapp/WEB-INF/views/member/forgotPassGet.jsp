<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Forgot Password</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/resources/bootTemplate/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath }/resources/bootTemplate/css/sb-admin-2.min.css" rel="stylesheet">
  <style>
  	#gPassword{
  		display: none;
  	}
  </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var gEmail;
		$("#f1").submit(function() {
			if($("#submitBtn").text()=="Send Email"){
				
				gEmail = $("#gEmail").val();
				var json = {gEmail:gEmail};
				var data = JSON.stringify(json)
				
				$.ajax({
					url:"forgotPassWord",
					type:"put",
					data:data,
					dataType:"text",
					headers:{
						"Content-Type":"application/json"
					},
					/* contentType : "application/json;charset=UTF-8", */
					success:function(res){
						console.log(res);
						if(res=='true'){
							alert("이메일로 임시비밀번호가 전송되었습니다.");
							$("#submitBtn").text("Send Login");
							$("#gEmail").attr("readOnly","readOnly");
							$("#gPassword").show();
						}else{
							alert("등록된 이메일이 없습니다.")
						}
					}
					
				})
				return false;
			}
			return true;
		})
	})
</script>

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                    <p class="mb-4">We get it, stuff happens. Just enter your email address below and we'll send you a link to reset your password!</p>
                  </div>
                  <form class="user" action="tempPassWord" id="f1" method="post">
                    
                    <div class="form-group">
                      <input type="email" name="gEmail" class="form-control form-control-user" id="gEmail" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                    </div>
                    <div class="form-group">
                      <input type="password" name="gPassword" class="form-control form-control-user" id="gPassword" aria-describedby="emailHelp" placeholder="Enter Password...">
                    </div>
                    
                    
                    <button id="submitBtn" class="btn btn-primary btn-user btn-block">Send Email</button>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="${pageContext.request.contextPath }/member/join">Create an Account!</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="${pageContext.request.contextPath }/member/login">Already have an account? Login!</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="${pageContext.request.contextPath }">Go to Main!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/js/sb-admin-2.min.js"></script>

</body>

</html>
