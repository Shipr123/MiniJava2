package com.genx.dao;

import java.sql.SQLException;
import java.util.List;

import com.genx.model.Product;

public interface ProductDao {

	void insertTodo(Product todo) throws SQLException;

	Product selectTodo(long todoId);

	List<Product> selectAllTodos();

	boolean deleteTodo(int id) throws SQLException;

	boolean updateTodo(Product todo) throws SQLException;

}