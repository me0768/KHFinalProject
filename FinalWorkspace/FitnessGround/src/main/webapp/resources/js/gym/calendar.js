$(document).ready(function(){
	var calendar = new controller(); 
	calendar.init();
});
										
	function controller(target) {
		var that = this;   
		var m_oMonth = new Date();
		m_oMonth.setDate(1);

		this.init = function() {
			that.renderCalendar();
			that.initEvent();
		}

	    /* 달력 UI 생성 */
		this.renderCalendar = function() {
			var arrTable = [];

			arrTable.push('<table class="col-lg-12 col-md-12 col-sm-12"><colgroup>');
			for(var i=0; i<7; i++) {
				arrTable.push('<col width="100">');
			}		
			arrTable.push('</colgroup><thead><tr>');

			var arrWeek = "일월화수목금토".split("");

			for(var i=0, len=arrWeek.length; i<len; i++) {
				var sClass = '';
				sClass += i % 7 == 0 ? 'sun' : '';
				sClass += i % 7 == 6 ? 'sat' : '';
				arrTable.push('<td class="'+sClass+'">' + arrWeek[i] + '</td>');
			}
			arrTable.push('</tr></thead>');
			arrTable.push('<tbody>');

			var oStartDt = new Date(m_oMonth.getTime());
			// 1일에서 1일의 요일을 빼면 그 주 첫번째 날이 나온다.
			oStartDt.setDate(oStartDt.getDate() - oStartDt.getDay());

			for(var i=0; i<100; i++) {
				if(i % 7 == 0) {
					arrTable.push('<tr>');
				}

				var sClass = 'date-cell '
			    sClass += m_oMonth.getMonth() != oStartDt.getMonth() ? 'not-this-month ' : '';
				sClass += i % 7 == 0 ? 'sun' : '';
				sClass += i % 7 == 6 ? 'sat' : '';
				
				if( sClass.includes("not-this-month")){
					arrTable.push('<td class="'+sClass+'"><div>' + oStartDt.getDate() + '</div></td>');
				} else {
					arrTable.push('<td class="'+sClass+'" id="' + m_oMonth.getFullYear() + (m_oMonth.getMonth()+1)  + oStartDt.getDate() + '" onclick="dayclick(' + m_oMonth.getFullYear() + ', ' + (m_oMonth.getMonth()+1) + ', ' + oStartDt.getDate() + ');"><div>' + oStartDt.getDate() + '</div></td>');
				}
				oStartDt.setDate(oStartDt.getDate() + 1);

				if(i % 7 == 6) {
					arrTable.push('</tr>');
					if(m_oMonth.getMonth() != oStartDt.getMonth()) {
					break;
					}
				}
			}
			arrTable.push('</tbody></table>');

			$('#calendar').html(arrTable.join(""));

			that.changeMonth();
		}

	    /* Next, Prev 버튼 이벤트 */
		this.initEvent = function() {
			$('#btnPrev').click(that.onPrevCalendar);
			$('#btnNext').click(that.onNextCalendar);
		}

	    /* 이전 달력 */
		this.onPrevCalendar = function() {
			m_oMonth.setMonth(m_oMonth.getMonth() - 1);
			that.renderCalendar();
		}

		/* 다음 달력 */
		this.onNextCalendar = function() {
			m_oMonth.setMonth(m_oMonth.getMonth() + 1);
			that.renderCalendar();
		}

		/* 달력 이동되면 상단에 현재 년 월 다시 표시 */
		this.changeMonth = function() {
			$('#currentDate').text(that.getYearMonth(m_oMonth).substr(0,9));
		}

		/* 날짜 객체를 년 월 문자 형식으로 변환 */
		this.getYearMonth = function(oDate) {
			return oDate.getFullYear() + '년 ' + (oDate.getMonth() + 1) + '월';
		}
	}
	
	function dayclick(year, month, day){
		var dateoutput = '';
		dateoutput += year + "년 " + month + "월 " + day + "일  일정등록";
		dateoutput += "<input type='text' class='form-control' id='scheduletime' placeholder='일정 시간 ex)18:00 ~ 20:00'>"
		dateoutput += "<input type='text' class='form-control' id='scheduletitle' style='margin-top: 10px;' placeholder='일정 이름'>"
		dateoutput += "<div class='col-lg-4 col-lg-offset-8 col-md-4 col-md-offset-8 col-sm-6 col-sm-offset-6 col-xs-12' style='padding: 0px;'>" +
						"<button class='btn btn-danger form-control' style='margin-top: 10px;' onclick='scheduleInsert("+ year + ", " + month + "," + day + ");'>일정 등록</button>" +
						"</div>"
		$("#dateinsert").html(dateoutput);
		$("#datesettings").show().animate({top: '75vh'});
	}
	
	function dateclose(){
		$("#datesettings").animate({top: '100vh'});
	}
	
	function scheduleInsert(year, month, day){
		var scheduletime = $("#scheduletime").val();
		var scheduletitle = $("#scheduletitle").val();
		var schedulein = '';
		schedulein += "<button class='btn btn-danger' style='padding: 0px; font-size: 8pt;'>" + scheduletime + " " + scheduletitle + "</button>";
		schedulein += "<input type='hidden' id='" + year + month + day + "day' value='" + year + "-" +  month + "-" + day + "'>";
		schedulein += "<input type='hidden' id='" + year + month + day + "time' value='" + scheduletime + "'>";
		schedulein += "<input type='hidden' id='" + year + month + day + "title' value='" + scheduletitle + "'>";
		$("#" + year + month + day + "").append(schedulein);
	}