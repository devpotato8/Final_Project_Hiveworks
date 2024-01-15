package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;

public interface ScheduleDao {
	
	List<Employee> selectEmployeesList(SqlSession session);
	
	int insertSchedule(SqlSession session, Schedule schedule);
	
	//일정 변경
	int updateSchedule(SqlSession session, Schedule schedule, int calNo);
	
	int deleteInvitaion(SqlSession session, int calNo);
	
	int updateInvitaion(SqlSession session, List<Integer> reempList, int calNo);
	
	
	int insertInvitation(SqlSession session, List<Integer> empList);
	
	int deleteSchedule(SqlSession session, int calNo);
	
	List<Schedule> selectScheduleAll(SqlSession session);
	
	
	List<Schedule> searchSchedule(SqlSession session, Map<String,Object> param);
	
	int insertResource(SqlSession session, Resource resource);
	
	List<Resource> selectResourceAll(SqlSession session);
	
	//reservation
	List<Schedule> selectReserveAll(SqlSession session);
	
	List<Schedule> selectReserveByNo(SqlSession session, int empNo);

	List<Schedule> selectReserveByCode(SqlSession session, String calCode);
	
	int reserveResource(SqlSession session, Schedule schedule);
	
	int reserveResourceEnd(SqlSession session, int resourceNo);
	
	//project
	List<Schedule> selectprojectAll(SqlSession session);
	
	List<Schedule> selectprojectByEmpNo(SqlSession session, int empNo);
	
	Schedule selectprojectByCalNo(SqlSession session, int calNo);

}
