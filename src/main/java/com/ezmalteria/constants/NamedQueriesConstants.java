package com.ezmalteria.constants;

public final class NamedQueriesConstants {

	private NamedQueriesConstants() {}
	
	public static final String GET_LOW_STOCK_PRODUCTS_QUERY = "SELECT p FROM produto p WHERE p.quantidade < 5";
	public static final String GET_LOW_STOCK_PRODUCTS_QUANTITY_WHERE_FILTER_FIELD = "quantity";
	
}
