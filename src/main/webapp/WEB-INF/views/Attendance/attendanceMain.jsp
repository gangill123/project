<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
 <!-- 한글 인코딩 추가 -->
 <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/attendanceMain.css" />
<!--QR 라이브러리  -->

    
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    
    
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
    
    
    
    
    
 
    <link
      rel="icon"
      href="${pageContext.request.contextPath }/resources/assets/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    />

    <!-- Fonts and icons -->
    
     
    
    
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
<!------------------------------------------------------------------------------------------------------------------>
  
  
  
  
  
  <h1>근태 관리</h1>
	
	
	
	
	
<div class="bg-white shadow-lg rounded-lg p-8 max-w-lg w-full">
    <h1 class="text-3xl font-bold mb-6 text-center">사원 정보</h1>
    <div class="flex justify-center mb-6">
        <div class="w-40 h-40 bg-gray-200 rounded-md flex items-center justify-center">
            <span class="text-gray-500">img</span>
        </div>
    </div>
    <div class="space-y-4">
        <div class="flex justify-between">
            <span class="font-semibold">사원번호 :</span>
            <span>${emp_id}</span>
        </div>
        <div class="flex justify-between">
            <span class="font-semibold">직책 :</span>
            <span>Manager</span>
        </div>
        <div class="flex justify-between">
            <span class="font-semibold">부서:</span>
            <span>HR</span>
        </div>
        <div class="flex justify-between">
            <span class="font-semibold">이름:</span>
            <span>홍길동</span>
        </div>
        <div class="flex justify-between">
            <span class="font-semibold">출근 시간:</span>
            <span>${checkInTime}</span>
        </div>
        <div class="flex justify-between">
            <span class="font-semibold">퇴근 시간:</span>
            <span id="checkoutTimeDisplay">퇴근 시간 기록 없음</span>
        </div>
        <div class="flex justify-between">
            <span class="font-semibold">근무한 시간:</span>
            <span id="workingTimeDisplay">근무한시간 기록 없음</span>
        </div>
        
		    <button id="calculateButton" class="btn btn-primary">오늘 내가 근무한 시간</button>
		    
		
		<button id="checkoutButton" class="btn btn-primary">퇴근</button>
		
    </div>
</div>
   
   
 <div class="container mt-5">
        <h2 class="mb-4">최근 3일간 내 근무 현황</h2>
        
        <table class="table table-bordered" id="attendanceTable">
            <thead>
                <tr>
                    <th scope="col">출근날짜</th>
                    <th scope="col">퇴근날짜</th>
                    <th scope="col">근무상태</th>
                </tr>
            </thead>
            <tbody>
                <!-- AJAX로 데이터가 추가될 부분 -->
            </tbody>
        </table>
    </div>
    
      <script>
        $(document).ready(function() {
            // 페이지가 로드될 때 출근 기록을 가져오는 AJAX 요청
            $.ajax({
                url: "fetchAttendanceRecords", // 컨트롤러의 메서드 URL
                type: "GET",
                success: function(attendanceList) {
                    // 테이블에 출근 기록 추가
                    var tableBody = $("#attendanceTable tbody");
                    tableBody.empty(); // 기존 데이터 지우기
                    attendanceList.forEach(function(attendance) {
                        tableBody.append(
                            "<tr>" +
                            "<td>" + attendance.check_in + "</td>" +
                            "<td>" + attendance.check_out + "</td>" +
                            "<td>" + attendance.workform_status + "</td>" +
                            "</tr>"
                        );
                    });
                },
                error: function() {
                    alert("출근 기록을 가져오는 데 실패했습니다.");
                }
            });
        });
    </script>
    
    



			<script>
		    $(document).ready(function() {
		        $('#checkoutButton').click(function() {
		            $.ajax({
		                url: '<c:url value="checkOut" />',
		                type: 'GET',
		                success: function(response) {
		                    if (response.status === 'success') {
		                        alert(response.message);
		
		                        // 퇴근 시간이 성공적으로 업데이트되면 현재 시간을 퇴근 시간으로 표시
		                        const now = new Date();
		                        const formattedTime = now.getFullYear() + '-' +
		                            ('0' + (now.getMonth() + 1)).slice(-2) + '-' +
		                            ('0' + now.getDate()).slice(-2) + ' ' +
		                            ('0' + now.getHours()).slice(-2) + ':' +
		                            ('0' + now.getMinutes()).slice(-2) + ':' +
		                            ('0' + now.getSeconds()).slice(-2);
		                        
		                        $('#checkoutTimeDisplay').text('' + formattedTime);
		                    } else {
		                        alert(response.message);
		                    }
		                },
		                error: function() {
		                    alert('퇴근 요청 중 오류가 발생했습니다.');
		                }
		            });
		        });
		    });
		    
		    $(document).ready(function() {
		        $('#calculateButton').click(function() {
		            $.ajax({
		                url: '<c:url value="calculateWorkingTime" />',
		                type: 'GET',
		                success: function(response) {
		                    alert(response.message);
		                    // 계산된 근무 시간을 페이지에 표시
		                    $('#workingTimeDisplay').text('총 근무 시간: ' + response.workingTime.toFixed(2) + ' 시간');
		                },
		                error: function() {
		                    alert('근무 시간 계산 중 오류가 발생했습니다.');
		                }
		            });
		        });
		    });
		    </script>

		   
		<!-- 출퇴근   -->
		


  

