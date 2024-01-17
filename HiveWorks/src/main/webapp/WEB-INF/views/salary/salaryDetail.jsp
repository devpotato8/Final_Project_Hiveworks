<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page= "/WEB-INF/views/common/header.jsp">
	<jsp:param value="default" name="style"/>
	<jsp:param value="" name="hover"/>
	
</jsp:include>
<%-- 	<jsp:param value="collapsed" name="style"/>
	<jsp:param value="data-hover='active'" name="hover"/> --%>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<style>@font-face {
        font-family: 'douzone';
        src: local('DOUZONEText10'), url('https://static.wehago.com/fonts/douzone/DOUZONEText10.woff2') format('woff2'), url('https://static.wehago.com/fonts/douzone/DOUZONEText10.woff') format('woff');
        font-weight: normal;
        font-display: fallback;
    }

    @font-face {
        font-family: 'douzone';
        src: local('DOUZONEText30'), url('https://static.wehago.com/fonts/douzone/DOUZONEText30.woff2') format('woff2'), url('https://static.wehago.com/fonts/douzone/DOUZONEText30.woff') format('woff');
        font-weight: bold;
        font-display: fallback;
    }

    @font-face {
        font-family: 'douzone';
        src: local('DOUZONEText50'), url('https://static.wehago.com/fonts/douzone/DOUZONEText50.woff2') format('woff2'), url('https://static.wehago.com/fonts/douzone/DOUZONEText50.woff') format('woff');
        font-weight: 900;
        font-display: fallback;
    }

    body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input, textarea, img, button, select {
        margin: 0;
        padding: 0
    }

    body, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, button {
        font-family: douzone, 'Microsoft YaHei', 'PingFang SC', 'MS PGothic', 'Hiragino Kaku Gothic ProN', '굴림', gulim, 'Apple SD Gothic Neo', sans-serif
    }

    body {
        min-width: 642px;
        -webkit-text-size-adjust: none
    }

    img, fieldset {
        border: 0;
        vertical-align: top
    }

    a {
        color: #1a1a1a
    }

    em, address {
        font-style: normal
    }

    ul, ol, li {
        list-style: none
    }

    label, button {
        cursor: pointer
    }

    input::-ms-clear {
        display: none
    }

    .blind {
        position: absolute !important;
        clip: rect(0 0 0 0) !important;
        width: 1px !important;
        height: 1px !important;
        margin: -1px !important;
        overflow: hidden !important
    }

    table {
        width: 100%;
        table-layout: fixed;
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%
    }

    table thead.blind {
        position: static;
        font-size: 0
    }

    /* 테이블 thead blind 버그해결 */
    .clearbx:after, .clearfix:after {
        content: '';
        clear: both;
        display: table
    }

    .dz_font, .dz_font * {
        font-family: douzone, 'Microsoft YaHei', 'PingFang SC', 'MS PGothic', 'Hiragino Kaku Gothic ProN', '굴림', gulim, 'Apple SD Gothic Neo', sans-serif
    }

    body {
        margin: 70px auto;
        width: 642px
    }

    .origin_tbl {
        border: 1px solid #eaeaea;
        margin-top: 10px
    }

    .origin_tbl + .origin_tbl {
        margin-top: 5px
    }

    .head_title {
        font-size: 15px;
        color: #191919;
        line-height: 20px;
        text-align: center;
        font-weight: 900;
        margin-bottom: 20px
    }

    .topdate {
        font-size: 11px;
        color: #4a4a4a;
        line-height: 12px;
        letter-spacing: -.5px;
        font-weight: bold;
        text-align: right;
        margin-bottom: 6px
    }

    .topdate > em {
        font-weight: 900;
    }

    .txtlft {
        text-align: left !important
    }

    .txtrgt {
        text-align: right !important
    }

    .top_basictbl {
        border: 0;
        table-layout: fixed;
        border-spacing: 0;
        margin-bottom: 6px
    }

    .top_basictbl td {
        font-size: 11px;
        color: #4a4a4a;
        line-height: 12px;
        letter-spacing: -.5px;
        font-weight: bold
    }

    .top_basictbl td em {
        font-weight: 900
    }

    .userinfo_tbl {
        border: 2px solid #eee
    }

    .userinfo_tbl th {
        font-size: 11px;
        color: #000;
        letter-spacing: -.5px;
        line-height: 12px;
        font-weight: 900;
        text-align: left;
        padding: 6px 2px;
        vertical-align: top
    }

    .userinfo_tbl td {
        font-size: 11px;
        color: #4a4a4a;
        letter-spacing: -.5px;
        line-height: 12px;
        font-weight: bold;
        text-align: left;
        padding: 6px 2px;
        vertical-align: top
    }

    .userinfo_tbl th > span {
        position: relative;
        display: block;
        padding-left: 6px
    }

    .userinfo_tbl th > span:before {
        content: '';
        position: absolute;
        top: 50%;
        left: 0;
        width: 2px;
        height: 2px;
        border-radius: 50%;
        background: #000;
        margin-top: -2px
    }

    .userinfo_tbl tr:first-of-type th, .userinfo_tbl tr:first-of-type td {
        padding-top: 18px
    }

    .userinfo_tbl tr:last-of-type th, .userinfo_tbl tr:last-of-type td {
        padding-bottom: 16px
    }

    .userinfo_tbl tr th:first-of-type {
        padding-left: 24px
    }

    .userwork_tbl {
        border: 1px solid #eaeaea;
        margin-top: 10px
    }

    .userwork_tbl th {
        font-size: 11px;
        color: #4a4a4a;
        line-height: 12px;
        letter-spacing: -.5px;
        background: #f8f8f8;
        height: 30px;
        border: 1px solid #eaeaea
    }

    .userwork_tbl td {
        font-size: 11px;
        color: #000;
        line-height: 12px;
        letter-spacing: -.5px;
        background: #fff;
        height: 30px;
        text-align: center;
        border: 1px solid #eaeaea
    }

    .pay_details_tbl {
        margin-top: 30px
    }

    .pay_details_tbl th {
        background: #f8f8f8;
        font-size: 11px;
        font-weight: bold;
        letter-spacing: -.5px;
        color: #000;
        height: 30px;
        border: 1px solid #eaeaea;
        border-right: 0;
        text-align: left;
        padding-left: 12px
    }

    .pay_details_tbl td {
        background: #fff;
        font-size: 11px;
        font-weight: bold;
        letter-spacing: -.5px;
        color: #000;
        text-align: right;
        height: 30px;
        border: 1px solid #eaeaea;
        border-left: 0;
        padding-right: 12px
    }

    .pay_details_tbl td.empty {
        border: 0;
        background: #fff !important
    }

    .pay_details_tbl th.tit {
        background: #fff;
        border: 0;
        font-size: 12px;
        color: #000;
        font-weight: 900;
        padding: 0
    }

    .pay_details_tbl th.tit > span {
        position: relative;
        display: block;
        padding-left: 6px
    }

    .pay_details_tbl th.tit > span:before {
        content: '';
        position: absolute;
        top: 50%;
        left: 0;
        width: 2px;
        height: 2px;
        border-radius: 50%;
        background: #000;
        margin-top: -2px
    }

    .pay_details_tbl .total th, .pay_details_tbl .total td {
        border-color: #e6ebf2;
        background: #f2f6fa
    }

    .pay_details_tbl .total td {
        font-weight: 900;
        font-size: 12px
    }

    .realpay_dl {
        position: relative;
        border: 1px solid #1c90fb;
        border-radius: 6px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, .07);
        background: #f2f9ff;
        margin-top: 16px;
        padding: 16px 16px 14px;
        line-height: 18px;
        clear: both;
        overflow: hidden
    }

    .realpay_dl dt {
        float: left;
        font-size: 12px;
        color: #000;
        letter-spacing: -.55px;
        font-weight: bold
    }

    .realpay_dl dd {
        float: right;
        font-size: 14px;
        color: #1c90fb;
        letter-spacing: -.7px;
        font-weight: 900
    }

    .calcrule_tbl {
        margin-top: 32px
    }

    .calcrule_tbl caption {
        position: relative;
        font-size: 12px;
        color: #000;
        letter-spacing: -.33px;
        line-height: 14px;
        text-align: left;
        font-weight: 900;
        padding-left: 6px;
        margin-bottom: 10px
    }

    .calcrule_tbl caption:before {
        content: '';
        position: absolute;
        top: 50%;
        left: 0;
        width: 2px;
        height: 2px;
        border-radius: 50%;
        background: #000;
        margin-top: -2px
    }

    .calcrule_tbl th, .calcrule_tbl td {
        font-size: 11px;
        letter-spacing: -.5px;
        font-weight: bold;
        height: 30px;
        border: 1px solid #eaeaea;
        text-align: center
    }

    .calcrule_tbl th {
        color: #4a4a4a;
        background: #f8f8f8
    }

    .calcrule_tbl td {
        color: #000
    }

    .thx_text {
        font-size: 12px;
        color: #000;
        font-weight: bold;
        line-height: 14px;
        text-align: center;
        margin-top: 24px
    }
    
    @media print {

    .print-button { display:none;} : print상태(Alt+p)가 될 경우 제외시킨다.

	}
    
    
