<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>패널티 회원 관리</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/css/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/penaltyUserManagement.css" rel="stylesheet">

</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="./trainerRegisterList.jsp">
                <div class="sidebar-brand-icon "> <!-- rotate-n-15 -->
                    <i class="fas fa-wrench"></i> <!-- fa-laugh-wink -->
                </div>
                <div class="sidebar-brand-text mx-3">관리자 페이지</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item ">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
                    aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>승인 요청 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Components:</h6> -->
                        <a class="collapse-item " href="./trainerRegisterList.jsp">트레이너 등록 요청</a>
                        <a class="collapse-item " href="./centerRegisterList.jsp">센터 등록 요청</a>
                    </div>
                </div>
            </li>
            
            <!-- <i class="fas fa-fw fa-chart-area"></i> -->
            <!-- <i class="fas fa-fw fa-cog"></i> -->
            <!-- <i class="fas fa-fw fa-tachometer-alt"></i> -->
            

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <!-- <div class="sidebar-heading">
                Interface
            </div> -->
            
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="./reportList.jsp">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>신고 관리</span></a>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities1"
                    aria-expanded="true" aria-controls="collapseUtilities1">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>상품 관리</span>
                </a>
                <div id="collapseUtilities1" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Utilities:</h6> -->
                        <a class="collapse-item" href="registeredProductList.jsp">등록 상품 리스트</a>
                        <a class="collapse-item" href="./tradedProductList.jsp">상품 거래 내역</a>
                        <!-- <a class="collapse-item" href="utilities-animation.html">센터 신고 내역</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a> -->
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities2"
                    aria-expanded="false" aria-controls="collapseUtilities2">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>채팅 관리</span>
                </a>
                <div id="collapseUtilities2" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Utilities:</h6> -->
                        <a class="collapse-item" href="./managerChatList.jsp">관리자 채팅 내역</a>
                        <a class="collapse-item" href="./customerChatList.jsp">고객 채팅 내역</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Heading -->
            <!-- <div class="sidebar-heading">
                Addons
            </div> -->
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item active">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities3"
                    aria-expanded="false" aria-controls="collapseUtilities3">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>회원 관리</span>
                </a>
                <div id="collapseUtilities3" class="collapse show" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Utilities:</h6> -->
                        <a class="collapse-item" href="./userManagement.jsp">회원 관리</a>
                        <a class="collapse-item active" href="./penaltyUserManagement.jsp">패널티 회원 관리</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="./reviewManagement.jsp">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>리뷰 관리</span></a>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage1"
                    aria-expanded="false" aria-controls="collapsePage1">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>포인트 관리</span>
                </a>
                <div id="collapsePage1" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Login Screens:</h6> -->
                        <a class="collapse-item" href="./pointList.jsp">포인트 내역</a>
                        <a class="collapse-item" href="./pointManagement.jsp">포인트 관리</a>
                        <!-- <a class="collapse-item" href="forgot-password.html">1:1 문의</a> -->
                        <!-- <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a> -->
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage2"
                    aria-expanded="false" aria-controls="collapsePage2">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>쿠폰 관리</span>
                </a>
                <div id="collapsePage2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Login Screens:</h6> -->
                        <a class="collapse-item" href="./couponList.jsp">쿠폰 내역</a>
                        <a class="collapse-item" href="./couponProvide.jsp">쿠폰 발급하기</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage3"
                    aria-expanded="false" aria-controls="collapsePage3">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>고객지원</span>
                </a>
                <div id="collapsePage3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Login Screens:</h6> -->
                        <a class="collapse-item" href="./noticeList.jsp">공지사항</a>
                        <a class="collapse-item" href="./FAQList.jsp">자주묻는 질문</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 my-5 pl-3 text-gray-800 font-weight-bold">패널티 회원 관리</h1>
                    

	                    

                    <div class="row">

                        <div class="col-lg-12">

                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4">
                            	
                            	<div class="row div-filter my-3">
			                    	<div class="col-md-6 div-status">
			                    		<div class="div-button">
			                    			<ul class="ul-status">
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						총 패널티 회원<span class="span-count"> 1000</span>
			                    					</a>
			                    				</li>
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						일반회원<span class="span-count"> 666</span>
			                    					</a>
			                    				</li>
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						트레이너<span class="span-count"> 300</span>
			                    					</a>
			                    				</li>
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						센터<span class="span-count"> 34</span>
			                    					</a>
			                    				</li>
			                    			</ul>
			                    		</div>
			                    	</div>
			                    	<div class="col-md-6 div-search">
			                    		<button type="button" class="btn btn-discord br-radi-0">
			                    			<i class="fas fa-search fa-sm"></i>
			                    		</button>
	                    				<div class="div-label">
			                    			<label class="label-search">
			                    				<input type="text" class="bg-light input-search">
			                    			</label>
	                    				</div>
			                    	</div>
			                    </div>
                            	
                            	<table class="table tb1">
                            		<tr>
                            			<th>회원번호</th>
                            			<th>이름</th>
                            			<th>분류</th>	<!-- 일반회원, 트레이너, 센터 -->
                            			<th>이메일</th>
                            			<th>주소</th>
                            			<th>가입일</th>
                            			<th>신고수</th>
                            			<th>상태</th>
                            		</tr>
                            		<c:forEach var="i" begin="1" end="9" step="1">
                            			<tr>
	                            			<td class="td1">0000${i}</td>
	                            			<td class="td1">이름${i}</td>
	                            			<td class="td1">회원분류${i}</td>
	                            			<td class="td1">${i}${i}${i}${i}@${i}${i}${i}${i}.com</td>
	                            			<td class="td1">주소${i}</td>
	                            			<td class="td1">2023-12-2${i} 17:50:0${i}</td>
	                            			<td class="td1">${i}</td>
	                            			<td class="td1">상태${i}</td>
	                            		</tr>
                            		</c:forEach>
                            	</table>
                            	
                            	<!-- 페이징 영역 시작 -->
                            	<div class="row my-4">
                            		<div class="col-lg-12">
                            			<div class="pagination-area">
                            				<ul class="pagination">
                            					<!-- disabled : 페이지 버튼 비활성 -->
                            					<li class="paginate_button page-item previous disabled">	
                            						<a href="#" aria-controls="dataTable" class="page-link">
                            							◀
                            						</a>
                            					</li>
                            					<c:forEach var="i" begin="1" end="5" step="1">
                            						<c:choose>
                            							<c:when test="${i eq 1}">
                            								<li class="paginate_button page-item active">
			                            						<a href="#" aria-controls="dataTable" class="page-link">
			                            							${i}
			                            						</a>
			                            					</li>
                            							</c:when>
                            							<c:otherwise>
                            								<li class="paginate_button page-item">
			                            						<a href="#" aria-controls="dataTable" class="page-link">
			                            							${i}
			                            						</a>
			                            					</li>
                            							</c:otherwise>
                            						</c:choose>
		                            						
                            					</c:forEach>
	                            					
                            					<li class="paginate_button page-item next">
                            						<a href="#" aria-controls="dataTable" class="page-link">
                            							▶
                            						</a>
                            					</li>
                            				</ul>
                            			</div>
									</div>
                            	</div>
								<!-- 페이징 영역 끝-->
								
                            </div>

                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/css/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/css/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/css/admin/js/sb-admin-2.min.js"></script>
	
	<script>
		
	</script>
	
</body>
</html>