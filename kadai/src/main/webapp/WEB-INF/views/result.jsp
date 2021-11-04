<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<section class="py-5 text-center container" id="scrollspy">
<div class="row py-lg-5">
  <div class="col-lg-6 col-md-8 mx-auto">
    <h1 class="fw-light">Total Costs</h1>
	<p class="lead text-muted">総額は　${cost }　円です。</p>
	<p>
	  <a href="kadaiMain.do" class="btn btn-secondary my-2">戻る</a>
	</p>
  </div>
</div>
<div>
  <div class="accordion col-4 text-start mx-auto" id="accordion">
	<div class="form-check form-switch accordion-header" id="headingOne">
  	  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" checked>
  	  <label class="form-check-label" for="flexRadioDefault1">
    	隠す
  	  </label>
	</div>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion">     
    </div>
	<div class="form-check form-switch accordion-header" id="headingTwo">
  	  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
  	  <label class="form-check-label" for="flexRadioDefault2">
    	地域ごとに見る
  	  </label>
	</div>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion">
      <div class="accordion-body">
        <c:forEach items="${regionList }" var="r">
		  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dot" viewBox="0 0 16 16"><path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/></svg>          
		  ${r[0] } : ${r[1] }件<br>
        </c:forEach>
      </div>
    </div>
	<div class="form-check form-switch accordion-header" id="headingOne">
  	  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
  	  <label class="form-check-label" for="flexRadioDefault3">
    	料金ごとに見る
  	  </label>
	</div>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordion">
      <div class="accordion-body">
        <c:forEach items="${costList }" var="c">
		  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dot" viewBox="0 0 16 16"><path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/></svg>        
		  ${c[0] }円 : ${c[1] }件<br>	  
        </c:forEach>
      </div>
    </div>
  </div>
</div>
</section>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>