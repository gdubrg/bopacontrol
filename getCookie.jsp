<%
String soglia11="500";
String soglia12="600";
String soglia13="700";
String statoSis = "0";

Cookie cookie = null;
Cookie[] cookies = null;
cookies = request.getCookies();

if(cookies != null){
if(cookies.length < 2){
    }
    else{
    for(int i=0;i<cookies.length;i++){
        cookie = cookies[i];
        if(cookie.getName().compareTo("sogliaT") == 0)
            soglia11 = cookie.getValue();
        if(cookie.getName().compareTo("sogliaP") == 0)
            soglia12 = cookie.getValue();
        if(cookie.getName().compareTo("sogliaE") == 0)
            soglia13 = cookie.getValue();
        if(cookie.getName().compareTo("stato") == 0)
            statoSis = cookie.getValue();
        }
    }
    }

%>
