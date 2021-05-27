<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
function check() {
	if (!form1.id.value){
		alert("아이디를 입력해주세요");
		form1.id.focus();
		return false;
	}
}
</script>
<title>Insert title here</title>
</head>
<body>

   <form action='template.jsp' name="form1" onsubmit="check()">
   <input type="hidden" name="target" value='joinUserView'>
   <table>
      <tr><td colspan="2" align="center"><h2>개인회원검색</h2></td></tr>
      <tr>
         <td id='id'> ID </td>
         <td><input type=text name=id></td>
      </tr>
      <tr>
         <td colspan="2" align="center">
         <input type="submit" value="검색">
         </td>
      </tr>
   </table>
   </form>
</body>
</html>