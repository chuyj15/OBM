<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.in_Layer {
		border: 1px solid #000;
		text-align: center;
	}
	</style>

	<footer class="footer">
		<div id="footer" class="">
			<div class="in_Layer">
				<p class="addr">
					상호 : 우아미<span class="none">|</span> 사업자등록번호 : 121-86-4@811<span
						class="none"> |</span> 통신판매신고번호 : 제 2018-인천부평-@2342호 <br> 인천광역시 부평구 부평대로 스테이션 708호<span class="none"> |</span> Tel : 지점 :
					RESERVATION 지점선택 H.P : 본사 : 010-3471-5924 <span class="none">| </span>
					<span class="ari">EMAIL : 우아미@naver.com</span>
				</p>
				<p class="copy">Copyright © 우아미 All rights reserved.</p>
				<div class="fBtn">
					<button onclick="openPopup()">개인정보보호정책</button>
				</div>
			</div>
		</div>
	</footer>
	<script>
		function openPopup() {
			// 팝업 창을 열 URL
			var popupUrl = "http://localhost:9090/OBM/layout/popup.jsp";
			
			// 팝업 창의 속성 설정
			var popupWidth = 500;
			var popupHeight = 700;
			
			// 팝업 창 열기
			var popup = window.open(popupUrl, "Popup", "width=" + popupWidth + ", height=" + popupHeight);
			
			// 팝업 창이 차단되었을 경우 대체 메시지 출력
			if (popup === null || typeof popup === "undefined") {
			  alert("팝업 차단이 활성화되어 있습니다. 팝업 차단을 해제하고 다시 시도하세요.");
			}
		  }

	</script>
