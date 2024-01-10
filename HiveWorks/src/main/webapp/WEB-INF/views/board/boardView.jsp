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
        <div id="boardContent" class="form-control" name="boardContent" placeholder="내용" required readonly="readonly">${board.boardContent}</div>
        <br>
		<c:if test="${board.files.size()>0 }">
            <c:forEach var="file" items="${board.files }">
                <button type="button" 
                    class="btn btn-dark"
                    onclick="fn_filedownload('${file.originalFileName}','${file.reNamefile }');">
                    ${file.originalFileName }
                </button> 
            </c:forEach>
        </c:if>
        <c:if test="${empty board.files}">
   			<p>첨부된 파일이 없습니다.</p>
		</c:if>
        <a href="${path}/board/board"><input type="button" value="확인"></a>
    </div>
</div>

<style>
   
    #boardContent{
    width:100%;
    height:100%;
    display: flex;
    flex-direction: column-reverse;
    
    }
</style>


<script>
    const fn_filedownload = (oriname, rename) => {
        location.assign("${path}/board/filedownload?oriname=" + oriname + "&rename=" + rename);	
    }
</script>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
