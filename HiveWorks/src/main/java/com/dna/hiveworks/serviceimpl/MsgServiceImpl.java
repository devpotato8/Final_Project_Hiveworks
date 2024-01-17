package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.MsgDao;
import com.dna.hiveworks.model.dto.Message;
import com.dna.hiveworks.service.MsgService;

import lombok.RequiredArgsConstructor;

/**
 * @author : 김태윤
 * @since : 2023. 01. 14.
 * Description : 쪽지함 Service 구현클래스
 * 
 * History :
 * - 작성자 : 김태윤, 날짜 : 2023. 01. 14., 설명 : 최초작성
**/

@Service
@RequiredArgsConstructor
public class MsgServiceImpl implements MsgService {

	private final SqlSession session;
	private final MsgDao dao;
	
	@Override
	public List<Message> msgList(int empNo) {
		
		List<Message> result = dao.msgList(session, empNo);
		
		return result;
	}

	@Override
	public int starMark(int msgNo) {
		
		return dao.starMark(session,msgNo);
	}
	
	@Override
	public int starUnmark(int msgNo) {
		
		return dao.starUnmark(session,msgNo);
	}

}
