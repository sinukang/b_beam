<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="app.domain.*" %> --%>
<%-- <%@ page import="java.util.ArrayList" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/source/css/board/noticeList.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

	<!-- header -->
	<jsp:include page="../source/include/header.jsp"/>
	
	<div class="page-inner">
		<div class="page-side">
			<h2 class="page-title">고객지원</h2>
		</div>
		<div class="content">
			<div class="btn-area">
				<button type="button" class="btn-Notice">공지사항</button>
				<button type="button" class="btn-FAQ">자주 묻는 질문</button>
			</div>
			<div class="table-area">
				<table class="content-table">
					<tr>
						<td class="td-head td-no">글 번호</td>
						<td class="td-head td-cate">분류</td>
						<td class="td-head td-sub">글 제목</td>
						<td class="td-head td-writer">작성자</td>
						<td class="td-head td-wdate">작성일</td>
						<td class="td-head td-cnt">조회수</td>
					</tr>
					<tr class="tr-body">
						<td class="td-body td-no">1</td>
						<td class="td-body td-cate">공지</td>
						<td class="td-body td-sub">
							안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 
							안녕하세요 안녕하세요 안녕하세요 안녕하세요 
						</td>
						<td class="td-body td-writer">bbeam</td>
						<td class="td-body td-wdate">2023-11-01</td>
						<td class="td-body td-cnt">1</td>
					</tr>						
					<c:forEach var="i" begin="2" end="9" step="1">
						<tr class="tr-body">
							<td class="td-body td-no">${i}</td>
							<td class="td-body td-cate">공지${i}</td>
							<td class="td-body td-sub">안녕하세요${i}</td>
							<td class="td-body td-writer">bbeam${i}</td>
							<td class="td-body td-wdate">2023-11-0${i}</td>
							<td class="td-body td-cnt">1${i}</td>
						</tr>							
					</c:forEach>
				</table>
			</div>
			<div class="btn-area2">
				<button id="btn-write" class="btn-write">공지사항 등록</button>
			</div>			
			<div class="pagination-area">
				<div class="paging-number-area">
					<a href="#" class="a-arrow">
						<i class="first-arrow-icon"></i><i class="first-arrow-icon"></i>
					</a>
					<a href="#" class="a-arrow">
						<i class="prev-arrow-icon"></i>
					</a>
					<c:forEach var="i" begin="1" end="10" step="1">
						<a href="#" class="page-number">${i}</a>
					</c:forEach>
					<a href="#" class="a-arrow">
						<i class="next-arrow-icon"></i>
					</a>
					<a href="#" class="a-arrow">
						<i class="last-arrow-icon"></i><i class="last-arrow-icon"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../source/include/footer.jsp"/>
	
</body>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btn-write").on("click", function(){
			location.href = "${pageContext.request.contextPath}/board/noticeWrite.do";
		});
		
	});
</script>
</html>