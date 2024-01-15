package com.dna.hiveworks.common;

import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.dna.hiveworks.model.dto.Work;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ExcelWorkListConvert extends AbstractXlsView {
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		List<Work> workView = (List<Work>)model.get("workView");

		// sheet 만들기
		// workbook으로 sheet만들기
		final Sheet sheet1 = workbook.createSheet();

		addHeader(sheet1, List.of(" ","출근일자","출근시간","퇴근시간","시간외 근무","지각여부","조퇴여부","결근여부"));
		workView.forEach(e->{
			addContent(sheet1, e);
		});

	}

	private void addHeader(Sheet sheet, List<String> headerdata) {
		Row header = sheet.createRow(0);
			for(int i = 0; i<headerdata.size(); i++) {
				header.createCell(i).setCellValue(headerdata.get(i));
			}
	}
	private void addContent(Sheet sheet, Work work) {
		Row row = sheet.createRow(sheet.getLastRowNum()+1);
		String[] workDay = work.getWorkDay().toLocaleString().split("오");
		String[] startTime = work.getWorkStartTime().toLocaleString().split("전 ");
		String[] endTime = work.getWorkEndTime().toLocaleString().split("후 ");
		row.createCell(0);
		row.createCell(1).setCellValue(workDay[0]);
		row.createCell(2).setCellValue(startTime[1]);
		row.createCell(3).setCellValue(endTime[1]);
		row.createCell(4).setCellValue(work.getWorkPermit() == null ? "null" :  work.getWorkPermit());
		row.createCell(5).setCellValue(work.getWorkRealtime().getWorkLate());
		row.createCell(6).setCellValue(work.getWorkRealtime().getWorkFastEnd());
		row.createCell(7).setCellValue(work.getWorkRealtime().getWorkAbsence());
		}
}
	

