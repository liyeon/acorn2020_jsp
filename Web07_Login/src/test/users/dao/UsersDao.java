package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	private UsersDao() {}
	public static UsersDao getInstance() {
		if(dao==null) {dao = new UsersDao();}return dao;
	}//getInstance()
	
	//인자로 전달된 아이디가 users 테이블에 존재하는지 여부를 리턴하는 메소드
	public boolean isExist(String inputId) {
		boolean isExist = false;
		Connection conn = null;
		PreparedStatement pstmt = null; //인터페이스
		ResultSet rs = null;
		try {
		    conn = new DbcpBean().getConn();
		    String sql ="SELECT id"
		               +" FROM users"
		               +" where id=?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, inputId);
		    rs = pstmt.executeQuery();
		    //select 된 row가 있는지 확인한다.
		    if(rs.next()) {
		    	isExist=true;//헤당 아이디가 이미 존재하는 경우
		    }//if 종료
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		return isExist;//아이디 존재 여부를 리턴한다
	}
	
	
	//회원 정보(이메일)을 수정 반영하는 메소드
	public boolean update(UsersDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "UPDATE users"
					+ " SET email=?, profile=?"
					+ " WHERE id =?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getProfile());
			pstmt.setString(3, dto.getId());
			//sql문을 수행하고 update or insert or delete 된 row의 개수를 리턴받는다.
			flag = pstmt.executeUpdate();
			//수정이 되었으면1 true, 안됐으면0 false
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		} //fianlly
		if (flag > 0) {return true;
		} else {return false;}
				
	}
	
	//비밀번호를 수정 반영하는 메소드
	public boolean updatePwd(UsersDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "UPDATE users"
					+ " SET pwd=?"
					+ " WHERE id =? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getNewPwd());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd()); //old pwd
			//sql문을 수행하고 update or insert or delete 된 row의 개수를 리턴받는다.
			flag = pstmt.executeUpdate();
			//수정이 되었으면1 true, 안됐으면0 false

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		} //fianlly
		if (flag > 0) {return true;
		} else {return false;}
		
	}//update();
	
	public boolean delete(String id) {
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "DELETE FROM users"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, id);
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
		if (flag > 0) {return true;
		} else {return false;}
		
	}//delete();
	
	
	
	public UsersDto getData(String id) {
		//회원 한명의 정보를 담을 BoardDto
		UsersDto dto = null;
        
        Connection conn = null;
        PreparedStatement pstmt = null; //인터페이스
        ResultSet rs = null;
        try {
            conn = new DbcpBean().getConn();
            String sql ="SELECT id, email, profile, regdate"
                       +" FROM users"
                       +" where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
            	dto=new UsersDto();
				dto.setId(rs.getString("id"));
				dto.setProfile(rs.getString("profile"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getString("regdate"));
            }//while종료
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
	}// getData
	
	
	//usersDto 객체에 있는 id, pwd가 유효한 정보인지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto) {
		//유효한 정보인지 여부를 담을 지역변수를 만들고 초기값 false부여하기
		boolean isValid = false;
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "SELECT id"
					+ " FROM users"
					+ " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과값 추출하기
			while(rs.next()){
				//select된 결과가 있으면 유효한 정보이므로 isValid에 true를 넣어준다.
				isValid = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs !=null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		} //fianlly
		//아이디 비밀번호가 유효한 정보인지 여부를 리턴해준다.
		return isValid;
	}//isValid
	
	
	
	
	
	//회원정보를 저장하는 메소드(profile 칼럼은 제외)
	public boolean insert(UsersDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "INSERT INTO users"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
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
		if (flag > 0) {return true;
		} else {return false;}
	}//insert()
	
	
}//UsersDao
