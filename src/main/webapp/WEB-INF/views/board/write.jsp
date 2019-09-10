<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>

<style>
	#insertBoardFrm{
		margin-left: 2%;
		margin-right: 2%;
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
            $("#insertBoardFrm").submit();
        });
    });
</script>
<body>
	
	
 
    <form action="insert" method="post" id="insertBoardFrm" enctype="multipart/form-data">
        <input type="text" id="title" name="title" style="width:100%" placeholder="제목을 입력해주세요."/>
        <textarea name="editor" id="editor" style="width: 90%; height: 400px;"></textarea><br><br>
        <label>태그</label> : <input type="text" id="hashTag" placeholder="# 검색에 사용할 태그를 입력해주세요(최대 10개)" style="width:80%;"><button type="button">추가</button><br>
        <fieldset>
	        <p id="hashResult"></p><br>
	        <input type="button" id="insertBoard" value="등록" />
        </fieldset>
        
    </form>
    
    
<%@ include file="../include/footer.jsp" %>
