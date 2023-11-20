<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="../source/css/gallery/galleryContentsInclude.css" type="text/css" rel="stylesheet">
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<div class="wrap">
	<div class="container">
		<table class="wrap-conttable">
			<tr>
				<td>
					<div class="inner-conttable">
						<table class="conttable1-cont">
							<tr>
								<td colspan="2" style="padding: 5px 0 5px 5px;">${bv.mbname}</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="swiper mySwiper" style="height: 100%;">
										<div class="swiper-wrapper">
											<c:forEach var="images" items="${bv.bdFilename}">
												<div class="swiper-slide">
													<img src="${pageContext.request.contextPath}/source/galleryImages/${images}" id="cont-img">
												</div>
											</c:forEach>
										</div>
										<!-- <div class="swiper-button-next" style="color: white;"></div>
										<div class="swiper-button-prev" style="color: white;"></div>
										<div class="swiper-pagination"></div> -->
									</div>
								</td>
							</tr>
						</table>
						<table class="conttable2-cont">
							<tr style="font-weight: bold;">
								<td style="border-bottom:0; padding: 5px 0 3px 15px;">
									${bv.bdtitle} 전주 한옥마을 야경
								</td>
								<td class="like">
									<c:choose>
										<c:when test="${bv.bdLikeYN == 'Y'}">
											<label class="like-button" for="input-like">♥</label>
											<input type="button" id="input-like" name="btn" value="${bv.bdno}" style="display:none;">
										</c:when>
										<c:otherwise>
											<label class="like-button" for="input-like">♡</label>
											<input type="button" id="input-like" name="btn" value="${bv.bdno}" style="display:none;">
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="padding: 10px">
									${bv.bdcont} 내용을 작성하였습니다.내용을 작성하였습니다.내용을 작성하였습니다.내용을 작성하였습니다.내용을 작성하였습니다.내용을 작성하였습니다.
								</td>
							</tr>
							<tr>
								<td colspan="2" style="border: 0; color:#567ff2; padding-left: 25px; font-weight: bold;">
									ㅁ${bv.bdtag}ㅁ #전주 #한옥마을 #야경
								</td>
							</tr>
							<tr>
								<td class="comment-area" style="border-bottom:0; justify-content: center;"> 
									<div>
										<input type="text" id="comment-write" placeholder="댓글을 작성해주세요.">
									</div>
									<div style="width: 24px;">
										<label class="write-btn" for="comment-btn">
											<img src="../source/images/commentbtn.png" id="btn-img">
										</label>
										<input type="button" id="comment-btn" value="작성">
									</div>
								</td>
							</tr>
							
							<!-- 댓글 영역 -->
							<c:forEach var="cv" items="${cv_alist}">
								<tr>
									<td class="comment-area" colspan="2" style="border-bottom:0;"> 
										<div class="comment-id">
											<span>닉네임 : ${cv.mbname}</span>
										</div>
										<div class="comment-cont">
											내용 : ${cv.cmcont}
										</div>
										<div class="comment-date">
											날짜 : ${cv.cmdate}
										</div>
										<div>
											<button type="button" style="color: black" class="del-btn" >삭제</button>
											<button type="button" style="margin-top: -4px;" onclick="">&#x1F6A8;</button>
										</div>
									</td>
								</tr>								
							</c:forEach>
							<!-- /댓글 영역 -->
							
							<tr>
								<td colspan=3 class="bottom-btn">
									<button type="button" class="modi-btn" onclick="location.href='${pageContext.request.contextPath}/board/galleryModify.do?bdno=${bv.bdno}';" >수정</button>
									<button type="button" class="del-btn" >삭제</button>
									<button type="button" onclick="">&#x1F6A8;</button>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>
<script>
	$(document).ready(function(){
		
		$(".like").on("click", function(){
			
			let bdno = $(this).children('input').val();
			alert("bdno : " + bdno);
			
		});
		
	});
</script>