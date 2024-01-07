<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="hk-pg-wrapper">
    <div class="container-xxl" style="margin-left: 0px;">
        <h2>상세</h2>
    </div>
    <div id="board-container">
        <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle"
        value="${board.boardTitle }"  required readonly="readonly">
		<!-- 첨부파일 -->
		<c:if test="${board.files.size()>0 }">
			<c:forEach var="file" items="${board.files }">
	            <button type="button" 
	                    class="btn btn-outline-success"
	                    onclick="fn_filedownload('${file.originalFileName}','${file.reNamefile }');">
	                    ${file.originalFileName }
	            </button> 
            </c:forEach>
        </c:if>
        
        <textarea class="form-control" name="boardContent" placeholder="내용" required readonly="readonly">${board.boardContent}</textarea>
              <a href="${path}/board/board"><input type="button" value="확인"></a>
    </div>
 </div>
<!--     <script type="text/javascript">
    document.getElementById('submit').addEventListener('click', handleSubmit);


    function handleSubmit() {
      console.log('submit 버튼이 클릭되었습니다.');

    }
    </script> -->

<style>
    .ck-editor__editable {
        height: 400px;
    }
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input{margin-bottom:15px;}
</style>
 <script>
    const fn_filedownload = (oriname, rename) => {
        const encodedOriname = encodeURIComponent(oriname);
        location.assign("${path}/board/filedownload.do?oriname=" + encodedOriname + "&rename=" + rename);
    }
</script>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>
