<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8"> <!-- 한글 인코딩 추가 -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
  <title>근태관리</title>
  <style>
    .container {
        margin-left: 0; /* 왼쪽 여백 제거 */
        padding-left: 0; /* 왼쪽 패딩 제거 (필요한 경우) */
        max-width: 100%; /* 최대 너비를 100%로 설정 */
    }

    #checkLeaveTable th,
    #checkLeaveTable td {
        overflow: hidden; /* 넘치는 내용 숨기기 */
        white-space: nowrap; /* 줄바꿈을 방지 */
        text-overflow: ellipsis; /* 텍스트가 넘칠 경우 생략 부호 추가 */
        padding: 10px; /* 패딩 추가로 여백 조정 */
        border: 1px solid #dee2e6; /* 경계 추가 */
       
    }

    #checkLeaveTable th {
        background-color: #f8f9fa; /* 헤더 배경 색상 */
        font-weight: bold; /* 헤더 글씨 두껍게 */
    }
	

	
 
</style>
   
   
   
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

<div class="mt-5" style="margin: 0; padding: 0;">
    <h1>사원 휴가 관리</h1>
    <input type="text" id="emp_id" placeholder="사원 ID를 입력하세요" />
    <button id="checkLeavesButton" class="btn btn-info">사원 휴가 조회</button>

    <!-- 사원 휴가 데이터 테이블 -->
    <div id="leaveData">
        <table id="checkLeaveTable" class="table mt-3">
            <thead>
                <tr>
                    <th>휴가 ID</th>
                    <th>사원 ID</th>
                    <th>휴가 유형</th>
                    <th>휴가 시작일</th>
                    <th>휴가 종료일</th>
                    <th>휴가 일수</th>
                    <th>연차 시작일</th>
                    <th>연차 종료일</th>
                    <th>총 연차 일수</th>
                    <th>사용된 연차 일수</th>
                    <th>잔여 연차 일수</th>
                    <th>상태</th>
                    <th>신청 사유</th>
                    <th>신청 날짜</th>
                    <th>승인 날짜</th>
                    <th>수정 이유</th>
                    <th>수정인</th>
                    <th>수정</th>
                </tr>
            </thead>
            <tbody id="checkLeaveList">
                <!-- 조회된 데이터가 여기에 삽입됩니다 -->
            </tbody>
        </table>
	         <!-- 페이징 영역 -->
	    <nav aria-label="Page navigation">
	        <ul id="pagination" class="pagination">
	            <!-- 페이지 번호가 동적으로 생성됩니다. -->
	        </ul>
	    </nav>
	</div>
        
 
    
    <!-- 페이징 버튼 -->
    <ul id="pagination" class="pagination justify-content-center"></ul>

    <!-- 성공 메시지 -->
    <div id="successMessage" class="alert alert-success" style="display:none;">수정이 완료되었습니다.</div>

    <!-- 수정 모달 -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">휴가 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="modalLeaveId">
                    <div class="form-group">
                        <label for="modalLeaveTypeInput">휴가 유형</label>
                        <input type="text" id="modalLeaveTypeInput" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="modalLeaveStartDateInput">휴가 시작일</label>
                        <input type="date" id="modalLeaveStartDateInput" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="modalEndLeaveDateInput">휴가 종료일</label>
                        <input type="date" id="modalEndLeaveDateInput" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="modalTLeaveInput">휴가 일수</label>
                        <input type="number" id="modalTLeaveInput" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="modalAnnualLeaveStartDateInput">연차 시작일</label>
                        <input type="date" id="modalAnnualLeaveStartDateInput" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="modalEndAnnualLeaveInput">연차 종료일</label>
                        <input type="date" id="modalEndAnnualLeaveInput" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="modalTotalAnnualLeaveInput">총 연차 일수</label>
                        <input type="number" id="modalTotalAnnualLeaveInput" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="modalUsedAnnualLeaveInput">사용된 연차 일수</label>
                        <input type="number" id="modalUsedAnnualLeaveInput" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="modalRemainingAnnualLeaveInput">잔여 연차 일수</label>
                        <input type="number" id="modalRemainingAnnualLeaveInput" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="modalReasonInput">신청 사유</label>
                        <input type="text" id="modalReasonInput" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button id="saveChangesButton" type="button" class="btn btn-primary">변경 저장</button>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
