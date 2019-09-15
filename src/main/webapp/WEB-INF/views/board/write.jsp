<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>

<style>
	form#insertBoardFrm{
		margin-left: 2%;
		margin-right: 2%;
	}
	form#insertBoardFrm select{
		float: left;
		margin-right: 5px;
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
	input#hashTag{
		padding-left: 10px;
		padding-right: 10px;
	}
	
</style>
 
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "${pageContext.request.contextPath }/resources/SE2/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#insertBoard").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            var hash=$("#hashResult").text();
            var $input = $("<input>").attr("type","hidden")
            	.val(hash)
            	.attr("name","hash");
            $("#insertBoardFrm").append($input)
            $("#insertBoardFrm").submit();
        });
        
        function hashPut(){
        	var text=$("#hashTag").val();
        	var $span = $("<span>").html("<img src='${pageContext.request.contextPath}/resources/images/x.png'>");
        	var $p = $("<p>").text("#"+text);
        	
        	
        	
        	$("#hashResult").append($p).append($span);
        	
        	$("#hashTag").val("");
        }
        
        
        $("#hashTag").keydown(function(key) {

        	if (key.keyCode == 13) {
        		hashPut();
        	}

        });
		
        $("#hashTagBtn").click(function() {
        	hashPut();
		})

		$(document).on("click","#hashResult span",function(){
			$(this).prev().remove();
			$(this).remove();
		})
        
		var data;
		
		$.ajax({
			url:"${pageContext.request.contextPath}/resources/map/Samples/MapDataBaseXml/SouthKoreaDrillDownMetroDongRegion.xml",
			type:"get",
			dataType:"xml",
			success:function(xml){
				data=xml;
				console.log(data);
				$(data).find("Area").each(function(){
					var $option = $("<option>").append($(this).attr("label"));
					$("#area").append($option);
					
				})
			}
		})
		
		$("#province").hide();
		$("#gu").hide();
		$("#dong").hide();
		
		$("#area").change(function(){
			$("#gu").hide();
			$("#dong").hide();
			var area=$(this).val();
			var area2=$(data).find("Area[label='"+area+"']");
			
			$("#province").empty();
			$("#province").append("<option>지역선택</option>");
			
			var provinceCheck=$(area2).children().is("Province");
			if(provinceCheck==true){
				$("#province").show();
				$(area2).find("Province").each(function(){
					var $option = $("<option>").append($(this).attr("label"));
					$("#province").append($option);
					
				});
			}else{
				$("#province").hide();
				$("#gu").show();
				$(area2).find("Gu").each(function(){
					var $option = $("<option>").append($(this).attr("label"));
					$("#gu").append($option);
					
				});
			}
			
			
			
		})
		
		
		$("#province").change(function(){
			$("#gu").hide();
			$("#dong").hide();
			var province=$(this).val();
			var province2=$(data).find("Province[label='"+province+"']");
			
			$("#gu").empty();
			$("#gu").append("<option>지역선택</option>");
			$("#gu").show();
			$(province2).find("Gu").each(function(){
				var $option = $("<option>").append($(this).attr("label"));
				$("#gu").append($option);
			});
		})
		
		
		
		$("#gu").change(function(){
			$("#dong").hide();
			var gu=$(this).val();
			var gu2=$(data).find("Gu[label='"+gu+"']");
			
			$("#dong").empty();
			$("#dong").append("<option>지역선택</option>");

			var dongCheck=$(gu2).children().is("Dong");
			if(dongCheck==true){
				$("#dong").show();
				$(gu2).find("Dong").each(function(){
					var $option = $("<option>").append($(this).attr("label"));
					$("#dong").append($option);
				});
			}else{
				$("#dong").hide();
			}
		})
		
		
    });
</script>
<body>
	
	
 
    <form action="${pageContext.request.contextPath }/board/insertBoard" method="post" id="insertBoardFrm" enctype="multipart/form-data">
    	<select id="area" class="form-control col-sm-2">
    		<option>지역선택</option>
    	</select>
    	<select id="province" class="form-control col-sm-2"></select>
    	<select id="gu" class="form-control col-sm-2"></select>
    	<select id="dong" class="form-control col-sm-2"></select>
        <input type="text" id="bTtitle" name="bTitle" class="form-control" style="width:100%" placeholder="제목을 입력해주세요."/>
        <textarea name="editor" id="editor" style="width: 100%; height: 400px;"></textarea><br><br>
        <label>태그</label> : <input type="text" id="hashTag" placeholder="# 검색에 사용할 태그를 입력해주세요(최대 20개)" style="width:80%;"><button type="button" id="hashTagBtn">추가</button><br>
        <fieldset>
	        <div id="hashResult"></div><br>
	        <input type="button" id="insertBoard" value="등록" />
        </fieldset>
    </form>
    
    
<%@ include file="../include/footer.jsp" %>
