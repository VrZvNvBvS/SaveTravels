package com.nguyen.travels.services;

import org.springframework.stereotype.Service;

import com.nguyen.travels.models.Expense;
import com.nguyen.travels.repositories.ExpenseRepository;
import java.util.List;

@Service
public class ExpenseService {
	
	private final ExpenseRepository expenseRepo;

	public ExpenseService (ExpenseRepository expenseRepo) {
		this.expenseRepo = expenseRepo;
	}
	

	public Expense createExpense(Expense addExpense) {
		return this.expenseRepo.save(addExpense);
		
	}
	

	public List<Expense> getAllExpenses() {
		return (List<Expense>)this.expenseRepo.findAll();
	}
	
	//update expense
	public Expense updatExpense(Expense expense) {
		return this.expenseRepo.save(expense);
	}
	

	public Expense getOneExpense(Long id) {
		return this.expenseRepo.findById(id).orElse(null);
	}

	public void deleteOneExpense(Long id) {
		this.expenseRepo.deleteById(id);
	}
	
}