$(document).ready(function() {
    var currentPage = 1; // 현재 페이지 번호
    var itemsPerPage = 10; // 페이지 당 아이템 수

    // 휴가 데이터 로드 함수
    function loadLeaveData(page) {
        var empId = $("#emp_id").val(); // 입력된 사원 ID 가져오기

        // AJAX 요청
        $.ajax({
            url: 'leaveSelect', // 요청 URL
            type: 'GET',
            data: { 
                emp_id: empId,
                page: page,
                size: itemsPerPage
            },
            success: function(response) {
                var leaves = response; // 조회된 데이터
                $("#checkLeaveList").empty(); // 기존 데이터 초기화

                // 조회된 데이터를 테이블에 추가
                if (leaves.length > 0) {
                    $.each(leaves, function(index, leave) {
                        $("#checkLeaveList").append(
                            "<tr>" +
                                "<td>" + leave.leave_id + "</td>" +
                                "<td>" + leave.emp_id + "</td>" +
                                "<td>" + leave.leave_type + "</td>" +
                                "<td>" + leave.leave_start_date + "</td>" +
                                "<td>" + leave.end_leave_date + "</td>" +
                                "<td>" + leave.t_leave + "</td>" +
                                "<td>" + leave.annual_leave_start_date + "</td>" +
                                "<td>" + leave.end_annual_leave + "</td>" +
                                "<td>" + leave.total_annual_leave + "</td>" +
                                "<td>" + leave.used_annual_leave + "</td>" +
                                "<td>" + leave.remaining_annual_leave + "</td>" +
                                "<td>" + leave.leave_status + "</td>" +
                                "<td>" + leave.reason + "</td>" +
                                "<td>" + leave.requested_at + "</td>" +
                                "<td>" + leave.approval_date + "</td>" +
                                "<td>" + (leave.modified_reason ? leave.modified_reason : "") + "</td>" +
                                "<td>" + (leave.modified_by ? leave.modified_by : "") + "</td>" +
                                "<td><button class='btn btn-warning edit-button' data-id='" + leave.leave_id + "' " +
                                "data-leave-type='" + leave.leave_type + "' " +
                                "data-leave-start-date='" + leave.leave_start_date + "' " +
                                "data-end-leave-date='" + leave.end_leave_date + "' " +
                                "data-t-leave='" + leave.t_leave + "' " +
                                "data-annual-leave-start-date='" + leave.annual_leave_start_date + "' " +
                                "data-end-annual-leave='" + leave.end_annual_leave + "' " +
                                "data-total-annual-leave='" + leave.total_annual_leave + "' " +
                                "data-used-annual-leave='" + leave.used_annual_leave + "' " +
                                "data-remaining-annual-leave='" + leave.remaining_annual_leave + "' " +
                                "data-reason='" + leave.reason + "'>수정</button></td>" +
                            "</tr>"
                        );
                    });
                } else {
                    $("#checkLeaveList").append("<tr><td colspan='17'>조회된 데이터가 없습니다.</td></tr>");
                }
                setupPagination(response.totalElements, page); // 페이지 설정
            }
        });
    }

    // 페이지 설정 함수
    function setupPagination(totalItems, currentPage) {
        var totalPages = Math.ceil(totalItems / itemsPerPage);
        $("#pagination").empty(); // 기존 페이지 초기화

        // 이전 버튼
        if (currentPage > 1) {
            $("#pagination").append('<li class="page-item"><a class="page-link" href="#" data-page="' + (currentPage - 1) + '">이전</a></li>');
        }

        // 페이지 번호 버튼
        for (var i = 1; i <= totalPages; i++) {
            $("#pagination").append('<li class="page-item ' + (i === currentPage ? 'active' : '') + '"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>');
        }

        // 다음 버튼
        if (currentPage < totalPages) {
            $("#pagination").append('<li class="page-item"><a class="page-link" href="#" data-page="' + (currentPage + 1) + '">다음</a></li>');
        }
    }

    // 버튼 클릭 시 휴가 조회
    $("#checkLeavesButton").click(function() {
        currentPage = 1; // 페이지 초기화
        loadLeaveData(currentPage); // 데이터 로드
    });

    // 페이지 번호 클릭 시 데이터 로드
    $(document).on('click', '#pagination .page-link', function(e) {
        e.preventDefault();
        currentPage = $(this).data('page'); // 클릭한 페이지 번호로 설정
        loadLeaveData(currentPage); // 데이터 로드
    });

    // 수정 버튼 클릭 시 모달에 데이터 설정
    $(document).on('click', '.edit-button', function() {
        $("#modalLeaveId").val($(this).data('id'));
        $("#modalLeaveTypeInput").val($(this).data('leave-type'));
        $("#modalLeaveStartDateInput").val($(this).data('leave-start-date'));
        $("#modalEndLeaveDateInput").val($(this).data('end-leave-date'));
        $("#modalTLeaveInput").val($(this).data('t-leave'));
        $("#modalAnnualLeaveStartDateInput").val($(this).data('annual-leave-start-date'));
        $("#modalEndAnnualLeaveInput").val($(this).data('end-annual-leave'));
        $("#modalTotalAnnualLeaveInput").val($(this).data('total-annual-leave'));
        $("#modalUsedAnnualLeaveInput").val($(this).data('used-annual-leave'));
        $("#modalRemainingAnnualLeaveInput").val($(this).data('remaining-annual-leave'));
        $("#modalReasonInput").val($(this).data('reason'));
        $("#editModal").modal('show'); // 모달 열기
    });

    // 모달에서 변경 저장 버튼 클릭 시
    $("#saveChangesButton").click(function() {
        var leaveId = $("#modalLeaveId").val();
        var leaveData = {
            leave_id: leaveId,
            leave_type: $("#modalLeaveTypeInput").val(),
            leave_start_date: $("#modalLeaveStartDateInput").val(),
            end_leave_date: $("#modalEndLeaveDateInput").val(),
            t_leave: $("#modalTLeaveInput").val(),
            annual_leave_start_date: $("#modalAnnualLeaveStartDateInput").val(),
            end_annual_leave: $("#modalEndAnnualLeaveInput").val(),
            total_annual_leave: $("#modalTotalAnnualLeaveInput").val(),
            used_annual_leave: $("#modalUsedAnnualLeaveInput").val(),
            remaining_annual_leave: $("#modalRemainingAnnualLeaveInput").val(),
            reason: $("#modalReasonInput").val()
        };

        // AJAX 요청으로 변경 저장
        $.ajax({
            url: 'leaveUpdate?leave_id=' + leaveId, // 업데이트 요청 URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(leaveData),
            success: function(response) {
                if (response.success) {
                    $("#successMessage").show().delay(3000).fadeOut(); // 성공 메시지 표시
                    loadLeaveData(currentPage); // 데이터 새로 고침
                    $("#editModal").modal('hide'); // 모달 닫기
                } else {
                    alert("수정에 실패했습니다. 다시 시도하세요.");
                }
            },
            error: function(xhr, status, error) {
            	 console.error("Error details: ", xhr.responseText); // 서버에서 반환한 오류 메시지
            	    alert("오류가 발생했습니다. 다시 시도하세요.");
            }
        });
    });
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
  </body>
</html>
