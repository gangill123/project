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
                    <div class="card-title">근태관리</div>
               
 
                    




<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 p-6 max-w-7xl mx-auto">
    <!-- 카드 1: 기본 근무시간 -->
    <div class="bg-white p-8 rounded-lg shadow-md flex flex-col items-center cursor-pointer" data-bs-toggle="modal" data-bs-target="#basicWorkingHoursModal">
        <div class="flex items-center mb-6">
            <span class="text-8xl">👨‍💼</span>
            <h2 class="ml-4 text-3xl font-semibold">기본 근무시간</h2>
        </div>
        <p class="text-gray-600 mb-4 text-xl text-center">직장별 기본근무시간을 확인하세요. 임시저장된 구성원 명단도 확인할 수 있습니다.</p>
    </div>

    <!-- 카드 2: 초과 근무시간 -->
    <div class="bg-white p-8 rounded-lg shadow-md flex flex-col items-center cursor-pointer" data-bs-toggle="modal" data-bs-target="#overtimeHoursModal">
        <div class="flex items-center mb-6">
            <span class="text-8xl">🔥</span>
            <h2 class="ml-4 text-3xl font-semibold">초과 근무시간</h2>
        </div>
        <p class="text-gray-600 mb-4 text-xl text-center">연장, 야간, 휴일 초과근무시간을 확인하세요. 기본근무시간과 동일하게 초과시간을 관리하여 확인할 수 있습니다.</p>
    </div>

    <!-- 카드 3: 일별 근태 기록 -->
    <div class="bg-white p-8 rounded-lg shadow-md flex flex-col items-center cursor-pointer" data-bs-toggle="modal" data-bs-target="#dailyAttendanceRecordModal">
        <div class="flex items-center mb-6">
            <span class="text-8xl">🏃‍♂️</span>
            <h2 class="ml-4 text-3xl font-semibold">일별 근태 기록</h2>
        </div>
        <p class="text-gray-600 mb-4 text-xl text-center">전체 근태의 일별 근태기록을 확인하세요. 출, 퇴근시간, 외근시간, 조퇴시간, 휴가시간을 확인할 수 있습니다.</p>
    </div>

    <!-- 카드 4: 연차 사용현황 -->
    <div class="bg-white p-8 rounded-lg shadow-md flex flex-col items-center cursor-pointer" data-bs-toggle="modal" data-bs-target="#annualLeaveStatusModal">
        <div class="flex items-center mb-6">
            <span class="text-8xl">🚗</span>
            <h2 class="ml-4 text-3xl font-semibold">연차 사용현황</h2>
        </div>
        <p class="text-gray-600 mb-4 text-xl text-center">구성원의 연차를 확인하세요. 기간 별 연차 현황, 사용한 연차 내역 언제든 쉽게 확인할 수 있습니다.</p>
    </div>

    <!-- 카드 5: 구성원 인사정보 -->
    <div class="bg-white p-8 rounded-lg shadow-md flex flex-col items-center cursor-pointer" data-bs-toggle="modal" data-bs-target="#employeeInfoModal">
        <div class="flex items-center mb-6">
            <span class="text-8xl">📄</span>
            <h2 class="ml-4 text-3xl font-semibold">구성원 인사정보</h2>
        </div>
        <p class="text-gray-600 mb-4 text-xl text-center">구성원의 인사정보를 다운로드 합니다. 인사 연차기준이 아닌 현재 직책의 구성원 정보로 표기되지 않습니다.</p>
    </div>

    <!-- 카드 6: 구성원 계약정보 -->
    <div class="bg-white p-8 rounded-lg shadow-md flex flex-col items-center cursor-pointer" data-bs-toggle="modal" data-bs-target="#contractInfoModal">
        <div class="flex items-center mb-6">
            <span class="text-8xl">✍️</span>
            <h2 class="ml-4 text-3xl font-semibold">구성원 계약정보</h2>
        </div>
        <p class="text-gray-600 mb-4 text-xl text-center">개별 계약정보를 다운로드 합니다. 인사 연차기준이 아닌 현재 직책의 구성원 정보로 표기되지 않습니다.</p>
    </div>
</div>

<!-- 모달 구조 -->
<div class="modal fade" id="basicWorkingHoursModal" tabindex="-1" aria-labelledby="basicWorkingHoursModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="basicWorkingHoursModalLabel">기본 근무시간</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                직장별 기본근무시간을 확인하세요. 임시저장된 구성원 명단도 확인할 수 있습니다.
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="overtimeHoursModal" tabindex="-1" aria-labelledby="overtimeHoursModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="overtimeHoursModalLabel">초과 근무시간</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                연장, 야간, 휴일 초과근무시간을 확인하세요. 기본근무시간과 동일하게 초과시간을 관리하여 확인할 수 있습니다.
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="dailyAttendanceRecordModal" tabindex="-1" aria-labelledby="dailyAttendanceRecordModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="dailyAttendanceRecordModalLabel">일별 근태 기록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                전체 근태의 일별 근태기록을 확인하세요. 출, 퇴근시간, 외근시간, 조퇴시간, 휴가시간을 확인할 수 있습니다.
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="annualLeaveStatusModal" tabindex="-1" aria-labelledby="annualLeaveStatusModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="annualLeaveStatusModalLabel">연차 사용현황</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                구성원의 연차를 확인하세요. 기간 별 연차 현황, 사용한 연차 내역 언제든 쉽게 확인할 수 있습니다.
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="employeeInfoModal" tabindex="-1" aria-labelledby="employeeInfoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="employeeInfoModalLabel">구성원 인사정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                구성원의 인사정보를 다운로드 합니다. 인사 연차기준이 아닌 현재 직책의 구성원 정보로 표기되지 않습니다.
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="contractInfoModal" tabindex="-1" aria-labelledby="contractInfoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="contractInfoModalLabel">구성원 계약정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                개별 계약정보를 다운로드 합니다. 인사 연차기준이 아닌 현재 직책의 구성원 정보로 표기되지 않습니다.
            </div>
        </div>
    </div>
</div>



 >
               
                    
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
