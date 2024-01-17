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

import com.dna.hiveworks.model.code.PosCode;

/**
 * @author : 이재연
 * @since : 2024. 1. 17.
 * Description : 전자문서에 사용되는 Enum 타입 PosCode에 대한 타입핸들러
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 17., 설명 : 최초작성
 * 
 */
public class PosCodeTypeHandler implements TypeHandler<PosCode>{

	@Override
	public void setParameter(PreparedStatement ps, int i, PosCode parameter, JdbcType jdbcType) throws SQLException {
		ps.setString(i, parameter.name());
	}

	@Override
	public PosCode getResult(ResultSet rs, String columnName) throws SQLException {
		return PosCode.valueOf(rs.getString(columnName));
	}

	@Override
	public PosCode getResult(ResultSet rs, int columnIndex) throws SQLException {
		return PosCode.valueOf(rs.getString(columnIndex));
	}

	@Override
	public PosCode getResult(CallableStatement cs, int columnIndex) throws SQLException {
		return PosCode.valueOf(cs.getString(columnIndex));
	}
	
}
