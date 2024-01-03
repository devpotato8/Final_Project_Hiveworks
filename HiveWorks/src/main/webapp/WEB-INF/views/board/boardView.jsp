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

<div id="board-container">
        <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle"
        value="${board.boardTitle }"  required>
        <input type="text" class="form-control" name="boardWriter"  
        value="${board.writer.userId }" readonly required>
		<!-- 첨부파일 -->
		<c:if test="${board.files.size()>0 }">
			<c:forEach var="file" items="${board.files }">
	            <button type="button" 
	                    class="btn btn-outline-success btn-block"
	                    onclick="fn_filedownload('${file.originalFilename}','${file.renamedFilename }');">
	                    ${file.originalFilename }
	            </button> 
            </c:forEach>
        </c:if>
        
        <textarea class="form-control" name="boardContent" placeholder="내용" required>${board.boardContent}</textarea>
    </div>

     <style>
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input,div#board-container button{margin-bottom:15px;}
    div#board-container label.custom-file-label{text-align:left;}
    </style>
    <script>
    	const fn_filedownload=(oriname,rename)=>{
    		location.assign("${path}/board/filedownload.do?oriname="+oriname+"&rename="+rename);	
    	}
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
    