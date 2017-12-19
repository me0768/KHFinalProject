// 캡스락 체크	
	$(document).ready(
	    function () {
	        check_capslock_form($('#formid')); //applies the capslock check to all input tags
	    }
	 );

	document.onkeydown = function (e) { //check if capslock key was pressed in the whole window
	    e = e || event;
	    if (typeof (window.lastpress) === 'undefined') { window.lastpress = e.timeStamp; }
	    if (typeof (window.capsLockEnabled) !== 'undefined') {
	        if (e.keyCode == 20 && e.timeStamp > window.lastpress + 50) {
	            window.capsLockEnabled = !window.capsLockEnabled;
	            $('#capslockdiv').toggle();
	        }
	        window.lastpress = e.timeStamp;
	        //sometimes this function is called twice when pressing capslock once, so I use the timeStamp to fix the problem
	    }

	};

	function check_capslock(e) { //check what key was pressed in the form
	    var s = String.fromCharCode(e.keyCode);
	    if (s.toUpperCase() === s && s.toLowerCase() !== s && !e.shiftKey) {
	        window.capsLockEnabled = true;
	        $('#capslockdiv').show();
	    }
	    else {
	        window.capsLockEnabled = false;
	        $('#capslockdiv').hide();
	    }
	}

	function check_capslock_form(where) {
	    if (!where) { where = $(document); }
	    where.find('input,select').each(function () {
	        if (this.type != "hidden") {
	            $(this).keypress(check_capslock);
	        }
	    });
	}
	
// 캡스락 체크	
	
	// 로그인 모달창 열림
	function login() {
		$("#login").show();
		$("#register").hide();
		$("#detectidpwd").hide();
		$("#email").val('');
		$("#pwd").val('');
		$("#findidname").val('');
		$("#findidphone").val('');
		$("#login").modal();
	}

	// 이메일과 비번이 비었으면 로그인버튼 비활성화
	function emptycheck(){
		var email = $("#email").val();
		var pwd = $("#pwd").val();
		if(email == "" || pwd == ""){
			$("#loginbtn").prop("disabled",true);
		} else {
			$("#loginbtn").prop("disabled",false);
		}
	}
	
	// 로그인 체크 ajax
	function logincheck(){
		var email = $("#email").val();
		var pwd = $("#pwd").val();
		var queryString = { "email": email, "pwd": pwd };
		$.ajax({
			url : "login.do",
			dataType : "json",
			type : "get",
			data : queryString,
			success : function(responseData){
				var data = responseData.user;
				if(data == null){
					alert("아이디와 비밀번호를 확인해주세요.");
					return false;
				} else if ( data.user_state == 1){
					alert("비활성화된 계정입니다. \n로그인이 불가능 합니다.");
					return false;
				}
				$("#login").modal("hide");
				if( responseData.user.user_level == 2){
					location.href = "adminMain.do";
				} else {
					location.reload();
				}
				if( responseData.user.tmppwd_tf == 1 ) {
					alert("임시비밀번호로 로그인하였습니다.\n비밀번호를 변경해주세요!");
					location.href = "userpwd.do";
				}
				/* 수정 - 비밀번호 변경 나오면 여기에 tmppwd_tf여부 확인하고 변경 페이지로 */
			},
			error : function(jqXHR, textStatus, errorThrown) {
		        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		    }
		});
	}
	
	// 엔터키로 로그인
	$("#pwd").on("keypress", function (event) {
		if (event.keyCode == 13) {
			logincheck();
		}
	});
	$("#email").on("keypress", function (event) {
		if (event.keyCode == 13) {
			logincheck();
		}
	});
	
	// Caps Lock 키 확인
	function fnKeyPress(e){
		var keyCode = 0;
		var shiftKey = false;
		keyCode = e.keyCode;
		shiftKey = e.shiftKey;
		if ((keyCode >= 65 && keyCode <= 90) && !shiftKey)
			$('[data-toggle="tooltip"]').tooltip("show");
		else
			$('[data-toggle="tooltip"]').tooltip("hide");
	}
	function fnKeyDown(e){
	var keyCode  = 0;
		keyCode = e.keyCode;
		if (keyCode == 20)
			$('[data-toggle="tooltip"]').tooltip("hide");
	}