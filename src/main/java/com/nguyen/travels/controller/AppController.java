package com.nguyen.travels.controller;

import javax.validation.Valid;

import com.nguyen.travels.models.Expense;
import com.nguyen.travels.services.ExpenseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AppController {
	private final ExpenseService expenseService;
	
	public AppController(ExpenseService expenseService) {
		this.expenseService = expenseService;
	//  interacts w/expense service avoid errors
	}

	@RequestMapping("/expense")
	public String home(Model model) {
		// obj to the form to bind
		model.addAttribute( "expense", new Expense() );
		model.addAttribute("allExpense", this.expenseService.getAllExpenses());
		return "index.jsp";
	}



//		total expenses
	@PostMapping("/expense/adding")
	public String createExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}else {
			this.expenseService.createExpense(expense);
			return "redirect:/expense";
		}
		
	}

//	update total expense
	@RequestMapping("/expense/edit/{id}")
	public String editPage( @PathVariable("id") long id, Model model) {
		//passing in the obj to the form to bind IMportants!!!
		model.addAttribute( "expense", new Expense() );
		Expense expenseToEdit = this.expenseService.getOneExpense(id);
		model.addAttribute("expenseToEdit", expenseToEdit);
		return "editExpense.jsp";
	}
	
	@PutMapping("/expense/updating/{id}")
	public String updateExpense(@PathVariable("id") Long id ,@Valid @ModelAttribute("expenseToUpdate") Expense expenseToUpdate, BindingResult result) {
		if(result.hasErrors()) {
			return "editExpense.jsp";
		}else {
			this.expenseService.updatExpense(expenseToUpdate);
			return "redirect:/expense";
		}
		
	}
	

	@RequestMapping("/expense/delete/{id}")
	public String deleteAnExpense(@PathVariable("id") Long id) {
		this.expenseService.deleteOneExpense(id);
		return "redirect:/expense";
	}
	
	// display profile details
	@RequestMapping("/expense/show/{id}")
	public String showExpensePage(@PathVariable("id") long id, Model model) {
		Expense expenseToShow = this.expenseService.getOneExpense(id);
		model.addAttribute("expenseToShow", expenseToShow);
		return "displayDetails.jsp";
	}


	
	
}
