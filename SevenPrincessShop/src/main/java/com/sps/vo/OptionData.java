package com.sps.vo;

import java.util.ArrayList;

import com.mysql.fabric.xmlrpc.base.Array;

public class OptionData {
	
	private String odSize;
	private	String odOption;
	private String odStock;
	public String getOdSize() {
		return odSize;
	}
	public void setOdSize(String odSize) {
		this.odSize = odSize;
	}
	public String getOdOption() {
		return odOption;
	}
	public void setOdOption(String odOption) {
		this.odOption = odOption;
	}
	public String getOdStock() {
		return odStock;
	}
	public void setOdStock(String odStock) {
		this.odStock = odStock;
	}
	@Override
	public String toString() {
		return "OptionData [odSize=" + odSize + ", odOption=" + odOption + ", odStock=" + odStock + "]";
	}
	
	
	
	
	
}
