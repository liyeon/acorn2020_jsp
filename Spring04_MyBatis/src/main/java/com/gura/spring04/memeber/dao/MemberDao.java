package com.gura.spring04.memeber.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring04.member.dto.MemberDto;

//Component scan을 했을 때 bean이 되도록 어노테이션을 붙인다.
//dao에는 @repository 라는 어노테이션을 붙인다.
@Repository
public class MemberDao { //서버가 시작하는 시점에 bean된다.
	//Spring이 관리하고 있는 객체를 주입(Di)받으려면 @Autowired 어노테이션을 붙인다.
	//Spring이 관리하고 있는 객체 중에 SqlSession type이 존재하면 자동 주입된다.
	@Autowired
	private SqlSession session; 
	
	//회원 한 명의 정보를 저장하는 메소드
	public void insert(MemberDto dto) {
		session.insert("mamber.insert", dto);
		//insert한 정보를 dto로 전달해준다.
	}
	
	//회원 한명의 정보를 삭제하는 메소드
	public void delete(int num) {
		session.delete("member.delete", num);
		// ("mapper namespace.sql id", parameter type(int));
	}
	
	//회원 한명의 정보를 리턴하는 메소드
	public MemberDto getData(int num) {
		MemberDto dto = session.selectOne("member.getData", num);
		//result type 결과를 MemberDto 타입으로 받아와야하기 때문에 result type
		/*
		 * 리턴해주는 타입은 그떄그때 다르다(동적 타입)
		 * TYPE ?
		 * MEMBERDTO
		 * CAFEDTO
		 * INT
		 * STRING 등등
		 */
		return dto;
	}
	//dao를 인터페이스로 만들고 dao를 implements 클래스로 만들어서 사용할것임
}
