package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Vector;

public class Asta {
	private String url = "jdbc:mysql://localhost:3306/";
	private String dbName = "oas";
	private String driver = "com.mysql.jdbc.Driver";
	private String userNameMySQL = "root"; 
	private String passwordMySQL = "root";
	private Vector <String> astaId = new Vector<String>();
	private Vector <String> astaScad = new Vector<String>();
	private Vector <Integer> astaPrezzo = new Vector<Integer>();
	private Vector <String> prodId = new Vector<String>();
	
	public void setAstaId(String astaId) {
		this.astaId.add(astaId);
	}
	public String getAstaId(int i) {
		return astaId.get(i);
	}
	public void setAstaScad(String astaScad){
		this.astaScad.add(astaScad);
	}
	public String getAstaScad(int i){
		return astaScad.get(i);	
	}
	public void setAstaPrezzo(Integer astaPrezzo){
		this.astaPrezzo.add(astaPrezzo);
	}
	public Integer getAstaPrezzo(int i){
		return astaPrezzo.get(i);	
	}
	public void setProdId(String prodId) {
		this.prodId.add(prodId);
	}
	public String getProdId(int i) {
		return prodId.get(i);
	}
	public int countAsta(){
		return astaId.size();
	}
	
	// newAsta: mette in vendita un prodotto -> crea una nuova asta
	public void newAsta(String username, String idProd, String astaPrezzo, Timestamp astaScad){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un username non nullo
			if(!username.equals("") && !username.isEmpty()){
				String strQuery="insert into asta (idprodotto, prezzo_base, username, scadenza) values (?, ?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(strQuery);
                pst.setString(1, idProd);
                pst.setString(2, astaPrezzo);
                pst.setString(3, username);
                pst.setTimestamp(4, astaScad);
        		pst.executeUpdate();
				pst.close();
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// prodtoAsta: dato un idprodotto restituisce il corrispondente idasta
	public String prodtoAsta(String idProd){
		String idAsta = "";
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un idProd non nullo
			if(!idProd.equals("") && !idProd.isEmpty()){
				String strQuery="select idasta from asta where idprodotto=?";
		        PreparedStatement pst = con.prepareStatement(strQuery);
		        pst.setString(1, idProd);
				ResultSet rs = pst.executeQuery();
				// accedo alla tabella asta, alla riga del prodotto scelto
				if(rs.next()){
					idAsta = rs.getString("idasta");
				}
				pst.close();
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return idAsta;
	}
	
	// astatoProd: dato un idasta restituisce il corrispondente idprodotto
	public String astatoProd(String idAsta){
		String idProd = "";
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un idAsta non nullo
			if(!idAsta.equals("") && !idAsta.isEmpty()){
				String strQuery="select idprodotto from asta where idasta=?";
	            PreparedStatement pst = con.prepareStatement(strQuery);
	            pst.setString(1, idAsta);
	    		ResultSet rs = pst.executeQuery();
	    		// accedo alla tabella asta, alla riga del prodotto scelto
				if(rs.next()){
					idProd = rs.getString("idprodotto");
				}
				pst.close();
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return idProd;
	}
	
	// viewOtherAsta: visualizza tutte le aste aperte in ordine crescente di scadenza (tranne quelle create dall'utente corrente)
	public void viewOtherAsta(String username){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			String strQuery="select * from asta where scadenza>=now() and username not in" +
					         "(select username from asta where username=?) order by scadenza";
            PreparedStatement pst = con.prepareStatement(strQuery);
            pst.setString(1, username);
    		ResultSet rs = pst.executeQuery();
    		// accedo ai dati
			while(rs.next()){
				String prodId = rs.getString("idprodotto");
				String astaId = rs.getString("idasta");
				String scad = rs.getString("scadenza");
				Integer prezzo = rs.getInt("prezzo_base");
				setAstaScad(scad);
				setProdId(prodId);
				setAstaId(astaId);
				setAstaPrezzo(prezzo);
			}
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	// viewAsta: visualizza tutte le aste aperte in ordine crescente di scadenza
	public void viewAsta(){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			String strQuery="select * from asta where scadenza>=now() order by scadenza";
            PreparedStatement pst = con.prepareStatement(strQuery);
    		ResultSet rs = pst.executeQuery();
    		// accedo ai dati
			while(rs.next()){
				String prodId = rs.getString("idprodotto");
				String astaId = rs.getString("idasta");
				String scad = rs.getString("scadenza");
				Integer prezzo = rs.getInt("prezzo_base");
				setAstaScad(scad);
				setProdId(prodId);
				setAstaId(astaId);
				setAstaPrezzo(prezzo);
			}
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// viewAstaCreate: visualizza tutte le aste create dall'utente
	public void viewAstaCreate(String username){
		try {
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(url + dbName, userNameMySQL, passwordMySQL);
			// accedo al DB solo se ho un username non nullo
			if(!username.equals("") && !username.isEmpty()){
				String strQuery="select idasta, idprodotto, scadenza  from asta where username=?";
		        PreparedStatement pst = con.prepareStatement(strQuery);
		        pst.setString(1, username);
				ResultSet rs = pst.executeQuery();
				// accedo ai dati
				while(rs.next()){
					String astaId = rs.getString("idasta");
					String prodId = rs.getString("idprodotto");
					String scad = rs.getString("scadenza");
					setAstaScad(scad);
					setProdId(prodId);
					setAstaId(astaId);
				}
				pst.close();

			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
