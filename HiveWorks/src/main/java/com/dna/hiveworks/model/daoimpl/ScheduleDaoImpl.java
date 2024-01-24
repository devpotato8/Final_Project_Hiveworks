package com.dna.hiveworks.model.daoimpl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.ScheduleDao;
import com.dna.hiveworks.model.dto.CheckList;
import com.dna.hiveworks.model.dto.Comment;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;

@Repository("scheduleDao")
public class ScheduleDaoImpl implements ScheduleDao {
	
	@Override
	public List<Employee> selectEmployeesList(SqlSession session) {
		return session.selectList("schedule.selectEmployeesList");
	}
	
	@Override
	public List<Schedule> searchSchedule(SqlSession session, Map<String, Object> param) {
		return session.selectList("schedule.searchSchedule",param);
	}
	
	@Override
	public List<Schedule> searchImpschedule(SqlSession session, Map<String,Object> param) {
		return session.selectList("schedule.searchSchedule",param);
	}
	
	@Override
	public List<Schedule> searchEmpSchedule(SqlSession session, Map<String, Object> param) {
		return session.selectList("schedule.searchEmpSchedule",param);

	}
	
	@Override
	public int insertSchedule(SqlSession session, Schedule schedule) {
		return session.insert("schedule.insertSchedule",schedule);
	}
	
	@Override
	public int insertInvitation(SqlSession session, List<Integer> empList) {
	    int count = 0;
	    for (int empNo : empList) {
	        if (empNo != 0) { // null 체크 추가
	            count += session.insert("schedule.insertInvitation", empNo);
	        }
	    }
	    return count;
	}
	
	
	
	//일정 변경 
	@Override
	public int updateSchedule(SqlSession session, Schedule schedule, int calNo) {
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("schedule", schedule);
	    parameters.put("calNo", calNo);
	    return session.update("schedule.updateSchedule", parameters);
	}
	
	@Override
	public int updateImportYn(SqlSession session, Schedule schedule, int calNo) {
		 Map<String, Object> parameters = new HashMap<>();
		    parameters.put("schedule", schedule);
		    parameters.put("calNo", calNo);
		return session.update("schedule.updateImportYn",parameters);
	}
	
	@Override
	public int deleteInvitaion(SqlSession session, int calNo) {
		return session.update("schedule.deleteInvitaion", calNo);
	}
	
	@Override
	public int updateInvitaion(SqlSession session, List<Integer> empList, int calNo) {
		int count = 0;
	    for (int empNo : empList) {
	        if (empNo != 0) { // null 체크 추가
	        	Map<String, Object> parameters = new HashMap<>();
	     	    parameters.put("empNo", empNo);
	     	    parameters.put("calNo", calNo);
	            count += session.insert("schedule.updateInvitation", parameters);
	        }
	    }
	    return count;
	}
	
	@Override
	public int deleteSchedule(SqlSession session, int calNo) {
		return session.delete("schedule.deleteSchedule",calNo);
	}
	
	@Override
	public List<Schedule> selectScheduleAll(SqlSession session) {
		return session.selectList("schedule.selectScheduleAll");
	}
	
	@Override
	public int reserveResource(SqlSession session, Schedule schedule) {
		return session.insert("schedule.reserveResource",schedule);
	}
	
	@Override
	public int insertResource(SqlSession session, Resource resource) {
		return session.insert("schedule.insertResource",resource);
	}
	
	@Override
	public int updateResource(SqlSession session, Resource resource) {
		return session.update("schedule.updateResource",resource);
	}
	
	@Override
	public int deleteResource(SqlSession session, List<Integer> checkedList) {
		int count = 0;
		for (Integer checkNo : checkedList) {
	        if (checkNo != null && checkNo != 0) { // null 체크 및 0 체크 추가
	            count += session.update("schedule.deleteResource", checkNo);
	        }
	    }
	    return count;
	}
	
	
	@Override
	public List<Resource> selectResourceAll(SqlSession session) {
		return session.selectList("schedule.selectResourceAll");
	}
	
	@Override
	public List<Resource> selectResourceByType(SqlSession session, String type) {
		return session.selectList("schedule.selectResourceByType",type);
	}
	
	@Override
	public List<Schedule> selectReserveAll(SqlSession session) {
		return session.selectList("schedule.selectReserveAll");
	}
	
