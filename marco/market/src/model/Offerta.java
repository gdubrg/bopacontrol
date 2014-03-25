package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Hashtable;
import java.util.Vector;

public class Offerta {
	private String url = "jdbc:mysql://localhost:3306/";
	private String dbName = "oas";
	private String driver = "com.mysql.jdbc.Driver";
	private String userNameMySQL = "root"; 
	private String passwordMySQL = "root";
	private Vector <String> astaIdOfferente = new Vector<String>();
	private Vector <Integer> offerta = new Vector<Integer>();
	private Vector <String> offerente = new Vector<String>();
	private Vector <String> astaScad = new Vector<String>();
	private Hashtable <String, String> errors;
	
	public void setAstaIdOfferente(String astaIdOfferente) {
		this.astaIdOfferente.add(astaIdOfferente);
	}
	public String getAstaIdOfferente(int i) {
		return astaIdOfferente.get(i);
	}
	public void setOfferta(Integer offerta){
		this.offerta.add(offerta);
	}
	public Integer getOfferta(int i){
		return offerta.get(i);	
	}
	public void setOfferente(String offerente){
		this.offerente.add(offerente);
	}
	public String getOfferente(int i){
		return offerente.get(i);	
	}
	public int countAsteOfferente(){
		return astaIdOfferente.size();
	}
	public void setAstaScad(String astaScad){
		this.astaScad.add(astaScad);
	}
	public String getAstaScad(int i){
		return astaScad.get(i);	
	}
	
	// newOfferta: l'utente partecipa ad un'asta -> crea una nuova offerta
	public void newOfferta(String username, String idAsta, Integer offerta){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un username non nullo
			if(!username.equals("") && !username.isEmpty()){
				String strQuery="insert into offer (idasta, offerta, offerente, data) values (?, ?, ?, now())";
                PreparedStatement pst = con.prepareStatement(strQuery);
                pst.setString(1, idAsta);
                pst.setInt(2, offerta);
                pst.setString(3, username);
        		pst.executeUpdate();
				pst.close();
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// viewOfferta: visualizza l'offerta massima e corrispondente offerente di una specifica asta (e anche la scadenza dell'asta)
	public void viewOfferta(String idAsta){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un id dell'asta non nullo
			if(!idAsta.equals("") && !idAsta.isEmpty()){
				String strQuery="select offerta, offerente, a.scadenza from offer o, asta a where o.idasta =?" +
						        "and o.idasta = a.idasta and offerta in (select max(offerta) from offer o1 where o1.idasta =?)";
				PreparedStatement pst = con.prepareStatement(strQuery);
                pst.setString(1, idAsta);
                pst.setString(2, idAsta);
        		ResultSet rs = pst.executeQuery();
        		// accedo ai dati
				while(rs.next()){
					Integer offerta = rs.getInt("offerta");
					String offerente = rs.getString("offerente");
					String scadenza = rs.getString("scadenza");
					setOfferta(offerta);
					setOfferente(offerente);
					setAstaScad(scadenza);
				}
				pst.close();
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// viewAsteOfferente: dato il nome di un utente salva tutti gli id delle aste per cui l'utente stesso abbia fatto almeno un'offerta
	public void viewAsteOfferente(String offerente){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un offerente non nullo
			if(!offerente.equals("") && !offerente.isEmpty()){
				String strQuery="select distinct(idasta) from offer where offerente =?";
                PreparedStatement pst = con.prepareStatement(strQuery);
                pst.setString(1, offerente);
        		ResultSet rs = pst.executeQuery();
        		// accedo ai dati
				while(rs.next()){
					String idAsta = rs.getString("idasta");
					setAstaIdOfferente(idAsta);
				}
				pst.close();
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	////////Classi per gestire errori di offerta //////////
		
	public String getErrorMsg(String s) {
		    String errorMsg =(String)errors.get(s.trim());
		    return (errorMsg == null) ? "":errorMsg;
	}	
	
    // checkOffer: metodo che gestisce e comunica errori riguardo il tentato inserimento di un'offerta nel database
	 public boolean checkOffer(String username, String idAsta, Integer off) {
	    boolean bool=true;
	    errors = new Hashtable <String, String> ();
	    String offstring = off.toString();
	    if (offstring.equals("-1")) {
	      errors.put("off","Please enter an offer");
	      bool=false;
	    }
	    if (!offstring.equals("-1")&&existingOff(username, idAsta, offstring)) {// non creo un messaggio di errore
	        bool=false;// metto a false la variabile booleana in modo che la Servlet sappia di non accettare un'offerta già fatta
	    }
	    if (!offstring.equals("-1")&&failOffer(username, idAsta, off)) {
	    	errors.put("failoff","Someone just did a best offer. Please reclick on menu item called Aste.");
	        bool=false;
	    }
	    return bool;
	  }
	 
    //existingOff: torna vera se l'utente ha già fatto la stessa offerta per una stessa asta
	 public boolean existingOff(String username, String idAsta, String off){
	  	boolean exists = false;
	 	try {
	 		Class.forName(driver).newInstance();
	 		Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
	 		// accedo al DB solo se ho dei campi non nulli
	 		if(!idAsta.isEmpty()&&!username.isEmpty()){
	 			String strQuery="select idasta from offer where offerente=? and idasta=? and offerta=?";
	 			PreparedStatement pst = con.prepareStatement(strQuery);
	 			pst.setString(1, username);
	 			pst.setString(2, idAsta);
	 			pst.setString(3, off);
	 			ResultSet rs = pst.executeQuery();
	 			if (rs.next()){
	 				System.out.println("Tentativo non intenzionale di inviare un'offerta con stessa offerta. Probabilmente" +
							       "a causa di un refresh della pagina di aste appena subito dopo un'offerta valida dell'utente.");
					exists=true;
	 			}
	 			pst.close();
	 		}
	 		con.close();
	 	} catch (Exception e) {
	 		e.printStackTrace();
	 	}
	 	return exists;
	  }
	 
    //failOffert: torna vera se un utente ha già fatto un'offerta pari o superiore a quella dell'utente
	 public boolean failOffer(String username, String idAsta, Integer off){
	  	boolean exists = false;
	 	try {
	 		Class.forName(driver).newInstance();
	 		Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
	 		// accedo al DB solo se ho dei campi non nulli
	 		if(!idAsta.isEmpty()&&!username.isEmpty()){
	 			String strQuery="select max(offerta) as maxofferta from offer where idasta=? and offerente not in" +
	 					"(select offerente from offer where offerente=?)";
	 			PreparedStatement pst = con.prepareStatement(strQuery);
	 			pst.setString(1, idAsta);
	 			pst.setString(2, username);
	 			ResultSet rs = pst.executeQuery();
	 			if (rs.next()){
	 				if (rs.getInt("maxofferta")>= off){
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
