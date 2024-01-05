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
        <h2>수정</h2>
    </div>
    <div id="board-container">
        <form name="boardUpdate" action="${path}/board/boardUpdate" method="post">
    <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" value="${board.boardTitle }" required>
    <input type="hidden" name="boardNo" value="${board.boardNo}"/>
            <div class="input-group mb-3" style="padding:0px;">
  <!--           	<div class="input-group-prepend" style="padding:0px;">
                    <button type="button" onclick="fn_addFileForm();">추가</button>
                    <button type="button" onclick="fn_deleteFileForm();">삭제</button>
                </div> -->
            </div>
            <!-- <div id="basicFileForm" class="input-group mb-3" style="padding:0px;">
                <div class="custom-file">
                     <input type="file" class="custom-file-input" >
                </div>
            </div> -->
            <textarea class="form-control" name="boardContent" placeholder="내용" required style="resize:none;">${board.boardContent }</textarea>
            <br />
              <input type="submit" name="name" id="submit" class="btn btn-outline-success" value="저장">
	</form>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>
