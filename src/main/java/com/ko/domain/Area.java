package com.ko.domain;

public class Area {
	private String area;
	private String province;
	private String gu;
	private String dong;
	
	public Area() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Area(String area, String province, String gu, String dong) {
		super();
		this.area = area;
		this.province = province;
		this.gu = gu;
		this.dong = dong;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	@Override
	public String toString() {
		return "Area [area=" + area + ", province=" + province + ", gu=" + gu + ", dong=" + dong + "]";
	}
	
	public String getStrChange() {
		String str="";
		
		if(area!=null)
			if(!area.equals("지역선택")) {
				str+="#"+area;
			}
		if(province!=null)
			if(!province.equals("지역선택")) {
				str+="#"+province;
			}
		if(gu!=null)
			if(!gu.equals("지역선택")) {
				str+="#"+gu;
			}
		if(dong!=null)
			if(!dong.equals("지역선택")) {
				str+="#"+dong;
			}
		
		return str;
	}
	
}
