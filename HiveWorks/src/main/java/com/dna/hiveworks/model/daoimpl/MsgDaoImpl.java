package com.dna.hiveworks.model.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Message> sendMsgList(SqlSession session, int empNo) {
		return session.selectList("message.sendMsgList",empNo);
	}
	
	@Override
	public List<Message> starMsgList(SqlSession session, int empNo) {
		return session.selectList("message.starMsgList",empNo);
	}
	
	@Override
	public List<Message> trashMsgList(SqlSession session, int empNo) {
		return session.selectList("message.trashMsgList",empNo);
	}
	
	@Override
	public List<Message> msgFileList(SqlSession session, int empNo) {
		return session.selectList("message.msgFileList",empNo);
	}
	
	
	
	///////////////////////////////////////////////////////////////////////
	
	
	@Override
	public List<String> sharedEmp(SqlSession session, Map<String,String> msgSharedEmps) {
		return session.selectList("message.sharedEmp",msgSharedEmps);
	}

	@Override
	public int starMark(SqlSession session, int msgNo) {
		return session.update("message.starMark",msgNo);
	}

	@Override
	public int starUnmark(SqlSession session, int msgNo) {
		return session.update("message.starUnmark",msgNo);
	}

	@Override
	public List<String> receiverNames(SqlSession session, List<Integer> empNos) {
		return session.selectList("message.receiverNames",empNos);
	}

	@Override
	public String categoryName(SqlSession session, String cateNo) {
		return session.selectOne("message.categoryName",cateNo);
	}

	@Override
	public int sendMsg(SqlSession session, Map<String, Object> params) {
		return session.insert("message.sendMsg",params);
	}

	@Override
	public int readMsg(SqlSession session, Map<String, Integer> params) {
		return session.update("message.readMsg",params);
	}

	@Override
	public int starChekedBtn(SqlSession session, Map<String, Integer> params) {
		System.out.println(params);
		return session.update("message.starChekedBtn",params);
	}

	@Override
	public int trashChekedBtn(SqlSession session, Map<String, Integer> params) {
		System.out.println(params);
		return session.update("message.trashChekedBtn",params);
	}

	@Override
	public int starUnchekedBtn(SqlSession session, Map<String, Integer> params) {
		return session.update("message.starUnchekedBtn",params);
	}

	@Override
	public int returnMsg(SqlSession session, Map<String, Integer> params) {
		return session.delete("message.returnMsg",params);
	}

	@Override
	public int unstarBtn(SqlSession session, Map<String, Integer> params) {
		return session.update("message.starUnchekedBtn",params);
	}

	@Override
	public int returnTrash(SqlSession session, Map<String, Integer> params) {
		return session.update("message.returnTrash",params);
	}

	@Override
	public int deleteFile(SqlSession session, Map<String, Object> params) {
		return session.update("message.deleteFile",params);
	}

	@Override
	public List<String> receiverIds(SqlSession session, List<Integer> empNos) {
		return session.selectList("message.receiverIds",empNos);
	}

	@Override
	public Map<String, Object> senderInfo(SqlSession session, int senderEmpNo) {
		return session.selectOne("message.senderInfo", senderEmpNo);
	}
	
	
	
	

	
	
	

	
	
	

	
	
	

}
