<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="command" value="${pageMaker.command }" />



<title>고속도로환경분석(교통)</title>

<head></head>
<body class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed" style="height: auto;">
	<div class="card-header">
		<h3 class="card-title">교통데이터 조회</h3>
	</div>
		<section class="content">
			<div class="card">
   				<div class="card-header with-border">
   					<div id="keyword" class="card-tools" style="width: 650px;">
						<div class="input-group row">
							<!-- search bar -->
							<select class="form-control col-md-3" name="perPageNum"
								id="perPageNum" onchange="location.href=this.value">
								<option value="<%=request.getContextPath() %>/envdata/traffic.do">리스트</option>
								<option value="<%=request.getContextPath() %>/envdata/trafficDetail.do">그래프</option>
							</select>
							<!-- sort num -->
							 <select class="form-control col-md-3" name="searchType" id="searchType" >
		                        <option>전체</option>
		                        <option value="A" ${command.searchType eq 'A' ? 'selected':'' }>A</option>
		                        <option value="B" ${command.searchType eq 'B' ? 'selected':'' }>B</option>
		                        <option value="C" ${command.searchType eq 'C' ? 'selected':'' }>C</option>
		                        <option value="D" ${command.searchType eq 'D' ? 'selected':'' }>D</option>
		                        <option value="E" ${command.searchType eq 'E' ? 'selected':'' }>E</option>
		                        <option value="F" ${command.searchType eq 'F' ? 'selected':'' }>F</option>
		                        <option value="G" ${command.searchType eq 'G' ? 'selected':'' }>G</option>
		                        <option value="H" ${command.searchType eq 'H' ? 'selected':'' }>H</option>
		                        <option value="I" ${command.searchType eq 'I' ? 'selected':'' }>I</option>
		                        <option value="J" ${command.searchType eq 'J' ? 'selected':'' }>J</option>
		                        <option value="K" ${command.searchType eq 'K' ? 'selected':'' }>K</option>
		                        <option value="L" ${command.searchType eq 'L' ? 'selected':'' }>L</option>
		                        <option value="M" ${command.searchType eq 'M' ? 'selected':'' }>M</option>
		                        <option value="N" ${command.searchType eq 'N' ? 'selected':'' }>N</option>
		                     </select>
							<!-- Date range as a button -->
							<div class="input-group-prepend">
								<span class="input-group-text"> <i
									class="far fa-calendar-alt"></i>
								</span>
							</div>
							<input type="text" class="form-control float-right"
								style="width: 100px" id="datepicker" value="${command.fromDate }">
							<input type="text" class="form-control float-right"
							style="width: 100px" id="datepicker2" value="${command.toDate }">&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- keyword -->
								<button class="btn btn-primary" type="button" id="searchBtn"
									data-card-widget="search" onclick="searchList_go(1);">조회</button>
							<!-- end : search bar -->
						</div>
					</div>
				</div>
			</div>
		
		<div class="card-body">
				<div class="row">
					<div class="col-sm-12" style="text-align:center;">
						<table class="table table-bordered table-striped" id="trafficList">
							<thead>
								<tr style="font-size:0.95em;">
									<th style="width:20%;">No.</th>
									<th style="width:20%;">날짜</th>
									<th style="width:15%;">구간코드</th>
									<th style="width:20%;">교통량</th>
									<th>평균속도</th>
								</tr>
							</thead>
							<c:if test="${empty trafficList }">
								<tr>
									<td colspan="5">
										<strong>해당 내용이 없습니다.</strong>
									</td>
								</tr>
							</c:if>
							<tbody>
								<c:forEach items="${trafficList }" var="traffic">
									<tr style='font-size:1em;'>	
										<td>${traffic.traffNum }</td>
										<td>
											<fmt:parseDate value="${traffic.traffDate }" var="traffDate" pattern="yyyyMMdd" />
											<fmt:formatDate value="${traffDate }" pattern="yyyy-MM-dd"/>
										</td>
										<td>${traffic.hwCode }</td>
										<td>${traffic.traff }</td>
										<td>${traffic.speedAvg }</td>
									<tr>	
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/envdata/pagination1.jsp" %>				
			</div>
		</div>
	</section>
<%@ include file="/WEB-INF/views/module/footer_js.jsp" %>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jszip/jszip.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/pdfmake/pdfmake.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/pdfmake/vfs_fonts.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
//Date range picker

   $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-2Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+3M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
 
            //input을 datepicker로 선언
            $("#datepicker").datepicker();                    
            $("#datepicker2").datepicker();
        });

 //Download    
   $("#trafficList").DataTable({
 	"paging": false,
     "searching": false,
     "info": false,
     "ordering": true,
     "responsive": true, 
     "lengthChange": false, 
     "autoWidth": false,
     "buttons": ["copy", 
     	{
 			extend: 'csv',
        		charset: 'utf-8',
        		bom: true
 		},
     	
     	"excel", "pdf", "print"]
   }).buttons().container().appendTo('#trafficList_wrapper .col-md-6:eq(0)');
 	
</script>
</body>
</html>