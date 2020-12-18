$(() => {
		// 상품 검색 ajax
		$("#search").on("click", (e) => {
			if($("#searchTerm").val()==''){
				e.preventDefault();
			}
			$.ajax({
				type: "GET",
				url: "productSearch",
				dataType: "json",
				data: {
					searchName: $("#searchName").val(),
					searchTerm: $("#searchTerm").val()
				},
				success: (data, status, xhr) => {
					$(".newProduct").empty();
					$.each(data, (key, value) => {
						if(value.length==0){
							let	str = '<div class="col-md-12 text-danger"><b>검색결과가 없습니다.</b></div>';
							$(".newProduct").append(str);
						}
						for(let i=0; i < value.length; i++){
							let	str = '<div class="col-md-3 col-lg-4 mb-4 mb-lg-4"><div class="card h-100">';
								str += '<a href="productRetrieve?pCode=' + value[i].pCode + '">';
								str += '<img src="img/' + value[i].pImage + '" width="300px" class="img-fluid"></a>';
								str += '<div class="card-body"><h5 class="card-title font-size-regular pName">';
								str += '<a href="productRetrieve?pCode=' + value[i].pCode + '" class="text-dark">';
								str += value[i].pName + '</a></h5><p class="card-text text-body">';
								str += '가격: ' + value[i].pPrice + '원<br>';
								str += '판매자: ' + value[i].userid + '<br>';
								str += value[i].pContent.substring(0, 18) +'...<br>';
								str += value[i].isSold == 'y' ? '<span class="card-text text-danger"><b>Sold Out</b></span></p>' : '</p>';
								str += '<p class="card-text"><a href="productRetrieve?pCode=' + value[i].pCode + '" class="text-info">상세보기</a></p></div></div></div>';
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