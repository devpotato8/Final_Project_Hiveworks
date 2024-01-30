<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="hk-pg-wrapper">
    <div id="board-container">
		<div style="margin-left: 40px;">
			<div style="display: flex; align-items: center;">
				  <p style="margin-right: 10px;">제목 :</p>
				  <input type="text" class="form-control" value="${board.boardTitle}" readonly="readonly" style="width: 200px; margin-left:16px;">
				</div>
				<br>
           		<div style="display: flex; align-items: center;">
				  <p style="margin-right: 10px;">작성일 :</p>
				  <input type="text" class="form-control" value="${board.createDate}" readonly="readonly" style="width: 200px;">
				</div>
				<br>
           		<div style="display: flex; align-items: center;">
				  <p style="margin-right: 10px;">글 번호:</p>
				  <input type="text" class="form-control" value="${board.boardNo}" readonly="readonly" style="width: 100px;">
				</div>
            <hr/ style="width: 1000px;">
        </div>    	
            <br>
            <div class="form-control2" id="boardContent" name="boardContent" placeholder="내용" required style="border: 1px solid black;">
    			${board.boardContent}
			</div>
    </div>
    <hr/ style="width: 1000px;margin-left: 230px;">
    <p style="margin-left: 230px; margin-top: 15px;">첨부파일</p>
        <c:if test="${not empty board.files}">
		    <c:forEach var="file" items="${board.files}">
		        <c:if test="${not empty file.originalFileName and not empty file.reNamefile}">
		            <button type="button" class="btn btn-light" onclick="fn_filedownload('${file.originalFileName}', '${file.reNamefile}');" style="margin-left: 230px; margin-top: 15px;">
		                ${file.originalFileName}
		            </button>
		        </c:if>
		    </c:forEach>
		</c:if>
	<hr/ style="width: 1000px;margin-left: 230px;">
      <div class="OkBtn">
        <a href="${path}/board/board"><input type="button" class="button" value="확인"></a>
      </div>
        
</div>
<style>
.button {
    width: 50px;
    height: 40px;
    background-color: #fff; 
    color: #000; 
    border-radius: 5px;
    font-size: 16px;
    line-height: 16px;
    text-transform: uppercase;
    padding: 5px;
    margin-bottom: 20px;
    margin-left: 30px;
    display: inline-block;
    vertical-align: middle;
    -webkit-transform: translateZ(0);
    transform: translateZ(0);
    box-shadow: 0 0 1px rgba(0, 0, 0, 0);
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    -moz-osx-font-smoothing: grayscale;
    position: relative;
    -webkit-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-property: transform;
    transition-property: transform;
    text-decoration: none;
}

.button:before {
    pointer-events: none;
    position: absolute;
    z-index: -1;
    content: '';
    top: 100%;
    left: 5%;
    height: 10px;
    width: 90%;
    opacity: 0;
    background: -webkit-radial-gradient(center, ellipse, rgba(0, 0, 0, 0.35) 0%, rgba(0, 0, 0, 0) 80%);
    background: radial-gradient(ellipse at center, rgba(0, 0, 0, 0.35) 0%, rgba(0, 0, 0, 0) 80%);
    -webkit-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-property: transform, opacity;
    transition-property: transform, opacity;
}

.button:hover,
.button:focus,
.button:active {
    -webkit-transform: translateY(-5px);
    transform: translateY(-5px);
    color: #000; /* hover 시 글자색을 검정색으로 변경 */
}

.button:hover:before,
.button:focus:before,
.button:active:before {
    opacity: 1;
    -webkit-transform: translateY(5px);
    transform: translateY(5px);
}
	hr{
	width:1200px;
	}
	#board-container{
    margin-left: 180px;
    margin-top: 60px;
    
	}
    #boardTitle{
    width:300px;
    }
    #boardContent{
    resize:none; 
    border: 1px solid #C2C2C2; 
    width: 1000px; 
    height: 800px;
    margin-left:50px;
    }
    figure.image>img{
    width:500px;
    height:400px;
    magin-left:150px;
    }
    figure{
    margin-left: 250px;
    }
    .OkBtn{
    display: flex;
    justify-content: flex-end;
    width: 1230px;
    margin-top: 20px;

    }
    p{
     margin-left: 15px;
    margin-top: 15px;
    }
</style>
<script>
    const fn_filedownload = (oriname, rename) => {
        location.assign("${path}/board/filedownload?oriname=" + oriname + "&rename=" + rename);	
    }
</script>
<!-- 에디터 -->
<script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
