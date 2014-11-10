<%@ page  contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">

<script>
	function fnEmail() {
		var email = document.join.email.value;
		if (email.indexOf("@") == -1) { //indexOf에 값이있으면 정수형으로 반환. 없으면 -1로 반환.
			alert("올바르게 입력하세요.");
		}
	}
	function fnPwd() {
		var pwd1 = document.getElementById("pwd1").value;
		var pwd2 = document.getElementById("pwd2").value;
		
		if (pwd1.length < 4||pwd1.length < 4) {
			alert("4글자 이상 써주세요.");
			}
	}
	function fnPhone() {
		var pwd = document.join.pwd.value;
		if (pwd<0 && pwd>9) {
			alert("숫자만 입력하세요.");
		}
	}	
	
	function fnIsNull() {
		var name= document.getElementById("name").value;
		var pwd1= document.getElementById("pwd1").value;
		var pwd2= document.getElementById("pwd2").value;
		var email= document.getElementById("email").value;
		var phone= document.getElementById("phone").value;
		
		if(name==""||pwd1==""||pwd2==""||email==""||phone==""){
			alert("값이 비어있습니다.");
		}else if(pwd1==""||pwd2==""){
			alert("비밀번호를 입력해주세요.");
			document.getElementById("email").focus();
		}else if(pwd1!=pwd2){
			alert("비밀번호가 다릅니다. 확인해주세요");
		}else{
			document.join.submit();
		}
	}
	
	<% 	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");%>
	
</script>

</head>
<body>
<form name="join" action="join_Proc.jsp" method="post">
	<div align="center" style="border:1px solid; width: 400px;">

	<div class="form-title" >회원가입</div>

	        <div id="menu">
			<div style="width:100px; float:left;" >E-mail:</div>
			<input type="text" readonly="readonly" name="email" id="email" value="<%=email %>"/>
			<!--  <div><a href="join_Success.jsp"></a></div>-->
			</div>

			<div id="1menu">
				<div style="width:100px; float:left;">비밀번호:</div>
				<div><input type="password" id="pwd1" name="pwd1" onblur="fnPwd()" /></div>
			</div>
			
			<div id="menu">
				<div style="width:100px; float:left;">비밀번호 확인:</div>
				<div><input type="password" id="pwd2" name="pwd2" onblur="fnPwd()" /></div>
			</div>

			<div id="menu">
				<div style="width:100px; float:left;">이름:</div>
				<div><input type="text" id="name" name="name" onblur="fnName()" /></div>
			</div>

			<div id="menu">
				<div style="width:100px; float:left;">전화번호:</div>
				<div><input type="text" id="phone" name="phone" onblur="fnPhone()" /></div>
			</div>

			<div>
				<div style="width:200px; float:left;">
				<input type="button" value="가입" onclick="fnIsNull()" />
				<input type="submit" value="가입1"  />
				</div>
				<div><input type="reset" value="취소" /></div>
				</div>
  		</div>
	
	</form>


</body>
</html>