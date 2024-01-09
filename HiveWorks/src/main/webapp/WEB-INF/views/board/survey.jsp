<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="default" name="style" />
    <jsp:param value="" name="hover" />
</jsp:include>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
	<div class="container">
  <h1 class="title">체형진단 설문지</h1>
  <h2 class="sub-title">a, b, c 세개의 보기 중<br/>자신의 특징과 비슷한 것을 고르세요</h2>

  <div id="data-list"></div>

<div id="result" style="display: none;">
  <h2>성격 결과:</h2>
  <p id="resultText"></p>
</div>

  <button id="submitBtn" class="ready">결과 확인</button>
</div>

</div>
<style>
body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #eccfd4;
  margin: 0;
  padding: 0;
}

.container {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
}

h1 {
  text-align: center;
  margin-top: 0;
}
.title {
  color: #f7d3d1;
  text-shadow: 1px 1px 10px black;
}
.sub-title {
  text-align: center;
  color: #fff;
  text-shadow: 1px 1px 2px gray;
}

h2 {
  font-size: 1.2em;
  color: #555;
}


p {
  margin-bottom: 10px;
}

.answer {
  border: solid 1px black;
  padding-left: 2rem;
  margin-bottom: 2rem;
}

.answer-options {
  display: flex;
  gap: 20px;
  margin-bottom: 20px;
}

button {
  display: block;
  margin: 0 auto;
  padding: 10px 20px;
  color: #fff;
  font-size: 1em;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  background-color: #f8959e;
}

.ready {
/*   border: solid white 1px; */
  background-color: gray;
}

#result {
  margin-top: 20px;
  text-align: center;
}

#result h2 {
  color: #f8959e;
  margin-bottom: 10px;
}

#resultText {
  font-size: 1.2em;
}

