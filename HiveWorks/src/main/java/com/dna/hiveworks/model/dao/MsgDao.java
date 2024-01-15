package com.dna.hiveworks.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.Message;

public interface MsgDao {
	List<Message> msgList(SqlSession session, int empNo);
	int starMark(SqlSession session, int msgNo);
	int starUnmark(SqlSession session, int msgNo);
}