<!--  달력 아이프레임-->

<!-- 근태 결재 신청 버튼 -->



<div class="">
    <div>
        <!-- 카드 1 -->
        <div class="bg-white p-8 rounded-lg shadow-md card mb-4" onclick="openModal('modal1')">
            <div class="flex items-center mb-4">
                <span class="text-2xl">👩‍💼</span>
                <h2 class="ml-2 text-xl font-bold">나의 출퇴근 시간 조회</h2>
            </div>
            <p class="text-gray-600">나의 기본근무시간을 확인하세요.</p>
        </div>

        <!-- 카드 2 -->
        <div class="bg-white p-8 rounded-lg shadow-md card mb-4" onclick="openModal('modal2')">
            <div class="flex items-center mb-4">
                <span class="text-2xl">🔥</span>
                <h2 class="ml-2 text-xl font-bold">초과 근무시간 조회</h2>
            </div>
            <p class="text-gray-600">초과, 야간, 특근 등의 초과근무시간을 확인하세요.</p>
        </div>

        <!-- 카드 3 -->
        <div class="bg-white p-8 rounded-lg shadow-md card mb-4" onclick="openModal('modal3')">
            <div class="flex items-center mb-4">
                <span class="text-2xl">🏃‍♂️</span>
                <h2 class="ml-2 text-xl font-bold">휴직 신청서 <span class="text-red-500 text-sm">NEW</span></h2>
            </div>
            <p class="text-gray-600">휴직 신청을 할 수 있습니다.</p>
        </div>

        <!-- 카드 4 -->
        <div class="bg-white p-8 rounded-lg shadow-md card mb-4" onclick="openModal('modal4')">
            <div class="flex items-center mb-4">
                <span class="text-2xl">☂️</span>
                <h2 class="ml-2 text-xl font-bold">출퇴근 수정 요청서</h2>
            </div>
            <p class="text-gray-600">출/퇴근 시간 수정 요청을 할 수 있습니다.</p>
        </div>
    </div>
</div>

<!-- 모달 구조 -->
<div id="modal1" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('modal1')">&times;</span>
        <h2>나의 출퇴근 시간 조회</h2>
        <p>여기에 내용을 추가하세요.</p>
    </div>
</div>
<div id="modal2" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('modal2')">&times;</span>
        <h2>초과 근무시간 조회</h2>
        <p>여기에 내용을 추가하세요.</p>
    </div>
