<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.file-label {
	  margin-top: 80px;
	  background-color: #F1F4F8;
	  color: #4E657E;
	  text-align: center;
	  padding: 100px 250px;
	  width: 100%;
	  border-radius: 6px;
	  cursor: pointer;
	}
	.file {
	  display: none;
	}
	#tag-list {
		padding-left: 0;
		margin: 10px 0 50px 0;
	}
	.tag-item {
		width: auto;
		height: auto;
		background:#F1F4F8;
	  	color: #869AAF;
	  	border-radius: 20px;
	  	padding: 5px 10px;
	  	display: inline-block;
	  	font-size: 0.9em; 
	  	margin-right: 5px; 
	}
	.form-group {
		margin:0;
		height: auto;
	}
	#tag {
		margin-bottom: 0 !important;
	}
</style>
<main>
	<div id="missionUp">
		<img src="<%= request.getContextPath()%>/img/__ (1).png"/><a href="javascript:window.history.back();"> 이전으로 돌아가기</a>
		<span>
			<button>임시저장</button>		
		</span>
	</div>
	
	<form id="main" method="post" action="/ozz/Mission/MissionwriteOk" enctype="multipart/form-data">
		<div class="fileUpload">
		
		<label class="file-label" for="chooseFile">파일 선택</label>
		<input class="file" name="pdf" id="chooseFile" type="file">
		</div>
		<li class="title">미션 설명</li>
		<li><input type="text" name="title" id="title" placeholder="미션에 대한 설명을 적어주세요."></li>
		<li class="title">미션 제목</li>
		<li><input type="text" placeholder="제목을 입력해주세요." name="mission_title" id="mission_title"></li>
		<li class="title" style="margin-bottom:0;">소요 시간</li>
			<li>
				<input type="text" placeholder="00시간 00분" class="totalTime" name="">
			</li>
		<li class="title">미션 태그</li>
            <div class="form-group">
            	<input type="hidden" value=""  name="mission_tag" id="mission_tag"/>
            	<input type="text"   id="tag" size="7" placeholder="엔터로 해시태그를 등록해주세요." style="width: 180px;"/>
           </div>
             <ul id="tag-list"></ul>           
		<li class="title">미션 스킬</li>
		<li><input type="text" placeholder="스킬을 입력해주세요. ex) 데이터분석, 커뮤니케이션 등" name="mission_skill" id="mission_skill" ></li>
		<li class="title">미션 재료</li>
		<li><input type="text" placeholder="데이터를 입력해주세요. ex) html, css, csv 등" name="mission_data" id="mission_data" style="margin-bottom:0 !important" ></li>
		<li><input type="text" placeholder="툴을 입력해주세요. ex) excel, word 등" name="mission_tool" id="mission_tool" style="margin-top:5px !important"></li>	
		<li class="title">미션 소개</li>
		<textarea cols="94" rows="5" name="mission_content" id="mission_content" style="resize:none;" name="mission_content" id="mission_content"></textarea>
		<li class="title">카테고리</li>
		<div id="cate2">
				<div>
					<li style="font-size:1.0em; margin-bottom:5px; color:#6e6e6e;">개발·프로그래밍</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="웹 개발">웹 개발</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="프론트엔드">프론트엔드</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="백엔드">백엔드</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="풀스택">풀스택</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="데이터베이스">데이터베이스</li>
				</div>
				<div>
					<li style="font-size:1.0em; margin-bottom:5px; color:#6e6e6e;">보안·네트워크</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="보안">보안</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="네트워크">네트워크</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="시스템">시스템</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="클라우드">클라우드</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="블록체인">블록체인</li>
				</div>
				<div>
					<li style="font-size:1.0em; margin-bottom:5px; color:#6e6e6e;">데이터 사이언스</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="데이터 분석">데이터 분석</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="인공지능">인공지능</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="데이터 시각화">데이터 시각화</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="데이터 수집·처리">데이터 수집·처리</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="자격증">자격증</li>
				</div>
				<div>
					<li style="font-size:1.0em; margin-bottom:5px; color:#6e6e6e;">하드웨어</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="컴퓨터 구조">컴퓨터 구조</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="반도체">반도체</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="로봇공학">로봇공학</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="모빌리티">모빌리티</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="자격증">자격증</li>
				</div>
				<div>
					<li style="font-size:1.0em; margin-bottom:5px; color:#6e6e6e;">비즈니스·마케팅</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="오피스">오피스</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="마케팅">마케팅</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="업무 자동화">업무 자동화</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="경영">경영</li>
					<li><input type="checkbox" name="mission_cate" id="mission_cate" value="자격증">자격증</li>
				</div>	
			</div>	
			<div style="display:flex;">
			<button type="button" id="aiGenerate" style="margin-right: 10px;">AI로 생성하기</button>
			<button type="button" class="selfGenerate" onclick="selfGenerate();">직접 생성하기</button>
			</div>
	</form>

