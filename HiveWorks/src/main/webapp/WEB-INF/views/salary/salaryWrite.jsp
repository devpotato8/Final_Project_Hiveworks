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
<%-- <%@ include file="/WEB-INF/views/common/sideBar.jsp"%> --%>
<jsp:include page="/WEB-INF/views/common/sideBar.jsp">
	<jsp:param value="${edocCountWait }" name="edocCountWait"/>
</jsp:include>
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
    /* css 추가 */
    input[type=text]{
    background: transparent; 
    text-align: center; 
    width:80px;
    
    }
    
    #register_sal{
    	text-align: right;
    	display: inline-block;
    	float: right;
    }
    
    </style>
<body leftmargin="0" topmargin="0" style="font-face:맑은고딕,Malgun Gothic, 돋음, dotum;" align="center"><!--제목--->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<form id="form" action="${path }/salary/SalaryWriteEnd" method="post">
<button class="btn btn-primary btn-sm" style="width:100px">등록</button>
	<div id="register_sal">
		<input type="search" id="searchId" list="data" placeholder="사원번호를 입력해 주세요." style="width:200px;"/>
		<button type="button" class="btn btn-primary btn-sm" style="width:100px" onclick="fn_changeEmployee()">검색</button>
		<datalist id="data"></datalist>
	</div>
<table width="740px">
    <tbody>
    <tr align="center">
        <td style="font-size: 16px;font-family: 돋음, dotum;color: #444444;padding:10px;">
        <b id="payday">
        	0000년 00월 급여명세서
        </b>
        </td>
    </tr>
    </tbody>
</table>
<table class="top_basictbl">
    <colgroup>
        <col style="width:50%">
        <col>
    </colgroup>
    <tbody>
    <tr>
        <td class="txtlft"><p><em>회사명</em> (주)하이브웍스</p></td>
        <td class="txtrgt"><p><em>지급일</em><input type="date" id="sal_date" name="sal_date" onchange="fn_change_date();"/></p></td>
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
        <td><input type="text" id="emp_no" name="emp_no" readonly="readonly" style="border: none;"/></td>
        <th><span>사원명</span></th>
        <td><input type="text" id="emp_name" name="emp_name" readonly="readonly" style="border: none;"/></td>
        <th><span>생년월일</span></th>
        <td><input type="text" id="emp_birth_date" name="emp_birth_date" readonly="readonly" style="border: none;"/></td>
    </tr>
    <tr>
        <th><span>부서</span></th>
        <td><input type="text" id="dept_name" name="dept_name" readonly="readonly" style="border: none;"/></td>
        <th><span>직급</span></th>
        <td><input type="text" id="job_name" name="job_name" readonly="readonly" style="border: none;"/></td>
        <th><span>직위</span></th>
        <td><input type="text" id="position_name" name="position_name" readonly="readonly" style="border: none;"/></td>
    </tr>
    </tbody>
</table><!--근로일수 및 시간 -->
<table class="userwork_tbl">
    <colgroup>
        <col style="width:20%" span="5">
    </colgroup>

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
                    <th width="14%">식대</th>
                    <th width="14%">직위수당</th>
                    <th width="14%">보너스</th>
                    <th width="14%"></th>
                    <th width="14%"></th>
                </tr>
                <tr bgcolor="#ffffff" height="22px" align="center"
                    style="font-size: 12px;font-family: 돋음, dotum;color: #000000;">
                    
                    <td style="border-bottom:1px solid #eee;"><input type="text" id="sal_base" name="sal_base" value="0" onkeyup="fn_auto_delete(event);"/></td>
                    <td style="border-bottom:1px solid #eee;"><input type="text" id="sal_meal" name="sal_meal" value="0" onkeyup="fn_auto_delete(event);"/></td>
                    <td style="border-bottom:1px solid #eee;"><input type="text" id="position_pay" name="position_pay" value="0" readonly="readonly" readonly="readonly" style="border: none;"/></td>
                    <td style="border-bottom:1px solid #eee;"><input type="text" id="sal_bonus" name="sal_bonus" value="0" onkeyup="fn_auto_delete(event);"/></td>
                    <td style="border-bottom:1px solid #eee;"><!-- <input type="text" id="overtime_pay" name="overtime_pay" value="0" readonly="readonly" style="border: none;"/> --></td>
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
                    <td style="border-bottom:1px solid #eee;"><input type="text" id="dedu_national_pension" name="dedu_national_pension" readonly="readonly" style="border: none;"/></td>
                    <td style="border-bottom:1px solid #eee;"><input type="text" id="dedu_health_insur" name="dedu_health_insur" readonly="readonly" style="border: none;"/></td>
                    <td style="border-bottom:1px solid #eee;"><input type="text" id=dedu_longterm_care_insur name="dedu_longterm_care_insur" readonly="readonly" style="border: none;"/></td>
                    <td style="border-bottom:1px solid #eee;"><input type="text" id="dedu_emp_insur" name="dedu_emp_insur" readonly="readonly" style="border: none;"/></td>
                    <td style="border-bottom:1px solid #eee;"><input type="text" id="dedu_income_tax" name="dedu_income_tax" readonly="readonly" style="border: none;"/></td>
                    <td style="border-bottom:1px solid #eee;"><input type="text" id="dedu_local_income_tax" name="dedu_local_income_tax" readonly="readonly" style="border: none;"/></td>
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
<button type="button" class="btn btn-primary btn-sm" onclick="fn_cal_salary()">계산</button>
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
                    <td width="14%"><input type="text" id="sal_total" name="sal_total" readonly="readonly" style="border: none;"/></td>
                    <td width="14%"><input type="text" id="dedu_total" name="dedu_total" readonly="readonly" style="border: none;"/></td>
                    <td width="14%"></td>
                    <td width="14%"><input type="text" id="sal_actual" name="sal_actual" readonly="readonly" style="border: none;"/></td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>
