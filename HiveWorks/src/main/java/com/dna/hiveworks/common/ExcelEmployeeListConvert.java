package com.dna.hiveworks.common;

import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.dna.hiveworks.model.dto.Employee;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ExcelEmployeeListConvert extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		List<Employee> employeeList=(List<Employee>)model.get("employees");
		
		//sheet 만들기
		final Sheet sheet1 = workbook.createSheet();
		
	}

	
	private void addHeader(Sheet sheet, List<String> headerdata) {
		Row header = sheet.createRow(0);
		for(int i=0;i<headerdata.size();i++) {
			header.createCell(i).setCellValue(headerdata.get(i));
		};
		
	}
	
	private void addContent(Sheet sheet, Employee emp) {
		Row row=sheet.createRow(sheet.getLastRowNum()+1);
		row.createCell(0).setCellValue(emp.getEmp_id());
		row.createCell(0).setCellValue(emp.getEmp_name());
		row.createCell(0).setCellValue(emp.getEmp_hired_date());
		row.createCell(0).setCellValue(emp.getEmp_resident_no());
		row.createCell(0).setCellValue(emp.getEmp_phone());
		row.createCell(0).setCellValue(emp.getEmp_cellphone());
		row.createCell(0).setCellValue(emp.getEmp_email());
		row.createCell(0).setCellValue(emp.getDept_name());
		row.createCell(0).setCellValue(emp.getPosition_name());
		row.createCell(0).setCellValue(emp.getJob_name());
		row.createCell(0).setCellValue(emp.getWork_status_name());
		row.createCell(0).setCellValue(emp.getWork_pattern_name());
		row.createCell(0).setCellValue(emp.getWork_type_name());
		
	}
	
}
