/**
 * 	유효성 검사
 */

// 회원가입
function checkjoin() {

	let form = document.join
	let id = form.userId
	let name = form.userName
	let email = form.email
	let phone = form.userPhone
	let pw = form.userPw
	let pwConfirm = form.pw_confirm; // 비밀번호 확인 필드
	let msg = ''

	// 유저아이디 체크
	// - 영문자로 대소문자와 숫자로 사용가능
	let userIdCheck = /^[a-zA-Z0-9]{2,16}$/
	msg = '아이디는 "2자리" 이상입력해주세요'

	if( !check(userIdCheck, id, msg) ) {
		return false
	}
		
	// 유저이름 체크
	// - 2글자 이상 한글
	let nameCheck = /^[가-힣]{2,12}$/
	msg = '이름은 한글로 "2자리" 이상입력해주세요'

	if( !check(nameCheck, name, msg) ) {
		return false
	}
		
	// 이메일 체크
	// - 영문자로 대소문자와 숫자로 1글자 이상
	let emailCheck = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
	msg = '이메일 형식에 맞게 입력해주세요.'

	if( !check(emailCheck, email, msg) ) {
		return false
	}
		
	// 전화번호 체크
	// - 숫자만 사용 가능한 8~13자리
	let phoneCheck = /^[0-9]{8,13}$/
	msg = '폰번호를 입력해주세요.'

	if( !check(phoneCheck, phone, msg) ){
		return false
	}

    // 비밀번호 체크
	// - 숫자로 6글자 이상
	let pwCheck = /^[a-zA-Z0-9]{6,}$/
	msg = '영문자 대소문자와 숫자로만 6글자 이상의 입력해주세요.'
    
	if( !check(pwCheck, pw, msg) ){
		return false
	}
	
	// 비밀번호 확인 체크
	if (pw.value !== pwConfirm.value) {
	    alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
	    pwConfirm.select();
	    pwConfirm.focus();
	    return false;
	}
    
	return true
}

// 회원정보 수정
function checkUserUpdate() {

	let form = document.userUpdateForm;
	let name = form.userName;
	let pw = form.userPw;
	let pwConfirm = form.pw_confirm; // 비밀번호 확인 필드
	let email = form.userEmail; // 'email'로 수정
	let phone = form.userPhone;
	let msg = ''

	// 유저이름 체크
	// - 2글자 이상 한글
	let nameCheck = /^[가-힣]{2,12}$/
	msg = '이름은 한글로 "2자리" 이상입력해주세요'

	if( !check(nameCheck, name, msg) ) {
		return false
	}

    // 비밀번호 체크
	// - 숫자로 6글자 이상
	let pwCheck = /^[a-zA-Z0-9]{6,}$/
	msg = '영문자 대소문자와 숫자로만 6글자 이상의 입력해주세요.'
    
	if( !check(pwCheck, pw, msg) ){
		return false
	}
	
	// 비밀번호 확인 체크
	if (pw.value !== pwConfirm.value) {
	    alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
	    pwConfirm.select();
	    pwConfirm.focus();
	    return false;
	}
		
	// 이메일 체크
	// - 영문자로 대소문자와 숫자로 1글자 이상
	let emailCheck = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
	msg = '이메일 형식에 맞게 입력해주세요.'

	if( !check(emailCheck, email, msg) ) {
		return false
	}
	
	// 전화번호 체크
	// - 숫자만 사용 가능한 8~13자리
	let phoneCheck = /^[0-9]{8,13}$/
	msg = '폰번호를 입력해주세요.'

	if( !check(phoneCheck, phone, msg) ){
		return false
	}
	return true
}

// 1:1 문의 접수
function checkOtoForm() {
    let form = document.otoForm
    let title = form.title
    let content = form.content
    let msg = ''

    // 제목 체크
    // - 영문자로 대소문자와 한글과 숫자로 사용 가능
    let titleCheck = /^.{2,16}$/
    msg = '제목은 "2자리" 이상입력해주세요'

    if (!check(titleCheck, title, msg)) {
        return false
    }

    // 문의 내용 체크
    let contentCheck = /.{1,}/ // 최소 1글자 이상
    msg = '문의 내용을 입력해주세요'

    if (!check(contentCheck, content, msg)) {
        return false
    }

    return true
}

