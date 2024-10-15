<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8"> <!-- 한글 인코딩 추가 -->
<!--QR 라이브러리  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Fonts and icons -->
  
    
     <style>
        #qrFrame {
            width: 200px;
            height: 200px;
            border: none;
            overflow: hidden; /* 스크롤바 숨기기 */
        }
    </style>
    
   
    
    
    
    
    
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
    <!--qr코드 숨김 스타일  -->
    <style>
        #qrcode {
            margin-top: 20px;
            display: none; /* 처음에는 QR 코드 숨김 */
        }
        
        
        #qrFrame {
            width: 200px;
            height: 200px;
            border: none;
            overflow: hidden; /* 스크롤바 숨기기 */
        }
    
        
    </style>
    
    <!-- 사원 테이블 -->
      <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    
    
    
    
     <title>Attendance Admin</title>
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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
<h1>사원 근태 관리</h1>
<input type="text" id="emp_id" placeholder="사원 ID를 입력하세요" />
<button id="checkTimeButton" class="btn btn-info">사원 조회</button>

<!-- 사원 근태 데이터 테이블 -->
<div id="attendanceData">
    <table id="checkTimeTable" class="table mt-3">
        <thead>
            <tr>
                <th>직원 ID</th>
                <th>직원 CID</th>
                <th>출근 시간</th>
                <th>퇴근 시간</th>
                <th>외출 시간</th>
                <th>복귀 시간</th>
                <th>근무 시간</th>
                <th>야근 시간</th>
                <th>특별 근무 시간</th>
                <th>근무 상태</th>
                <th>출근 수정 시간</th>
                <th>퇴근 수정 시간</th>
                <th>외출 수정 시간</th>
                <th>결재 수정 시간</th>
                <th>결재일</th>
                <th>근태 ID</th>
                <th>상태</th>
                <th>초과 근무 시간</th>
                <th>수정 이유</th>
                <th>수정인</th>
                <th>수정</th>
            </tr>
        </thead>
        <tbody id="checkTimeList">
            <!-- 조회된 데이터가 여기에 삽입됩니다 -->
        </tbody>
    </table>
    <!-- 페이징 버튼을 위한 공간 -->
    <ul id="pagination" class="pagination"></ul>
</div>

