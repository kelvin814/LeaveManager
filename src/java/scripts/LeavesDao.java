/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scripts;


import scripts.LeavesModel;
import scripts.DbConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kimaiga
 */
public class LeavesDao {
    private Connection connection;
    public LeavesDao() {
        connection = DbConn.connectDB();
 }
//    public void deleteUser(int userId) {
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement("delete from tblUser where userid=?");
//   // Parameters start with 1
//   preparedStatement.setInt(1, userId);
//   preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//   e.printStackTrace();
//  }
// }
// 
// public void updateUser(LeavesModel user) throws ParseException {
//  try {
//   PreparedStatement preparedStatement = connection
//     .prepareStatement("update tblUser set lastname=?,email=?" +
//       "where userid=?");
//   // Parameters start with 1   
//   preparedStatement.setString(1, user.getLastName());
//   preparedStatement.setString(2, user.getEmail());   
//   preparedStatement.setInt(3, user.getUserid());
//   preparedStatement.executeUpdate();
//
//  } catch (SQLException e) {
//   e.printStackTrace();
//  }
// }

 public List<LeavesModel> getRequests() {
     List<LeavesModel> leaves = new ArrayList<>();
  try {
   Statement statement = connection.createStatement();
   ResultSet rs = statement.executeQuery("SELECT * FROM requests");
   while (rs.next()) {
    LeavesModel requests = new LeavesModel();
    requests.setName(rs.getString("name"));
    requests.setDepartment(rs.getString("department"));
    requests.setType(rs.getString("type"));
    requests.setStart(rs.getInt("start"));
    requests.setEnd(rs.getInt("end"));
    requests.setReason(rs.getString("reason"));
   }
  } catch (SQLException e) {
      e.printStackTrace();
  }
  return leaves;
 }

}
