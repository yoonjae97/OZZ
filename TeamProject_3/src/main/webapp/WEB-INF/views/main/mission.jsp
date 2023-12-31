<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<main>
	<div id="landing">
		<div
			style="flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 20px; display: inline-flex;">
			<div style="margin-top: 50px;">
				<span
					style="color: #222A2F; font-size: 30px; word-wrap: break-word;">직접
					미션을 만들어<br />다른 사용자의 랜선사수가 되어주세요!
				</span>
			</div>
			<button id="landBtn" onclick="location.href='<%=request.getContextPath() %>/Mission/Missionwrite'">미션 만들기</button>
		</div>
		<div id="landingImage"
			style="display: flex; margin-left: 70px; width: 470px; height: 320px;">
			<img src="<%=request.getContextPath()%>/img/Group 7169.png" />
		</div>
	</div>

   <c:if test="${not empty logId}">
   <div style="margin-top:90px;">
      <span style="font-size:1.6em;">진행 중인 미션</span>
      <span><a href="/ozz/mypage/myPageDetail" style="font-size:0.8em; color: #869AAF; float:right;">더보기 ></a></span>
   </div>
   <div id="mIng">
   <c:choose>
      <c:when test="${not empty mymissionList}">
      <c:forEach items="${mymissionList}" var="mission_ing">
         <div id="ingList">
            <div class="ingM">
                     <li>${mission_ing.mission_title}</li>
                     <li>진행률<span>${mission_ing.mission_rate}%</span><span>남은 스텝 수</span><span>${mission_ing.restcnt}</span></li>
                     <li><progress id="progress" value="${mission_ing.mission_rate}" min="0" max="100" style="margin: 5px 0 8px 0;"></progress></li>
                     <li><button>이어서 진행하기</button></li>
            </div>
         </div>
      </c:forEach>
      </c:when>
      <c:otherwise>
         <div class="notStart">진행 중인 미션이 없습니다. 미션을 진행해보세요!</div>
      </c:otherwise>
   </c:choose>
      </div>
   </div>
   </c:if>
	
	<div style="font-size: 1.6em; margin-top: 90px;">맞춤 추천 미션</div>
	<div id="recommendM">
		<div id="recommendMList">
			<c:forEach items="${responseBodyList['Title']}" var="title" varStatus="loop">
	        <div class="rMInfo" onclick="location.href='/ozz/Mission/MissionView?no=${responseBodyList['index'][loop.index][0]}';">

	                <li><img src="<%= request.getContextPath()%>/img/Frame 2526 (3).png" /></li>
	                <li>${title.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("'", "").replaceAll("\\{", "").replaceAll("\\}", "")}</li>
	                <c:forEach items="${responseBodyList['Content'][loop.index]}" var="content">
	            		<li>${content.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("'", "")}</li>
	        		</c:forEach>
	                <li>
	                <c:forEach items="${fn:split(responseBodyList['Tag'][loop.index], ',')}" var="tag">
	                    <span class="spanTag">${tag.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("'", "")}</span>
	                </c:forEach>
	                </li>
					<c:forEach items="${responseBodyList['Author'][loop.index]}" var="author">
	            		<li>${author.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("'", "")}</li>
	        		</c:forEach>
	            </div>
        	</c:forEach>
		</div>
	</div>


	<div id="popM">
		<li style="font-size: 1.6em">인기 미션 Top 10</li>
		<li style="color: #869AAF; margin-top: 5px; font-size: 0.9em">지금
			가장 많이 도전하고 있는 미션</li>
	</div>
	<div id="popMList">
		<c:forEach var="M_dto" items="${MissionToplist}" varStatus="loop">
			<div class="popMContent">
				<c:choose>
					<c:when test="${loop.index + 1 < 10}">
						<span style="margin-bottom:20px;">
							0<c:out value="${loop.index + 1}" />
						</span>
						<!-- 01 자리에 반복 인덱스를 표시 -->
					</c:when>
					<c:otherwise>
						<div>
							<c:out value="${loop.index + 1}" />
						</div>
					</c:otherwise>
				</c:choose>
				<!-- 01 자리에 반복 인덱스를 표시 -->
				<div>
					<img src="<%=request.getContextPath()%>/img/image 70.jpg" />
				</div>
				<div class="popMInfo">
					<li><a href="/ozz/Mission/MissionView?no=${M_dto.mission_no}">${M_dto.mission_title}</a></li>
					<li><c:forEach items="${fn:split(M_dto.mission_tag, ',')}" var="category"><span class="spanTag">${category}</span></c:forEach></li>
					<li>${M_dto.userid}</li>
				</div>
			</div>
		</c:forEach>
	</div>
	</div>

</main>

<script>
let missionGoPopup2 = document.querySelector('span#more2');

missionGoPopup2.onclick = function() {
	let option2 = "width = 900px, height = 600px, top = 300px, left = 200px, scrollbars = yes,  location=no"
	let openurl2 = '/ozz/mypage/mission_ing'
	window.open(openurl2, 'missionGoPopup', option2)
}


</script>