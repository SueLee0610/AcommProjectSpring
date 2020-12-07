package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ProductDAO;
import com.dto.ProductDTO;

@Service
public class ProductService {

	@Autowired
	ProductDAO dao;

	public List<ProductDTO> selectProduct() {
		List<ProductDTO> result = dao.selectProduct();
		return result;
	}

	public ProductDTO selectProductRetrieve(int pCode) {
		ProductDTO result = dao.selectProductRetrieve(pCode);
		return result;
	}

	public int isSoldUpdate(int pCode) {
		int result = dao.isSoldUpdate(pCode);
		return result;
	}

	public void addProduct(ProductDTO dto) {
		dao.addProduct(dto);
	}

	public void deleteProduct(int pCode) {
		dao.deleteProduct(pCode);
	}

	public List<ProductDTO> search(String searchName, String searchTerm) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchName", searchName);
		map.put("searchTerm", searchTerm);

		List<ProductDTO> result = dao.search(map);
		return result;
	}

	public List<ProductDTO> selectMyProduct(String userid) {
		List<ProductDTO> result = dao.selectMyProduct(userid);
		return result;
	}

	public void productUpdate(ProductDTO dto) {
		dao.productUpdate(dto);
	}

}
