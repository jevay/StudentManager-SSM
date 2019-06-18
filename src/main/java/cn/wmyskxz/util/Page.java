package cn.wmyskxz.util;

public class Page {
	private int start;
	private int count;
	private int total;

	public Page(int start, int count) {
		this.start = start;
		this.count = count;
	}
	
	public int getStart() {
		return this.start;
	}
	
	public int getCount() {
		return this.count;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
