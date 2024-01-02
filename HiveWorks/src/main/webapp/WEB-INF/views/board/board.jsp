<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <h2>공지사항</h2>
        <a href="${path}/board/boardWrite">등록</a>
        <hr />
    </div>
    <div class="invoice-body">
        <div data-simplebar class="nicescroll-bar">
            <div class="invoice-list-view">
                <table id="datable_1" class="table nowrap w-100 mb-5">
                    <thead>
                        <tr>
                            <th><span class="form-check mb-0"> <input
                                    type="checkbox" class="form-check-input check-select-all"
                                    id="customCheck1"> <label class="form-check-label"
                                    for="customCheck1"></label>
                            </span></th>
                            <th>게시판 번호</th>
                            <th>날짜</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>수정일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty board}">
                                <tr>
                                    <td colspan="8">게시물이 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="b" items="${board}">
                                    <tr>
                                        <td></td>
                                        <td><a href="#" class="table-link-text link-high-em">
                                        <c:out value="${b.boardNo}" /></a></td>
                                        <td><c:out value="${b.createDate}" /></td>
                                        <td><a href="${path}/board/detail?boardNo=${b.boardNo}"><c:out value="${b.boardTitle}" /></a></td>
                                        <td><c:out value="${b.creater}" /></td>
                                        <td><c:out value="${b.createDate}" /></td>
                                        <td><c:out value="${b.modifyDate}" /></td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div style="margin-right: 100px;">
                                                    <c:out value="${b.boardCount}" />
                                                </div>
                                                <div class="d-flex">
                                                    <a
                                                        class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover"
                                                        data-bs-toggle="tooltip" data-bs-placement="top" title=""
                                                        data-bs-original-title="수정" href="contact-details.html">
                                                        <span class="btn-icon-wrap"><span
                                                            class="feather-icon"><i data-feather="edit"></i></span></span>
                                                    </a> <a
                                                        class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button"
                                                        data-bs-toggle="tooltip" data-bs-placement="top" title=""
                                                        data-bs-original-title="삭제" href="#"> <span
                                                        class="btn-icon-wrap"><span class="feather-icon"><i
                                                            data-feather="trash-2"></i></span></span>
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
