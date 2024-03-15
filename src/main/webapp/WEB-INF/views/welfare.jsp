<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
    	div{
		text-align: center;
	}
	
	table{
		margin : 100px;
		padding : 100px;
		background-color: white;
	  	border-collapse: collapse;
	  	border-radius: 10px;
	  	border-style: hidden;
	  	box-shadow: 0 0 0 1px #000;
	  	text-align: center;
	  	table-layout: fixed;
	  	word-spacing: normal;
	}
  
	
	table tr td{
		width : 1500px;
		height : 200px;
		border-top: 1px solid black;
		border-bottom: 1px solid #ccc;
		border-right: 1px solid #ccc;
		padding:10px;
		text-align: center;
		word-spacing: normal;
	}
	
	table tr th{
		text-align:center;
		height : 30px;
	}
	
	#title{
		height: 50px;
		border-bottom: 1px solid black;
	}
	
	.product:hover{
		cursor: pointer;
		
	}
	
	input[type='button']{
		color: white;
		background-color: #1BBC9B;
		border : 1px;
		border-radius : 10px;
		padding : 10px;
		margin-left : 20px;
		margin-right : 20px;
		width : 130px;
	}
	
	input[type='button']:hover{
	    color: black;
	    cursor: pointer;
	}
	
	.delete{
		border : 1px;
		border-radius : 10px;
		background-color: #1BBC9B;
		color : black;
		height:20px;
		width:20px;
	}
	
	.delete:hover{
		color:white;
		cursor:pinter;
	}
	
</style>
</head>
<body>
<form method="post" action="welfareDelete">
    <table>
        <tr>
            <th>상품 이미지</th>
            <th>상품 이름</th>
            <th>상품 설명</th>
            <th>상품 가격</th>
            <c:choose>
	            <c:when test="${'관리자' == loginMember.getUjob()}">
	            	<th>상품 삭제</th> <!-- 수정: 이 부분 추가 -->
	            </c:when>
        	</c:choose>
        </tr>
        <c:choose>
            <c:when test="${!empty List}">
                <c:forEach var="m" items="${List}">
                    <tr onclick="location.href='welfareDetail?num=${m.num}'">
                        <td>
                            <img src="https://static.ebs.co.kr/images/public/lectures/2014/06/19/10/bhpImg/44deb98d-1c50-4073-9bd7-2c2c28d65f9e.jpg" height="300px">
                        </td>
                        <td>${m.model}</td>
                        <td>${m.intro}</td>
                        <td>
                            <f:formatNumber value="${m.price}" type="number" /> 원
                        </td>
                        <c:choose>
                            <c:when test="${'관리자' == loginMember.getUjob()}">
                                <!-- 각 삭제 버튼은 해당 상품의 번호를 전달하여 삭제 동작을 수행 -->
                                <td><input type="submit" class="delete" name="num" value="${m.num}" /></td>
                            </c:when>
                        </c:choose>
                    </tr>
                </c:forEach>
            </c:when>                
            <c:otherwise>
                <tr>
                    <td colspan="4">등록된 상품이 없습니다.</td> <!-- 수정: colspan 추가 -->
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
    
    <!-- 관리자만 보이게 -->
    <c:choose>
        <c:when test="${'관리자' == loginMember.getUjob()}">
            <br/>
            <hr/>
            <br/>
            <input type="button" id="add" value="상품 추가하기"/>
        </c:when>
    </c:choose>
    <br/>
    <br/>
</form>
<script>
    $(function(){
        $("#add").on("click",function(){
            location.href="${pageContext.request.contextPath}/Welfare/welfareAdd";
        });

        // 삭제 버튼 클릭 시 확인 대화상자 표시 후 폼 제출
        $(".delete").on("click", function(){
            if(confirm("상품을 삭제합니다.")){
                // 폼 제출
                $(this).closest("form").submit();
            }
        });
    });
</script>
</body>
</html>
