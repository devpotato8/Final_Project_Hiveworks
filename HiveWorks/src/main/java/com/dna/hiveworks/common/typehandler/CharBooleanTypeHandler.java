/**
 * 
 */
package com.dna.hiveworks.common.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 'Y','N' 을 boolean 으로 변환하는 TypeHandler
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
public class CharBooleanTypeHandler implements  TypeHandler<Boolean>{

	@Override
	public void setParameter(PreparedStatement ps, int i, Boolean parameter, JdbcType jdbcType) throws SQLException {
		if(parameter) {
			ps.setString(i, "Y");
		}else {
			ps.setString(i, "N");
		}
	}

	@Override
	public Boolean getResult(ResultSet rs, String columnName) throws SQLException {
		boolean result = rs.getString(columnName).toUpperCase().equals("Y")?true:false;
		return result;
	}

	@Override
	public Boolean getResult(ResultSet rs, int columnIndex) throws SQLException {
		boolean result = rs.getString(columnIndex).toUpperCase().equals("Y")?true:false;
		return result;
	}

	@Override
	public Boolean getResult(CallableStatement cs, int columnIndex) throws SQLException {
		boolean result = cs.getString(columnIndex).toUpperCase().equals("Y")?true:false;
		return result;
	}
	
}
