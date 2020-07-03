package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	private static MemberDao dao;
	private MemberDao() {}
		//자신의 참조값을 리턴해주는 static 메소드
	public static MemberDao getInstance() {
		if(dao==null) {
			dao=new MemberDao();
		}
		return dao;
	}
	
	//회원 한명의 정보를 리턴해주는 메소드
	
	public MemberDto getData(int num) {
		MemberDto dto = null;
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "SELECT name, addr"
					+ " FROM member"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할 값이 있으면 바인딩 하고
			pstmt.setInt(1, num);
			//select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			//만일 select 된 결과가 있다면
			if (rs.next()) {
				//MemberDto 객체를 생성하고
				dto=new MemberDto();
				//select된 결과를 MemberDto 객체에 담는다.
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		return dto;
	
	}
	
	
	//회원 한명의 정보를 수정 반영하는 메소드
	public boolean update(MemberDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "UPDATE member"
					+ " set name = ? , "
					+ " addr = ? "
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			
			//?에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			//sql문을 수행하고 update or insert or delete 된 row의 개수를 리턴받는다.
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		} //fianlly
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	//회원 정보를 삭제하는 메소드
	
	public boolean delete(int num) {
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "DELETE FROM MEMBER"
					+ " WHERE NUM = ?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setInt(1, num);
			//sql문을 수행하고 update or insert or delete 된 row의 개수를 리턴받는다.
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		} //fianlly
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	
	//새로운 회원 정보를 저장하는 메소드
	public boolean insert(MemberDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "INSERT INTO member"
					+ " (num, name, addr)"
					+ " VALUES(member_seq.NEXTVAL, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			//?에 바인딩 할 값이 있으면 바인딩한다.

			//sql문을 수행하고 update or insert or delete 된 row의 개수를 리턴받는다.
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		} //fianlly
		if (flag > 0) {return true;}
		else {return false;}
	}
	
	
	//회원목록을 리턴해주는 메소드
	public List<MemberDto> getList(){
		List<MemberDto> list = new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=new DbcpBean().getConn();
			String sql = "SELECT num, name, addr"
					+ " FROM member"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				list.add(dto);
			}
		} catch (Exception e) {
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
	
	
	
	
	
}//MemberDao
