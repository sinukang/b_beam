<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="../source/css/gallery/galleryContentsInclude.css" type="text/css" rel="stylesheet">
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<div class="contents-area">
	<div class="div-photo">
		<div class="div-nick">
			<span>${bv.mbname}</span>
		</div>
		<div class="photo-area">
			<div class="swiper mySwiper" style="height: 100%;">
				<div class="swiper-wrapper">
					<c:forEach var="images" items="${bv.bdFilename}">
						<div class="swiper-slide">
							<img class="cont-img" src="${pageContext.request.contextPath}/source/galleryImages/${images}">
						</div>
					</c:forEach>
				</div>
				<div class="swiper-button-next" style="color: white;"></div>
				<div class="swiper-button-prev" style="color: white;"></div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</div>
	<div class="div-contents">
		<div class="div-title">
			<div class="md-title-area">
				<span>${bv.bdtitle} 전주 한옥마을 야경</span>
			</div>
			<div class="md-like-area">
				<c:choose>
					<c:when test="${bv.bdLikeYN == 'Y'}">
						<label for="input-like" class="like-button">♥</label>
						<input type="button" id="input-like" class="input-like" name="btn" value="${bv.bdno}">
					</c:when>
					<c:otherwise>
						<label for="input-like" class="like-button">♡</label>
						<input type="button" id="input-like" class="input-like" name="btn" value="${bv.bdno}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="div-content">
			<div class="content-area">
				${bv.bdcont} 내용을 작성하였습니다. 내용을 작성하였습니다. 내용을 작성하였습니다.<br>
				내용을 작성하였습니다. 내용을 작성하였습니다. 내용을 작성하였습니다.<br>
				내용을 작성하였습니다. 내용을 작성하였습니다. 내용을 작성하였습니다.<br>	
			</div>
			<div class="tag-area">
				${bv.bdtag} #전주 #한옥마을 #야경
			</div>
		</div>
		
		<!-- 댓글 작성 영역 시작-->
		<div class="div-comment-write">
			<div class="comment-write-area">
				<input type="text" id="input-comment" name="cmcont" class="input-comment" placeholder="댓글을 작성해주세요.">
			</div>
			<div class="comment-write-btn-area">
				<button class="btn-img"></button>
			</div>
		</div>
		<!-- 댓글 작성 영역 끝 -->
		
		<!-- 댓글 리스트 영역 -->
		<div class="div-commentList">
		
		</div>
		<!-- /댓글 리스트 영역 -->
		
		<div class="div-bottom">
			<c:if test="${mbno eq bv.mbno}">
				<button type="button" class="modi-btn" onclick="location.href='${pageContext.request.contextPath}/board/galleryModify.do?bdno=${bv.bdno}';" >수정</button>
				<button type="button" class="del-btn" onclick="" >삭제</button>
			</c:if>
			<button type="button" onclick="">&#x1F6A8;</button>
		</div>
		
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script>
	var swiper = new Swiper(".mySwiper", {
		spaceBetween: 30,
		centeredSlides: true,
		autoHeight : true,
		slidesPerView: 1,
		pagination: {
			el: ".swiper-pagination",
			clickable: true,
		},
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
	});	
	
	//띄운 모달 안의 글 삭제 버튼
	$(".del-btn").on("click", function() {
		var isConfirmed = confirm('정말 삭제하시겠습니까?');
		
		if (isConfirmed) {
			var bdno = "${bv.bdno}";
		
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/board/galleryDeleteAction.do",
				data: { "bdno": bdno },
				dataType: "json",
				success: function(response) {
					if (response.success) {
						alert('삭제되었습니다.');
						// console.log(response);
						//debugger;
						location.href = "${pageContext.request.contextPath}/board/galleryList.do";
					} else {
						alert('삭제에 실패했습니다.');
					}
				},
				error: function(request, status, error) {
					alert("code : "+request.status+"\n"+"message : " +request.responseText+"\n"+"error : "+ error);
				}
			});
		} else {
			alert('삭제가 취소되었습니다.');
		}
	});
	
	$(document).ready(function(){
		
		$(".md-like-area").on("click", function(){
			
			let mbno = "${mbno}";
			let bdno = $(this).children('input').val();
			
			event.preventDefault();
			
			if(!mbno){
				if(confirm("로그인이 필요한 기능입니다.\n\n로그인 하시겠습니까?")){
					location.href = "${pageContext.request.contextPath}/member/memberLogin.do";
				}else{
					return;
				}
			}else{
				let currentLike = $(this).children('label');
					
				if(currentLike.text() === "♡") {
				
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/board/boardLikeCntUpdate.do",
						data : {"bdno" : bdno},
						dataType : "json",
						cache : false,
						success : function(data){
							if(data.value == 1){
								currentLike.text("♥");
								$("#like-num"+bdno).siblings().text("♥");
							}else{
								alert(data.value + "좋아요 추가 에러");
							}
						},
						error : function(data){
							alert("추가 에러");
						}
					});
					
				}else{
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/board/boardLikeCntUpdateCancel.do",
						data : {"bdno" : bdno},
						dataType : "json",
						cache : false,
						success : function(data){
							if(data.value == 1){
								currentLike.text("♡");
								$("#like-num"+bdno).siblings().text("♡");
							}else{
								alert(data.value + "좋아요 취소 에러");
							}							
						},
						error : function(){
							alert("취소 에러");
						}
					});					
				}
			}
		});
		
		//글쓰기 버튼 시 댓글 등록 후 댓글목록 다시 불러옴
		$(".btn-img").on("click", function(){
			
			event.preventDefault();
			
			let inputComment = $("#input-comment");
			
			let mbno = "${mbno}";
			let bdno = "${bv.bdno}";
			
			if(mbno == null || mbno == ""){
				if(confirm("로그인이 필요한 기능입니다.\n\n로그인 하시겠습니까?")){
					location.href = "${pageContext.request.contextPath}/member/memberLogin.do";
				}else{
					return;
				}
			}else if(inputComment.val() == ""){
				alert("내용을 입력해주세요");
				inputComment.focus();
				return;
			}else{
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/comment/commentWrite.do",
					data : {"mbno" : mbno, "bdno" : bdno},
					dataType : "json",
					cache : false,
					success : function(data){
						if(data.value == 1){
							commentListLoad();
							inputComment.val("");
						}
					},
					error : function(){
						alert("글등록 에러");
						return;
					}
				});
			}
		});
		
		$("#input-comment").on("click", function(){
			
			event.preventDefault();
			
			let mbno = "${mbno}";
			
			if(mbno == null || mbno == ""){
				if(confirm("로그인이 필요한 기능입니다.\n\n로그인 하시겠습니까?")){
					location.href = "${pageContext.request.contextPath}/member/memberLogin.do";
				}else{
					return;
				}
			}
		});
		
	});		
	
	function commentListLoad(){
		
		let bdno = "${bv.bdno}";
		
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/comment/commentList.do",
			data : {"bdno" : bdno},
			dataType : "json",
			cache : false,
			success : function(data){
				createCommentList(data);
			},
			error : function(){
				alert("commentListLoad 에러");
				return;
			}
			
		});
	}
	commentListLoad();
	
	//화면 로드 시 bdno들고가서 bdno에 맞는 commentList 불러와서 화면에 그림
	function createCommentList(data){
		
		let str = "";
		let mbno = "${mbno}";
		
		$(data).each(function(){
			
			if(mbno == this.mbno){
				
				str += "<div id='comment-area"+this.cmno+"' class='comment-area'>"
					+		"<div class='comment-id'>"
					+			"<span class='span-nick'>"+this.mbname+"</span>"
					+		"</div>"
					+		"<div class='comment-cont'>"
					+			"<span class='span-cont'>"+this.cmcont+"</span>"
					+		"</div>"
					+		"<div class='comment-date'>"
					+			"<span class='span-date'>"+this.cmdate+"</span>"
					+		"</div>"
					+		"<div class='comment-btn'>"
					+			"<button type='button' class='btn-modify' onclick=''>수정</button>"
					+			"<button type='button' class='btn-delete' onclick=''>삭제</button>"
					+			"<button type='button' class='btn-report' onclick=''>&#x1F6A8;</button>"	
					+		"</div>"
					+	"</div>";			
			}else{
				str += "<div class='comment-area' id='comment-area"+this.cmno+"'>"
					+		"<div class='comment-id'>"
					+			"<span class='span-nick'>"+this.mbname+"</span>"
					+		"</div>"
					+		"<div class='comment-cont'>"
					+			"<span class='span-cont'>"+this.cmcont+"</span>"
					+		"</div>"
					+		"<div class='comment-date'>"
					+			"<span class='span-date'>"+this.cmdate+"</span>"
					+		"</div>"
					+		"<div class='comment-btn'>"
					+			"<button type='button' class='btn-report' onclick=''>&#x1F6A8;</button>"	
					+		"</div>"
					+	"</div>";
			}
			
			$(".div-commentList").html(str);
			
			return;
		});
	}		

	
</script>