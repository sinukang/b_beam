<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../source/css/home.css" type="text/css" rel="stylesheet">
	<link href="../source/css/gallery.css" type="text/css" rel="stylesheet">
</head>
<body>
	<header class="header">
		<div class="header-logo">
			<h1 class="logo">
				<a class="svgLogo" href="../index.jsp">
					<img src="../source/images/logo4.png" width="150" height="80" alt="메인화면으로 이동">
				</a>
			</h1>
		</div>
		<div class="menu">
			<ul class="depth1">
				<li>
					<a href="../index.jsp">관광컨텐츠</a>
				</li>
				<li>
					<a href="../index.jsp">TOP10</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/board/galleryList.do">갤러리</a>
				</li>
				<li>
					<a href="../index.jsp">마이페이지</a>
				</li>
				<li>
					<a href="../index.jsp">고객지원</a>
				</li>
			</ul>
		</div>
		<span class="login">
			<a class="loginbutton" href="${pageContext.request.contextPath}/member/memberLogin.do">
			<img src="../source/images/login.png">
			</a>
		</span>
	</header>
	<div class="wrap">
		<div>
			<h1>GALLERY</h1>
		</div>
		<div class="container">
			<table class="wrap-table">
				<tr>
					<td colspan="4" class="write-btn">
						<label class="input-button" for="input-write">글쓰기</label>
						<input type="button" id="input-write" name="btn" style="display:none;" onclick="location.href='${pageContext.request.contextPath}/board/galleryWrite.do';">
					</td>
				</tr>
				<tr>
					<td>
					<div class="inner-table">
						<table class="table-cont" style=" cursor: pointer;" onclick="location.href='목적지 링크주소(URL);">
							<tr>
								<td colspan="2">닉네임</td>
							</tr>
							<tr>
								<td colspan="2"><img src="../source/images/testimg.png"></td>
								
							</tr>
							<tr>
								<td>전주 한옥마을 야경</td>
								<td class="like">♥</td>
							</tr>
						</table>
					</div>
					</td>
					<td>
					<div class="inner-table">
						<table class="table-cont" style=" cursor: pointer;" onclick="location.href='목적지 링크주소(URL);">
							<tr>
								<td colspan="2">닉네임</td>
							</tr>
							<tr>
								<td colspan="2"><img src="../source/images/testimg.png"></td>
								
							</tr>
							<tr>
								<td>전주 한옥마을 야경</td>
								<td class="like">♥</td>
							</tr>
						</table>
					</div>
					</td>
					<td>
					<div class="inner-table">
						<table class="table-cont" style=" cursor: pointer;" onclick="location.href='목적지 링크주소(URL);">
							<tr>
								<td colspan="2">닉네임</td>
							</tr>
							<tr>
								<td colspan="2"><img src="../source/images/testimg.png"></td>
								
							</tr>
							<tr>
								<td>전주 한옥마을 야경</td>
								<td class="like">♥</td>
							</tr>
						</table>
					</div>
					</td>
					<td>
					<div class="inner-table">
						<table class="table-cont" style=" cursor: pointer;" onclick="location.href='목적지 링크주소(URL);">
							<tr>
								<td colspan="2">닉네임</td>
							</tr>
							<tr>
								<td colspan="2"><img src="../source/images/testimg.png"></td>
								
							</tr>
							<tr>
								<td>전주 한옥마을 야경</td>
								<td class="like">♥</td>
							</tr>
						</table>
					</div>
					</td>
				</tr>
				<tr>
					<td>
					<div class="inner-table">
						<table class="table-cont" style=" cursor: pointer;" onclick="location.href='목적지 링크주소(URL);">
							<tr>
								<td colspan="2">닉네임</td>
							</tr>
							<tr>
								<td colspan="2"><img src="../source/images/testimg.png"></td>
								
							</tr>
							<tr>
								<td>전주 한옥마을 야경</td>
								<td class="like">♥</td>
							</tr>
						</table>
					</div>
					</td>
					<td>
					<div class="inner-table">
						<table class="table-cont" style=" cursor: pointer;" onclick="location.href='목적지 링크주소(URL);">
							<tr>
								<td colspan="2">닉네임</td>
							</tr>
							<tr>
								<td colspan="2"><img src="../source/images/testimg.png"></td>
								
							</tr>
							<tr>
								<td>전주 한옥마을 야경</td>
								<td class="like">♥</td>
							</tr>
						</table>
					</div>
					</td>
					<td>
					<div class="inner-table">
						<table class="table-cont" style=" cursor: pointer;" onclick="location.href='목적지 링크주소(URL);">
							<tr>
								<td colspan="2">닉네임</td>
							</tr>
							<tr>
								<td colspan="2"><img src="../source/images/testimg.png"></td>
								
							</tr>
							<tr>
								<td>전주 한옥마을 야경</td>
								<td class="like">♥</td>
							</tr>
						</table>
					</div>
					</td>
					<td>
					<div class="inner-table">
						<table class="table-cont" style=" cursor: pointer;" onclick="location.href='목적지 링크주소(URL);">
							<tr>
								<td colspan="2">닉네임</td>
							</tr>
							<tr>
								<td colspan="2"><img src="../source/images/testimg.png"></td>
								
							</tr>
							<tr>
								<td>전주 한옥마을 야경</td>
								<td class="like">♥</td>
							</tr>
						</table>
					</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="page">
			<table class="page-num">
				<tr>
				<td><a href="">◀</a></td>
				<td><a href="">1</a></td>
				<td><a href="">2</a></td>
				<td><a href="">3</a></td>
				<td><a href="">4</a></td>
				<td><a href="">5</a></td>
				<td><a href="">▶</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>