package com.dna.hiveworks.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Message;

public interface MsgDao {
	List<Message> msgList(SqlSession session, int empNo);
	List<Message> sendMsgList(SqlSession session, int empNo);
	List<Message> starMsgList(SqlSession session, int empNo);
	List<Message> trashMsgList(SqlSession session, int empNo);
	List<Message> msgFileList(SqlSession session, int empNo);
	
	
	List<String> sharedEmp(SqlSession session, Map<String,String> msgSharedEmps);
	int starMark(SqlSession session, int msgNo);
	int starUnmark(SqlSession session, int msgNo);
	List<String> receiverNames(SqlSession session, List<Integer> empNos);
	String categoryName(SqlSession session, String cateNo);
	int sendMsg(SqlSession session, Map<String,Object> params);
	int readMsg(SqlSession session, Map<String,Integer> params);
	int starChekedBtn(SqlSession session, Map<String,Integer> params);
	int trashChekedBtn(SqlSession session, Map<String,Integer> params);
	int starUnchekedBtn(SqlSession session, Map<String,Integer> params);
	int returnMsg(SqlSession session, Map<String,Integer> params);
	int unstarBtn(SqlSession session, Map<String,Integer> params);
	int returnTrash(SqlSession session, Map<String,Integer> params);
	int deleteFile(SqlSession session, Map<String,Object> params);
	
	List<String>receiverIds(SqlSession session, List<Integer> empNos);
	Map<String, Object> senderInfo(SqlSession session,int senderEmpNo);
}
