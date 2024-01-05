package com.dna.hiveworks.model.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.ScheduleDao;
import com.dna.hiveworks.model.dto.Schedule;

@Repository("scheduleDao")
public class ScheduleDaoImpl implements ScheduleDao {
	
	@Override
	public int insertSchedule(SqlSession session, Schedule schedule) {
		return session.insert("schedule.insertSchedule",schedule);
	}
	
	@Override
	public List<Schedule> selectScheduleAll(SqlSession session) {
		return session.selectList("schedule.selectScheduleAll");
	}
	
	@Override
	public int reserveResource(SqlSession session, Schedule schedule) {
		return session.insert("schedule.insertSchedule");
	}

}