</main>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
 
    $(document).ready(function () {
        var tag = {};
        var counter = 0;

     // mission_tag 업데이트
        function updateMissionTag() {
            var value = marginTag().join(","); // 배열을 공백으로 구분된 문자열로 변환
            $("#mission_tag").val(value);
        }
     
        // 입력한 값을 태그로 생성한다.
        function addTag (value) {
            tag[counter] = value;
            counter++; // del-btn 의 고유 id 가 된다.
            updateMissionTag();
        }

        // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
        function marginTag () {
            return Object.values(tag).filter(function (word) {
                return word !== "";
            });
        }
    
     

        $("#tag").on("keypress", function (e) {
            var self = $(this);

            //엔터나 스페이스바 눌렀을때 실행
            if (e.key === "Enter" || e.keyCode == 32) {

                var tagValue = self.val(); // 값 가져오기

                // 해시태그 값 없으면 실행X
                if (tagValue !== "") {

                    // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                    var result = Object.values(tag).filter(function (word) {
                        return word === tagValue;
                    })
                
                    // 해시태그가 중복되었는지 확인
                    if (result.length == 0) { 
                        $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                        addTag(tagValue);
                        self.val("");
                    } else {
                        alert("태그값이 중복됩니다.");
                    }
                }
                e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
            }
        });

        // 삭제 버튼 
        // 인덱스 검사 후 삭제
        $(document).on("click", ".del-btn", function (e) {
            var index = $(this).attr("idx");
            tag[index] = "";
            $(this).parent().remove();
        });
})

        // 서버에 제공
        $("#tag-form").on("submit", function (e) {
            var value = marginTag(); // return array
            $("#mission_tag").val(value); 

            $(this).submit();
        });
    
	    
    	
    	 $(document).ready(function(){
    		     $(document).on("click", "#aiGenerate", function() {
    		      event.preventDefault();
    		      var formData = new FormData(document.getElementById('main'));
    		      
    		      $.ajax({
    		         url : "${pageContext.request.contextPath}/Mission/aiGenerate",
    		         type : 'post',
    		         data : formData,
    		         processData : false,
    		         contentType : false,
    		         success : function(result) {
    		            if (result == "success") {
    		               alert('ai를 통한 미션 자동 생성은 3~5분정도 소요될 수 있습니다.');
    		               window.location.replace("${pageContext.request.contextPath}/main/mainMission");
    		            } else {
    		               alert("미션 자동 생성이 실패하였습니다. 다시 시도 부탁드립니다.");
    		               window.location.reload();
    		            }
    		         }
    		      });
    		   });
    		      
    		   });
    		   // 수동 생성 코드 수동 생성은 스텝하고 태스크까지 생성하고 ajax로 메시지 띄워주는게 맞는거같아서 ajax 처리 안함
    		      function selfGenerate() {
    		         document.getElementById('main').action = '${pageContext.request.contextPath}/Mission/selfGenerate'; 
    		         document.getElementById('main').submit();
    		    }
    
</script>