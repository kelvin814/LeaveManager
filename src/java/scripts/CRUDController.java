/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scripts;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import java.util.HashMap;
import scripts.LeavesDao;
import scripts.jTable;


/**
 *
 * @author kimaiga
 */
public class CRUDController extends HttpServlet {

 private static final long serialVersionUID = 1L;
 private LeavesDao dao;
 
 public CRUDController() {
     dao=new LeavesDao();
 }
 
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 }
 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//     Gson gson = new GsonBuilder().setPrettyPrinting().create();
if(request.getParameter("action")!=null){
   List<jTable> leaves = new ArrayList<>();
   String action=(String)request.getParameter("action");
   Gson gson = new Gson();
   response.setContentType("application/json");
   
   if(action.equals("list")){
    try{      
    //Fetch Data from requests Table
    leaves = dao.getRequests();
    //Convert Java Object to Json    
    JsonElement element = gson.toJsonTree(leaves, new TypeToken<List<jTable>>() {}.getType());
    JsonArray jsonArray = element.getAsJsonArray();
    String listData=jsonArray.toString();    
    //Return Json in the format required by jTable plugin
    listData="{\"Result\":\"OK\",\"Records\":"+listData+"}";   
    response.getWriter().print(listData);
    }catch(Exception ex){
     String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}";
     response.getWriter().print(error);
     ex.printStackTrace();
    }    
   }
//   if(action.equals("delete")){//Delete record
//    try{
//     if(request.getParameter("userid")!=null){
//      String userid=(String)request.getParameter("userid");
////      dao.deleteUser(Integer.parseInt(userid));
//da
//      String listData="{\"Result\":\"OK\"}";        
//      response.getWriter().print(listData);
//     }
//    }catch(Exception ex){
//    String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getStackTrace().toString()+"}";
//    response.getWriter().print(error);
//   }    
//  }
  }
 }
 
}