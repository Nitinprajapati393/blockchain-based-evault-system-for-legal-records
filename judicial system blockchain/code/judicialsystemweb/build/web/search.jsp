<!DOCTYPE html>
<%@page import="dbpack.dbconnection"%>
<%@page import="java.sql.*"%>
<html lang="en">
  <head>
    <title>Judicial &mdash; Colorlib Website Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/mediaelementplayer.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="css/fl-bigmug-line.css">
    
  
    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
  </head>
  <body bgcolor="red">
  
    
  
  <div class="site-wrap">

    <div class="site-navbar mt-4">
        <div class="container py-1">
          <div class="row align-items-center">
            <div class="col-8 col-md-8 col-lg-4">
              <h1 class="mb-0"><a href="index.html" class="text-white h2 mb-0"><strong class="text-uppercase">Judicial<span class="text-primary">.</span></strong></a></h1>
            </div>
            <div class="col-4 col-md-4 col-lg-8">
              <nav class="site-navigation text-right text-md-right" role="navigation">

                <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3"><a href="#" class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a></div>

                <ul class="site-menu js-clone-nav d-none d-lg-block">
                 
                  <li ><a href="index.html">Home</a></li>
                  <li><a href="userlogin.jsp">User Login</a></li>
                  <li><a href="lawyerlogin.jsp">Lawyer Login</a></li>
                  <li><a href="judgelogin.jsp">Judge Login</a></li>
                  <li class="active"><a href="search.jsp">Search</a></li>
                 
                  <li><a href="contact.html">Contact</a></li>
                
                </ul>
              </nav>
            </div>
           

          </div>
        </div>
      </div>
    </div>

  </div>   
  
    
   


    <div class="site-section section-5">
      <div class="container">
      
      </div>
    </div>
  
  
 
     
  
      
 

    <div class="site-section section-6">
      <div class="container">
          
          <h1 >Welcome User </h1>
          <br>
          <h1 align="center">Search Case</h1>
    <form name="searchcase" method="" action="">
    <table align="center" width="600" height="120">
   
        <tr>
            <td>Enter Case ID</td>
            <td> <input type=text name=cid required/></td>
            <td><input type="submit" name="search" value="Search Case" style="height:30px; width:150px"/></td>
        </tr>
        
        
    </table>
</form>
           <%
  try
  {
      %>
  
          <%@page import="java.net.*,java.io.*,java.util.*"%>
          <%
                if (request.getParameter("search")!=null)  //if 1
                {
                    String cid=request.getParameter("cid");
                    
                    Socket soc=new Socket("localhost",3000);
                    System.out.println("socket conneted");
                    ObjectOutputStream oos=new ObjectOutputStream(soc.getOutputStream());
                    ObjectInputStream oin=new ObjectInputStream(soc.getInputStream());
                    oos.writeObject("SEARCHCASE");
                    oos.writeObject(cid);
                    //oos.writeObject(Integer.toString((Integer)session.getAttribute("id")));
                    String v=(String)oin.readObject();
                    
                    if (v.equals("")) //if 2
                    {
                        %>
                        <script>
                            alert('No Data found!');
                        </script>    
                        <%
                    
                        
                    }  //end if 2
                    else
                    {
                        %>
                        <table align="center" width="1000" border="1">
                        <tr>
                 
                        <th>CASE ID</th>
                        <th>CASE NAME</th>
                        <th>DETAILS</th>
                        <th>LAWYER</th>
                        <th>LAWYER COMMENT</th>
                        <th>JUDGE </th>
                        <th>JUDGE COMMENT</th>                  
                        <th>STATUS</th>
                  
                        </tr>
                        <%
                        StringTokenizer st=new StringTokenizer(v,"$");
                            
                            while (st.hasMoreTokens())
                            {
                                %>
                                <tr>
                                   
                                    <%String caseid=st.nextToken();%>
                                    <td><%=caseid%></td>
                                    <td><%=st.nextToken()%></td>
                                    <td><%=st.nextToken()%></td>
                                    <td><%=st.nextToken()%></td>
                                    <td><%=st.nextToken()%></td>
                                    <td><%=st.nextToken()%></td>
                                    <td><%=st.nextToken()%></td>
                                   
                                   
                                     <td><%=st.nextToken()%></td>                                        
                                    
                                </tr>
                                <%
                            }    //end while
                            %>
                        </table>
                 <%       
                } //end else
            }   //end if
            
          %>
   
    
      </div>
    </div>

<%
}
catch(Exception e)
{
    out.println(e);
    e.printStackTrace();
}

%>


  

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/mediaelement-and-player.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/bootstrap-datepicker.min.js"></script>
  <script src="js/aos.js"></script>
  <!-- <script src="js/circleaudioplayer.js"></script> -->

  <script src="js/main.js"></script>
    
  </body>
</html>