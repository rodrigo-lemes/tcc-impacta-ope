package com.ezsystem.utils;

public class ConversorDatas {

	private String dataBr = "";
	private String dataUs = "";

	public String converterDataUsParaBr(String dataUs) {
		if (!dataUs.isEmpty()) {
			this.dataUs = dataUs;

			String[] splitedDataUs = new String[3];

			splitedDataUs = this.dataUs.split("-");

			dataBr = splitedDataUs[2] + "/" + splitedDataUs[1] + "/"
					+ splitedDataUs[0];
		}
		return dataBr;
	}

	public String converterDataBrParaUS(String dataBr) {

		if (!dataBr.isEmpty()) {
			this.dataBr = dataBr;

			String[] splitedDataBr = new String[3];

			splitedDataBr = this.dataBr.split("/");

			dataUs = splitedDataBr[2] + "-" + splitedDataBr[1] + "-"
					+ splitedDataBr[0];
		}
		return dataUs;
	}

}
