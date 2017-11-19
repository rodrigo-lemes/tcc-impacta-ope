package com.ezmalteria.constants;

public final class NamedQueriesConstants {

	private NamedQueriesConstants() {}
	
	public static final String GET_LOW_STOCK_PRODUCTS_QUERY = "SELECT p FROM produto p WHERE p.quantidade > :quantity";
	public static final String GET_LOW_STOCK_PRODUCTS_QUANTITY_FIELD_PARAMETER_NAMING = "quantity";
	
}
