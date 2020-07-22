package com.sx.pojo;
/**
 * 菜单表
 * @author 微爱
 *
 */
public class Jurisdiction {
		private int id;		//id
		private String jurisdiction_name;	//权限名称
		private int jurisdiction_type;		//菜单类型
		private int jurisdiction_parent;	//菜单父级
		private String jurisdiction_uri;	//菜单路径
		private String jurisdiction_describe;//描述
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getJurisdiction_name() {
			return jurisdiction_name;
		}
		public void setJurisdiction_name(String jurisdiction_name) {
			this.jurisdiction_name = jurisdiction_name;
		}
		public int getJurisdiction_type() {
			return jurisdiction_type;
		}
		public void setJurisdiction_type(int jurisdiction_type) {
			this.jurisdiction_type = jurisdiction_type;
		}
		public int getJurisdiction_parent() {
			return jurisdiction_parent;
		}
		public void setJurisdiction_parent(int jurisdiction_parent) {
			this.jurisdiction_parent = jurisdiction_parent;
		}
		public String getJurisdiction_uri() {
			return jurisdiction_uri;
		}
		public void setJurisdiction_uri(String jurisdiction_uri) {
			this.jurisdiction_uri = jurisdiction_uri;
		}
		public String getJurisdiction_describe() {
			return jurisdiction_describe;
		}
		public void setJurisdiction_describe(String jurisdiction_describe) {
			this.jurisdiction_describe = jurisdiction_describe;
		}
		
}
