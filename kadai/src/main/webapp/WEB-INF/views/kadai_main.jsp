<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<main>
  <section class="py-5 text-center container">
    <div class="px-4 py-5 my-5 text-center">
      <h1 class="display-5 fw-bold">料金計算プログラム for .csv</h1>
      <div class="col-lg-6 mx-auto">
        <p class="lead mb-4">CSV形式のファイルをアップロードするとデータを整理するプログラムです。<br>ファイルをアップロードして、右側のボタンを押してください。</p>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
          <form name="csvUploadForm" action="csvUpload.do" method="post" enctype="multipart/form-data">
		  <div class="input-group">
		    <input type="file" name="csv" class="form-control" id="inputGroupFile" aria-describedby="inputGroupFileAddon" aria-label="Upload" accept=".csv">
		    <button class="btn btn-primary" type="button" id="inputGroupFileAddon">Upload Button</button>		    
		  </div>         
		  </form>
		  <script>
		  	$('#inputGroupFileAddon').click(function() {
		  		if($('.form-control').get(0).files[0] == null) {
		  			window.alert('ファイルをアップロードしてください');
		  			return;
		  		}
		  		var name = $('.form-control').get(0).files[0].name;
		  		var extension = name.substring(name.lastIndexOf('.')+1, name.length);
		  		if(extension != 'csv' && extension != 'CSV') {
		  			window.alert('CSV形式のファイルのみアップロードしてください');
		  		} else {
		  			$('form[name="csvUploadForm"]').submit();
		  		}
		  	});
		  </script>
        </div>
      </div>
    </div>
  </section>
</main>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>