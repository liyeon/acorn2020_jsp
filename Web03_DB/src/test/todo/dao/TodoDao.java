package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	//자신의 참조값을 담을 static 메소드
	private static TodoDao dao;
	//외부에서 객체를 생성 할 수 없도록 생성자의 접근지정자를 private로
	private TodoDao() {}
	//자신의 참조값을 리턴해주는 static 메소드
	public static TodoDao getInstance() {
		if (dao == null) {//최초 호출 될 때는
			//객체를 생성해서 static 필드에 참조값을 저장해 놓는다.
			dao = new TodoDao();
			}
		return dao;
	}// getInstance

	
	//인자로 전달되는 번호에 해당하는 할 일을 삭제하는 메소드
	
	public boolean delete(int num) {
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "DELETE FROM TODO"
					   + " WHERE num = ? ";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setInt(1, num);
			//sql문을 수행하고 update or insert or delete 된 row의 개수를 리턴받는다.
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		} //fianlly
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	//인자로 전달되는 할일 1개를 Db에 저장하는 메소드
	
	public boolean insert(String work) {
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "INSERT INTO todo "
					+ " (num, work, regdate)"
					+ " VALUES(todo_seq.NEXTVAL, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			
			//?에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, work);;
			//sql문을 수행하고 update or insert or delete 된 row의 개수를 리턴받는다.
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}//fianlly
		if(flag >0) {return true;}
		else {return false;}
	
	}
	
	
	
	
	
	//할 일 목록을 리턴하는 메소드
	public List<TodoDto> getList() {
		//할 일 목록을 담을 ArrayList 객체 생성
		List<TodoDto> list = new ArrayList<>();
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "SELECT num, work, regdate"
					   + " FROM todo"
					   + " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할 값이 있으면 바인딩 하고
			
			//select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기
			while (rs.next()) {
				//row 하나의 정보를 Dto 객체에 담고
				TodoDto dto = new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setWork(rs.getString("work"));
				dto.setRegdate(rs.getString("regdate"));
				//Dto의 참조값을 ArrayList객체에 누적 시킨다.
				list.add(dto);
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
		return list;
	}// getList

	
}// TodoDao