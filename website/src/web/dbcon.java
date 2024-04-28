package web;

import java.sql.*;

import com.mysql.jdbc.Connection;

public class dbcon {

		public static Connection connect() throws SQLException ,ClassNotFoundException
		{
			Connection db;
			Class.forName("com.mysql.jdbc.Driver");
			db= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","admin");
			return db;
		}
}
