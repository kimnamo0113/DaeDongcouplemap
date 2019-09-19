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
  	.regExpMsg{
		color:red;
		display: none;
	}
	.repeatMsg{
		color:red;
		display: none;
	}
	
	.redBorder{
		border:2px solid red !important;
	}
	.noRepeat{
		color:red;
		display: none;
	}
  </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#f1").submit(function(e) {
			var form=$(this);
			var gPassword = $("#password").val();
			var gPassword1 = $("#password1").val();
			console.log(gPassword)
			console.log(gPassword1)
			var json = {gPassword:gPassword,gPassword1:gPassword1};
			var data = JSON.stringify(json)
			
			$.ajax({
				url:"updatePassword",
				type:"POST",
				data:data,
				dataType:"text",
				headers:{
					"Content-Type":"application/json"
				},
				/* contentType : "application/json;charset=UTF-8", */
				success:function(res){
					console.log(res);
					if(res=='true'){
						alert("비밀번호가 변경되었습니다.");
						location.href="${pageContext.request.contextPath}";
					}else{
						alert("비밀번호를 잘못 입력하였습니다.");
						
					}
				}
				
			})
			return false;
		})
		$('input').blur(function(){
			 if($(this).attr('id') == 'password'){
		    	   let strpassword1 = $('#password').val() ;
		    	   
		    	   if(strpassword1=='')
		    		   return;
		    	   
		           let regExp = /^[a-z0-9~!@#$%^&*()-_=+]{4,15}$/i;
		           
		           if (!strpassword1.match(regExp)) {
		        	   $('#password').addClass("redBorder");
		        	   $("#password").next().show();
		               return false
		           }else{
		        	   $("#password").next().hide();
		        	   $('#password').removeClass("redBorder");
		           }
			    }
			 if($(this).attr('id') == 'password1'){
		    	   let strpassword1 = $('#password1').val() ;
		    	   
		    	   if(strpassword1=='')
		    		   return;
		    	   
		           let regExp = /^[a-z0-9~!@#$%^&*()-_=+]{4,15}$/i;
		           
		           if (!strpassword1.match(regExp)) {
		        	   $('#password1').addClass("redBorder");
		        	   $("#password1").next().show();
		               return false
		           }else{
		        	   $("#password1").next().hide();
		        	   $('#password1').removeClass("redBorder");
		           }
			    }
			    if($(this).attr('id') == 'password2'){
		    	   let strpassword2 = $('#password2').val() ;
		    	   
		    	   if(strpassword2=='')
		    		   return;
		    	   
		           let regExp = /^[a-z0-9~!@#$%^&*()-_=+]{4,15}$/i;
		           
		           if (!strpassword2.match(regExp)) {
		        	   $('#password2').addClass("redBorder");
		        	   $("#password2").next().show();
		               return false
		           }else{
		        	   $("#password2").next().hide();
		        	   $('#password2').removeClass("redBorder");
		           }
			    }
			    
			    if($(this).attr('id') == 'password2' || $(this).attr('id') == 'password1'){
			    	
			    	var pass1=$("#password1").val();
			    	var pass2=$("#password2").val();
			    	
			    	if(pass1!=''&&pass2!=''){
				    	if(pass1!=pass2){
				    		$(".noRepeat").show();
				    	}else{
				    		$(".noRepeat").hide();
				    	}
			    	}
			    }
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
                    <h1 class="h4 text-gray-900 mb-2">Update PassWord!</h1>
                    <p class="mb-4">We get it, stuff happens. Just enter your email address below and we'll send you a link to reset your password!</p>
                  </div>
                  <form class="user" action="sadsadsa" id="f1" method="post">
                    
                    <div class="form-group">
                      <input type="password" name="gPassword" id="password" class="form-control form-control-user" id="gEmail" aria-describedby="emailHelp" placeholder="Old password...">
                      <p class="regExpMsg">형식이 올바르지 않습니다.(4~15)</p>
                    </div>
                    <div class="form-group">
                      <input type="password" name="gPassword1" id="password1" class="form-control form-control-user" id="gPassword" aria-describedby="emailHelp" placeholder="new Password...">
                      <p class="regExpMsg">형식이 올바르지 않습니다.(4~15)</p>
                    </div>
                    <div class="form-group">
                      <input type="password" name="gPassword2" id="password2" class="form-control form-control-user" id="gPassword" aria-describedby="emailHelp" placeholder="Repeat Password...">
                      <p class="regExpMsg">형식이 올바르지 않습니다.(4~15)</p>
                      <p class="noRepeat">비밀번호가 일치하지 않습니다.</p>
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
