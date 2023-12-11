<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<main>
	<input type="hidden" value="${dto.step_no}">
	<div id="missionView">
		<div id="missionLeft">
			<div id="stepSub">
				<li><span>STEP ${dto.step}</span>${dto.step_title}</li>
			</div>
			
			<div id="learnSkill">
				<li>미션을 통해 습득할 <span style="color:#F93D18;">스킬</span></li>
				<li>이 미션을 수행하면 이런 스킬을 획득할 수 있어요!</li>
				<li><c:forEach items="${fn:split(Mdto.mission_skill, ',')}" var="category3">
                <span>${category3}</span></c:forEach></li>
			</div>
			
			<div id="require">
				<p style="font-size:1.2em;">미션을 시작하기 위한 <span style="color:#F93D18;">재료</span></p>
				<div class="ingredients">
					<div class="ingredient">
						<li>데이터<span>이런 파일 확장자를 사용합니다.</span></li>
						<div><c:forEach items="${fn:split(Mdto.mission_data, ',')}" var="category4">
                <span>${category4}</span></c:forEach></div>
					</div>
					<div class="ingredient">
						<li>Tool<span>이런 툴을 사용합니다. </li></p>
						<div><c:forEach items="${fn:split(Mdto.mission_tool, ',')}" var="category5">
                <span>${category5}</span></c:forEach></div>
					</div>
				</div>
			</div>

			<div id="stepPractice">		
				<div class="missionStep">
					<c:forEach var="TaskDTO" items="${Tasklist}">
					<c:if test="${dto.step_no eq TaskDTO.step_no}">
					<div class="StepDetail">
						
						<li style="font-size:1.2em;">${TaskDTO.task_title}<c:if test="${not empty TaskDTO.completed_at}"><span>완료  <img src="<%= request.getContextPath()%>/img/체크.png"/></span></c:if></li>
						<div style="white-space: pre-line;">
							${TaskDTO.task_content}
						</div>
						<c:if test="${empty TaskDTO.completed_at}">
						<button class="next">태스크 완료하기</button>
						</c:if>
						<input name="stepNo" value="${TaskDTO.step_no }" hidden>
						<input name="taskNo" value="${TaskDTO.task_no }" hidden>
					</div>
					</c:if>
       				</c:forEach>
					
					<button class="noComplete" disabled hidden>완료하고 스텝 제출하기</button>
				
					<button class="yesComplete">완료하고 스텝 제출하기</button>

				</div> 
			</div>
		</div>	
			
			<c:if test="${completed.at=='Y'}">
			<div id="missionComplete">
				<li>${Mdto.mission_title}</li>
				<li><span style="color:#F93D18;">제출</span> 완료되었습니다.</li>
				<div><img src="<%= request.getContextPath()%>/img/7.png"/></div>
				<li>제출한 미션을 커뮤니티에 공유해 함께 의션을 나누어 보세요.</li>
			</div>
			</c:if>
			
	
		<div id="missionRight">
			<div id="stepSubmit">
				<li>미션 스텝 제출 여부</li>
				<li>제출 안 함</li>
				<li>미션 스텝  제출 일시</li>
				<li>-</li>
				<li>피드백 현황<span>-</span></li>
			</div>
			
			<div>
			<p>${Mdto.mission_title}</p>
			<div id="totalStep">
			<c:forEach var="Steplist" items="${Steplist}">
					<li>${Steplist.step}.  ${Steplist.step_title}</li>
					<!-- <li>2.  자바설치 및 설정</li>
					<li>3.  주피터 노트북 세팅</li>
					<li>4.  분석할 코드 만들기</li>
					<li>5.  파라메터 조정</li>
					<li>6.  코드 실행 : 클러스터링</li>
					<li>7.  최종 산출물 제출</li> -->
       		</c:forEach>
			</div>
		
		</div>
		
			<div id="missionBtn2" style="padding-right: 20px;">
				<button>미션 추천하기 <img src="<%= request.getContextPath()%>/img/Thumbs-up.png"/></button>		
			</div>
			
		</div>
		
		
		
	</div>
	

<script>
$(document).on("click", ".next", function() {
    var stepNo = $(this).siblings("input[name='stepNo']").val();
    var taskNo = $(this).siblings("input[name='taskNo']").val();
    var clickedButton = $(this);

    $.ajax({
        url: '/ozz/Task/completeTask',
        type: 'POST',
        data: {
            "mission_no": ${Mdto.mission_no},
            "step_no": stepNo,
            "task_no": taskNo
        },
        success: function(newCompletedAt) {
            if (newCompletedAt == "success") {
                alert("태스크가 완료되었습니다.");
                clickedButton.hide();

                var completeIcon = document.createElement("span");
                completeIcon.innerHTML = `완료  <img src='${pageContext.request.contextPath}/img/체크.png'/>`;

                // 해당 태스크 아이템에 완료 아이콘을 추가합니다.
                clickedButton.closest(".StepDetail").find("li").append(completeIcon);
            } else {
                alert("이미 완료된 태스크 입니다. 페이지를 새로고침 해주세요");
            }
        },
        error: function(error) {
            console.error('Ajax 요청 실패:', error);
        }
    });
});

</script>


</main>