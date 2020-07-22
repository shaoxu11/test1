package com.sx.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sx.pojo.CpachaUtil;
import com.sx.pojo.Jurisdiction;
import com.sx.pojo.User;
import com.sx.service.UserService;
@SessionAttributes(value="user2",types={User.class})
@Controller
public class indexController {
	@Autowired
	private UserService us;
	//登录页面
	@RequestMapping({"/index",""})
	public String index() {
		return "index";
	}
	//验证吗
	@RequestMapping("/Cpachau")
	public void Cpachau(HttpServletResponse response,HttpServletRequest request,int a,int b,int c,String capchaType) {
		CpachaUtil cpachaUtil = new CpachaUtil(a,b,c);
		String generatorVCode = cpachaUtil.generatorVCode();
		request.getSession().setAttribute(capchaType,generatorVCode);
		BufferedImage generatorRotateVCodeImage = cpachaUtil.generatorRotateVCodeImage(generatorVCode, true);
		try {
			ImageIO.write(generatorRotateVCodeImage, "gif", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//登录
		@RequestMapping("/login")
		@ResponseBody
		public Map<String, String> login(String name, String password,HttpServletRequest request,String cpacha) {
			Map<String, String> map = new HashMap<String, String>();
			Object cc = request.getSession().getAttribute("denglu");
			if(!cpacha.toUpperCase() .equals(cc.toString().toUpperCase())) {
				map.put("type", "error");
				map.put("msg", "验证码输入错误");
				return map;
			}
			User user = us.loginUser(name, password);
			if(user == null) {
				map.put("type", "error");
				map.put("msg", "用户名或密码输入错误!");
				return map;
			}
			request.getSession().setAttribute("user1",user);
			map.put("type","success");
			map.put("msg", "登录成功");
			return map;
		}
		@RequestMapping("/menu")
		public String menu(HttpServletRequest request,Model model) {
			User user1 = (User) request.getSession().getAttribute("user1");
			int id = 0;
			if(user1 == null || user1== null) {
				id= 1;
			}else {
				id=user1.getId();
			}
			
			
			List<Jurisdiction> user2 = us.byidMenu(id);
			model.addAttribute("menu", user2);
			return "login";
		}
		//查询用户信息
		@RequestMapping("/allUser")
		public String selectUser(Model model,String uri,int user_id,int jurisdiction_parent){
			//,int user_id,int jurisdiction_parent
			List<User> list = us.allUser();
			List<Jurisdiction> button = us.byidButton(user_id, jurisdiction_parent);
			model.addAttribute("button", button);
			model.addAttribute("list", list);
 			return "allUser";
		}
		//跳转至分配权限页面,查询所有权限
		@RequestMapping("/Assgin")
		public String Assgin(Model model,String uri, int id) {
			ObjectMapper mapper = new ObjectMapper();
			List<Jurisdiction> list = us.Assgin();
			model.addAttribute("list", list);
			List<Jurisdiction> user2 = us.byidMenu(id);
			
			//获取1级菜单权限
			List<Jurisdiction> juri1 = us.Assginbyid1();
			//获取2级菜单权限
			List<Jurisdiction> juri2 = us.Assginbyid2();
			//获取3级菜单权限 
			List<Jurisdiction> juri3 = us.Assginbyid3();
			
			try {
				//1级菜单
				String json1 = mapper.writeValueAsString(juri1);
				//2级菜单
				String json2 = mapper.writeValueAsString(juri2);
				//3级菜单
				String json3 = mapper.writeValueAsString(juri3);
				String juri = mapper.writeValueAsString(user2);
			
				model.addAttribute("json1", json1);
				model.addAttribute("json2", json2);
				model.addAttribute("json3", json3);
				model.addAttribute("juri", juri);
				System.out.println(json1);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			model.addAttribute("juri1",juri1);
			model.addAttribute("juri2",juri2);
			model.addAttribute("juri3",juri3);
			model.addAttribute("id", id);
			return "Assgin";
		}
		
		
		@RequestMapping("/menuUser")
		public String menuUser() {
			return "menuUser";
		}
		//修改权限
		@RequestMapping("/updateRole")
		@ResponseBody
		public Map<String, String> updateRole(int[] ids,int id){
			System.out.println("id的值为"+id);
			Map<String,String> map = new HashMap<String,String>();
			//删除
			int row = us.delRole(id);
			int row2=0;
			for(int i=0;i<ids.length;i++) {
				row2 = us.addRole(ids[i], id);
			}
			if(row2<=0) {
				map.put("type", "error");
				map.put("msg","修改失败");
				return map;
			}
			map.put("type", "success");
			map.put("msg","修改成功");
			return map;
		}
		
		
	
		

}
