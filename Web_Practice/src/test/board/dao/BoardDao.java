package test.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.board.dto.BoardDto;
import test.util.DBcpBean;

public class BoardDao {
	private static BoardDao dao;
	private BoardDao() {}
	public static BoardDao getInstance() {
		if(dao==null) {
			dao=new BoardDao();
		}
		return dao;
	}
	
	public List<BoardDto> getList(){
		List<BoardDto> list = new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=new DBcpBean().getConn();
			String sql = "SELECT num, title, name, regdate"
					+ " FROM board_list"
					+ " order by num asc";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setRegdate("regdate");
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e) {}
		}
		return list;
	}//getList
	
	
	
	
}
