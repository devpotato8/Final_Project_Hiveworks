package com.dna.hiveworks.serviceimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.VacationDao;
import com.dna.hiveworks.model.dto.Vacation;
import com.dna.hiveworks.service.VacationService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VacationServiceImpl implements VacationService {
	
	private final SqlSession session;
	private final VacationDao dao;

	@Override
	public List<Vacation> selectVacationListAll() {
		// TODO Auto-generated method stub
		return dao.selectVacationListAll(session);
	}

	@Override
	public List<Vacation> selectVacationByNo(int no) {
		// TODO Auto-generated method stub
		return dao.selectVacationByNo(session, no);
	}

	@Override
	public int insertVacation(Vacation v) {
		// TODO Auto-generated method stub
		return dao.insertVacation(session, v);
		
		// updateVacation 여기다 같이 추가해야할듯?
	}

	@Override
	public int updateVacation(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.updateVacation(session, param);
	}

	@Override
	public int deleteVacation(int vacationNo) {
		// TODO Auto-generated method stub
		return dao.deleteVacation(session, vacationNo);
	}

	@Override
	public double selectLeftVacation(int empNo) {
		// TODO Auto-generated method stub
		return dao.selectLeftVacation(session, empNo);
	}
	
	@Override
	public int confirmVacation(String edocNo) {
		// TODO Auto-generated method stub
		//tbl_vacation의 vac_permit 을 '승인'으로 바꾸기
		int result = dao.confirmVacation(session, edocNo);
		return result;
	}
	
	@Override
	public int revokeVacation(String edocNo) {
		// TODO Auto-generated method stub
		//tbl_vacation의 vac_permit 을 '반려'로 바꾸기
		int result = dao.revokeVacation(session, edocNo);
		//성공했을 때
		if(result>0) {
			//휴가정보를 가져와서
			Vacation vac = dao.selectVacation(session, edocNo);
			
			if(vac.getVacOption().equals("연차")||vac.getVacOption().equals("오전반차")||vac.getVacOption().equals("오후반차")) {
				dao.rollbackVacation(session, Map.of("empNo",vac.getEmpNo(),"vacCount",vac.getVacCount()));
				
			}
			
		}
		
		
		return 0;
	}
}
