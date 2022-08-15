package com.nguyen.travels.repositories;

import com.nguyen.travels.models.Expense;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExpenseRepository  extends CrudRepository<Expense, Long>{
	
}
