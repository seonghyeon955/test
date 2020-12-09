<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>들어가기전 test창</title>
</head>
<body>

	<p><a href="../goBookDetail.do">상세페이지로 이동</a></p>
	<form action="../goBookDetail.do">
	<table>
		<tr>
			<td><input type="text" name="book_no"></td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="로그인">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>