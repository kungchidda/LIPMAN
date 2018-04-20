<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
		<c:forEach items="${list}" var="boardVO">
				<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'><img class="card-img-top" src="/displayFile?fileName=${boardVO.fullName}" alt=""></a>
						
						<div class="card-body">
							<h4 class="card-title">
								<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title} <strong>[ ${boardVO.replycnt} ]</strong></a>
							</h4>
							<div><p class="card-text">${boardVO.writer} <span class="badge bg-red">${boardVO.viewcnt}</span></p></div>
							<div>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" />
							</div>
						</div>
					</div>
				</div>
		</c:forEach>
</body>
</html>