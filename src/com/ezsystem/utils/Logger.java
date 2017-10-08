package com.ezsystem.utils;

import com.ezsystem.dataBaseControl.JdbcManager;

public class Logger {

	public void gravarLog(String mensagemDeLog)
	{
		JdbcManager dataBaseTools = new JdbcManager();
		dataBaseTools.insertJdbc("INSERT INTO ezmalteria.logsSistema (saidaDeLog) VALUES('"+mensagemDeLog+"')");
		
		
	}
	
}
