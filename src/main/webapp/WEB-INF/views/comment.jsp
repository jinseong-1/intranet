<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#comments li{
		list-style:none;
		padding:10px;
		border:1px solid blue;
		height:100px;
		margin : 5px 0;
	}
	#modcom{
		border:1px solid black;
		padding:10px;
		display:none;
	}
	#comments span{
		border:1px solid skyblue;
		padding:5px 10px;
	}
	
	#comments span:hover{
		border:1px solid black;
		color:#D1B2FF;
		cursor:pointer;
		
	}
	
</style>
	<!-- 댓글 수정 화면 -->
	<div id="modCom">
		<!-- 수정할 댓글 번호 출력 -->
		<div id="numCom"></div>
		<div>
		<!-- 댓글 작성자 -->
			댓글 작성자 - <input type="text" name="writer" value="${loginMember.getUname()}" readonly />
		</div>
		<div>
			<!-- 댓글 내용 수정 -->
			댓글 내용 - <input type="text" id="comText"/>
		</div>
		<div>
			<button id="modBtn">수정</button>
			<button id="deleteBtn">삭제</button>
		</div>
	</div>
		<!-- 댓글 작성 -->
		<div>
			<div>
				작성자 : <input type="text" id="auth" value="${loginMember.getUname()}" readonly/>
			</div>
			<div>
				댓글 내용 : <input type="text" id="commtext"/>
			</div>
			<button id="addBtn">등록</button>
		</div>
	
	<!-- 전체 댓글 목록 -->
	<div>
		<ul id="comments"></ul>
	</div>
	
	
	
	<script>
		var bno = ${read.bno};
		
		getCommentList();
		
		// 댓글 전체 리스트
		function getCommentList(){
			let url = "${path}/comment/"+bno+"/list";
			
			$.getJSON(url, function(data){
				console.log(data);
				printList(data);
			});
		}	
	
		 function printList(list){
			console.log(list);
			let str ="";
			for(var i = 0; i<list.length;i++){
				str += `<li>
							\${list[i].noti_cno} - \${list[i].author} - <button data-cno='\${list[i].noti_cno}' data-content='\${list[i].noti_content}' data-author='\${list[i].author}'>수정</button>
							<br/><hr/>
							\${list[i].noti_content}
						</li>`;
				}
			console.log(str);
			$("#comments").html(str); 
		};
		
		// 댓글 삽입
		$("#addBtn").click(function(){
			let auth = $("#auth").val();
			let text = $("#commtext").val();
			
			$.ajax({
				type : "POST",
				url : "${path}/comment/joncomment",
				data : {
					bno : bno,
					noti_content : text,
					author : auth
				},
				dataType : "text",
				success : function(result){
					alert(result);
					$("#auth").val("");
					$("#Text").val("");
					getCommentList();
				},
				error : function(res){
					console.log(res);
					if(res.status === 400){
						alert("잘못된 요청입니다.");
						alert(res.responseText);
					}else if(res.status === 404){
						alert("요청 경로를 확인하세요.");
					}
				}
				
			});
		});
		
		// 댓글 수정 - 삭제 창 호출
		$("#comments").on("click","li button",function(){
			console.log(this);
			let cno = $(this).attr("data-cno");
			let auth = $(this).attr("data-author");
			let content = $(this).attr("data-content");
			
			$("#numCom").text(cno);
			$("#comText").val(content);
			$("#auth").val(auth);
			console.log(cno);
			console.log(content);
			console.log(auth);
			
			$(this).parent().after($("#modCom"));
			
			$("#modCom").toggle("slow");
		})
		
		// 댓글 수정창 호츨 - modify 버튼 이벤트
		function modifyPage(span, cno, content, auth){
			console.log(cno, content, auth);
			
			$("#numCom").text(cno);
			$("#comText").val(content);
			$("#auth").val(auth);
			
			$(span).parent().after($("#modCom"));
			
			$("#modCom").toggle("slow");
		}
		
		// 댓글 수정 요청 처리
		$("#modBtn").click(function(){
			let cno = $("#numCom").text();
			let content = $("#text").val();
			let auth = $("#auth").val();
			console.log(cno,content,auth);
/* 경로문제 */		
			$.ajax({
				type : "PATCH",
				/* url : "${path}/comment/joncomment", */
				url : "${path}/comment/"+cno,
				headers : {
					"Content-Type" : "application/json",
				},
				data : JSON.stringify({
					author : auth,
					content : noti_content
				}),
				dataType : "test",
				success : function(result){
					alert(result);
				},
				error : function(res){
					alert(res.responseText);
				}
			});
		});
		
		// 댓글 삭제 요청 처리
		$("#deleteBtn").click(function(){
			let cno = $("#numCom").text();
/* 경로문제 */			
			$.ajax({
				type : "DELETE",
				url : "${path}/comment/"+cno,
				dataType : "text",
				success : function(result){
					alert(result);
				},
				error : function(res){
					console.log(res);
				}
			});
		});
		
	</script>
