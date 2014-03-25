package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Asta;
import model.Offerta;
import model.Prodotto;
import model.User;

/**
 * Servlet implementation class ControllerServlet
 */
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String userPath=""; // path della pagina JSP
	    String op = request.getParameter("op");
	    HttpSession session = request.getSession(true);
	    Asta a = new Asta ();
		Offerta o = new Offerta ();
		Prodotto p = new Prodotto ();
		User u = (User) session.getAttribute("user");
		
	    // Pagina di registrazione
	   if ("regmodule".equals(op)){
		   userPath = "/register";
		}
	   if ("loginreturn".equals(op)){
		   userPath = "/login";
	   }
	    // Pagina di benvenuto dopo aver effettuato il login
	   if ("home".equals(op)){
		   userPath = "/home";
		}
	   // Pagina dei prodotti dell'utente non ancora messi in vendita
	   if ("prodotto".equals(op)||"del".equals(op)){
		   // Cancellazione di un prodotto
		   if ("del".equals(op)){
			   p.delProd(request.getParameter("idProd"));
		   }
		   p.viewProd(u.getUsername());
		   session.setAttribute("prod", p);
		   userPath = "/prodotto";
		}  
	   // Modifica di un prodotto
	   if ("upProdOK".equals(op)){
		   String upName = request.getParameter("upName");
		   String upDesc = request.getParameter("upDesc");
		   // Se i campi non sono inseriti correttamente-> errore
		   if(!p.checkUpProd(upName, upDesc)){
		    session.setAttribute("upName",upName);
		    session.setAttribute("upDesc",upDesc);
		    session.setAttribute("errun",p.getErrorMsg("upName"));
		    session.setAttribute("errud",p.getErrorMsg("upDesc"));
		    userPath = "/upProdErr";
		   }
		   // altrimenti se i campi sono inseriti correttamente -> inserimento avvenuto 
		   else {
			p.updateProd(request.getParameter("idProd"), upName, upDesc);
			p.viewProd(u.getUsername());
			session.setAttribute("prod", p);
			userPath = "/prodotto";
		   }
	   }
	   // Modulo di inserimento di un prodotto da mettere ancora in vendita
	   if ("ins".equals(op)){
		   userPath = "/inserter";
	   }
	   // Modulo di messa in vendita di un prodotto
	   if ("sell".equals(op)){
		 //Costruisco dei formati data yyyy-mm-dd hh:mm:ss da passare alla pagina sell.jsp
		   SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		   Date now = new Date();
		   String strTime = sdfTime.format(now);
		   session.setAttribute("timedefault", strTime);
		   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		   Calendar c = Calendar.getInstance();
		   c.add(Calendar.DATE, 3);
		   session.setAttribute("datedefault", dateFormat.format(c.getTime()));
		   c.add(Calendar.DATE, 4);
		   session.setAttribute("datemax", dateFormat.format(c.getTime()));
		   userPath = "/sell";
	   }
	   // Modulo di modifica di un prodotto da mettere ancora in vendita
	   if ("upProd".equals(op)){ 
		   userPath = "/upProd";
	   } 
	   // Pagina di tutte le aste aperte
	   if ("asta".equals(op)){
		   a.viewOtherAsta(u.getUsername());
		   session.setAttribute("ast", a);
		   session.setAttribute("offer", o);
		   session.setAttribute("prod", p);
		   userPath = "asta";
		}
	   // Pagina di tutte le aste create o a cui ha partecipato l'utente
	   if ("asteuser".equals(op)){
		   String username = u.getUsername();
		   a.viewAstaCreate(username);
		   o.viewAsteOfferente(username);
		   session.setAttribute("ast", a);
		   session.setAttribute("offer", o);
		   session.setAttribute("prod", p);
		   userPath = "asteuser";
		}
	   
	    // logout: torna alla pagina di login annullando la sessione
	   if ("logout".equals(op)){
		   session.invalidate();
		   userPath = "/login";
		}
	   
	   //uso RequestDispatcher per reindirizza la richiesta alla view con nome userPath
       String url = userPath + ".jsp";
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        } 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPath=""; // path della pagina JSP
	    String op = request.getParameter("op");
	    HttpSession session = request.getSession(true);
	    Asta a = new Asta ();
		Offerta o = new Offerta ();
		Prodotto p = new Prodotto ();
		User u = (User) session.getAttribute("user");
	    
	    // Login
	    if ("login".equals(op) || op==null){
	       u = new User(request.getParameter("username"));
	       // se non è istanziato l'oggetto user o se username e password non sono validi, ritorno alla pagina di login
	       if (u==null||!u.logUser(request.getParameter("password1")))
	    	   userPath = "/login";
	       // se il login è andato a buon fine, vado alla pagina di benvenuto
	       else {
	         session.setAttribute("user",u);
	         userPath = "/home";
	       }
	    }
	    
	    // Registrazione utente
	    if ("reg".equals(op)){
	    	u = new User(request.getParameter("username"));
		    String usernameins = request.getParameter("usernameins");
		    String firstName = request.getParameter("firstName");
		    String lastName = request.getParameter("lastName");
		    String email = request.getParameter("email");
		    String password1 = request.getParameter("password1");
		    String password2 = request.getParameter("password2");
		    // Se i campi sono inseriti correttamente
		    // -> registrazione avvenuta e indirizzamento alla pagina per fare il primo login  
		    if(u.checkReg(firstName, lastName, email, usernameins, password1, password2)){
		    	u.regUser(firstName, lastName, email, usernameins, password1);
		    	userPath = "/login";
		    }
		    // Altrimenti se i campi non sono inseriti correttamente
		    // -> presentazione dello stesso form con indicazione sui campi mal compilati
		    else {
		    	session.setAttribute("firstName",firstName);
		    	session.setAttribute("usernameins",usernameins);
		    	session.setAttribute("lastName",lastName);
		    	session.setAttribute("email",email);
		    	session.setAttribute("password1",password1);
		    	session.setAttribute("password2",password2);
		    	session.setAttribute("errf",u.getErrorMsg("firstName"));
		    	session.setAttribute("erru",u.getErrorMsg("username"));
		    	session.setAttribute("errl",u.getErrorMsg("lastName"));
		    	session.setAttribute("errp1",u.getErrorMsg("password1"));
		    	session.setAttribute("errp2",u.getErrorMsg("password2"));
		    	session.setAttribute("erre",u.getErrorMsg("email"));
		    	userPath = "/retry";
		    }
	    }
	    
	   // Offerta per un prodotto e riaggiornamento della pagina di tutte le aste aperte dagli altri utenti
	   if ("off".equals(op)){
		   String username = u.getUsername();
		   Integer off = -1;
		   if (!request.getParameter("offerta").isEmpty()){
			   off = Integer.parseInt(request.getParameter("offerta"));
		   }
		   String idAsta = request.getParameter("idAsta");
		// se c'è un errore nel momento della conferma della vendita di un prodotto -> pagina con errore notificato
		   if(!o.checkOffer(u.getUsername(), idAsta, off)){
		    	session.setAttribute("off",off);
		    	session.setAttribute("erro",o.getErrorMsg("off"));
		    	session.setAttribute("errfo",o.getErrorMsg("failoff"));
		    	userPath = "/astaErr";
		   }
		// altrimenti l'offerta è possibile
		   else{
		   o.newOfferta(username, idAsta, off);
		   a.viewOtherAsta(username);
		   session.setAttribute("ast", a);
		   session.setAttribute("offer", o);
		   session.setAttribute("prod", p);
		   userPath = "asta";
		   }
		}
	   
	   // Inserimento di un prodotto e riaggiornamento della pagina dei prodotti dell'utente
	   if ("insOK".equals(op)){
		    String insName = request.getParameter("insName");
		    String insDesc = request.getParameter("insDesc");
		    // Se i campi non sono inseriti correttamente-> errore
		    if(!p.checkInsProd(u.getUsername(), insName, insDesc)){
		    	session.setAttribute("insName",insName);
		    	session.setAttribute("insDesc",insDesc);
		    	session.setAttribute("errn",p.getErrorMsg("insName"));
		    	session.setAttribute("errd",p.getErrorMsg("insDesc"));
		    	session.setAttribute("errp",p.getErrorMsg("insProd"));
		    	userPath = "/inserterErr";
		    }
		    // altrimenti se i campi sono inseriti correttamente -> inserimento avvenuto 
		    else {
			    p.insProd(u.getUsername(), insName, insDesc);
				p.viewProd(u.getUsername());
				session.setAttribute("prod", p);
				userPath = "/prodotto";
		    }
	   }
	   // Vendita di un prodotto: cambio il flag del prodotto, creo l'asta, creo un'offerta automatica pari a 0
	   if ("sellOK".equals(op)){
		   String idProd = request.getParameter("idProd");
		   String sellpb = request.getParameter("sellpb");
		   String data = request.getParameter("data");
		   String ora = request.getParameter("ora");
		   String username = u.getUsername();
		   // se c'è un errore nel momento della conferma della vendita di un prodotto -> pagina con errore notificato
		   if(!p.checkSellProd(u.getUsername(), idProd, sellpb, data, ora)){
		    	session.setAttribute("sellpb",sellpb);
		    	session.setAttribute("errs",p.getErrorMsg("sellProd"));
		    	session.setAttribute("errspb",p.getErrorMsg("sellpb"));
		    	session.setAttribute("errd",p.getErrorMsg("dataProd"));
		    	userPath = "/sellErr";
		   }
		  // altrimenti la vendita è possibile
		   else{
			   p.sellProd(idProd);
			   String scadenza = data + " " + ora;
			   a.newAsta(username, idProd, sellpb, Timestamp.valueOf(scadenza));
			   o.newOfferta("nessuno", a.prodtoAsta(idProd), 0);
			   p.viewProd(u.getUsername());
			   session.setAttribute("prod", p);
		   	   userPath = "/prodotto";
		   }
	   }
	   //uso RequestDispatcher per reindirizzare la richiesta alla view con nome userPath
       String url = userPath + ".jsp";
        try {
            request.getRequestDispatcher(url).forward(request, response);
            //return;
        } catch (Exception ex) {
            ex.printStackTrace();
        }   
	}
	

}