<!-- 모달 구조 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">근태 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="modalContent">
                    <p><strong>근태 ID:</strong> <input type="text" id="modalAttendanceId" class="form-control" /></p>
                    <p><strong>출근 시간:</strong> <input type="text" id="modalCheckInInput" class="form-control" /></p>
                    <p><strong>퇴근 시간:</strong> <input type="text" id="modalCheckOutInput" class="form-control" /></p>
                    <p><strong>외출 시간:</strong> <input type="text" id="modalWorkingOutsideTimeInput" class="form-control" /></p>
                    <p><strong>복귀 시간:</strong> <input type="text" id="modalReturnTimeInput" class="form-control" /></p>
                    <p><strong>근무 시간:</strong> <input type="text" id="modalWorkingTimeInput" class="form-control" /></p>
                    <p><strong>야근 시간:</strong> <input type="text" id="modalNightWorkTimeInput" class="form-control" /></p>
                    <p><strong>특별 근무 시간:</strong> <input type="text" id="modalSpecialWorkingTimeInput" class="form-control" /></p>
                </div>
                <div class="form-group mt-3">
                    <label for="modified_reason">수정 이유:</label>
                    <input type="text" class="form-control" id="modified_reason" placeholder="수정 이유를 입력하세요">
                </div>
                <!-- 수정 완료 메시지 -->
                <div id="successMessage" class="alert alert-success" style="display: none;">
                    수정이 완료되었습니다.
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" id="saveChangesButton">변경 저장</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    var currentPage = 1; // 현재 페이지 번호
    var itemsPerPage = 10; // 페이지 당 아이템 수

    function loadAttendanceData(page) {
        var empId = $("#emp_id").val(); // 입력된 사원 ID 가져오기

        // AJAX 요청
        $.ajax({
            url: '/Attendance/attendanceData', // 요청 URL
            type: 'POST',
            data: { 
                emp_id: empId, 
                page: page,
                size: itemsPerPage
            },
            success: function(response) {
                var data = response.data;
                var totalItems = response.totalItems;
                var totalPages = Math.ceil(totalItems / itemsPerPage);

                $("#checkTimeList").empty(); // 기존 데이터 초기화

                // 조회된 데이터를 테이블에 추가
                if (data.length > 0) {
                    $.each(data, function(index, attendance) {
                        $("#checkTimeList").append(
                            "<tr>" +
                                "<td>" + attendance.emp_id + "</td>" +
                                "<td>" + attendance.emp_cid + "</td>" +
                                "<td>" + attendance.check_in + "</td>" +
                                "<td>" + attendance.check_out + "</td>" +
                                "<td>" + attendance.workingoutside_time + "</td>" +
                                "<td>" + attendance.return_time + "</td>" +
                                "<td>" + attendance.working_time + "</td>" +
                                "<td>" + attendance.night_work_time + "</td>" +
                                "<td>" + attendance.special_working_time + "</td>" +
                                "<td>" + attendance.workform_status + "</td>" +
                                "<td>" + attendance.new_check_in + "</td>" +
                                "<td>" + attendance.new_check_out + "</td>" +
                                "<td>" + attendance.new_workingoutside_time + "</td>" +
                                "<td>" + attendance.modified_time + "</td>" +
                                "<td>" + attendance.created_at + "</td>" +
                                "<td>" + attendance.attendance_id + "</td>" +
                                "<td>" + attendance.status + "</td>" +
                                "<td>" + attendance.overtime + "</td>" +
                                "<td>" + attendance.modified_reason + "</td>" +
                                "<td>" + attendance.modified_person + "</td>" +
                                "<td><button class='btn btn-warning edit-button' data-id='" + attendance.attendance_id + "' " +
                                "data-check-in='" + attendance.check_in + "' " +
                                "data-check-out='" + attendance.check_out + "' " +
                                "data-workingoutside-time='" + attendance.workingoutside_time + "' " +
                                "data-return-time='" + attendance.return_time + "' " +
                                "data-working-time='" + attendance.working_time + "' " +
                                "data-night-work-time='" + attendance.night_work_time + "' " +
                                "data-special-working-time='" + attendance.special_working_time + "'>수정</button></td>" +
                            "</tr>"
                        );
                    });

                    // 페이징 버튼 업데이트
                    updatePagination(totalPages);
                } else {
                    $("#checkTimeList").append("<tr><td colspan='20'>조회된 시간이 없습니다.</td></tr>");
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 실패:", status, error);
                $("#checkTimeList").append("<tr><td colspan='20'>시간 조회에 실패했습니다.</td></tr>");
            }
        });
    }

    function updatePagination(totalPages) {
        $("#pagination").empty(); // 기존 페이지 버튼 초기화

        for (var i = 1; i <= totalPages; i++) {
            $("#pagination").append(
                "<li class='page-item " + (i === currentPage ? "active" : "") + "'>" +
                    "<a class='page-link' href='#'>" + i + "</a>" +
                "</li>"
            );
        }

        // 페이지 클릭 이벤트 추가
        $(".page-link").click(function(e) {
            e.preventDefault();
            currentPage = parseInt($(this).text());
            loadAttendanceData(currentPage);
        });
    }

    // 버튼 클릭 이벤트
    $("#checkTimeButton").click(function() {
        currentPage = 1; // 조회 시 첫 페이지부터 시작
        loadAttendanceData(currentPage);
    });

    // 수정 버튼 클릭 이벤트
    $(document).on("click", ".edit-button", function() {
        // 클릭한 버튼의 데이터 속성에서 값 가져오기
        var attendanceId = $(this).data("id");
        var checkIn = $(this).data("check-in");
        var checkOut = $(this).data("check-out");
        var workingOutsideTime = $(this).data("workingoutside-time");
        var returnTime = $(this).data("return-time");
        var workingTime = $(this).data("working-time");
        var nightWorkTime = $(this).data("night-work-time");
        var specialWorkingTime = $(this).data("special-working-time");

        // 모달에 값 설정
        $("#modalAttendanceId").val(attendanceId);
        $("#modalCheckInInput").val(checkIn);
        $("#modalCheckOutInput").val(checkOut);
        $("#modalWorkingOutsideTimeInput").val(workingOutsideTime);
        $("#modalReturnTimeInput").val(returnTime);
        $("#modalWorkingTimeInput").val(workingTime);
        $("#modalNightWorkTimeInput").val(nightWorkTime);
        $("#modalSpecialWorkingTimeInput").val(specialWorkingTime);

        // 모달 열기
        $("#editModal").modal("show");
    });

    // 변경 저장 버튼 클릭 이벤트
    $("#saveChangesButton").click(function() {
        // 수정할 데이터 가져오기
        var attendanceId = $("#modalAttendanceId").val();
        var checkIn = $("#modalCheckInInput").val();
        var checkOut = $("#modalCheckOutInput").val();
        var workingOutsideTime = $("#modalWorkingOutsideTimeInput").val();
        var returnTime = $("#modalReturnTimeInput").val();
        var workingTime = $("#modalWorkingTimeInput").val();
        var nightWorkTime = $("#modalNightWorkTimeInput").val();
        var specialWorkingTime = $("#modalSpecialWorkingTimeInput").val();
        var modified_reason = $("modified_reason").val(); // 수정 이유 추가

        // AJAX 요청
        $.ajax({
            url: '/Attendance/updateAttendance', // 요청 URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ // JSON 형식으로 데이터 전송
                attendance_id: attendanceId,
                check_in: checkIn,
                check_out: checkOut,
                workingoutside_time: workingOutsideTime,
                return_time: returnTime,
                working_time: workingTime,
                night_work_time: nightWorkTime,
                special_working_time: specialWorkingTime,
                modified_reason: modified_reason // 수정 이유 추가
            }),
            success: function(response) {
                $("#editModal").modal("hide"); // 모달 닫기
                $("#successMessage").show(); // 성공 메시지 표시
                loadAttendanceData(currentPage); // 데이터 재조회
                setTimeout(function() {
                    $("#successMessage").hide(); // 성공 메시지 숨기기
                }, 3000);
            },
            error: function(xhr, status, error) {
                console.error("수정 요청 실패:", status, error);
                alert("수정 요청에 실패했습니다.");
            }
        });
    });
});
</script>





