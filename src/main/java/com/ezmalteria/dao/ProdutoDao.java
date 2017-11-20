package com.ezmalteria.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ezmalteria.constants.QueriesConstants;
import com.ezmalteria.domain.ProdutoTO;

@Repository
public interface ProdutoDao extends CrudRepository<ProdutoTO, Long> {

	@Query(value = QueriesConstants.GET_LOW_STOCK_PRODUCTS_QUERY,nativeQuery = true)
	public List<ProdutoTO> findAllLowStockProducts(
			/*@Param(QueriesConstants.GET_LOW_STOCK_PRODUCTS_QUANTITY_WHERE_FILTER_FIELD) String quantity*/);
}