</style>
<body leftmargin="0" topmargin="0" style="font-face:맑은고딕,Malgun Gothic, 돋음, dotum;" align="center"><!--제목--->
<table width="740px">
    <tbody>
    <tr align="center">
        <td style="font-size: 16px;font-family: 돋음, dotum;color: #444444;padding:10px;"><b>2023년 12월 급여명세서</b></td>
    </tr>
    </tbody>
</table>
<i id="print" style="cursor: pointer; " class="fa fa-print print-button"></i>

<table class="top_basictbl">
    <colgroup>
        <col style="width:50%">
        <col>
    </colgroup>
    <tbody>
    <tr>
        <td class="txtlft"><p><em>회사명</em> (주)하이브웍스</p></td>
        <td class="txtrgt"><p><em>지급일</em> <c:out value="${salary.sal_date }" /></p></td>
    </tr>
    </tbody>
</table><!--사원정보 테이블-->
<table class="userinfo_tbl">
    <colgroup>
        <col style="width:80px">
        <col>
        <col style="width:60px">
        <col style="width:18%">
        <col style="width:60px">
        <col style="width:18%">
    </colgroup>
    <tbody>
    <tr>
        <th><span>사원코드</span></th>
        <td><c:out value="${salary.emp_no }"/></td>
        <th><span>사원명</span></th>
        <td><c:out value="${salary.employee.emp_name }"/></td>
        <th><span>생년월일</span></th>
        <td><c:out value="${salary.employee.emp_birth_date }"/></td>
    </tr>
    <tr>
        <th><span>부서</span></th>
        <td><c:out value="${salary.employee.dept_name }"/></td>
        <th><span>직급</span></th>
        <td><c:out value="${salary.employee.job_name }"/></td>
        <th><span>직위</span></th>
        <td><c:out value="${salary.employee.position_name }"/></td>
    </tr>
    </tbody>
