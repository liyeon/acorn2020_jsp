package test.main;

public class MainClass01 {
	public static void main(String[] args) {
		//검증할 문자열
		String str="abcd1234";
		//검증할 정규표현식 정보를 가지고 있는 문자열
		//얘네는 기본으로 ^$(시작과끝)이 있다고 간주됨
		String reg = "abcd1234";
		//정규표현식에 매칭되는지 여부 "^abcd$"완벽히 일치해야 true가 나온다.
		boolean isMatch=str.matches(reg);
		System.out.println(isMatch);
	}
}//종료
