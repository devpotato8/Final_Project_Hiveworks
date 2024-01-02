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
        <h2>등록</h2>
    </div>
    <div>
        <form name="boardFrm" action="${path}/board/insertBoard.do" method="post" enctype="multipart/form-data">
            <div class="invoiceapp-content">
                <div class="invoiceapp-detail-wrap">
                    <div class="invoice-body">
                        <div data-simplebar class="nicescroll-bar">
                            <div class="container">
                                <div class="create-invoice-wrap mt-xxl-5 p-md-5 p-3">
                                    <select class="form-select" aria-label="Default select example" style="width: 145px;">
                                        <option selected>게시판 선택</option>
                                        <option value="1">공지사항</option>
                                        <option value="2">건의사항</option>
                                        <option value="3">블라인드</option>
                                    </select> <br>
                                    <div>
                                        <input type="text" class="form-control" style="width: 400px;" placeholder="제목">
                                    </div>
                                    <br>
                                    <div>
                                        <input type="text" class="form-control" style="width: 400px;" placeholder="작성자">
                                    </div>
                                    <br>
                                    <div>
                                        <form action="" method="POST">
                                            <textarea name="text" id="editor" placeholder="내용을 입력해주세요"></textarea>
                                        </form>
                                        <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
                                        <script>
                                            ClassicEditor.create(document.querySelector('#editor'));
                                        </script>
                                    </div>
                                    <li data-repeater-item style="display: none;" class="form-group close-over">
                                        <input type="text" class="form-control">
                                        <button type="button" class="close-input btn-close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </li>
                                </div>
                                <div class="input-group mb-3" style="padding: 0px;"></div>
                                <div id="basicFileForm" class="input-group mb-3" style="padding: 0px;">        
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="upFile" id="upFile1">
                                    </div>
                                    <div class="input-group-prepend" style="padding: 0px;">
                                        <button type="button" class="btn btn-outline-primary" onclick="fn_addFileForm();">추가</button>
                                        <button type="button" class="btn btn-outline-danger" onclick="fn_deleteFileForm();">삭제</button>
                                    </div>
                                </div>
                                <input type="submit" class="btn btn-outline-success" value="저장">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<style>
    .ck-editor__editable {
        height: 400px;
    }
</style>

<script>
    const adddelFunction = (function () {
        let count = 2;
        const addFile = () => {
            if (count <= 5) {
                const fileForm = $("#basicFileForm").clone(true);
                fileForm.find("span.input-group-text").text("첨부파일 " + count);
                fileForm.find("label.custom-file-label").text("파일을 선택하세요")
                    .attr("for", "upFile" + count);
                fileForm.find("input[type=file]").attr("id", "upFile" + count).val("");
                fileForm.find("input[type=file]").on('change', function (e) {
                    const fileName = e.target.files[0].name;
                    $(e.target).next(".custom-file-label").text(fileName);
                });
                $("textarea[name=boardContent]").before(fileForm);
                count++;
            } else {
                alert("첨부파일은 5개까지 가능합니다.");
            }
        };
        const delFile = () => {
            if (count != 2) {
                $("textarea[name=boardContent]").prev().remove();
                count--;
            }
        };

        return [addFile, delFile];
    })();

    const fn_addFileForm = adddelFunction[0];
    const fn_deleteFileForm = adddelFunction[1];

    $("input[name=upFile]").change(e => {
        const fileName = e.target.files[0].name;
        $(e.target).next(".custom-file-label").text(fileName);
    });
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
