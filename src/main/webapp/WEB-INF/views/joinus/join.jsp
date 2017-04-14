<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="../member-reg" method="post">
		<table border="1">
			<tr>
				<th><label>아이디</label></th>
				<td><input name="id" type="text" /></td>
			</tr>
			<tr>
				<th><label>비밀번호</label></th>
				<td><input name="pwd" type="text" /></td>
			</tr>
			<tr>
				<th><label>비밀번호 확인</label></th>
				<td><input name="pwd-test" type="password" /></td>
			</tr>
			<tr>
				<th><label>이름</label></th>
				<td><input name="name" type="text" /></td>
			</tr>
			<tr>
				<th><label>취미</label></th>
				<td><input name="hobbies" type="checkbox" value="게임" /><label>게임</label>
					<input name="hobbies" type="checkbox" value="잠" /><label>잠</label>
					<input name="hobbies" type="checkbox" value="코딩" /><label>코딩</label></td>
			</tr>
			<tr>
				<td colspan="2"><label>취미</label> <select name="hobby">
						<option value="game">게임</option>
						<option value="coding">코딩</option>
						<option value="sleep">잠</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인" /></td>
			</tr>
		</table>
	</form>
</body>
</html>