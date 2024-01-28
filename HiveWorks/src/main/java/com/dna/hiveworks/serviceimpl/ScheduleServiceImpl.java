package com.dna.hiveworks.serviceimpl;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.ScheduleDao;
import com.dna.hiveworks.model.dto.CheckList;
import com.dna.hiveworks.model.dto.Comment;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;
import com.dna.hiveworks.model.dto.ScheduleVacation;
import com.dna.hiveworks.model.dto.Vacation;
import com.dna.hiveworks.service.ScheduleService;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private SqlSession session;
 
	@Autowired
	@Qualifier("scheduleDao")
	private ScheduleDao dao;

	
	
	@Override
	public Schedule scheduleListByCalNo(int calNo) {
		return dao.scheduleListByCalNo(session, calNo);
	}
	
	
	@Override
	public int insertSchedule(Schedule schedule, List<Integer> empList) {
		int inviresult = 0;
		int scheduleResult = dao.insertSchedule(session, schedule);
		if (scheduleResult > 0 ) {
			if (empList != null && empList.size() > 0) {
				inviresult = dao.insertInvitation(session, empList);
				if (inviresult == 0) {
					throw new RuntimeException("일정 등록 실패");
				}
			}

		} else {
			throw new RuntimeException("일정 등록 실패");

		}
		return scheduleResult;
	}

	@Override
	public int updateSchedule(Schedule schedule, List<Integer> empList, int calNo) {
		int updateInvi = 0;
		int scheduleUpdate = dao.updateSchedule(session, schedule, calNo);

		if (scheduleUpdate>0) {
			int deleteInvi = dao.deleteInvitaion(session, calNo); // delete지만 useYn을 n으로
			if (deleteInvi > 0) {
				if(empList != null && empList.size() > 0) {
				updateInvi = dao.updateInvitaion(session, empList, calNo);

				if (updateInvi == 0) {
					throw new RuntimeException("일정 수정 실패");
				}
			}
		} 
		}else {
			throw new RuntimeException("일정 수정 실패");
		}

		return scheduleUpdate;
	}
	
	@Override
	public int updateImportYn(Schedule schedule, int calNo) {
		return  dao.updateImportYn(session, schedule, calNo);
		
	}

	@Override
	public int deleteSchedule(int calNo) {
		int deleteInvi = 0;
		int scheduleDelete = dao.deleteSchedule(session, calNo);
		if(scheduleDelete > 0) {
			deleteInvi = dao.deleteInvitaion(session, calNo);
			/*
			 * if(deleteInvi == 0) { throw new RuntimeException("일정 삭제 실패"); }
			 */
		}else{
	        throw new RuntimeException("일정 삭제 실패");
		}
		return scheduleDelete;
	}

	@Override
	public List<Employee> selectEmployeesList() {
		return dao.selectEmployeesList(session);
	}

	@Override
	public List<Schedule> selectScheduleAll() {
		return dao.selectScheduleAll(session);
	}
	
	@Override
	public List<Schedule> searchSchedule(Map<String, Object> param) {
		List<Schedule> searchList = dao.searchSchedule(session, param);
		return searchList;
	}
	
	@Override
	public List<Schedule> searchImpschedule(Map<String, Object> param) {
		return dao.searchImpschedule(session, param);
	}
	
	@Override
	public List<Schedule> searchEmpSchedule(Map<String, Object> param) {
		return dao.searchEmpSchedule(session, param);
	}
	
	@Override
	public List<ScheduleVacation> searchVacationByCode(String deptCode) {
		return dao.searchVacationByCode(session, deptCode);
	}

	@Override
	public int reserveResource(Schedule schedule, int resourceNo, int[] empList) {
		int inviresult = 0;
		int reserveResource = dao.reserveResource(session, schedule);
		if (reserveResource > 0) {
			int reserveResourceEnd = dao.reserveResourceEnd(session, resourceNo);
			if (empList != null && empList.length > 0) {
				inviresult = dao.insertInvitationRe(session, empList);
				if (inviresult == 0) {
					throw new RuntimeException("예약 등록 실패");
				}
			}

		} else {
			throw new RuntimeException("예약 등록 실패");

		}
		return reserveResource;
	}
	
	@Override
	public int updateReservation(Schedule schedule, int calNo, int[] empList) {
		int inviresult = 0;
		int updateReservation = dao.updateReservation(session, schedule);
		if(updateReservation > 0) {
			int deleteInvi = dao.deleteInvitaion(session, calNo); // delete지만 useYn을 n으로
			if (empList != null && empList.length > 0) {
				inviresult = dao.updateInvitationRe(session, empList, calNo);
				if (inviresult == 0) {
					throw new RuntimeException("예약 수정 실패");
				}
			}

		} else {
			throw new RuntimeException("예약 수정 실패");

		}
		return updateReservation;
		};
		
	

	@Override
	public int insertResource(Resource resource) {
		return dao.insertResource(session, resource);
	}
	
	@Override
	public int updateResource(Resource resource) {
		return dao.updateResource(session, resource);
	}
	
	@Override
	public int deleteResource(List<Integer> checkedList) {
		return dao.deleteResource(session, checkedList);
	}

	@Override
	public List<Resource> selectResourceAll() {
		return dao.selectResourceAll(session);
	}
	
	@Override
	public List<Resource> selectResourceByType(String type) {
		return dao.selectResourceByType(session, type);
	}
	
	

	@Override
	public List<Schedule> selectReserveByNo(int empNo) {
		return dao.selectReserveByNo(session, empNo);
	}
	
	@Override
	public List<Schedule> selectReservationBydate(Date selectDate, int resourceNo) {
		System.out.println(resourceNo+"서비스");
		return dao.selectReservationBydate(session, selectDate, resourceNo);
	}
	
	@Override
	public List<Schedule> selectReserveByresource(int resourceNo) {
		return dao.selectReserveByresource(session, resourceNo);
	}

	@Override
	public List<Schedule> selectReserveAll() {
		return dao.selectReserveAll(session);
	}

	@Override
	public List<Schedule> selectReserveByCode(String calCode) {
		return dao.selectReserveByCode(session, calCode);
	}
	
	@Override
	public int deleteReservation(List<Integer> checkedList) {
		return dao.deleteReservation(session, checkedList);
	}
	
	@Override
	public List<Schedule> reserveBykeyword(String keyword,String type, int empNo) {
		System.out.println("서비스"+type+keyword);
		return dao.reserveBykeyword(session, keyword, type, empNo);
	}

	// project
	@Override
	public List<Schedule> selectprojectAll() {
		return dao.selectprojectAll(session);
	}

	/*
	 * @Override public Schedule scheduleListByCalNo(int calNo) { return
	 * dao.scheduleListByCalNo(session, calNo); }
	 */

	@Override
	public List<Schedule> selectprojectByEmpNo(int empNo) {
		return dao.selectprojectByEmpNo(session, empNo);
	}
	
	@Override
	public int insertProject(Schedule schedule, int[] empList) {
		int inviresult = 0;
		int insertProject = dao.insertSchedule(session, schedule);
		if (insertProject > 0) {
			if (empList != null && empList.length > 0) {
				inviresult = dao.insertInvitationRe(session, empList);
				if (inviresult == 0) {
					throw new RuntimeException("예약 등록 실패");
				}
			}

		} else {
			throw new RuntimeException("예약 등록 실패");

		}
		return insertProject;
	}
	
	@Override
	public CheckList selectChecklistByNo(int checklistNo) {
		return dao.selectChecklistByNo(session, checklistNo);
	}
	
	@Override
	public List<CheckList> checkListByCalNo(int calNo) {
		return dao.checkListByCalNo(session, calNo);
	}

	
	@Override
	public int insertChecklist(CheckList checklist) {
		return dao.insertChecklist(session, checklist);
	}
	
	@Override
	public int deleteChecklist(int checklistNo) {
		return dao.deleteChecklist(session, checklistNo);
	}
	
	@Override
	public int doneChecklist(int checklistNo) {
		return dao.doneChecklist(session, checklistNo);
	}
	
	@Override
	public int undoneChecklist(int checklistNo) {
		return dao.undoneChecklist(session, checklistNo);
	}
	
	@Override
	public  int insertComment(Comment comment) {
		return dao.insertComment(session, comment);
	}
	
	@Override
	public Comment selectCommentByNo(int calCommenttNo) {
		return dao.selectCommentByNo(session, calCommenttNo);
	}
	
	@Override
	public int updateComment(Comment comment) {
		return dao.updateComment(session, comment);
	}
	
	@Override
	public int deleteComment(int calCommentNo) {
		return dao.deleteComment(session, calCommentNo);
	}

}