<!-- QR 생성 -->
	<h1>사원 출/퇴근 QR카드 발급 </h1>
   <form action="${pageContext.request.contextPath}/getQR" method="get" target="qrFrame" onsubmit="showQrModal(event)">
    <label for="emp_id">사원번호 :</label>
    <input type="text" id="modal_emp_id" name="emp_id" placeholder="직원 ID 입력" required>
    <button type="submit">사원 카드 발급</button>
</form>

<!-- QR 코드 모달 -->
<div class="modal fade" id="qrModal" tabindex="-1" role="dialog" aria-labelledby="qrModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="qrModalLabel">QR 코드</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeQrModal()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <iframe id="qrFrame" name="qrFrame" style="width:100%; height:200px; border:none;"></iframe>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeQrModal()">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
    function showQrModal(event) {
        event.preventDefault(); // 기본 폼 제출 방지
        var form = event.target;
        var empId = document.getElementById('modal_emp_id').value; // 모달 내 입력 필드에서 emp_id 가져오기
        var actionUrl = form.action + "?emp_id=" + empId; // URL에 emp_id 추가

        // iframe에 QR 코드 URL 로드
        document.getElementById('qrFrame').src = actionUrl;

        // 모달 보여주기
        $('#qrModal').modal('show');
    }

    function closeQrModal() {
        // 모달을 닫고 원래 상태로 되돌리기
        $('#qrModal').modal('hide'); // Bootstrap 모달 닫기
        document.getElementById('qrFrame').src = ''; // iframe을 초기화하여 내용 제거
    }

    // 모달이 완전히 숨겨졌을 때 실행되는 이벤트
    $('#qrModal').on('hidden.bs.modal', function () {
        document.getElementById('qrFrame').src = ''; // 모달이 닫힐 때 iframe 초기화
    });
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
    <script src="${pageContext.request.contextPath }/resources/assets/js/validate.js"></script>
  </body>
</html>