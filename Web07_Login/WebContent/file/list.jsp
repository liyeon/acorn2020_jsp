<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file/list.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
<style>
.page-display a {
	text-decoration : none;
	border-radius : 5px;
	background : orange;
	color : #fff;
	padding : 10px 15px;
	font-weight : bold;
}
.page-display {width : 100%;text-align : center;}
.page-display ul{display : inline-block;}
	.page-display ul li {
		float : left;
		list-style-type : none; 
		margin-left : 10px;
	}
	.page-display ul li.active{
		text-decoration: underline;
		
	}
	.page-display ul li.active a {
		color : red;
		background : pink;
	}
</style>
</head>
<body>
<%
  //로그인 된 아이디 읽어오기 (로그인을 하지 않으면 null 이다)
  	String id=(String)session.getAttribute("id");
  	
  	//한 페이지에 나타낼 row 의 갯수
  	final int PAGE_ROW_COUNT=5;
  	//하단 디스플레이 페이지 갯수
  	final int PAGE_DISPLAY_COUNT=3;
  	
  	//보여줄 페이지의 번호
  	int pageNum=1;
  	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
  	String strPageNum=request.getParameter("pageNum");
  	if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
  		//페이지 번호를 설정한다.
  		pageNum=Integer.parseInt(strPageNum);
  	}
  	//보여줄 페이지 데이터의 시작 ResultSet row 번호 (등차수열 an = a1 + (n-1)d ) ///공차수열
  	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
  	//보여줄 페이지 데이터의 끝 ResultSet row 번호
  	int endRowNum=pageNum*PAGE_ROW_COUNT;
  	
  	/*
		검색 키워드에 돤련된 처리
	*/
	String keyword=request.getParameter("keyword");
  	if(keyword==null){
  		//전달된 키워드가 없다면
  		keyword="";//빈문자열을 ㅇ넣어준다.
  	}
	//인코딩된 키워드를 미리 만들어 둔다. 
	String encodedK=URLEncoder.encode(keyword);
	String condition=request.getParameter("condition");
	//검색 키워드와 startRowNum, endRowNum 을 담을 FileDto 객체 생성
	FileDto dto=new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//select 된 결과를 담을 List
	List<FileDto> list=null;
	//전체 row 의 갯수를 담을 변수 
	int totalRow=0;
	if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
		if(condition.equals("title_filename")){
			//검색 키워드를 FileDto 객체의 필드에 담는다. 
			dto.setTitle(keyword);
			dto.setOrgFileName(keyword);
			//검색 키워드에 맞는 파일 목록 중에서 pageNum 에 해당하는 목록 얻어오기
			list=FileDao.getInstance().getListTF(dto);
			//검색 키워드에 맞는 전체 글의 갯수를 얻어온다. 
			totalRow=FileDao.getInstance().getCountTF(dto);
		}else if(condition.equals("title")){
			dto.setTitle(keyword);
			list=FileDao.getInstance().getListT(dto);
			totalRow=FileDao.getInstance().getCountT(dto);
		}else if(condition.equals("writer")){
			dto.setWriter(keyword);
			list=FileDao.getInstance().getListW(dto);
			totalRow=FileDao.getInstance().getCountW(dto);
		}
	}else{//검색 키워드가 없으면 전체 목록을 얻어온다.
		condition="";
		keyword="";
		list=FileDao.getInstance().getList(dto);
		totalRow=FileDao.getInstance().getCount();
	}	
	//전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//시작 페이지 번호
	int startPageNum=
		1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//끝 페이지 번호가 잘못된 값이라면 
	if(totalPageCount < endPageNum){
		endPageNum=totalPageCount; //보정해준다. 
	}
%>
<div class="container mt-4">
<h1>파일 목록입니다.</h1>
	<a href="private/upload_form.jsp" class="btn btn-dark mt-4">파일 업로드</a>
	<table class="table mt-4">
		<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>파일크기</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(FileDto tmp:list){%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %></td>
				<td><a href="download.jsp?num=<%=tmp.getNum() %>"><%=tmp.getOrgFileName() %></a></td>
				<td><%=tmp.getFileSize() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td>
					<%if(tmp.getWriter().equals(id)){ %>
						<a href="private/delete.jsp?num=<%=tmp.getNum() %>">삭제</a>
					<%} %>
				</td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<div class="page-display">
		<ul>
		<%if(startPageNum != 1){ %>
			<li><a href="list.jsp?pageNum=<%=startPageNum-1 %>&condition=<%=condition %>&keyword=<%=encodedK %>">Prev</a></li>
		<%} %>
		<%for(int i=startPageNum; i<=endPageNum; i++){ %>
			<%if(i==pageNum){ %>
				<li class="active"><a href="list.jsp?pageNum=<%=i %>&condition=<%=condition %>&keyword=<%=encodedK %>"><%=i %></a></li>
			<%}else{%>
				<li><a href="list.jsp?pageNum=<%=i %>&condition=<%=condition %>&keyword=<%=encodedK %>"><%=i %></a></li>
			<%} %>
		<%} %>	
		<%if(endPageNum < totalPageCount){ %>
			<li><a href="list.jsp?pageNum=<%=endPageNum+1 %>&condition=<%=condition %>&keyword=<%=encodedK %>">Next</a></li>
		<%} %>
		</ul>
	</div>
	
	
	<form action="list.jsp" method="get" class="mb-4"><!-- 전송하기 위한 목적이라 get -->
	<div class="input-group">
		<div class="input-group-prepend">
    		<label class="input-group-text" for="condition">검색조건</label>
			<select name="condition" id="condition" class="custom-select">
				<option value="title_filename" <%if(condition.equals("title_filename")){%>selected<%} %> >제목+파일명</option>
				<option value="title" <%if(condition.equals("title")){%>selected<%} %> >제목</option>
				<option value="writer" <%if(condition.equals("writer")){%>selected<%} %> >작성자</option>
			</select>
		</div>
		<input value="<%=keyword %>" type="text" name="keyword" placeholder="검색어를 입력해주세요!" class="form-control" />
		 	<div class="input-group-append">
				<button type="submit" class="btn btn-outline-secondary">검색</button>
			</div>
		</div>
	</form>
	
	
</div>
</body>
</html>