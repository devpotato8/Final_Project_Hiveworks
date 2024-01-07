
/*<!----------------체크박스 관리-------------------->  */
/**
 * 체크박스는 Header의 ID와 Body의 NAME을 아래의 형식으로 맞춰줘야 정상적으로 동작합니다.
 * Ex) Header's id="chkRowAll", Body's name="chkRow"
 */
// Header에 있는 체크박스 변경시
$(document).on('change', 'input[id="chkRowAll"]:checkbox', function() {
  fncCheckAll($(this).attr('id'));
});

// 모두 체크된 경우 Header 체크박스를 변경
$(document).on('change', 'input:checkbox', function() {
  var chgId = $(this).attr('id') || '';
  var chgNm = $(this).attr('name') || '';

  // 다른 Checkbox에 영향이 가지 않도록 id 와 name 값이 'chk'로 시작하는 Checkbox만 대상으로 함
  if (chgId.indexOf('chk') == -1 && chgNm.indexOf('chk') == -1) return;

  // id 와 name 값이 모두 없는 경우 제외
  if (isNullStr(chgId) && isNullStr(chgNm)) return;

  // Header(ID가 '%All'로 끝나는)에 있는 CheckBox인 경우는 제외
  if (chgId.indexOf('All') > -1) return;

  var totLen = $('input[name=' + chgNm + ']').length;
  var chkLen = $('input[name=' + chgNm + ']:checked').length;

  // 목록에 있는 CheckBox가 모두 체크된 경우 Header도 체크되도록 설정
  if (totLen == chkLen) {
	$('#' + chgNm + 'All').prop('checked', true);
  } else {
    $('#' + chgNm + 'All').prop('checked', false);
  }
});

// 행 어디를 선택해도 맨 앞의 checkbox선택
$(document).on('click','td',function(){
	if (!$(event.target).is('input[type="checkbox"]')) {
        var checkbox = $(this).closest('tr').find('input[type="checkbox"]');
        checkbox.prop('checked', !checkbox.prop('checked'));
    }
});
/*$('td').click(function(event) {
    if (!$(event.target).is('input[type="checkbox"]')) {
        var checkbox = $(this).closest('tr').find('input[type="checkbox"]');
        checkbox.prop('checked', !checkbox.prop('checked'));
    }
});*/

$('input[type="checkbox"]').click(function(event) {
    event.stopPropagation();
});
  	    	

/**
 * 체크박스 전체 체크/해제
 * Ex) Header's id="chkRowAll", Body's name="chkRow"
 * @param {string} id
 */
function fncCheckAll(id) {
	var targetNm = id.replace('All', '');
	if ($('#' + id).is(':checked')) {
		$('input[name=' + targetNm + ']').each(function() {
		  $(this).prop('checked', true);
		});
	} else {
		$('input[name=' + targetNm + ']').each(function() {
		  $(this).prop('checked', false);
		});
	}
}

/**
 * String 값이 비어 있는 값인지 확인
 * @param {string} str
 */
function isNullStr(str) {
	str = $.trim(str);
	if (str == null || str == 'undefined' || str.length == 0 || typeof str == 'undefined' || str == '') {
	  return true;
	} else {
	  return false;
	}
} 