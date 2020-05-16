<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

//	������ ��ſ� ����� ��ü�� �����Ѵ�.
//	XMLHttpRequest : �ڹٽ�ũ��Ʈ object�� http�� ���� �ۼ����� ������ �ִ� ��ü
	var searchRequest = new XMLHttpRequest();
		
//	ajax ��û �Լ�
	function searchFunction() {
//		alert(document.getElementById("userName").value);
//		XMLHttpRequest��ü.open("��û���", ������, ������)
//		���� ��� : ����� => false, �񵿱�� => true
//		encodeURIComponent() : ���ڿ��� �����ڵ�� ���ڵ� �Ѵ�.
//		decodeURIComponent() : encodeURIComponent() �Լ��� ���ڵ��� ���ڿ��� ���ڵ� �Ѵ�.
		var url = "/ajax?name=" + encodeURIComponent(document.getElementById("name").value)
		searchRequest.open("post", url, true);
//		onreadystatechange : ajax ��û�� �Ϸ�Ǹ� ������ �ݹ� �Լ��� �����Ѵ�.
		searchRequest.onreadystatechange = searchProcess;
//		send() : ��û�Ѵ�.
		searchRequest.send(null);
	}
	
//	ajax ��û�� ���� ó���� ����� �޾Ƽ� ȭ�鿡 ����ϴ� �۾��� ����Ǵ� �Լ�
	function searchProcess() {
//		alert("���� searchFunction() �Լ����� ȣ��Ǵ� �ݹ� �Լ�");

//		onreadystatechange�� ������ �ݹ� �Լ��� readyState
//		0 : ������� ����
//		1 : �ε� ��
//		2 : �ε� ��
//		3 : ��� ��
//		4 : ��� �Ϸ�

//		onreadystatechange�� ������ �ݹ� �Լ��� status
//		200 : ���� ����
//		300 : ����
//		400 : ������ ����
//		500 : ���� ����

		if(searchRequest.readyState == 4 && searchRequest.status == 200) {
			
//			�������� ������ �����͸� ����ϱ� ���� ������ ǥ�õǴ� �����͸� �����Ѵ�.
			var table = document.getElementById("ajaxTable");
			table.innerHTML = "";
			
//			�������� ���ϵ� ���ڿ� �����͸� json Ÿ������ ��ȯ�ϱ� ���� ��ȣ�� �ٿ��� �޾� ��ü�� �����Ѵ�.
//			eval() : �μ��� ������ ���ڿ��� ������ �ڹٽ�ũ��Ʈ�� �����Ѵ�.
			var object = eval("(" + searchRequest.responseText + ")");	// ���ǿ��...
//			json ��ü���� result ��� �̸��� ������ �����͸� ���´�. => ȭ�鿡 ����� ������
			var result = object.result;
//			alert(result.length);

//			�˻��Ǽ� �Ѿ�� �������� ���� ��ŭ �ݺ��Ѵ�.
			for (var i = 0; i < result.length; i++) {
//				tbody�� �־��� ���� �����.
				var row = table.insertRow(0);
//				�� �࿡ ����� ���� ���� ��ŭ �ݺ��Ѵ�.
				for (var j = 0; j < result[i].length - 1; j++) {
//					�࿡ �־��� ���� �����.
					var cell = row.insertCell(j);
//					���� ȭ�鿡 ǥ�õ� �����͸� �־��ش�.
					cell.innerHTML = result[i][j + 1].value;
				}
			}
			
		} // if
	} // searchProcess()
		
//		�������� �ε���ڸ��� ȭ�鿡 �����Ͱ� ������ �ϱ� ������ onload �̺�Ʈ���� searchFunction() �Լ��� �����Ѵ�.
		onload = function() {
			searchFunction()
		}
	

</script>	
</head>
<body>

	<br/>
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" type="text" size="20" id="name" onkeyup="searchFunction()"/>
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" type="button" onclick="searchFunction()">�˻�</button>
			</div>
		</div>
	</div>

	<table class="table" align="center" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #fafafa; text-align: center;">���̵�</th>
				<th style="background-color: #fafafa; text-align: center;">�̸�</th>
				<th style="background-color: #fafafa; text-align: center;">����</th>
				<th style="background-color: #fafafa; text-align: center;">�̸���</th>
			</tr>
		</thead>
		<tbody id="ajaxTable">
			<tr></tr>
		</tbody>
	</table>
</body>
</html>