var gfv_count = 1;
	$(document).ready(function(){
		$("#addFile").on("click", function(e){ //파일 추가 버튼
			e.preventDefault();
			fn_addFile();
		});
		$("a[name='delete']").on("click", function(e){ //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
		$("#addFileSm").on("click", function(e){
			e.preventDefault();
			fn_addFileSm();
		});
});
function fn_addFile(){
	var str = "<tr><th></th><td><input type='file' class='form-control' id='file' name='file_"+(gfv_count++)+"' style='width:100%'></td>"
			+ "<td align='right'><a class='btn btn-danger' href='#this' style='text-decoration:none;' id='delete' name='delete'>삭제</a></td></tr>";
	$("#fileDiv").append(str);
	$("a[name='delete']").on("click", function(e){ //삭제 버튼
		e.preventDefault();
		fn_deleteFile($(this));
	});
}
function fn_addFileSm(){
	var str = "<tr><td><input type='file' class='form-control' id='file' name='file_"+(gfv_count++)+"' style='width:100%'></td>"
			+ "<td align='right'><a class='btn btn-danger' href='#this' style='text-decoration:none;' id='delete' name='delete'>삭제</a></td></tr>";
	$("#fileDivSm").append(str);
	$("a[name='delete']").on("click", function(e){ //삭제 버튼
		e.preventDefault();
		fn_deleteFile($(this));
	});
	}
function fn_deleteFile(obj){
	obj.parent().parent().remove();
}

function gymQnAInsert() {
	$("#gymQnAForm").submit();
}

function gymQnAUpdate() {
	$("#gymQnAForm").attr("action", "gymQnAUpdate.do").submit();
}
function gymQnAAnswer() {
	$("#gymQnAForm").attr("action", "gymQnAAnswer.do").submit();
}

function ckWordLen(obj, maxByte) {
	$('#textCount').css('color','black');
	var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";
    for (var i = 0; i<strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) { // 한글일 경우 판단
            totalByte += 2;
        } else {
            totalByte++;
        }
        $('#textCount').text(totalByte+'/1500');
        // 입력 가능한 최대 글자수까지의 인덱스
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }
    // 초과되는 글자 자르기
    if (totalByte > maxByte) {
    	$('#textCount').css('color','red');
    	$('#textCount').html(totalByte+'/1500<br>최대 1500자까지 입력 가능합니다.');
        str2 = strValue.substr(0, len);
        obj.value = str2;
//        ckWordLen(obj, 1502);
    }
}