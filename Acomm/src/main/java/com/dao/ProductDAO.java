package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ProductDTO;

@Repository
public class ProductDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<ProductDTO> selectProduct() {
		List<ProductDTO> result = template.selectList("ProductMapper.selectProduct");
		return result;
	}
	
	public ProductDTO selectProductRetrieve(int pCode) {
		ProductDTO result = template.selectOne("ProductMapper.selectProductRetrieve", pCode);
		return result;
	}

	public int isSoldUpdate(int pCode) {
		 int result = template.update("ProductMapper.isSoldUpdate", pCode);
		 return result;
	}

	public void addProduct(ProductDTO dto) {
		template.insert("ProductMapper.addProduct", dto);
	}

	public void deleteProduct(int pCode) {
		template.delete("ProductMapper.deleteProduct", pCode);
	}

	public List<ProductDTO> search(HashMap<String, String> map) {
		List<ProductDTO> result = template.selectList("ProductMapper.search", map);
		return result;
	}

	public List<ProductDTO> selectMyProduct(String userid) {
		List<ProductDTO> result = template.selectList("ProductMapper.selectMyProduct", userid);
		return result;
	}

	public void productUpdate(ProductDTO dto) {
		template.update("ProductMapper.productUpdate", dto);
	}

}
