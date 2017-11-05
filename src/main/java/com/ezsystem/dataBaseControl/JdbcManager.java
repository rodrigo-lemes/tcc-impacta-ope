package com.ezsystem.dataBaseControl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcManager {

	// Database config
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/ezmalteria";

	// Database credentials
	static final String USER = "root";
	static final String PASS = "r";

	Connection connectDataBase = null;
	Statement stmt = null;
	java.sql.PreparedStatement pStmt = null;

	public void generateConnection() {

		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to a selected database...");
			connectDataBase = DriverManager.getConnection(DB_URL, USER, PASS);
			System.out.println("Connected database successfully...");

			// STEP 4: Execute a query
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public String insertJdbc(String sql) {

		generateConnection();

		System.out.println("Query criada:" + sql);

		try {
			System.out.println("Inserting records into the table...");
			stmt = connectDataBase.createStatement();

			try {
				stmt.executeUpdate(sql);
				System.out.println("Inserted records into the table...");
			} catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
				return "2";
			} catch (com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException e) {
				return "0";
			}

		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// finally block used to close resources
			try {
				if (stmt != null)
					connectDataBase.close();
			} catch (SQLException se) {
			}// do nothing
			try {
				if (connectDataBase != null)
					connectDataBase.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}// end finally try
		}
		return "1";
	}

	public ResultSet selectJdbc(String sql) {

		generateConnection();

		ResultSet resultTable = null;

		System.out.println("SQL a ser inserida SELECT:" + sql);

		try {
			System.out.println("Reading records in table...");
			stmt = connectDataBase.createStatement();

			resultTable = stmt.executeQuery(sql);

			System.out.println("Data Ready!...");

		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		}

		return resultTable;
	}

	public String deleteJdbc(String sql) {

		generateConnection();
		try {
			System.out.println("SQL Delete: " + sql);

			pStmt = connectDataBase.prepareStatement(sql);
			pStmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			return "4";
		}
		return "5";
	}

	public String updateJdbc(String sql) {
		generateConnection();

		System.out.println("Query criada:" + sql);
		String erro;
		try {
			System.out.println("Inserting records into the table...");
			stmt = connectDataBase.createStatement();
			try {
				stmt.executeUpdate(sql);
				System.out.println("Inserted records into the table...");
			} catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
				return "2";
			}

		} catch (SQLException se) {

			return "0";
		} catch (Exception e) {
			return "0";
		} finally {
			// finally block used to close resources
			try {
				if (stmt != null)
					connectDataBase.close();
			} catch (SQLException se) {
			}// do nothing
			try {
				if (connectDataBase != null)
					connectDataBase.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}// end finally try
		}
		return "1";
	}

}
