package test.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBcpBean {
	//필드
	private Connection conn;
	
	//생성자
	public DBcpBean () {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			Connection conn = ds.getConnection();
			System.out.println("Connection 얻어오기 성공");
			//etc.
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
