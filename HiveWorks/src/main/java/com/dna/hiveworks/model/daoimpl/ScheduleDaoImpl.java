package com.dna.hiveworks.model.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.ScheduleDao;
import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;

@Repository("scheduleDao")
public class ScheduleDaoImpl implements ScheduleDao {
	
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
	public List<Resource> selectResourceAll(SqlSession session) {
		return session.selectList("schedule.selectResourceAll");
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
	public int reserveResourceEnd(SqlSession session, int resourceNo) {
		 Map<String, Object> parameters = new HashMap<>();
		 parameters.put("resourceNo", resourceNo);
		return session.insert("schedule.reserveResourceEnd",parameters);
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

}