</style>
<script>
const bodyTypes = [
	  {
	    title: "1번",
	    a: "목이 짧고 승모근이 발달했다",
	    b: "목선이 길고 승모근이 적다",
	    c: "목선이 보통이다"
	  },
	  {
	    title: "2번",
	    a: "쇄골이 도드라진 편은 아니다",
	    b: "쇄골이 v자 형태다",
	    c: "쇄골이 일자형태고 튀어나와있다"
	  },
	  {
	    title: "3번",
	    a: "어깨가 넓다",
	    b: "어깨가 좁고 둥근형태다",
	    c: "직각어깨다"
	  },
	  {
	    title: "4번",
	    a: "손이 몸에 비해 작은편이다",
	    b: "손가락이 길고 가는편이다",
	    c: "손이 크고, 손가락 마디가 도드라진 편이다"
	  },
	  {
	    title: "5번",
	    a: "실핏줄이 잘 안보인다",
	    b: "잘 모르겠다",
	    c: "실핏줄이 잘 보인다"
	  },
	  {
	    title: "6번",
	    a: "근육이 잘 붙고, 피부가 팽팽&땡땡한 느낌이 든다.(만져봤을때 말랑말랑 보다는 묵직하고 단단한 느낌이 든다)",
	    b: "살이 잘 붙고, 피부가 말랑말랑한 편이다",
	    c: "통뼈거나 무릎,어깨 관절 도드라진다"
	  },
	  {
	    title: "7번",
	    a: "어깨가 넓고, 상체보다 하체가 짧다",
	    b: "어깨가 좁고, 상체보다 하체가 짧다",
	    c: "쭉뻗은 모델체형이며, 상체보다 하체가 길다"
	  },
	  {
	    title: "8번",
	    a: "스포티하거나 심플한 옷이 잘 어울린다",
	    b: "여성스러운 옷이 잘 어울린다",
	    c: "모델핏이란 소리를 자주 듣는다"
	  },
	  {
	    title: "9번",
	    a: "건강미가 돋보인다",
	    b: "여리여리함이 돋보인다",
	    c: "팔다리가 길어 시원한 느낌이 돋보인다"
	  },
	  {
	    title: "10번",
	    a: "다리가 일자고 근육질인 편이다",
	    b: "다리가 살짝 오다리고 살집이 있는 편이다",
	    c: "다리가 일자고 무릎뼈가 도드라진다"
	  },
	  {
	    title: "11번",
	    a: "어깨가 넓고 골반이 좁은편이다",
	    b: "허리가 얇고 골반이 넓은편이다",
	    c: "허리 굴곡이 없는 편이다"
	  },
	  {
	    title: "12번",
	    a: "손발이 몸에 비해 작은편이다",
	    b: "손이 길고 고운편이다",
	    c: "손이 길고 손목뼈가 도드라졌다"
	  },
	  {
	    title: "13번",
	    a: "뼈가 두드러지지 않고 근육이 잘 붙고 피부가 탄력적인 편이다",
	    b: "뼈가 작은 편이고 살이 부드러운 편이다",
	    c: "뼈대가 굵고 튼튼하며 피부가 매트한 편이다"
	  },
	  {
	    title: "14번",
	    a: "상체 위주로 살이 찐다",
	    b: "하체 위주로 살이 찐다",
	    c: "살이 찌면 전체적으로 몸집이 커진다"
	  },
	  {
	    title: "15번",
	    a: "옆모습이 두꺼운 느낌이다",
	    b: "옆모습이 날씬하다",
	    c: "옆모습은 허리 날씬, 앞모습은 허리 통짜다"
	  },
	  {
	    title: "16번",
	    a: "살이 찌면 배부터 찌는편이다. (복부형 비만)",
	    b: "하체에 비해 상체가 아주 가늘다",
	    c: "마른편이다. 종잇장같다는 소리 자주듣는다"
	  },
	  {
	    title: "17번",
	    a: "손가락이 짧은편이다",
	    b: "손목이 발목에 비해 아주 가늘다",
	    c: "골격이 커서 뼈툭튀다. (손목뼈, 복숭아뼈 등)"
	  }
	];

	const template = (qno, bodyType) => {
	  const {title, a, b, c} = bodyType
	  return `
	      <h2>질문 ${title}</h2>
	      <div class="answer-options">
	        <label>
	          <input class="answer-item" type="radio" name="${qno}" value="a">${a} 
	        </label>
	      </div>
	      <div class="answer-options">
	        <label>
	          <input class="answer-item" type="radio" name="${qno}" value="b">${b}
	        </label>
	      </div>
	      <div class="answer-options">
	        <label>
	          <input class="answer-item" type="radio" name="${qno}" value="c">${c}
	        </label>
	      </div>
	`
	}
	document.addEventListener("DOMContentLoaded", function() {
	  const dataList = document.getElementById("data-list");
	  
	  bodyTypes.forEach((bodyType, qno) => {
	    const listItem = document.createElement("div");
	    listItem.className = 'answer'

	    listItem.innerHTML = template(qno, bodyType);

	    dataList.appendChild(listItem);
	  })
	});

	document.getElementById('submitBtn').addEventListener('click', function() {
	  const checkedAnswers = [...document.querySelectorAll('.answer input:checked')]
	  // console.log('checkedAnswers', checkedAnswers)
	  
	  // 모든 질문에 답변했는지 확인
	  const answered = checkedAnswers?.length || 0
	  // console.log('answered', answered, bodyTypes.length)
	  
	  if (answered === bodyTypes.length) {
	    // 결과 계산    

	    const answerAs = checkedAnswers.filter(a => a.value === "a")
	    const answerBs = checkedAnswers.filter(a => a.value === "b")
	    const answerCs = checkedAnswers.filter(a => a.value === "c")
	    
	    const noA = answerAs?.length;
	    const noB = answerBs?.length;
	    const noC = answerCs?.length;
	    // console.log('noA', noA, noB, noC)
	  
	    let result
	    if (noA === noB && noB === noC) {
	      result = "밸런스 체형"
	    } else if (noA > noB && noA > noC) {
	      result = "스트레이트 체형"
	    } else if (noB > noA && noB > noC) {
	      result = "웨이브 체형"
	    } else if (noC > noA && noC > noB) {
	      result = "내추럴 체형"
	    } else if (noA === noB && noA > noC && noB > noC) {
	      result = "스트레이트-웨이트 체형"
	    } else if (noA === noC && noA > noB && noC > noB) {
	      result = "스트레이트-내추럴 체형"
	    } else if (noB === noC && noB > noA && noC > noA) {
	      result = "웨이브-내추럴 체형"
	    } else {
	      result = `바디타입 ${noA}${noB}${noC} 형`
	    }
	    // console.log(result, result)
	    // 결과를 표시
	    document.getElementById('resultText').textContent = result;
	    const resultBox = document.getElementById('result');
	    resultBox.style.display = 'block';
	    resultBox.scrollIntoView();

	  } else {
	    alert('질문에 모두 답해주세요!');
	  }
	});

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>