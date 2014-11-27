<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main hero unit for a primary marketing message or call to action -->
<div class="container">
	<div class="span12">
		<div class="row">
			<div class="span3"></div>
			<div class="hero-unit" style="background-color: lightgray">
				<h1>SendWich �Ұ�</h1>
				<p>���� ��ġ�� �Ұ��ϴ� ��.</p>
				<p>
					<a href="main?cmd=ABOUTUS" class="btn btn-primary btn-large">�о��
						&raquo;</a>
				</p>
			</div>
			<div class="span3"></div>
		</div>
		<div class="row">
			<div class="span12"></div>
		</div>

		<!-- Example row of columns -->
		<!--  �α����ؾ߸� ���̴� ��, ����+ģ�� �Խñ� -->

		<c:choose>
			<c:when test="${!empty memberDTO}">
				<c:forEach var="listdto" items="${boardList}">


					<div class="span5"
						style="text-overflow: ellipsis; overflow: hidden; background-color: #ffffff;margin-bottom: 10px">
						<c:if test="${!empty listdto.photo}">
							<img src="upload/${listdto.photo}" class="img-rounded" align="middle"
								>
						</c:if>
						<c:if test="${empty listdto.photo}">
						<img src="images/single-post-pic.jpg" class="img-rounded">
						</c:if>
						<h2>${listdto.title}</h2>
						<p>
							<nobr>${listdto.textarea} </nobr>
						</p>
						<p>
							<a class="btn"
								href="main?cmd=CONTENT&board_id=${listdto.board_id}">�ڼ��� ����
								&raquo;</a>
						</p>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>


		<div class="span5" style="text-overflow: ellipsis; overflow: hidden;">
			<img src="images/single-post-pic.jpg" class="img-rounded">
			<h2>���� 1</h2>
			<p>
				<nobr>�ÿ��� ���� �� ���� �Դϴ�. ����� �����ϴ�. </nobr>
			</p>
			<p>
				<a class="btn" href="#">�ڼ��� ���� &raquo;</a>
			</p>
		</div>

		<div class="span5" style="text-overflow: ellipsis; overflow: hidden;">
			<img src="images/single-post-pic.jpg" class="img-rounded">
			<h2>���� 2</h2>
			<p>
				<nobr>�������� �̺�Ʈ�� �����۵��� �ö� �����Դϴ�.</nobr>
			</p>
			<p>
				<a class="btn" href="#">�ڼ��� ���� &raquo;</a>
			</p>
		</div>



		<div class="span5" style="text-overflow: ellipsis; overflow: hidden;">
			<img src="images/single-post-pic.jpg" class="img-rounded">
			<h2>���� 3</h2>
			<p>
				<nobr>Donec sed odio dui. Cras justo odio, dapibus ac
					facilisis in, egestas eget quam. Vestibulum id ligula porta felis
					euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor
					mauris condimentum nibh, ut fermentum massa justo sit amet risus.</nobr>
			</p>
			<p>
				<a class="btn" href="#">�ڼ��� ���� &raquo;</a>
			</p>
		</div>

		<div class="span5" style="text-overflow: ellipsis; overflow: hidden;">
			<img src="images/single-post-pic.jpg" class="img-rounded">
			<h2>���� 4</h2>
			<p>
				<nobr>Donec sed odio dui. Cras justo odio, dapibus ac
					facilisis in, egestas eget quam. Vestibulum id ligula porta felis
					euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor
					mauris condimentum nibh, ut fermentum massa justo sit amet risus.</nobr>
			</p>
			<p>
				<a class="btn" href="#">�ڼ��� ���� &raquo;</a>
			</p>
		</div>

	</div>
</div>
<!-- /container -->

<hr />

<footer>
	<p>&copy; 2014 SendWich</p>
</footer>



