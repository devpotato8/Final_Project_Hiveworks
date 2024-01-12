package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.ScheduleDao;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;
import com.dna.hiveworks.service.ScheduleService;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private SqlSession session;

	@Autowired
	@Qualifier("scheduleDao")
	private ScheduleDao dao;

	@Override
	public int insertSchedule(Schedule schedule, List<Integer> empList) {
		int inviresult = 0;
		int scheduleResult = dao.insertSchedule(session, schedule);
		if (scheduleResult > 0) {
			if (empList.size() > 0) {
				inviresult = dao.insertInvitation(session, empList);
				if (inviresult == 0) {
					throw new RuntimeException("일정 등록 실패");
				}
			}

		} else {
			throw new RuntimeException("일정 등록 실패");

		}
		return inviresult;
	}

	@Override
	public int updateSchedule(Schedule schedule, List<Integer> empList, int calNo) {
		int updateInvi = 0;
		int scheduleUpdate = dao.updateSchedule(session, schedule, calNo);

		if (scheduleUpdate>0 && empList.size() > 0) {
			int deleteInvi = dao.deleteInvitaion(session, calNo); // delete지만 useYn을 n으로
			if (deleteInvi > 0) {
				updateInvi = dao.updateInvitaion(session, empList, calNo);

				if (updateInvi == 0) {
					throw new RuntimeException("일정 수정 실패");
				}
			}
		} else {
			throw new RuntimeException("일정 수정 실패");
		}

		return scheduleUpdate;
	}

	@Override
	public int deleteSchedule(int calNo) {
		int deleteInvi = 0;
		int scheduleDelete = dao.deleteSchedule(session, calNo);
		if(scheduleDelete > 0) {
			deleteInvi = dao.deleteInvitaion(session, calNo);
			if(deleteInvi == 0) {
				throw new RuntimeException("일정 삭제 실패");
			}
		}else{
	        throw new RuntimeException("일정 삭제 실패");
		}
		return deleteInvi;
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
	public int reserveResource(Schedule schedule, int resourceNo) {
		int reserveResource = dao.reserveResource(session, schedule);
		if (reserveResource > 0) {
			int reserveResourceEnd = dao.reserveResourceEnd(session, resourceNo);
		}
		return reserveResource;
	}

	@Override
	public int insertResource(Resource resource) {
		return dao.insertResource(session, resource);
	}

	@Override
	public List<Resource> selectResourceAll() {
		return dao.selectResourceAll(session);
	}

	@Override
	public List<Schedule> selectReserveByNo(int empNo) {
		return dao.selectReserveByNo(session, empNo);
	}

	@Override
	public List<Schedule> selectReserveAll() {
		return dao.selectReserveAll(session);
	}

	@Override
	public List<Schedule> selectReserveByCode(String calCode) {
		return dao.selectReserveByCode(session, calCode);
	}

	// project
	@Override
	public List<Schedule> selectprojectAll() {
		return dao.selectprojectAll(session);
	}

	@Override
	public Schedule selectprojectByCalNo(int calNo) {
		return dao.selectprojectByCalNo(session, calNo);
	}

	@Override
	public List<Schedule> selectprojectByEmpNo(int empNo) {
		return dao.selectprojectByEmpNo(session, empNo);
	}

}
