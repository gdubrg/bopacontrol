package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Hashtable;
import java.util.Vector;

public class Prodotto {
	private String url = "jdbc:mysql://localhost:3306/";
	private String dbName = "oas";
	private String driver = "com.mysql.jdbc.Driver";
	private String userNameMySQL = "root"; 
	private String passwordMySQL = "root";
	private Vector <String> prodId = new Vector<String>();
	private Vector <String> prodName = new Vector<String>();
	private Vector <String> prodDesc = new Vector<String>();
	private Hashtable <String, String> errors;

	public void setProdId(String prodId) {
		this.prodId.add(prodId);
	}
	public String getProdId(int i) {
		return prodId.get(i);
	}
	public void setProdName(String nome){
		this.prodName.add(nome);
	}
	public String getProdName(int i){
		return prodName.get(i);	
	}
	public void setProdDesc(String descrizione){
		this.prodDesc.add(descrizione);
	}
	public String getProdDesc(int i){
		return prodDesc.get(i);	
	}
	public String getCurrentProdName(){
		return prodName.lastElement();	
	}
	public String getCurrentProdDesc(){
		return prodDesc.lastElement();	
	}
	public int countProd(){
		return prodName.size();
	}
	// insProd: inserisce un prodotto che potrà essere messo in vendita
	public void insProd(String username, String nome, String descrizione){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un username non nullo
			if(!username.equals("") && !username.isEmpty()){
				String strQuery="insert into prodotto (nome, descrizione, username) values (?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(strQuery);
                pst.setString(1, nome);
                pst.setString(2, descrizione);
                pst.setString(3, username);
        		pst.executeUpdate();
				pst.close();
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// viewOneProd: visualizza tutti i dati di un prodotto specifico
	public void viewOneProd(String idProd){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un id del prodotto non nullo
			if(!idProd.equals("") && !idProd.isEmpty()){
				String strQuery="select * from prodotto where idprodotto=?";
                PreparedStatement pst = con.prepareStatement(strQuery);
                pst.setString(1, idProd);
        		ResultSet rs = pst.executeQuery();
        		// accedo ai dati
				while(rs.next()){
					String nome = rs.getString("nome");
					String descrizione = rs.getString("descrizione");
					setProdName(nome);
					setProdDesc(descrizione);
				}
				pst.close();
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// viewProd: visualizza i prodotti dell'utente non ancora messi in vendita
	public void viewProd(String username){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un username non nullo
			if(!username.equals("") && !username.isEmpty()){
				String strQuery="select * from prodotto where username=? and invendita='0'";
                PreparedStatement pst = con.prepareStatement(strQuery);
                pst.setString(1, username);
        		ResultSet rs = pst.executeQuery();
        		// salvo i campi dei prodotti dell'utente nei vettori stringa della classe prodotto
				while(rs.next()){
					String nome = rs.getString("nome");
					String descrizione = rs.getString("descrizione");
					String idProd = rs.getString("idprodotto");
					setProdName(nome);
					setProdDesc(descrizione);
					setProdId(idProd);
				}
				pst.close();
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// sellProd: mette in vendita un prodotto che non sarà più visualizzabile nella sezione prodotti, bensì nella sezione aste
	public void sellProd(String idProd){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un idProd non nullo
			if(!idProd.equals("") && !idProd.isEmpty()){
				String strQuery="update prodotto set `invendita`=1 where idprodotto=?";
                PreparedStatement pst = con.prepareStatement(strQuery);
                pst.setString(1, idProd);
        		pst.executeUpdate();
				pst.close();
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// updateProd: modifica un prodotto che potrà essere messo in vendita
	public void updateProd(String idProd, String nome, String descrizione){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un idProd non nullo
			if(!idProd.equals("") && !idProd.isEmpty()){
				String strQuery="update prodotto set nome=?, descrizione=? where idprodotto=?";
                PreparedStatement pst = con.prepareStatement(strQuery);
        		pst.setString(1, nome);
        		pst.setString(2, descrizione);
        		pst.setString(3, idProd);
        		pst.executeUpdate();
				pst.close();
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// delProd: cancella un prodotto
	public void delProd(String idProd){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un idProd non nullo
			if(!idProd.equals("") && !idProd.isEmpty()){
				String strQuery="delete from prodotto where idprodotto=?";
                PreparedStatement pst = con.prepareStatement(strQuery);
                pst.setString(1, idProd);
        		pst.executeUpdate();
				pst.close();
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//////// Classi per gestire errori di inserimento //////////
	
	 public String getErrorMsg(String s) {
		    String errorMsg =(String)errors.get(s.trim());
		    return (errorMsg == null) ? "":errorMsg;
	 }
	
	// checkUpProd: metodo che controlla i campi nel form di modifica di un prodotto
	 public boolean checkUpProd(String upName, String upDesc) {
		    boolean bool=true;
		    errors = new Hashtable <String, String> ();
		    if (upName.isEmpty()) {
		      errors.put("upName","Please enter a product name");
		      upName="";
		      bool=false;
		    }
		    if (upDesc.isEmpty()) {
			      errors.put("upDesc","Please enter a product description");
			      upDesc="";
			      bool=false;
			}
		    return bool;
	}
	 
	// checkInsProd: metodo che controlla i campi del form per inserire un prodotto
	 public boolean checkInsProd(String username, String insName, String insDesc) {
	    boolean bool=true;
	    errors = new Hashtable <String, String> ();
	    if (insName.isEmpty()) {
	      errors.put("insName","Please enter a product name");
	      insName="";
	      bool=false;
	    }
	    if (insDesc.isEmpty()) {
		      errors.put("insDesc","Please enter a product description");
		      insDesc="";
		      bool=false;
		}
	    if (!insName.isEmpty()&&!insDesc.isEmpty()&&existingProd(username, insName, insDesc)) {
	        errors.put("insProd", "You have just inserted a product with this name and this description");
	        insName="";
	        insDesc="";
	        bool=false;
	    }
	    return bool;
	  }

	//existingProd: torna vera se il nome del prodotto e la descrizione data è già presente nel db tra i prodotti non in vendita dell'utente
	 public boolean existingProd(String username, String insName, String insDesc){
	  	boolean exists = false;
	 	try {
	 		Class.forName(driver).newInstance();
	 		Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
	 		// accedo al DB solo se ho dei campi non nulli
	 		if(!insName.isEmpty()&&!insDesc.isEmpty()&&!username.isEmpty()){
	 			String strQuery="select * from prodotto where invendita=0 and username=?";
	 			PreparedStatement pst = con.prepareStatement(strQuery);
	 			pst.setString(1, username);
	 			ResultSet rs = pst.executeQuery();
	 			while (rs.next()){
 					if (insName.equals(rs.getString("nome"))&&insDesc.equals(rs.getString("descrizione"))){
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
	 
     // checkSellProd: metodo che controlla i campi inseriti nel modulo di vendita
	 public boolean checkSellProd(String username, String idProd, String sellpb, String data, String ora) {
	    boolean bool=true;
	    errors = new Hashtable <String, String> ();
	    if (sellpb.isEmpty()) {
	      errors.put("sellpb","Please enter a reserve price");
	      sellpb="";
	      bool=false;
	    }
	    if (data.isEmpty()||ora.isEmpty()) {
	        errors.put("dataProd","Please enter a valid deadline");
	        bool=false;
	    }
	    if (!sellpb.isEmpty()&&!data.isEmpty()&&!ora.isEmpty()&&existingSell(username, idProd)) {
	        errors.put("sellProd","You have just sold this product in this session");
	        bool=false;
	    }
	    return bool;
	  }
	 
     //existingProd: torna vera se l'utente ha già messo in vendita un prodotto con lo stesso id nella stessa sessione
	 public boolean existingSell(String username, String idProd){
	  	boolean exists = false;
	 	try {
	 		Class.forName(driver).newInstance();
	 		Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
	 		// accedo al DB solo se ho dei campi non nulli
	 		if(!idProd.isEmpty()&&!username.isEmpty()){
	 			String strQuery="select username, idprodotto from asta where username=? and idprodotto=?";
	 			PreparedStatement pst = con.prepareStatement(strQuery);
	 			pst.setString(1, username);
	 			pst.setString(2, idProd);
	 			ResultSet rs = pst.executeQuery();
	 			if (rs.next()){
 					if (username.equals(rs.getString("username"))&&idProd.equals(rs.getString("idprodotto"))){
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
