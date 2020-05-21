function loginFormCheck(obj) { //비밀번호 검사		
		var id_len = obj.client_id.value.length;
		var password_len = obj.client_password.value.length;
		if(id_len==0||password_len==0){
			
			if(id_len==0){
				if(password_len!=0){
					alert("아이디를 입력해주세요.");
					return false;
				}
				else{
					alert("아이디, 비번을 입력해주세요.");
					return false;
				}
			}else if(password_len==0){
				if(id_len!=0){
					alert("비밀번호를 입력해주세요.");
					return false;
				}

			}
		}
		
		return true;
	}