	@Override
	public List<Schedule> selectReserveByNo(SqlSession session, int empNo) {
		return session.selectList("schedule.selectReserveByNo",empNo);
	}
	
	@Override
	public List<Schedule> selectReserveByCode(SqlSession session, String calCode) {
		return session.selectList("schedule.selectReserveByCode");
	}
	
	@Override
	public List<Schedule> selectReservationBydate(SqlSession session, Date selectDate, int resourceNo) {
		System.out.println(resourceNo+"dao");
		Map<String, Object> parameters = new HashMap<>();
		 parameters.put("selectDate", selectDate);
		 parameters.put("resourceNo", resourceNo);
		return session.selectList("schedule.selectReservationBydate",parameters);
	}
	
	@Override
	public List<Schedule> selectReserveByresource(SqlSession session, int resourceNo) {
		return session.selectList("schedule.selectReserveByresource",resourceNo);
	}
	
	
	@Override
	public int reserveResourceEnd(SqlSession session, int resourceNo) {
		 Map<String, Object> parameters = new HashMap<>();
		 parameters.put("resourceNo", resourceNo);
		return session.insert("schedule.reserveResourceEnd",parameters);
	}
	
	@Override
	public int updateReservation(SqlSession session, Schedule schedule) {
		return session.update("schedule.updateReservation", schedule);
	}
	
	@Override
	public int insertInvitationRe(SqlSession session, int[] empList) {
	    int count = 0;
	    for (int empNo : empList) {
	        if (empNo != 0) { // null 체크 추가
	            count += session.insert("schedule.insertInvitation", empNo);
	        }
	    }
	    return count;
	}
	
	@Override
	public int updateInvitationRe(SqlSession session, int[] empList, int calNo) {
		int count = 0;
		 for (int empNo : empList) {
		        if (empNo != 0) { // null 체크 추가
		        	Map<String, Object> parameters = new HashMap<>();
		     	    parameters.put("empNo", empNo);
		     	    parameters.put("calNo", calNo);
		            count += session.insert("schedule.updateInvitation", parameters);
		        }
		    }
		    return count;
	}
	
	
	
	
	@Override
	public int deleteReservation(SqlSession session, List<Integer> checkedList) {
		int count = 0;
		for (Integer checkNo : checkedList) {
	        if (checkNo != null && checkNo != 0) { // null 체크 및 0 체크 추가
	            count += session.update("schedule.deleteReservation", checkNo);
	        }
	    }
	    return count;
	}
	
	@Override
	public List<Schedule> selectprojectAll(SqlSession session) {
		return session.selectList("schedule.selectprojectAll");
	}
	
	@Override
	public List<Schedule> selectprojectByEmpNo(SqlSession session, int empNo) {
		return session.selectList("schedule.selectprojectByEmpNo",empNo);
	}
	
	@Override
	public Schedule selectprojectByCalNo(SqlSession session, int calNo) {
		return session.selectOne("schedule.selectprojectByCalNo", calNo);
	}
	
	@Override
	public CheckList selectChecklistByNo(SqlSession session, int checklistNo) {
		return session.selectOne("schedule.selectChecklistByNo", checklistNo);
	}
	
	
	@Override
	public int insertChecklist(SqlSession session, CheckList checklist) {
		return session.insert("schedule.insertChecklist",checklist);
	}
	
	@Override
	public int deleteChecklist(SqlSession session, int checklistNo) {
		return session.update("schedule.deleteChecklist",checklistNo);
	}
	
	@Override
	public int doneChecklist(SqlSession session, int checklistNo) {
		return session.update("schedule.doneChecklist",checklistNo);
	}
	
	@Override
	public int undoneChecklist(SqlSession session, int checklistNo) {
		return session.update("schedule.undoneChecklist",checklistNo);
	}
	
	@Override
	public int insertComment(SqlSession session, Comment comment) {
		return session.insert("schedule.insertComment",comment);
	}
	
	@Override
	public Comment selectCommentByNo(SqlSession session, int calCommenttNo) {
		return session.selectOne("schedule.selectCommentByNo", calCommenttNo);
	}
	
	@Override
	public int updateComment(SqlSession session, Comment comment) {
		return session.update("schedule.updateComment",comment);
	}
	
	@Override
	public int deleteComment(SqlSession session, int calCommentNo) {
		return session.update("schedule.deleteComment",calCommentNo);
	}

}
