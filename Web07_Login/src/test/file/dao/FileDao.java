package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	private FileDao() {}
	
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
		}
		return dao;
	}
	//파일 목록을 리턴해주는 메소드
	public List<FileDto> getList(){
		//파일 목록을 담을 ArrayList 객체 생성
		List<FileDto> list = new ArrayList<>();
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "SELECT num, writer, title, orgFileName,"
					+ " saveFileName, fileSize, regdate"
					+ " FROM board_file"
					+ " ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할 값이 있으면 바인딩 하고
			
			//select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기
			while (rs.next()) {
				//select된 파일의 정보를 FileDto 객체에 담고
				FileDto dto = new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setRegdate(rs.getString("regdate"));
				//ArrayList에 누적시킨다.
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
	
	
	//파일 정보를 Db에 저장하는 메소드
	public boolean insert(FileDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			//Connection 객체의 참조값얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql = "INSERT INTO board_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " VALUES(board_file_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize()); //long type
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
	}//insert
	
	
	
	
}//FileDao