</table><!--근로일수 및 시간 -->
<table class="userwork_tbl">
    <colgroup>
        <col style="width:20%" span="5">
    </colgroup>
    <thead>
    <tr>
        <th>연장근로시간</th>
        <th>야간근로시간</th>
        <th>휴일근로시간</th>
        <th colspan="2">통상시급(원)</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
    </tr>
    </tbody>
</table><!--지급내역/공제내역 테이블-->
<table width="740px" border="0" cellspacing="1" cellpadding="1" class="origin_tbl">
    <tbody>
    <tr>
        <td bgcolor="#b1c5db">
            <table width="100%" border="0" cellspacing="0" cellpadding="0"
                   style="table-layout:fixed; border-collapse:collapse;word-break:break-all;"><!--지급내역-->
                <tbody>
                <tr bgcolor="#f7f7f7" height="22px" align="center"
                    style="font-size: 11px;font-family: 돋음, dotum;color: #666677;">
                    <td rowspan="8" width="16%" align="center" bgcolor="#cedff7"
                        style="font-weight: bold; font-size: 12px;font-family: 돋음, dotum; color: #333355;border-right:1px solid #b1c5db;">
                        지급내역
                    </td>
                   	<th width="14%">기본급</th>
                    <th width="14%">시간 외 <br>근로수당</th>
                    <th width="14%">식대</th>
                    <th width="14%">직위수당</th>
                    <th width="14%">보너스</th>
                    <th width="14%"></th>
                </tr>
                <tr bgcolor="#ffffff" height="22px" align="center"
                    style="font-size: 12px;font-family: 돋음, dotum;color: #000000;">
                    <td style="border-bottom:1px solid #eee;">
	                    <c:set var="sal_base" value="${salary.sal_base }"/>
	                    <fmt:formatNumber value="${sal_base}" type="number" />
                    </td>
                    <td style="border-bottom:1px solid #eee;">
                    	<c:set var="overtime_pay" value="${salary.overtime_pay }"/>
                    	<fmt:formatNumber value="${overtime_pay}" type="number" />
                    </td>
                    <td style="border-bottom:1px solid #eee;">
                    	<c:set var="sal_meal" value="${salary.sal_meal }"/>
                    	<fmt:formatNumber value="${sal_meal}" type="number" />
                    </td>
                    <td style="border-bottom:1px solid #eee;">
                    	<c:set var="position_pay" value="${salary.position_pay }"/>
                    	<fmt:formatNumber value="${position_pay}" type="number" />
                    </td>
                    <td style="border-bottom:1px solid #eee;">
                    	<c:set var="sal_bonus" value="${salary.sal_bonus }"/>
                    	<fmt:formatNumber value="${sal_bonus}" type="number" />
                    </td>
                    <td style="border-bottom:1px solid #eee;"></td>
                </tr>
                <tr bgcolor="#f7f7f7" height="22px" align="center"
                    style="font-size: 11px;font-family: 돋음, dotum;color: #666677;">
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr bgcolor="#ffffff" height="22px" align="center"
                    style="font-size: 12px;font-family: 돋음, dotum;color: #000000;">
                    <td style="border-bottom:1px solid #eee;"></td>
                    <td style="border-bottom:1px solid #eee;"></td>
                    <td style="border-bottom:1px solid #eee;"></td>
                    <td style="border-bottom:1px solid #eee;"></td>
                    <td style="border-bottom:1px solid #eee;"></td>
                    <td style="border-bottom:1px solid #eee;"></td>
                </tr>
                <tr bgcolor="#f7f7f7" height="22px" align="center"
                    style="font-size: 11px;font-family: 돋음, dotum;color: #666677;">
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr bgcolor="#ffffff" height="22px" align="center" style="font-size: 12px;color: #000000;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr bgcolor="#f7f7f7" height="22px" align="center"
                    style="font-size: 11px;font-family: 돋음, dotum;color: #666677;">
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr bgcolor="#ffffff" height="22px" align="center" style="font-size: 12px;color: #000000;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr><!--//지급내역-->
                <tr>
                    <td colspan="7" height="1px"></td>
                </tr><!--공제내역-->
                <tr bgcolor="#f7f7f7" height="22px" align="center"
                    style="font-size: 11px;font-family: 돋음, dotum;color: #666677;">
                    <td rowspan="8" width="16%" align="center" bgcolor="#cedff7"
                        style="font-weight: bold; font-size: 12px;font-family: 돋음, dotum; color: #333355;border-right:1px solid #b1c5db;">
                        공제내역
                    </td>
                    <th width="14%">국민연금</th>
                    <th width="14%">건강보험</th>
                    <th width="14%">장기요양보험</th>
                    <th width="14%">고용보험</th>
                    <th width="14%">소득세</th>
                    <th width="14%">지방소득세</th>
                </tr>
                <tr bgcolor="#ffffff" height="22px" align="center"
                    style="font-size: 12px;font-family: 돋음, dotum;color: #000000;">
                    <td style="border-bottom:1px solid #eee;">
                    	<c:set var="o_pension" value="${dedution.o_pension }"/>
                    	<fmt:formatNumber value="${o_pension}" type="number" />
                    </td>
                    <td style="border-bottom:1px solid #eee;">
                    	<c:set var="o_insurance" value="${dedution.o_insurance }"/>
                    	<fmt:formatNumber value="${o_insurance}" type="number" />
                    </td>
                    <td style="border-bottom:1px solid #eee;">
                    	<c:set var="o_nursing" value="${dedution.o_nursing }"/>
                    	<fmt:formatNumber value="${o_nursing}" type="number" />
                    </td>
                    <td style="border-bottom:1px solid #eee;">
                    	<c:set var="o_employ" value="${dedution.o_employ }"/>
                    	<fmt:formatNumber value="${o_employ}" type="number" />
                    </td>
                    <td style="border-bottom:1px solid #eee;">
                    	<c:set var="o_income" value="${dedution.o_income }"/>
                    	<fmt:formatNumber value="${o_income}" type="number" />
                    </td>
                    <td style="border-bottom:1px solid #eee;">
                    	<c:set var="o_local" value="${dedution.o_local }"/>
                    	<fmt:formatNumber value="${o_local}" type="number" />
                    </td>
                </tr>
                <tr bgcolor="#f7f7f7" height="22px" align="center"
                    style="font-size: 11px;font-family: 돋음, dotum;color: #666677;">
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr bgcolor="#ffffff" height="22px" align="center"
                    style="font-size: 12px;font-family: 돋음, dotum;color: #000000;">
                    <td style="border-bottom:1px solid #eee;"></td>
                    <td style="border-bottom:1px solid #eee;"></td>
                    <td style="border-bottom:1px solid #eee;"></td>
                    <td style="border-bottom:1px solid #eee;"></td>
                    <td style="border-bottom:1px solid #eee;"></td>
                    <td style="border-bottom:1px solid #eee;"></td>
                </tr>
                <tr bgcolor="#f7f7f7" height="22px" align="center" style="font-size: 12px;color: #666677;">
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr bgcolor="#ffffff" height="22px" align="center"
                    style="font-size: 12px;font-family: 돋음, dotum;color: #000000;">
                    <td width="14%"></td>
                    <td width="14%"></td>
                    <td width="14%"></td>
                    <td width="14%"></td>
                    <td width="14%"></td>
                    <td width="14%"></td>
                </tr>
                <tr bgcolor="#f7f7f7" height="22px" align="center" style="font-size: 12px;color: #666677;">
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr bgcolor="#ffffff" height="22px" align="center"
                    style="font-size: 12px;font-family: 돋음, dotum;color: #000000;">
                    <td width="14%"></td>
                    <td width="14%"></td>
                    <td width="14%"></td>
                    <td width="14%"></td>
                    <td width="14%"></td>
                    <td width="14%"></td>
                </tr><!--//공제내역-->
                </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table><!--합계데이블-->
