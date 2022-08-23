<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>이미지 게시판</title>

<!--  css외부스크립트 불러오기   -->
<link rel="stylesheet" href="<%=cp %>/imageTest/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=cp %>/imageTest/css/list.css" type="text/css" />

</head>
<body>

<br/><br/>

<table width="600" align="center" style="font-family: 돋움; font-size: 10pt;" cellspacing="2" cellpadding="1" >
<tr id="bbsList">
	<td id="bbsList_title" colspan="3">
	이미지 게시판
	</td>
	<c:if test="${!empty sessionScope.MemberDTO.userId}">
	<td style="border: none; text-align: right;">${sessionScope.MemberDTO.userId}님 반갑습니다.</td>
	</c:if>
</tr>

</table>
<center>
<table style="margin: auto;">
<tr>
	<td align="left" colspan="2" width="400">
	Total ${totalDataCount } articles, ${totalPage } pages / Now Page is ${currentPage }
	</td>
	<td align="right" colspan="1" width="200">
	<input type="button" value="게시물등록" onclick="javascript:location.href='<%=cp%>/img/write.action';"/>
	<c:if test="${!empty sessionScope.MemberDTO.userId}">
	<input type="button" value="로그아웃" onclick="javascript:location.href='<%=cp%>/img/logout.action';"/>
	</c:if>
	<c:if test="${empty sessionScope.MemberDTO.userId}">
	<input type="button" value="로그인" onclick="javascript:location.href='<%=cp%>/img/login.action';"/>
	</c:if>
	</td>
</tr>
<tr><td style="border-bottom:2px solid #DBDBDB;" colspan="3"></td></tr>

<% 
	
	int cnt = 0;
%>
	<c:forEach var="dto" items="${lists }">
<% 
	if(cnt==0){
		out.print("<tr>");
	}
	cnt++;
%>
	<td>
		<img alt="" src="${imagePath }/${dto.saveFileName }" width="180" height="180"/><br/>
		${dto.listNum}번 제목 : ${dto.subject } id : ${dto.userId } 
		<a href="<%=cp%>/img/delete.action?num=${dto.num}&userId=${sessionScope.MemberDTO.userId}">삭제</a>


	
<% 
	if(cnt==3){	
		out.print("</tr>");
		cnt = 0;
	}
%>
	</c:forEach>


<tr><td style="border-bottom:2px solid #DBDBDB;" colspan="3"></td></tr>	

<tr>
	<td align="center" colspan="3">
	<!--  데이터가 있으면 -->
	
	<c:if test="${totalDataCount!=0 }">
		${pageIndexList }
	</c:if>
	
	<!-- 데이터가 없으면 -->
	
	<c:if test="${totalDataCount==0 }">
		등록된 파일이 없습니다
	</c:if>
	</td>
</tr>
<tr>
	<td colspan="3" align="center"><font color="red">${message }</font></td>
</tr>


</table>
</center>
</body>
</html>