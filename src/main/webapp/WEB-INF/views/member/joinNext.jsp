<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Register</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/resources/bootTemplate/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath }/resources/bootTemplate/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

  <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Additional input!</h1>
              </div>
              <form class="user" id="f1" action="joinNext" method="post">
              
                <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="Phone Number">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Birth (ex:920123)">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Address">
                </div>
                <br>
                <div class="form-group row">
	                <div class="col-sm-6 mb-3 mb-sm-0">
	                	<div class="form-group row">
	                		<div class="col-sm-4 mb-3 mb-sm-0">
	                			<label class="">Gender :</label>
	                		</div>
	                		
		                	<div class="col-sm-4 mb-3 mb-sm-0">
			                	<div class="custom-control custom-radio">
									<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
									<label class="custom-control-label" for="jb-radio-1">Man</label>
								</div>
							</div>
							<div class="col-sm-4 mb-3 mb-sm-0">
								<div class="custom-control custom-radio">
									<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
									<label class="custom-control-label" for="jb-radio-2">Woman</label>
								</div>
							</div>
						</div>
	                </div>
                </div>
                <div class="form-group row">
	                <div class="col-sm-9 mb-3 mb-sm-0">
               			<input type="text" name="addr1" class="form-control form-control-user" id="sample6_postcode" placeholder="우편번호">
                	</div>
	                <div class="col-sm-3 mb-3 mb-sm-0">
               			<input type="button" class="btn btn-info btn-md" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                	</div>
                	
                </div>
                <div class="form-group row">
                	<div class="col-sm-12">
              			<input type="text" name="addr2" class="form-control form-control-user" id="sample6_address" placeholder="주소"><br>
              		</div>	                
                </div>
                <div class="form-group row">
                	<div class="col-sm-6 mb-3 mb-sm-0">
						<input type="text" name="addr3" class="form-control form-control-user" id="sample6_detailAddress" placeholder="상세주소">
					</div>
					<div class="col-sm-6 mb-3 mb-sm-0">
						<input type="text" name="addr4" class="form-control form-control-user" id="sample6_extraAddress" placeholder="참고항목">
					</div>
                </div>
                <hr>
                
                
                <div class="form-group row">
	                <div class="col-sm-6 mb-3 mb-sm-0">
	                	<input type="submit" href="login.html" class="btn btn-primary btn-user btn-block" value="Register Account"/>
	                </div>
                  	<div class="col-sm-6 mb-3 mb-sm-0">
		                <input type="submit" class="btn btn-primary btn-user btn-block" value="Enter Next"/>
		            </div>
                </div>
                <hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
              
              
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="forgot-password.html">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login.html">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath }/resources/bootTemplate/js/sb-admin-2.min.js"></script>

</body>

</html>
