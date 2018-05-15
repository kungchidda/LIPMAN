<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<body>
		<c:forEach items="${list}" var="boardVO">
					<!-- <div class="image__cell is-collapsed" > -->
					<div class="image__cell" id="expand-jump-${boardVO.bno}"><!-- second -->
						<div class="card h-100">
								<div class="image--basic">
									<!-- <a href="#;return false;"> -->
									<a href="#expand-jump-${boardVO.bno}">
										<img class="card-img-top basic__img" src="/displayFile?fileName=${boardVO.fullName}">
									</a>
									<a href="#close-jump-${boardVO.bno}" class="expand-close"></a>
								</div>
							
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
						<div class="image--expand">
						    <img class="image--large" src="/displayFile?fileName=${boardVO.fullName}" />
						</div>
					</div>
			</c:forEach>
</body>
</html>