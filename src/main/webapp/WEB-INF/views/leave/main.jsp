<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html> <!-- html 태그 추가 -->
<head>
<meta charset="UTF-8"> <!-- 한글 인코딩 추가 -->

   
   
   
   
   
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/leaveMain.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/leaveStyle.css" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    
   
    
     
    
    
    
    
     
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["${pageContext.request.contextPath }/resources/assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/demo.css" />
  </head>
  <body>
    <div class="wrapper">
      <%@ include file="/resources/assets/inc/sidebar.jsp" %> <!-- sidebar -->
      <div class="main-panel">
        <div class="main-header">
          <%@ include file="/resources/assets/inc/logo_header.jsp" %> <!-- Logo Header -->
          <%@ include file="/resources/assets/inc/navbar.jsp" %> <!-- Navbar Header -->
        </div>
        <div class="container">
          <div class="page-inner">
                
                <!-- page-inner -->
<!------------------------------------------------------------------------------------------------------------------>
                    
  <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                 <div class="card-title">휴가 관리</div>



				<button class="btn1 btn-primary">
					<span class="btn-label"> <i class="fa fa-bookmark"></i>
					</span> 연차 신청서
				</button>

				<button class="btn1 btn-primary" data-toggle="modal"
					data-target="#overtimeModal">
					<span class="btn-label"> <i class="fa fa-bookmark"></i>
					</span> 휴가 신청서
				</button>

				<button class="btn1 btn-primary">
					<span class="btn-label"> <i class="fa fa-bookmark"></i>
					</span> 휴직 신청서
				</button>

					<button class="btn1 btn-primary">
                        <span class="btn-label">
                          <i class="fa fa-bookmark"></i>
                        </span>
                       		나의 휴가 현황
              </button>




<div class="card-header">
                    <h4 class="card-title">나의 연차 현황표</h4>
                  </div>
<div class="card-body">
	<div class="table-responsive">
		<div id="basic-datatables_wrapper"
			class="dataTables_wrapper container-fluid dt-bootstrap4">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="basic-datatables_length">
						<label>Show <select name="basic-datatables_length"
							aria-controls="basic-datatables"
							class="form-control form-control-sm"><option
									value="10">10</option>
								<option value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option></select> entries
						</label>
					</div>
				</div>
				<div class="col-sm-12 col-md-6">
					<div id="basic-datatables_filter" class="dataTables_filter">
						<label>Search:<input type="search"
							class="form-control form-control-sm" placeholder=""
							aria-controls="basic-datatables"></label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<table id="basic-datatables"
						class="display table table-striped table-hover dataTable"
						role="grid" aria-describedby="basic-datatables_info">
						<thead>
							<tr role="row">
								<th class="sorting_asc" tabindex="0"
									aria-controls="basic-datatables" rowspan="1"
									colspan="1" aria-sort="ascending"
									aria-label="Name: activate to sort column descending"
									style="width: 242.312px;">날짜</th>
						<th class="sorting" tabindex="0"
							aria-controls="basic-datatables" rowspan="1"
							colspan="1"
							aria-label="Position: activate to sort column ascending"
							style="width: 366.031px;">자동부여</th>
						<th class="sorting" tabindex="0"
							aria-controls="basic-datatables" rowspan="1"
							colspan="1"
							aria-label="Office: activate to sort column ascending"
							style="width: 187.375px;">자동소멸</th>
						<th class="sorting" tabindex="0"
							aria-controls="basic-datatables" rowspan="1"
							colspan="1"
							aria-label="Age: activate to sort column ascending"
							style="width: 84.3125px;">조정</th>
						<th class="sorting" tabindex="0"
							aria-controls="basic-datatables" rowspan="1"
							colspan="1"
							aria-label="Start date: activate to sort column ascending"
							style="width: 183.922px;">사용</th>
						<th class="sorting" tabindex="0"
							aria-controls="basic-datatables" rowspan="1"
							colspan="1"
							aria-label="Salary: activate to sort column ascending"
							style="width: 156.047px;">잔여</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th rowspan="1" colspan="1"></th>
								<th rowspan="1" colspan="1"></th>
								<th rowspan="1" colspan="1"></th>
								<th rowspan="1" colspan="1"></th>
								<th rowspan="1" colspan="1"></th>
								<th rowspan="1" colspan="1"></th>
							</tr>
						</tfoot>
						<tbody>

				
<!-- 연차 소멸 부여 자동 테이블  -->
<!-- 							<tr role="row" class="odd"> -->
<!-- 								<td class="sorting_1"></td> -->
					 <c:forEach var="leave" items="${leaveInfo}">
            <tr role="row" class="odd">
                <td class="sorting_1">${leave.adjustmentDate}</td>
                <td class="sorting_1">${leave.Lgrant}</td>
                <td class="sorting_1">${leave.expiry}</td>
                <td class="sorting_1">${leave.adjustment}</td> <!-- 조정 필드 -->
                <td class="sorting_1">${leave.used_annual_leave}</td>
                <td class="sorting_1">${leave.remaining_annual_leave}</td>
            </tr>
        </c:forEach>
	
					
						</tbody>
					</table>
					
					
	<script>
	
	$.ajax({
	    url: 'getLeaveInfo',
	    method: 'GET',
	    contentType: 'application/json', // 명시적으로 설정
	    success: function(data) {
	        if (data.length > 0) {
	            data.forEach(function(leave) {
	                var row = '<tr>' +
	                    '<td>' + leave.adjustmentDate + '</td>' +
	                    '<td>' + leave.Lgrant + '</td>' +
	                    '<td>' + leave.expiry + '</td>' +
	                    '<td>' + (leave.adjustment ? leave.adjustment : '') + '</td>' +
	                    '<td>' + leave.used_annual_leave + '</td>' +
	                    '<td>' + leave.remaining_annual_leave + '</td>' +
	                    '</tr>';
	                $('#leaveTable tbody').append(row);
	            });
	        } else {
	            alert('휴가 정보가 없습니다.');
	        }
	    },
	    error: function() {
	        alert('서버 요청에 실패했습니다.');
	    }
	});
</script>



					
					
					
					
					
					
					
					
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-5">
					<div class="dataTables_info" id="basic-datatables_info"
						role="status" aria-live="polite">Showing 1 to 10 of
						57 entries</div>
				</div>
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="basic-datatables_paginate">
						<ul class="pagination">
							<li class="paginate_button page-item previous disabled"
								id="basic-datatables_previous"><a href="#"
								aria-controls="basic-datatables" data-dt-idx="0"
								tabindex="0" class="page-link">Previous</a></li>
							<li class="paginate_button page-item active"><a
								href="#" aria-controls="basic-datatables"
								data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="basic-datatables" data-dt-idx="2"
								tabindex="0" class="page-link">2</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="basic-datatables" data-dt-idx="3"
								tabindex="0" class="page-link">3</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="basic-datatables" data-dt-idx="4"
								tabindex="0" class="page-link">4</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="basic-datatables" data-dt-idx="5"
								tabindex="0" class="page-link">5</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="basic-datatables" data-dt-idx="6"
								tabindex="0" class="page-link">6</a></li>
							<li class="paginate_button page-item next"
								id="basic-datatables_next"><a href="#"
								aria-controls="basic-datatables" data-dt-idx="7"
								tabindex="0" class="page-link">Next</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



</div>
                  <div class="card-body">
                    
   

<!------------------------------------------------------------------------------------------------------------------>
          
          <!-- page-inner -->
        </div>
		<!-- container -->
<%--         <%@ include file="/resources/assets/inc/footer.jsp" %> --%>
      </div>
      <!-- main-panel -->
    </div>
    <!-- main-wrapper -->
    
    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Chart JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/datatables/datatables.min.js"></script>

    <!-- Bootstrap Notify -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!-- jQuery Vector Maps -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jsvectormap/world.js"></script>

    <!-- Sweet Alert -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/kaiadmin.min.js"></script>

    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/setting-demo.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/demo.js"></script>
    <script>
      $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#177dff",
        fillColor: "rgba(23, 125, 255, 0.14)",
      });

      $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#f3545d",
        fillColor: "rgba(243, 84, 93, .14)",
      });

      $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#ffa534",
        fillColor: "rgba(255, 165, 52, .14)",
      });
    </script>
    
  </body>
</html>
