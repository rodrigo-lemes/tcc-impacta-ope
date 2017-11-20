package com.ezmalteria.facade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezmalteria.dao.ProdutoDao;
import com.ezmalteria.domain.ProdutoTO;

@Service
public class ProdutoFacade {

	@Autowired
	ProdutoDao pdao;

	public List<ProdutoTO> getAllProducts() {

		return (List<ProdutoTO>) pdao.findAll();
	}
	
	public List<ProdutoTO> getLowStockProducts(Long quantity){
		return (List<ProdutoTO>) pdao.findAllLowStockProducts(quantity);
	}
	
	public void saveProduct(ProdutoTO produtoData){
		pdao.save(produtoData);
	}

}