<table width="740px" border="0" cellspacing="1" cellpadding="1" class="origin_tbl">
    <tbody>
    <tr>
        <td bgcolor="#7f9db9">
            <table width="100%" border="0" cellspacing="0" cellpadding="0"><!--합계-->
                <tbody>
                <tr bgcolor="#e7e7e7" height="22px" align="center"
                    style="font-size: 11px;font-family: 돋음, dotum;color: #555;">
                    <td rowspan="6" width="16%" align="center" bgcolor="#a8bdd3"
                        style="font-weight: bold; font-size: 12px;font-family: 돋음, dotum; color: #000;border-right:1px solid #7f9db9;">
                        합계
                    </td>
                    <th width="14%"></th>
                    <th width="14%"></th>
                    <th width="14%">지급총액</th>
                    <th width="14%">공제총액</th>
                    <th width="14%"></th>
                    <th width="14%">차인지급액</th>
                </tr>
                <tr bgcolor="#ffffff" height="22px" align="center"
                    style="font-size: 12px;font-family: 돋음, dotum;color: #000000;">
                    <td width="14%"></td>
                    <td width="14%"></td>
                    <td width="14%">
                    	<c:set var="sal_total" value="${dedution.i_total }" />
                    	<fmt:formatNumber value="${sal_total}" type="number" />
                    </td>
                    <td width="14%">
                    	<c:set var="dedu_total" value="${dedution.o_pension+dedution.o_insurance+dedution.o_nursing+dedution.o_employ+dedution.o_income+dedution.o_local}" />
                    	<fmt:formatNumber value="${dedu_total}" type="number" />
                    </td>
                    <td width="14%"></td>
                    <td width="14%">
                    	<c:set var="sal_actual" value="${salary.sal_actual }" />
                    	<fmt:formatNumber value="${sal_actual}" type="number" />
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>
<table class="calcrule_tbl">
    <caption>계산방법</caption>
    <colgroup>
        <col style="width:30%">
        <col>
        <col style="width:30%">
    </colgroup>
    <thead>
    <tr>
        <th>구분</th>
        <th>산출식 또는 산출방법</th>
        <th>지급액</th>
    </tr>
    </thead>
    <tbody></tbody>
