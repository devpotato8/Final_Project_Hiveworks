package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.ScheduleDao;
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
	public int insertSchedule(Schedule schedule) {
		return dao.insertSchedule(session,schedule);
	}
	
	@Override
	public List<Schedule> selectScheduleAll() {
		return dao.selectScheduleAll(session);
	}
	
	@Override
	public int reserveResource(Schedule schedule, int resourceNo) {
		int reserveResource = dao.reserveResource(session, schedule);
		if (reserveResource > 0) {
			int reserveResourceEnd = dao.reserveResourceEnd(session,resourceNo);
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
	public List<Schedule> selectReserveAll() {
		return dao.selectReserveAll(session);
	}
	
	@Override
	public List<Schedule> selectReserveByCode(String calCode) {
		return dao.selectReserveByCode(session, calCode);
	}
	
}
