package com.ezmalteria.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ezmalteria.domain.ProdutoTO;

@Repository
public interface ProdutoDao extends CrudRepository<ProdutoTO, Long> {

	@Query("SELECT p FROM produto p WHERE p.quantidade = :quantity")
	public List<ProdutoTO> findAllLowStockProducts(@Param("quantity") String quantity);
	
}
