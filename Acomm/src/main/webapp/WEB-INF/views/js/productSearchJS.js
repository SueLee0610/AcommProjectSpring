$(() => {
		
		// 상품 검색 ajax
		$("#search").on("click", () => {
				$.ajax({
					type: "GET",
					url: "ProductSearchServlet",
					dataType: "json",		
					data: {
						searchName: $("#searchName").val(),
						searchTerm: $("#searchTerm").val()
					},
					success: (data, status, xhr) => {
						$(".newProduct").empty();
						$.each(data, (key, value) => {
							for(let i=0; i < value.length; i++){
								let str = '<div class="col-md-3 col-lg-4 mb-4 mb-lg-4" style="display: flex; flex-direction: column;"><div class="card h-100">';
									str = '<a href="ProductRetrieveServlet?pCode=' + value[i].pCode + '">';
									str += '<img src="img/' + value[i].pImage + '" width="300px"></a>';
									str += '<div class="card-body"><h5 class="card-title font-size-regular pName">';
									str += '<a href="ProductRetrieveServlet?pCode=' + value[i].pCode + '" class="text-dark">';
									str += value[i].pName + '</a></h5><p class="card-text text-body">';
									str += '가격: ' + value[i].pPrice + '원<br>';
									str += '팔렸습니까: ' + value[i].isSold + '<br></p><p class="card-text">';
									str += '<a href="ProductRetrieveServlet?pCode=' + value[i].pCode + '" class="text-info">상세보기</a></p></div></div></div>';
									$(".newProduct").append(str);
							}
						})
					},
					error: (xhr, status, data) => {
						console.log("error");
					}
				});
		});
	})