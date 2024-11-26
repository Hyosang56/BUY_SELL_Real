package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static String URL = "jdbc:mysql://localhost:3306/buynselldb";
    private static String USER = "dbmgrid";
    private static String PASSWORD = "dbmgrpw";

    // 정적 메서드로 Connection 객체 반환
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("드라이버 로드 실패", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
