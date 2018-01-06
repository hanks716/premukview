<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<style type="text/css">
	img{
		width:300px;
		
	}
	
</style>
<body>
    <table class="board_view">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <caption>게시글 상세</caption>
        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>${map.BBS_SEQ }</td>
                <th scope="row">조회수</th>
                <td>${map.HIT_CNT }</td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td>${map.IN_ID }</td>
                <th scope="row">작성시간</th>
                <td>${map.IN_DT }</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.TITLE }</td>
            </tr>
            <tr>
                <td colspan="4">${map.CONTENTS }</td>
            </tr>
             <tr>
                <th scope="row">첨부파일</th>
                <td colspan="3">
                    <c:forEach var="row" items="${list }">
                        <input type="hidden" id="BBS_SEQ" value="${row.BBS_SEQ }">
                        <a href="#this" name="file"><img src="/img/${row.FILE_NAME_DB }" style="width: 100px; height: 100px;"/></a>
                        (${row.FILE_SIZE }kb)
                    </c:forEach>
                </td>
            </tr>

		
        </tbody>
    </table>
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
             
            $("#update").on("click", function(e){
                e.preventDefault();
                fn_openBoardUpdate();
            });
            
            $("a[name='file']").on("click", function(e){ //파일 이름
                e.preventDefault();
            });

        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/bbs/openBbsList.do' />");
            comSubmit.submit();
        }
         
        function fn_openBoardUpdate(){
            var BBS_SEQ = "${map.BBS_SEQ}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/bbs/openBbsUpdate.do' />");
            comSubmit.addParam("BBS_SEQ", BBS_SEQ);
            comSubmit.submit();
        }
    </script>
</body>

</html>