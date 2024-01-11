package com.dna.hiveworks.serviceimpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dna.hiveworks.model.dao.DeptDao;
import com.dna.hiveworks.model.dto.Department;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.service.DeptService;

import lombok.RequiredArgsConstructor;

/**
 * @author : 김태윤
 * @since : 2024. 01. 01.
 * Description : 부서정보 서비스 구현
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2024. 01. 01., 설명 : 최초작성
 * 
 */

@Service
@RequiredArgsConstructor
public class DeptServiceImpl implements DeptService {
	
	private final DeptDao dao;
	private final SqlSession session;

	@Override
	public List<Department> deptListAll() {
		return dao.deptListAll(session);
	}
	
	@Override
	public String searchDeptName(String deptCode) {
		String deptName = dao.searchDeptName(session,deptCode);
		return deptName;
	}

	@Override
	public int insertDept(Department dept) {
		int result = dao.insertDept(session,dept);
		return result;
	}

	@Override
	public int updateDept(Map<String,String>response) {
		int result = dao.updateDept(session,response);
		return result;
	}

	@Override
	public int deleteDept(Department dept) {
		int result = dao.deleteDept(session, dept);
		return result;
	}

	@Override
	public List<Map<String, Object>> deptEmpList(String deptCode) {
	    return dao.deptEmpList(session,deptCode);
	}

	@Override
	public int changeEmpDept(Map<String,Object>params) {
		int result = dao.changeEmpDept(session,params);
		return result;
	}

	@Override
	public int changeDeptLeader(String id) {
		int result = dao.changeDeptLeader(session,id);
		return result;
	}
	
	@Override
	public int changeDeptLeaderOld(String id) {
		int result = dao.changeDeptLeaderOld(session,id);
		return result;
	}

	@Override
	public int removeDeptLeader(String id) {
		int result = dao.removeDeptLeader(session,id);
		return result;
	}

	@Override
	public int deptEmpOut(Map<String, Object> params) {
		int result = dao.deptEmpOut(session,params);
		return result;
	}

	@Override
	public List<Employee> searchEmpByName(String name) {
		List<Employee> result = dao.searchEmpByName(session,name);
		return result;
	}

	@Override
	public int addEmpDept(Employee emp) {
		int result = dao.addEmpDept(session,emp);
		return result;
	}
	
	
	//조직도 엑셀 일괄 업로드
	@Override
	public boolean parseAndSaveExcel(MultipartFile file) throws IOException {
		
		try (Workbook workbook = WorkbookFactory.create(file.getInputStream())) {
	    
			Sheet sheet = workbook.getSheetAt(0); //파일의 첫번째 시트를 연다.			
	       
			int numberOfRows = sheet.getPhysicalNumberOfRows(); //sheet에서 데이터가 들어있는 행의 수를 가져온다.	        
	        
	        for (int i = 1; i < numberOfRows; i++) { 
	        	
	        	//순차적으로 1행씩 가져온다
	            Row row = sheet.getRow(i); 
	            
	            //데이터 저장소 map 생성
	            Map<String, Object> dataMap = new HashMap<>(); 
	            
	            // 2레벨 부서는 무조건 DEP001을 상위 코드로 가진다.
	            String upstairCode = "DEP001"; 
	            
	            // 5레벨까지만 작성하도록했으므로 5까지 순환
	            for (int j = 0; j < 5; j++) { 
	            	
	                Cell cell = row.getCell(j); //행을 순환 하면서 행의 각 cell을 가져온다
	                
	                if (cell != null && !cell.getStringCellValue().isEmpty()) {
	                    String deptName = cell.getStringCellValue(); //셀에서 부서이름을 가져온다.
	                    String deptCode = dao.selectDeptCodeByName(session, deptName); //부서이름으로 기존에 있는 부서이면 code를 가져온다.
	                    
	                    // 부서이름이 없는 부서라면 새로 생성한다.
	                    if (deptCode == null || deptName.isEmpty()) { 
	                        dataMap.put("DEPT_UPSTAIR", upstairCode);
	                        dataMap.put("DEPT_NAME", deptName);
	                        dataMap.put("USE_YN", "Y");
	                        dao.insertDeptExcel(session,dataMap);
	                        upstairCode = dao.selectLastDepCode(session); //마지막으로 생성한 부서코드를 찾아서 상위부서코드로 설정해준다
	                    }else {
	                    	upstairCode = deptCode;
	                    }
	                }
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	    return true;
	}

	
	
	
	
	
	
	

	

	
	
	
	
}
