package com.ezmalteria.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ezmalteria.constants.NamedQueriesConstants;
import com.ezmalteria.domain.ProdutoTO;

@Repository
public interface ProdutoDao extends CrudRepository<ProdutoTO, Long> {

	@Query(NamedQueriesConstants.GET_LOW_STOCK_PRODUCTS_QUERY)
	public List<ProdutoTO> findAllLowStockProducts(
			@Param(NamedQueriesConstants.GET_LOW_STOCK_PRODUCTS_QUANTITY_WHERE_FILTER_FIELD) String quantity);
}
