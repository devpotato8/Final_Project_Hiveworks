package com.dna.hiveworks.model.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dna.hiveworks.model.dao.MsgDao;
import com.dna.hiveworks.model.dto.Message;

@Repository
public class MsgDaoImpl implements MsgDao {

	@Override
	public List<Message> msgList(SqlSession session, int empNo) {
		return session.selectList("message.msgList",empNo);
	}

	@Override
	public int starMark(SqlSession session, int msgNo) {
		return session.update("message.starMark",msgNo);
	}

	@Override
	public int starUnmark(SqlSession session, int msgNo) {
		return session.update("message.starUnmark",msgNo);
	}
	
	

}
