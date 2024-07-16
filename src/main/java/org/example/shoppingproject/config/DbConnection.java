package org.example.shoppingproject.config;

import org.postgresql.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public interface DbConnection {
    static Connection getConnection() throws SQLException {
        DriverManager.registerDriver(new Driver());
        return DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping", getProperties());
    }

    static Properties getProperties(){
        Properties properties = new Properties();
        properties.put("user","postgres");
        properties.put("password","990099413o");
        return properties;
    }


}