</table><!--하단글-->
<table width="740px">
    <tbody>
    <tr align="center">
        <td style="font-size: 12px;font-family: 돋음, dotum;color: #444;padding:10px;"><p></p></td>
    </tr>
    </tbody>
</table>

	<!-- jQuery -->
    <script src="${path}/resources/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JS -->
   	<script src="${path}/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- FeatherIcons JS -->
    <script src="${path}/resources/js/feather.min.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="${path}/resources/js/dropdown-bootstrap-extended.js"></script>

	<!-- Simplebar JS -->
	<script src="${path}/resources/vendors/simplebar/dist/simplebar.min.js"></script>

	<!-- Init JS -->
	<script src="${path}/resources/js/init.js"></script>
	<script src="${path}/resources/js/chips-init.js"></script>
	<script src="${path}/resources/js/dashboard-data.js"></script>
	
	<script>
//프린트 관련 기능
  $('#print').on('click', function(){
	 $('body').css('background-image', 'url("path/to/your/background/image.jpg")');
	 window.print();  // 클릭액션 : 버튼클릭시 인쇄창팝업
  });

  $('#print').mouseover(function(){
	  $(this).css("color",'#cdee1d');  // 마우스오버액션 : 커서가 올라갈 경우 다른색상으로 변경 
  });


  $('#print').mouseleave(function(){
	  $(this).css("color",'#0c4276');  // 마우스릴리즈액션 : 커서가 밖에 위치할 경우 기존색상으로 변경 
  });

	</script>
	