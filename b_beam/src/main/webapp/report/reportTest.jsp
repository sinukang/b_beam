<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지-신고내역</title>
<link rel="stylesheet" type="text/css" href="../source/css/report.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<jsp:include page="../source/include/header.jsp"/>
			
	<div class="container">
		
		<div class="container-title">
			<h1>REPORT</h1>
		</div>
			
		<div class="m-navi">
			<div class="report-tap tap clicked" onclick="mNavi(0)">신고내역</div>
			<div class="QnA-tap tap" onclick="mNavi(1)">1:1 문의내역</div>
			<div class="notice-tap tap" onclick="mNavi(2)">공지사항</div>
			<div class="FAQ-tap tap" onclick="mNavi(3)">자주하는 질문</div>
		</div>
		
		<div id="tab1" class="tabContent">
			<table class="report-table">
				<tr>
					<td id="delCheck">
						<button class="delCheck">전체선택</button>
					</td>
					<td id="reportNum">신고번호</td>
					<td id="reportCnt">누적신고</td>
					<td id="sort">분류</td>
					<td id="reportedBdno">원글 번호</td>
					<td id="useName">닉네임</td>
					<td id="ctn">내용</td>
					<td id="pntYn">패널티여부</td>
					<td id="clearYn">글삭제여부</td>
				</tr>
				<c:forEach var="rpv" items="${alist}" varStatus="status" >
					<tr>
						<td>
							<input type="checkbox" class="deleteBox">
						</td>
						<td>${rpv.rpno}</td>
						<td>12</td>
						<td>${rpv.rpcate}</td>
						<td>${rpv.bdno}/${rpv.rvno}/${rpv.cmno}</td>
						<td>
							<button class="userId">${rpv.mbname}</button>
						</td>
						<td>${rpv.bdcont }${rpv.reviewVo.rvcont }${rpv.commnetVo.cmcont }</td>
						<td>${rpv.penaltyVo.pndelyn}</td>
						<td>${rpv.rpdelyn}</td>
					</tr>	
				</c:forEach>
			</table>
		</div>
	</div>
	
	<jsp:include page="../source/include/footer.jsp"/>
	
<script>

	//상단 메뉴 바 클릭 시 색상변화, 클릭 감지 이벤트 리스너 달아줌
	var tap = document.querySelectorAll(".tap");
	
	function handleClick1(e){
		for(let i = 0; i < tap.length; i++){
			tap[i].classList.remove("clicked");
		}
		e.target.classList.add("clicked");
	}
	function init1(){
		for(let i = 0; i < tap.length; i++){
			tap[i].addEventListener("click", handleClick1);
		}
	}
	init1();	
	
	function mNavi(e){
		switch(e){
		case 0 : location.href="${pageContext.request.contextPath}/report/report.do"; break;
		case 1 : location.href="${pageContext.request.contextPath}/qna/managerMyQnA.do"; break;
		case 2 : location.href="${pageContext.request.contextPath}/report/report.do"; break;
		case 3 : location.href="${pageContext.request.contextPath}/report/report.do"; break;
		
		}
	}

	$(document).ready(function() {
		// 삭제 버튼 클릭 시
		$(".deleteBtn").on("click", function() {
			var checkboxes = $(".deleteBox:checked");
			if (checkboxes.length === 0) {
				alert("삭제할 글을 선택하세요");
			}else{
				var confirmDelete = confirm("삭제된 글은 복구가 어렵습니다. 삭제하시겠습니까?");
				if (confirmDelete) {
				// 여기서 선택된 행을 삭제하는 로직을 추가할 수 있습니다.
				// checkboxes.each(function() {
				//     $(this).closest('tr').remove(); // 선택된 항목 삭제하는 예시
				// });
				}
			}
		});
		
		// 사용자 ID 클릭 시 모달 표시----------------------------------------------
		$(".userId").on("click", function() {
			var modal = $('#myModal');
			if (modal.is(':visible')) {
				modal.hide();
			} else {
				modal.show();
			}
		});
		
		// 완료 버튼 클릭 시 모달 닫기
		$(".penaltyBtn").on("click", function() {
			// 완료 버튼을 클릭한 경우 실행되는 코드 작성
			
			// 모달 닫기
			$('#myModal').hide();
		});
	
		// 취소 버튼 클릭 시 모달 닫기
		$(".cancelBtn").on("click", function() {
			// 취소 버튼을 클릭한 경우 모달 닫기
			$('#myModal').hide();
		});
	
		$(document).on("click", function(event) {
			if (!$(event.target).closest('#myModal, .userId').length) {
				$('#myModal').hide();
			}
		});
	});
	
	
</script>
</body>
</html>