</form>
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
    <tbody>
    	<td>-</td>
    	<td>자세한 사항은 인사담당자에게 문의하세요.</td>
    	<td>-</td>
    </tbody>
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
	$("#searchId").keyup(e=>{
		const value=e.target.value;
		$.ajax({
			url:"${path}/employees/searchEmployees",
			data:{"keyword":value},
			success:data=>{
				const emp_ids=data.split(",");
				$("#data").html("");
				emp_ids.forEach(e=>{
					const $op=$("<option>").attr("value",e).text(e);
					$("#data").append($op);
				});
			}
		})
	});
	
	fn_changeEmployee=()=>{
		let value = $("#searchId").val();
		$.ajax({
			type:'post',
			url:"${path}/employees/searchEmployees",
			data:{"keyword":value},
			success:data=>{
				if(data[0]!=null){
					$("#emp_no").val(data[0].emp_no);
					$("#emp_name").val(data[0].emp_name);
					$("#emp_birth_date").val(data[0].emp_birth_date);
					$("#dept_name").val(data[0].dept_name);
					$("#job_name").val(data[0].job_name);
					$("#position_name").val(data[0].position_name);
					$("#position_pay").val(fn_insert_comma(data[0].pp_add_pay));					
				}else{
					alert("사원이 없습니다.");
				}
			
			
			},
			error:function(){
                alert("사원을 찾을 수 없습니다.");
			}
		})
	};
	
	fn_cal_salary=()=>{
		let total = parseInt($("#sal_base").val())
					+Number($("#overtime_pay").val())
					+Number($("#sal_meal").val())
					+Number(fn_delete_comma($("#position_pay").val()))
					+Number($("#sal_bonus").val());
		
		let notax = Number($("#sal_meal").val());
		
		$.ajax({
			type:'get',
			url:"${path}/salary/calculateSalary",
			data:{"total":total,"notax":notax},
			success:function(data){
				$("#dedu_national_pension").val(fn_insert_comma(data.o_pension));
				$("#dedu_health_insur").val(fn_insert_comma(data.o_insurance));
				$("#dedu_longterm_care_insur").val(fn_insert_comma(data.o_nursing));
				$("#dedu_emp_insur").val(fn_insert_comma(data.o_employ));
				$("#dedu_income_tax").val(fn_insert_comma(data.o_income));
				$("#dedu_local_income_tax").val(fn_insert_comma(data.o_local));
				$("#sal_total").val(fn_insert_comma(data.i_total));
				
				let $dedu_total =Number(data.o_pension)
								+Number(data.o_insurance+data.o_nursing)
								+Number(data.o_employ)
								+Number(data.o_income)
								+Number(data.o_local);
				$("#dedu_total").val(fn_insert_comma($dedu_total));
				let $actual = Number(data.i_total)-$dedu_total;
				
				$("#sal_actual").val(fn_insert_comma($actual));
			},
			error:function(){
                alert("계산 실패");
			}
		})

	};
	
	//document.getElementById('sal_date').value = new Date().toISOString().substring(0, 10);

	fn_change_date=()=>{
		// input 태그에서 선택한 날짜 가져오기
		let changeDate = document.getElementById('sal_date').value;
		
		// Date 객체로 변환하기
		let date = new Date(changeDate);
		
		// 연도와 월 가져오기
		let year = date.getFullYear();
		let month = date.getMonth()+1;
		
		let payday = document.getElementById('payday');
		
		payday.innerHTML = year + "년 " + month + "월 급여명세서";
	};
</script>
<script>
//콤마 생성 및 삭제
fn_insert_comma=(num)=>{
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

fn_delete_comma=(num)=>{
    return num.replaceAll(',','');
}
</script>
<script>
let $form = document.getElementById('form');
$form.addEventListener('submit',event=>{
	event.preventDefault();
	
	$("#sal_actual").val(fn_delete_comma($("#sal_actual").val()));
	$("#position_pay").val(fn_delete_comma($("#position_pay").val()));
	
	if($("#sal_date").val()==0){
		alert("날짜를 선택해 주세요.");
		return false;
	}
	
	if($("#sal_base").val()==0){
		alert("기본 급여를 입력해 주세요.");
		return false;
	}
	
	if($("#emp_no").val()==0 || $("#emp_no").val()==null ){
		alert("직원을 선택해 주세요.");
		return false;
	}	
	
	$form.submit();
});

</script>
<script>
let fn_auto_delete=(e)=>{
	e.target.value = e.target.value
	.replace(/[^0-9]/g, '');
};

</script>	