</div>
<div id="modal3" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('modal3')">&times;</span>
        <h1><휴직 신청서></h1>
        <form id="leaveRequestForm">
        	   <div class="mb-4">
                <label for="leaveType" class="block text-sm font-medium text-gray-700">휴직 분류:</label>
                <select id="leaveType" name="leaveType" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                    <option value="">선택하세요</option>
                    <option value="육아휴직">육아휴직</option>
                    <option value="예비군">예비군</option>
                    <option value="병가휴직">병가휴직</option>
                </select>
            </div>
        
            <div class="mb-4">
                <label for="employeeName" class="block text-sm font-medium text-gray-700">이름</label>
                <input type="text" id="employeeName" name="employeeName" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md" placeholder="이름을 입력하세요.">
            </div>
            <div class="mb-4">
                <label for="employeeId" class="block text-sm font-medium text-gray-700">직원 ID</label>
                <input type="text" id="employeeId" name="employeeId" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md" placeholder="직원 ID를 입력하세요.">
            </div>
            <div class="mb-4">
                <label for="leaveStart" class="block text-sm font-medium text-gray-700">휴직 시작일</label>
                <input type="date" id="leaveStart" name="leaveStart" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label for="leaveEnd" class="block text-sm font-medium text-gray-700">휴직 종료일</label>
                <input type="date" id="leaveEnd" name="leaveEnd" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label for="leaveReason" class="block text-sm font-medium text-gray-700">휴직 사유</label>
                <textarea id="leaveReason" name="leaveReason" rows="4" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md" placeholder="휴직 사유를 입력하세요."></textarea>
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white font-semibold py-2 rounded-md hover:bg-blue-600">신청서 제출</button>
        </form>
    </div>
</div>


<div id="modal4" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('modal4')">&times;</span>
        <h2>출퇴근 수정 요청서</h2>
        <form id="attendanceRequestForm">
            <div class="mb-4">
                <label for="employeeName" class="block text-sm font-medium text-gray-700">이름:</label>
                <input type="text" id="employeeName" name="employeeName" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md" placeholder="이름을 입력하세요.">
            </div>
            <div class="mb-4">
                <label for="employeeId" class="block text-sm font-medium text-gray-700">직원 ID:</label>
                <input type="text" id="employeeId" name="employeeId" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md" placeholder="직원 ID를 입력하세요.">
            </div>
            <div class="mb-4">
                <label for="attendanceType" class="block text-sm font-medium text-gray-700">출퇴근 수정 사유:</label>
                <select id="attendanceType" name="attendanceType" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                    <option value="">선택하세요</option>
                    <option value="출근시간 지연">출근시간 지연</option>
                    <option value="조기 퇴근">조기 퇴근</option>
                    <option value="잘못된 출퇴근 시간 기록">잘못된 출퇴근 시간 기록</option>
                    <option value="기타">기타</option>
                </select>
            </div>
            <div class="mb-4">
                <label for="correctedTime" class="block text-sm font-medium text-gray-700">수정할 시간:</label>
                <input type="datetime-local" id="correctedTime" name="correctedTime" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label for="reason" class="block text-sm font-medium text-gray-700">추가 설명:</label>
                <textarea id="reason" name="reason" rows="4" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md" placeholder="추가 설명을 입력하세요."></textarea>
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white font-semibold py-2 rounded-md hover:bg-blue-600">요청서 제출</button>
        </form>
    </div>
</div>


<!-- JavaScript -->
<script>
    function openModal(modalId) {
        document.getElementById(modalId).style.display = "flex"; // Flex로 변경하여 중앙 정렬
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none"; // 숨김
    }

    // 모달 바깥 클릭 시 모달 닫기
    window.onclick = function(event) {
        const modals = document.getElementsByClassName('modal');
        for (let i = 0; i < modals.length; i++) {
            if (event.target == modals[i]) {
                closeModal(modals[i].id);
            }
        }
    }
</script>






<!------------------------------------------------------------------------------------------------------------------>
          </div>
          <!-- page-inner -->
        </div>
		<!-- container -->
        <%@ include file="/resources/assets/inc/footer.jsp" %>
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
