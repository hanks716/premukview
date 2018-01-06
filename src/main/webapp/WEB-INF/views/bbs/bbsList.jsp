<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<title>게시판 목록</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


</head>
<body>
	<h2>게시판 목록</h2>
	<table style="border: 1px solid #ccc">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="20%" />
			<col width="20%" />
			<col width="15%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td style="text-align: right;">${row.BBS_SEQ }</td>
							<td class="title">
								<a href="#this" name="title">${row.TITLE }</a>
								<input type="hidden" id="BBS_SEQ" name ="BBS_SEQ" value="${row.BBS_SEQ }">
							</td>
							<td style="text-align: center;">${row.IN_ID}</td>
							<td style="text-align: center;"><fmt:formatDate
									value="${row.IN_DT}" pattern="yyyy-MM-dd" /></td>
							<td style="text-align: center;">${row.HIT_CNT }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>
		<tfoot>
			<tr>
				<td><a href="#this" class="btn" id="write">글쓰기</a></td>
			</tr>
		</tfoot>
	</table>

	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#write").on("click", function(e) { //글쓰 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});
			$("a[name='title']").on("click", function(e) { //제목
				e.preventDefault();
				fn_openBoardDetail($(this));
			});

		});

		function fn_openBoardWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/bbs/openBbsWrite.do' />");
			comSubmit.submit();
		}

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/bbs/openBbsDetail.do' />");
			comSubmit.addParam("BBS_SEQ", obj.parent().find("#BBS_SEQ").val());
			comSubmit.submit();
		}
	</script>
</body>
</html>

