<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<body>
	    	<h2> 설문 응답하기</h2>
			
	      		
	      		<div class="surv-container">
		    	<!-- 설문 기본정보 START -->
				<div class="form-table-title-continer">
					<table class="form-tbl" style="width:1000px;">
				       <tr>
				           <td class="form-tbl-col">제목</td>
				           <td><input name="" id="" size="80" maxlength="100" /></td>
				       </tr>
				       <tr>
				       <td class="form-tbl-col" >등록자</td>
				           <td></td>
				       </tr>
				   </table>
				</div>
			<!-- 설문 기본정보 END -->
			
			<!-- 설문지 소개 START -->
			<div>
			<input type="hidden" >
				<table style="width: 524px;height: 74px;">
				   <tr>
				       <td>소개</td>
				       <td style="width:80%;" ></td>
				   </tr>
				</table>
			</div>
			
			<!-- 설문지 소개 END -->
			<div>
			<table style="width: 1044px;">
			<thead>		
				<tr>
				    <th>질문</th>
				 </tr>
			</thead>
		    <tbody>
		         <tr>
	            	
	            	<!-- 단답형 -->
	            	<td>
	            	 	<div>
		            		<span></span><span></span>
		            		<br/>
		            		<br/>
		            		<input >
	            		</div>
	            	</td>
	            	
	            	<!-- 장문형 -->
		            <td>
		                <div>
		                	<span> </span><span></span>
		                	<br/>
		                	<br/>
		                	<textarea style="resize:none"></textarea>
		                </div>
		            </td>
		            
		            <!-- 셀릭트 형 -->
	            	<td>
		                <div>		
		                <span></span><span></span>       
		                <br/>
		                 <br/>
		                <select>
							<option></option>					
						</select>
		                </div>
	            	</td>
	            	
	            	<!-- 라디오 -->
		            <td>
		                <div>
		                	<span></span><span></span>
		                	<br/>
		                	<br/>
		                	<th:block>
		                    	<input type="radio"></input>  
		                    <br>
		                	</th:block>	
		                </div>
		            </td>
		            
		            <!-- 체크박스 -->
		            <td >
		                <div>
		                	<span></span><span></span>
		                	<br/>
		                	<br/>
		                	<th:block>
		                		<input type="checkbox"/>
		                		<br>
		                	</th:block>
		                </div>
		            </td>
		         </tr>
		         
		       </tbody>
		    </table>
		    </div>
			</div>
			<br>
			<!-- <button type="submit" class="btn btn-dark " >제출하기</button> -->
			

			<!-- currentPage, cntPerPage, pageSize, srchTyp, keyword -->
			  <button>제출하기</button>
			  <button>목록 보기</button>
						<!-- 설문지 질문 END -->
	    </body>
	     <style>
		  button {
			  -webkit-appearance: none;
			  -moz-appearance: none;
			  appearance: none;
			  
			  margin:10px;
			  margin-left:0;
			  padding: 0.5rem 1rem;
			
			  font-size: 1rem;
			  font-weight: 400;
			  text-align: center;
			  text-decoration: none;
			
			  display: inline-block;
			  width: auto;
			
			  border: none;
			  border-radius: 4px;
		  
		}
		  
		button:hover {
			background-color:black;
			color:white;
		}
		h2 {
	margin-bottom:30px;	
    margin-top: 100px;
    margin-left: 300px;
	
}
table,th,td {
	border: 2px solid #d4d2d2;
	border-collapse: collapse;
	padding: 10px;
}
.form-table-title-continer .form-tbl-col{
	width:15%;
}
.form-table-title-continer td {
	width:40%;
}
.form-table-intro-container .form-tbl-col{
	width:15%;
}
#survTitle, #useYn{
	width:97%;
}

/*설문 기본정보 테이블 caption*/
.surv-container{
margin-left: 300px;
margin-top: 150px;
margin-bottom: 235px;
}
.surv-container body{
	font-size:small;
}
.form-tbl-caption {
	caption-side: top;
}
.form-tbl-caption span{
    font-weight:bold;
}
.form-tbl-caption button {
	width:7%;
	float:right;
	border-width: 1px;
	margin:0;
	font-size: small;
}
/*설문 기본정보 테이블*/
.form-tbl {
	margin-top: 20px;
	padding: 20px;
    border-collapse: collapse;
}
/*설문 기본정보 테이블 td*/
.form-tbl td {
    padding: 2px;
    cellpadding:7px;
}
/*설문 기본정보 테이블 컬럼*/
.form-tbl-col {
    text-align: center;
    background-color: #EEEEEE;
    font-weight:bold;
   
}
.form-tbl textarea {
	overflow:auto;
	max-height:100px;
}
[class*='item'] td:nth-child(1) {
	text-align:center;
	width:5%;
}
[class*='item'] td:nth-child(2) {
	width:15%;
}
[class*='item'] td:nth-child(3) {
	width:25%;
}
[class*='item'] td:nth-child(4) {
	width:50%;
}
[class*='item'] select{
	box-sizing:content-box;
	width:97%;
}
[class*='item'] #qustCont{
	box-sizing:content-box;
	width:97%;
	margin-bottom:3%;
}
/*질문내용 td 안 내용*/
.surv_opt_box {
	vertical-align: middle;
	padding: 5px;
	width: 200;
}
/*질문번호 컬럼*/
.questNo {
	text-align:center;
}
[name=multi-opt] {
	width:85%;
}
[name=opt_delete] {
	padding-left:6%;

}

#addQuestRow, #regSurvBtn, #uptSurvBtn, #delSurvBtn{
 	height:7%;
 	width:10%;
 	border: 2px solid #d4d2d2;
	border-collapse: collapse;
	font-size: small;
	font-weight: bold;
	margin-right:5px;
}
.surv-container button:hover {
	background-color:black;
	color:white;
}
#delQuestRow {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background-color: transparent; 
  border: none;
  font-size:large;
  
}
/*설문 소개보 테이블의 div
.form-table-intro-container{

}*/

.qustCont {
	font-weight: bold;
}
		
	   </style>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>