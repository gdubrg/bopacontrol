package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Hashtable;

public class User {
	private String url = "jdbc:mysql://localhost:3306/";
	private String dbName = "oas";
	private String driver = "com.mysql.jdbc.Driver";
	private String userNameMySQL = "root"; 
	private String passwordMySQL = "root";
	private String username;
	private Hashtable <String, String> errors;
 
 public User(){  
 }
 public User(String account) {
	 setUsername(account);
 } 
 public void setUsername(String username) {
	 this.username=username;
 }
 public String getUsername() {
	 return username;
 }

// checkReg: metodo che controlla i campi del form per registrarsi
 public boolean checkReg(String firstName, String lastName, String email, String username, String password1, String password2) {
    boolean bool=true;
    errors = new Hashtable <String, String> ();
    if (firstName.equals("")) {
      errors.put("firstName","Please enter your first name");
      firstName="";
      bool=false;
    }
    if (lastName.equals("")) {
      errors.put("lastName","Please enter your last name");
      lastName="";
      bool=false;
    }
    if (email.equals("") || (email.indexOf('@') == -1)) {
      errors.put("email","Please enter a valid email address");
      email="";
      bool=false;
    }
    if (username.equals("")) {
      errors.put("username","Please enter a username");
      username="";
      bool=false;
    }
    else if (existingUser(username)) {
        errors.put("username", username+" already exists. Please choiche another username");
        username="";
        bool=false;
    }
    if (password1.equals("")) {
      errors.put("password1","Please enter a valid password");
      password1="";
      bool=false;
    }
    if (!password1.equals("") && (password2.equals("") || !password1.equals(password2))) {
      errors.put("password2","Please confirm your password");
      password2="";
      bool=false;
    }
    return bool;
  }//fine checkReg
 
 public String getErrorMsg(String s) {
    String errorMsg =(String)errors.get(s.trim());
    return (errorMsg == null) ? "":errorMsg;
  }
 
 // regUser: inserisce un nuovo utente
 public void regUser(String firstName, String lastName, String email, String username, String password1){
	try {
		Class.forName(driver).newInstance();
		Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
		String strQuery="insert into user (nome, cognome, email, username, password) values (?, ?, ?, ?, ?)";
		PreparedStatement pst = con.prepareStatement(strQuery);
        pst.setString(1, firstName);
        pst.setString(2, lastName);
        pst.setString(3, email);
        pst.setString(4, username);
        pst.setString(5, password1);
		pst.executeUpdate();
		pst.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
  }
 
 //logUser: ritorna vera se sono inseriti username e login presenti nel database
 public boolean logUser(String password1){
  	boolean log = false;
  	String username = getUsername();
	try {
		Class.forName(driver).newInstance();
		Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
		// accedo al DB solo se sono stati inseriti i campi username e password
		if(!username.isEmpty() && !password1.isEmpty()){
			String strQuery="select * from user where username=? and  password=?";
            PreparedStatement pst = con.prepareStatement(strQuery);
            pst.setString(1, username);
            pst.setString(2, password1);
    		ResultSet rs = pst.executeQuery();
			if (rs.next()){
				log=true;
			}
			pst.close();
		}
		con.close();
	} catch (Exception e) {
			e.printStackTrace();
	}
	return log;
  }

//existingUser: torna vera se l'username dato è già presente nel db
public boolean existingUser(String username){
 	boolean exists = false;
	try {
		Class.forName(driver).newInstance();
		Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
		// accedo al DB solo se è stato inserito il campo username
		if(!username.isEmpty()){
			String strQuery="select username from user";
			PreparedStatement pst = con.prepareStatement(strQuery);
			ResultSet rs = pst.executeQuery();
			while (rs.next()){
					if (username.equals(rs.getString("username"))){
						exists=true;
					}
			}
			pst.close();
		}
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return exists;
 }

}





