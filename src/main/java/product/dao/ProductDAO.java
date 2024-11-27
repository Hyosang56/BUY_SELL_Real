package product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.DBConnection;
import product.dto.ProductDTO;

public class ProductDAO {
	// 상품 등록
    public void insertProduct(ProductDTO product) throws SQLException {
        String sql = "INSERT INTO product(p_id, p_name, p_price, p_description, p_fileName, buycheck, userid)"
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, product.getP_id());
            pstmt.setString(2, product.getP_name());
            pstmt.setInt(3, product.getP_price());
            pstmt.setString(4, product.getP_description());
            pstmt.setString(5, product.getP_fileName());
            pstmt.setInt(6, product.getBuycheck());
            pstmt.setString(7, product.getUserid());
            pstmt.executeUpdate();
        }
    }

    // 상품 목록 가져오기
    public List<ProductDTO> getAllProducts() throws SQLException {
        List<ProductDTO> products = new ArrayList<>();
        String sql = "SELECT * FROM product";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setP_id(rs.getString("p_id"));
                product.setP_name(rs.getString("p_name"));
                product.setP_price(rs.getInt("p_price"));
                product.setP_description(rs.getString("p_description"));
                product.setP_fileName(rs.getString("p_fileName"));
                product.setBuycheck(rs.getInt("buycheck"));
                product.setUserid(rs.getString("userid"));
                products.add(product);
            }
        }
        return products;
    }

    // 상품 ID 중복 여부 확인
    public boolean isProductIdDuplicate(String productId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM product WHERE p_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, productId);
	            try (ResultSet rs = pstmt.executeQuery()) {
	                if (rs.next()) {
	                    return rs.getInt(1) > 0;
	                }
	            }
        }
        return false;
    }
    
    public ProductDTO findProduct(String productId) throws SQLException{
    	String sql = "select * from product where p_id = ?";
    	 try (Connection conn = DBConnection.getConnection();
              PreparedStatement pstmt = conn.prepareStatement(sql)) { 
                pstmt.setString(1, productId);
                try (ResultSet rs = pstmt.executeQuery()){
	                if (rs.next()) {
	                	ProductDTO product = new ProductDTO(); // 데이터가 있을 때만 객체 생성
	                	product.setP_id(rs.getString("p_id"));
	                    product.setP_name(rs.getString("p_name"));
	                    product.setP_price(rs.getInt("p_price"));
	                    product.setP_description(rs.getString("p_description"));
	                    product.setP_fileName(rs.getString("p_fileName"));
	                    product.setBuycheck(rs.getInt("buycheck"));
	                    product.setUserid(rs.getString("userid"));
	                    return product;
	                }
                }
            }        	 
    	 return null;
    }
    
    public void buyProduct(ProductDTO product, String buyid) throws SQLException {
    	String sql = "UPDATE product SET buy_userid=?, buycheck=? WHERE p_id=?";
     try (Connection conn = DBConnection.getConnection();
          PreparedStatement pstmt = conn.prepareStatement(sql)) {
         pstmt.setString(1, buyid);
         pstmt.setInt(2, 1);
         pstmt.setString(3, product.getP_id());
         pstmt.executeUpdate();
     	}
    	
    }
    public List<ProductDTO> findSellUserid(String userid) throws SQLException {
        List<ProductDTO> products = new ArrayList<>();
        String sql = "select * from product where userid = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	 pstmt.setString(1, userid);
             try(ResultSet rs = pstmt.executeQuery()) {
            	while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setP_id(rs.getString("p_id"));
                product.setP_name(rs.getString("p_name"));
                product.setP_price(rs.getInt("p_price"));
                product.setP_description(rs.getString("p_description"));
                product.setP_fileName(rs.getString("p_fileName"));
                product.setBuycheck(rs.getInt("buycheck"));
                product.setUserid(rs.getString("userid"));
                products.add(product);
            	}
           }
        }
        return products;
    }
    public List<ProductDTO> findBuyUserid(String userid) throws SQLException {
        List<ProductDTO> products = new ArrayList<>();
        String sql = "select * from product where buy_userid = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	 pstmt.setString(1, userid);
             try(ResultSet rs = pstmt.executeQuery()) {
            	while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setP_id(rs.getString("p_id"));
                product.setP_name(rs.getString("p_name"));
                product.setP_price(rs.getInt("p_price"));
                product.setP_description(rs.getString("p_description"));
                product.setP_fileName(rs.getString("p_fileName"));
                product.setBuycheck(rs.getInt("buycheck"));
                product.setUserid(rs.getString("userid"));
                products.add(product);
            	}
           }
        }
        return products;
    }
    public void updateProduct(ProductDTO product) throws SQLException {
        if(product.getP_fileName() != null) {
        	String sql = "UPDATE product SET p_name=?, p_price=?, p_description=?, p_fileName=? WHERE p_id=?";
         try (Connection conn = DBConnection.getConnection();
              PreparedStatement pstmt = conn.prepareStatement(sql)) {
             pstmt.setString(1, product.getP_name());
             pstmt.setInt(2, product.getP_price());
             pstmt.setString(3, product.getP_description());
             pstmt.setString(4, product.getP_fileName());
             pstmt.setString(5, product.getP_id());
             pstmt.executeUpdate();
         }
        	
        } else {
        	String sql = "UPDATE product SET p_name=?, p_price=?, p_description=? WHERE p_id=?";
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, product.getP_name());
                pstmt.setInt(2, product.getP_price());
                pstmt.setString(3, product.getP_description());
                pstmt.setString(4, product.getP_id());
                pstmt.executeUpdate();
        	
            }
    	
        }
    }
    public void deleteProduct(String productId) throws SQLException {
    	String sql = "delete from product where p_id = ?";
     try (Connection conn = DBConnection.getConnection();
          PreparedStatement pstmt = conn.prepareStatement(sql)) {
         pstmt.setString(1, productId);
         pstmt.executeUpdate();
     	}
    }
    public List<ProductDTO> getSearch(String search) throws SQLException {
        List<ProductDTO> products = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE p_name LIKE ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	 pstmt.setString(1,"%"+ search +"%");
             try(ResultSet rs = pstmt.executeQuery()) {
            	while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setP_id(rs.getString("p_id"));
                product.setP_name(rs.getString("p_name"));
                product.setP_price(rs.getInt("p_price"));
                product.setP_description(rs.getString("p_description"));
                product.setP_fileName(rs.getString("p_fileName"));
                product.setBuycheck(rs.getInt("buycheck"));
                product.setUserid(rs.getString("userid"));
                products.add(product);
            	}
           }
        }
        return products;
    }
    
}
