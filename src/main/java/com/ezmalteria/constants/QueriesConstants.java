package com.ezmalteria.constants;

public final class QueriesConstants {

	private QueriesConstants() {}
	
	public static final String GET_LOW_STOCK_PRODUCTS_QUERY = "SELECT * FROM produto WHERE quantidade < 5";
	public static final String GET_LOW_STOCK_PRODUCTS_QUANTITY_WHERE_FILTER_FIELD = "quantity";
	
}
