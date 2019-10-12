<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	div.container-fluid{
		margin-top:120px;
	}
	table.activityTable th:nth-child(1){
		width: 72px;
		text-align: center;
	}
	table.activityTable td:nth-child(1){
		text-align: center;
	}
	table.activityTable th:nth-child(3){
		width: 94px;
	}
	table.activityTable tr td:nth-child(2) {
		cursor: pointer;
	}
	table.activityTable tr td:nth-child(2):hover{
		color: black;
	}
	#selectAct{
		width:100px !important;
	}
	@media(min-width:800px){
		table.activityTable th:nth-child(1){
		width: 120px;
		}
		table.activityTable th:nth-child(3){
			width: 200px;
		}
	}
	
</style>
<script>
$(function(){
	
		$(document).on("click",".friendLog",function(){
			var gNo=$(this).attr("data-gNo");
			location.href="${pageContext.request.contextPath }/board/timeLine?gNo="+gNo;
		})
		
		$("#selectAct").change(function(){
			var select = $(this).val();
			var keyword = "";
			location.href="/daedong/board/activityLog?page=1&searchType="+select+"&keyword="+keyword;	
			
		})
		
})
</script>


<div class="container-fluid">

<div class="col-lg-12" id="mainScroll">

	<select class="form-control" id="selectAct">
		<option ${cri.searchType==null||cri.searchType=='All'?'selected':''}>All</option>
		<option ${cri.searchType=='게시판'?'selected':''}>게시판</option>
		<option ${cri.searchType=='좋아요'?'selected':''}>좋아요</option>
		<option ${cri.searchType=='댓글'?'selected':''}>댓글</option>
		<option ${cri.searchType=='친구'?'selected':''}>친구</option>
	</select>
  <table class="table activityTable">
    <thead class="thead-light">
      <tr>
        <th>종류</th>
        <th>내용</th>
        <th>시간</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="act" items="${activityList}">
		<c:if test="${act.bContents=='b'}">
			<tr>
		        <td class="table-warning">게시판</td>
		        <td class="boardDetail" data-bNo="${act.bNo }" data-toggle="modal" data-target="#myModal3"><span class="font-weight-bold">${act.bTitle }</span>게시글을 작성하였습니다.</td>
		        <td>${fn:substring(act.bWritetime,0,16) }</td>
		    </tr>			
		</c:if>
		<c:if test="${act.bContents=='l'}">
			<tr>
		        <td class="table-success">좋아요</td>
		        <td class="boardDetail" data-bNo="${act.bNo }" data-toggle="modal" data-target="#myModal3"><span class="font-weight-bold">${act.bTitle }</span>게시글을 좋아합니다.</td>
		        <td>${fn:substring(act.bWritetime,0,16) }</td>
		    </tr>			
		</c:if>
		<c:if test="${act.bContents=='r'}">
			<tr>
		        <td class="table-info">댓글</td>
		        <td class="boardDetail" data-rNo="${act.bFlag }" data-bNo="${act.bNo }" data-toggle="modal" data-target="#myModal3"><span class="font-weight-bold">${act.bTitle }</span>게시글에 댓글을 달았습니다.</td>
		        <td>${fn:substring(act.bWritetime,0,16) }</td>
		    </tr>			
		</c:if>
		<c:if test="${act.bContents<'5'}">
			<tr>
		        <td class="table-primary">친구</td>
		        <c:if test="${act.bContents=='0' }">
		        	<td class="friendLog" data-gNo="${act.bNo }"><span class="font-weight-bold">${act.bTitle }</span>를 팔로우하였습니다.</td>
		        </c:if>
		        <c:if test="${act.bContents=='1' }">
		        	<td class="friendLog" data-gNo="${act.bNo }"><span class="font-weight-bold">${act.bTitle }</span>를 팔로우하였습니다.</td>
		        </c:if>
		        <c:if test="${act.bContents=='2' }">
		        	<td class="friendLog" data-gNo="${act.bNo }"><span class="font-weight-bold">${act.bTitle }</span>를 팔로우하였습니다.</td>
		        </c:if>
		        <c:if test="${act.bContents=='3' }">
		        	<td class="friendLog" data-gNo="${act.bNo }"><span class="font-weight-bold">${act.bTitle }</span>와 팔로잉 되었습니다.</td>
		        </c:if>
		        <c:if test="${act.bContents=='4' }">
		        	<td class="friendLog" data-gNo="${act.bNo }"><span class="font-weight-bold">${act.bTitle }</span>와 팔로잉 되었습니다.</td>
		        </c:if>
		        <td class="friendLog">${fn:substring(act.bWritetime,0,16) }</td>
		    </tr>			
		</c:if>
	</c:forEach>
    </tbody>
  </table>

	<ul class="pagination justify-content-center" data-bNo="${board.bNo }">
		<c:if test="${pageMaker.prev }">
			<li class="page-item"><a class="page-link" href="activityLog?page=${pageMaker.startPage-1 }&searchType=${cri.searchType}">&laquo;</a></li>
		</c:if>
		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<li class="page-item ${pageMaker.cri.page==idx ? 'active' : ''}"><a class="page-link" href="activityLog?page=${idx}&searchType=${cri.searchType}">${idx}</a></li>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<li class="page-item"><a class="page-link" href="activityLog?page=${pageMaker.endPage+1 }&searchType=${cri.searchType}">&raquo;</a></li>
		</c:if>	
	</ul>
	</div>
</div>


<%@ include file="../include/footer.jsp" %>