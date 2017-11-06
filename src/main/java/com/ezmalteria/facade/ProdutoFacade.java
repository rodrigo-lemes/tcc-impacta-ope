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

		List<ProdutoTO> productsList = (List<ProdutoTO>) pdao.findAll();

		return productsList;
	}

}
