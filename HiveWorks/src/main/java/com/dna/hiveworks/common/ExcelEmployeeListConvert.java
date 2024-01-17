package com.dna.hiveworks.common;

import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.dna.hiveworks.model.dto.Account;
import com.dna.hiveworks.model.dto.Employee;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ExcelEmployeeListConvert extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		List<Employee> employeeList=(List<Employee>)model.get("employees");
		List<Account> accountList=(List<Account>)model.get("accounts");
		
		//sheet 만들기
		final Sheet sheet1 = workbook.createSheet();
		
		addHeader(sheet1,
				List.of("사원번호","아이디","이름","주민번호","입사일","퇴사일","생년월일","사내전화","핸드폰번호"
						,"이메일","부서명","직위","직무","근로상태","근로형태","근무유형","권한","우편번호","주소","상세주소","메모","계좌번호","은행","소유주"));
		
		for(int i=0; i<employeeList.size();i++) {
				addContent(sheet1,employeeList.get(i),accountList.get(i));
				

		}
	
	}

	
	private void addHeader(Sheet sheet, List<String> headerdata) {
		Row header = sheet.createRow(0);
		for(int i=0;i<headerdata.size();i++) {
			header.createCell(i).setCellValue(headerdata.get(i));
		};
		
	}
	
	private void addContent(Sheet sheet, Employee emp, Account ac) {
		Row row=sheet.createRow(sheet.getLastRowNum()+1);
		row.createCell(0).setCellValue(emp.getEmp_no());
		row.createCell(1).setCellValue(emp.getEmp_id());
		row.createCell(2).setCellValue(emp.getEmp_name());
		row.createCell(3).setCellValue(emp.getEmp_resident_no());
		if(emp.getEmp_hired_date()!=null) {
			row.createCell(4).setCellValue(emp.getEmp_hired_date().toLocaleString());			
		}else {
			row.createCell(4).setCellValue(emp.getEmp_hired_date());	
		}
		if(emp.getEmp_retired_date()!=null) {
			row.createCell(5).setCellValue(emp.getEmp_retired_date().toLocaleString());						
		}else {
			row.createCell(5).setCellValue(emp.getEmp_retired_date());
		}
		row.createCell(6).setCellValue(emp.getEmp_birth_date());
		row.createCell(7).setCellValue(emp.getEmp_phone());
		row.createCell(8).setCellValue(emp.getEmp_cellphone());
		row.createCell(9).setCellValue(emp.getEmp_email());
		row.createCell(10).setCellValue(emp.getDept_name());
		row.createCell(11).setCellValue(emp.getPosition_name());
		row.createCell(12).setCellValue(emp.getJob_name());
		row.createCell(13).setCellValue(emp.getWork_status_name());
		row.createCell(14).setCellValue(emp.getWork_pattern_name());
		row.createCell(15).setCellValue(emp.getWork_type_name());
		row.createCell(16).setCellValue(emp.getAut_name());
		row.createCell(17).setCellValue(emp.getEmp_postcode());
		row.createCell(18).setCellValue(emp.getEmp_address());
		row.createCell(19).setCellValue(emp.getEmp_address_detail());
		row.createCell(20).setCellValue(emp.getEmp_memo());
		if(ac!=null) {
			row.createCell(21).setCellValue(ac.getAc_no());
			row.createCell(22).setCellValue(ac.getAc_bank());
			row.createCell(23).setCellValue(ac.getAc_name());			
		}else {
			row.createCell(21).setCellValue(0);
			row.createCell(22).setCellValue(0);
			row.createCell(23).setCellValue(0);			
		}
	}
	
}