// 주문 체크
function checkOrder() {
    let form = document.orderForm
    let name = form.name
    let phone = form.phone
    let msg = ''

    // 예약자이름 체크
    // - 한글로 사용 가능
    let nameCheck = /^[가-힣]{2,12}$/
    msg = '예약자는 한글로만 입력해주세요'

    if (!check(nameCheck, name, msg)) {
        return false
    }

    // 문의 내용 체크
    let phoneCheck = /^[0-9]{8,13}$/ // 최소 1글자 이상
    msg = '전화번호를 입력해주세요'

    if (!check(phoneCheck, phone, msg)) {
        return false
    }

    return true
}
	
	
	// 리뷰 작성 체크
function checkRegReview() {
    let form = document.regReview
    let title = form.title
    let content = form.content
    let msg = ''

    // 제목 체크
    let titleCheck = /^.{2,30}$/
    msg = '제목을 입력해주세요'

    if (!check(titleCheck, title, msg)) {
        return false
    }

    // 문의 내용 체크
    let contentCheck = /^.{1,}$/
    msg = '내용을 입력해주세요'

    if (!check(contentCheck, content, msg)) {
        return false
    }

    return true
}

// 코스 생성 체크
function checkCourseAdd() {
	let form = document.courseAdd
	let name = form.courseName
	let cd = form.courseDes
	let price = form.coursePrice
	let popul = form.coursePopul
	let dur = form.courseDur
	let msg = ''

	// 코스이름 체크
	// - 2글자 이상
	let nameCheck = /^.{2,}$/
	msg = '코스 이름을 입력해 주세요.'

	if( !check(nameCheck, name, msg) ) {
		return false
	}

    // 코스설명 체크
	// - 1글자 이상
	let cdCheck = /^.{1,}$/
	msg = '코스 설명을 입력해주세요.'
    
	if( !check(cdCheck, cd, msg) ){
		return false
	}
	
	
	// 코스가격 체크
	// - 숫자와 ,으로 4글자 이상
	let priceCheck = /^[0-9,]{4,6}$/
	msg = '가격을 입력해주세요.'

	if( !check(priceCheck, price, msg) ) {
		return false
	}
	
	// 인기도 체크
	// - 숫자만 사용 가능한 최대3자리
	let populCheck = /^[0-9]{1, 3}$/
	msg = '인기도 순위를 입력해주세요.'

	if( !check(populCheck, popul, msg) ){
		return false
	}
	
	// 코스시간 체크
	// - 숫자만 사용 가능
	let durCheck = /^[0-9]{1, 2}$/
	msg = '코스 시간을 입력해주세요.'

	if( !check(durCheck, dur, msg) ){
		return false
	}

	return true
}

// 코스 업데이트 체크
function checkCourseUpd() {

	let form = document.courseUpd
	let name = form.courseName
	let cd = form.courseDes
	let price = form.coursePrice
	let popul = form.coursePopul
	let dur = form.courseDur
	let msg = ''

	// 코스이름 체크
	// - 2글자 이상
	let nameCheck = /^.{2,}$/
	msg = '코스 이름을 입력해 주세요.'

	if( !check(nameCheck, name, msg) ) {
		return false
	}

    // 코스설명 체크
	// - 1글자 이상
	let cdCheck = /^.{1,}$/
	msg = '코스 설명을 입력해주세요.'
    
	if( !check(cdCheck, cd, msg) ){
		return false
	}
	
	
	// 코스가격 체크
	// - 숫자와 ,으로 4글자 이상
	let priceCheck = /^[0-9,]{4,6}$/
	msg = '가격을 입력해주세요.'

	if( !check(priceCheck, price, msg) ) {
		return false
	}
	
	// 인기도 체크
	// - 숫자만 사용 가능한 3자리
	let populCheck = /^[0-9]{3,}$/
	msg = '인기도 순위를 입력해주세요.'

	if( !check(populCheck, popul, msg) ){
		return false
	}
	
	// 코스시간 체크
	// - 숫자만 사용 가능
	let durCheck = /^[0-9]{1, 2}$/
	msg = '코스 시간을 입력해주세요.'

	if( !check(durCheck, dur, msg) ){
		return false
	}

	return true
}


	// 정규 표현식 유효성 검사 함수
function check(regExp, element, msg) {

		if( regExp.test(element.value) ) {
			return true
		}
		alert(msg)
		element.select()
		element.focus()
		return false
}