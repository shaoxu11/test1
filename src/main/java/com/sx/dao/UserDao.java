package com.sx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sx.pojo.Jurisdiction;
import com.sx.pojo.User;

public interface UserDao {
	//登录
	public User loginUser(@Param("name")String name,@Param("password")String password);
	//查询所有用户信息
	public List<User> allUser();
	//显示用户所拥有的菜单
	public List<Jurisdiction> byidMenu(int id);
	//显示登录人的按钮
	public List<Jurisdiction> byidButton(@Param("user_id")int user_id,@Param("jurisdiction_parent")int jurisdiction_parent);
	//查询所有菜单
	public List<Jurisdiction> Assgin();
	//删除用户的所有权限
	public int delRole(int id);
	//添加用户权限
	public int addRole(@Param("ids")int ids,@Param("id")int id);
	//查询1级菜单
	public List<Jurisdiction> Assginbyid1();
	//查询2级菜单
	public List<Jurisdiction> Assginbyid2();
	//查询3级菜单
	public List<Jurisdiction> Assginbyid3();
        //是已收到吧
//参数
	


}
