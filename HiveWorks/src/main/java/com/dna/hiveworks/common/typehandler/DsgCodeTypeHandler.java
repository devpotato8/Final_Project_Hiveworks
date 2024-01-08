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

import com.dna.hiveworks.model.code.DsgCode;

/**
 * @author : 이재연
 * @since : 2024. 1. 3.
 * Description : 전자문서에 사용되는 Enum 타입 DsgCode에 대한 타입핸들러
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 8., 설명 : 최초작성
 * 
 */
public class DsgCodeTypeHandler implements TypeHandler<DsgCode> {

	@Override
	public void setParameter(PreparedStatement ps, int i, DsgCode parameter, JdbcType jdbcType) throws SQLException {
		ps.setString(i, parameter.name());
	}

	@Override
	public DsgCode getResult(ResultSet rs, String columnName) throws SQLException {
		return DsgCode.valueOf(rs.getString(columnName));
	}

	@Override
	public DsgCode getResult(ResultSet rs, int columnIndex) throws SQLException {
		return DsgCode.valueOf(rs.getString(columnIndex));
	}

	@Override
	public DsgCode getResult(CallableStatement cs, int columnIndex) throws SQLException {
		return DsgCode.valueOf(cs.getString(columnIndex));
	}
	
}
