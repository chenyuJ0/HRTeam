package com.cn.hrsystem.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.hrsystem.domain.Contract;
import com.cn.hrsystem.domain.Employee;
import com.cn.hrsystem.service.ContractService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/con")
public class ContractController {
	
	@Autowired
	private ContractService contractService;
	
	@RequestMapping("/findChange")
	public String findChange(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,Employee emp) {
		PageHelper.startPage(pn,5);
		List<Employee> list = contractService.findChange(emp);
		PageInfo<Employee> info = new PageInfo<Employee>(list);
		model.addAttribute("emp", emp);
		model.addAttribute("info",info);
		return "forward:/pages/contract/changerSelect.jsp";
	}
	
	@RequestMapping("/findDis")
	public String findDis(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,Employee emp) {
		PageHelper.startPage(pn,5);
		List<Employee> list = contractService.findDis(emp);
		PageInfo<Employee> info = new PageInfo<Employee>(list);
		model.addAttribute("emp", emp);
		model.addAttribute("info",info);
		return "forward:/pages/contract/dimissionSelect.jsp";
	}
	
	//已签订合同
	@RequestMapping("/findAllCons")
	public String findAllCons(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,Employee emp) {
		PageHelper.startPage(pn,5);
		List<Employee> list = contractService.findAllCons(emp);
		PageInfo<Employee> info = new PageInfo<Employee>(list);
		model.addAttribute("emp", emp);
		model.addAttribute("info",info);
		return "forward:/pages/contract/contractSelect.jsp";
	}
	
	@RequestMapping("/addCon")
	public String addCon(Contract contract,@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,Employee emp) {
		contractService.addContract(contract);
		PageHelper.startPage(pn,5);
		List<Employee> list = contractService.findAllCons(emp);
		PageInfo<Employee> info = new PageInfo<Employee>(list);
		model.addAttribute("emp", emp);
		model.addAttribute("info",info);
		return "forward:/pages/contract/contractSelect.jsp";
	}
	
	@RequestMapping("/deleteCon")
	public String deleteCon(@RequestParam(value="pn",defaultValue="1")Integer pn,Integer id,Model model,Employee emp) {
		contractService.deleteContractById(id);
		PageHelper.startPage(pn,5);
		List<Employee> list = contractService.findAllCons(emp);
		PageInfo<Employee> info = new PageInfo<Employee>(list);
		model.addAttribute("emp", emp);
		model.addAttribute("info",info);
		return "forward:/pages/contract/contractSelect.jsp";
	}
	
	//签订合同
	@RequestMapping("/signCon")
	public String signCon(@RequestParam(value="pn",defaultValue="1")Integer pn,Integer id,Model model) {
		//根据员工id查询数据
		Employee emp = contractService.findEmpAndConByEmpID(id);
		PageHelper.startPage(pn,5);
		List<Employee> list = contractService.findAllUnsignedContracts(emp);
		PageInfo<Employee> info = new PageInfo<Employee>(list);
		model.addAttribute("emp", emp);
		model.addAttribute("info",info);
		return "forward:/pages/contract/contractAdd.jsp";
	}
	
	//合同预警
	@RequestMapping("/findCW")
	public String findCW(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,Employee emp) {
		PageHelper.startPage(pn,5);
		List<Contract> list = contractService.findContractWarnning(emp);
		PageInfo<Contract> info = new PageInfo<Contract>(list);
		model.addAttribute("emp", emp);
		model.addAttribute("info",info);
		return "forward:/pages/contract/contractWarning.jsp";
	}
	
	//查找未签订合同的
	@RequestMapping("/findUsC")
	public String findUsC(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,Employee emp) {
		PageHelper.startPage(pn,5);
		List<Employee> list = contractService.findAllUnsignedContracts(emp);
		PageInfo<Employee> info = new PageInfo<Employee>(list);
		model.addAttribute("emp", emp);
		model.addAttribute("info",info);
		return "forward:/pages/contract/deContract.jsp";
	}
}
