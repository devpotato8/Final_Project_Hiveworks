package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;

public interface ScheduleDao {
	
	int insertSchedule(SqlSession session, Schedule schedule);
	
	List<Schedule> selectScheduleAll(SqlSession session);
	
	
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
	
	List<Schedule> selectprojectByNo(SqlSession session, int empNo);

}
