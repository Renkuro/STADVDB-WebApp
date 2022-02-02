package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCINFOM.*;
import java.util.*;
import java.sql.*;

public final class create_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Create a Record</title>\n");
      out.write("    </head>\n");
      out.write("    <body onload=\"displayResults()\">\n");
      out.write("        <h1>Create a Record</h1>\n");
      out.write("        ");

            int result = 0;
            Client client = new Client();
            if(request.getParameter("submit") != null) {
                String username = new String();
                String last_name = new String();
                String first_name = new String();
                String password = new String();
                String gender = new String();
                String bday = new String();
                String contact_no = new String();
                String address = new String();
                String EM_name = new String();
                String EM_address = new String();
                String EM_contact_no = new String();
                String country = new String();
                String status = new String();
                String reject_reason = new String();
                String TO_username = new String();
                
                if(request.getParameter("username") != null) {
                    username = request.getParameter("username");
                }
                
                if(request.getParameter("last_name") != null) {
                    last_name = request.getParameter("last_name");
                }
                    
                if(request.getParameter("first_name") != null){
                    first_name = request.getParameter("first_name");
                }
                    
                if(request.getParameter("password") != null) {
                    password = request.getParameter("password");
                }
                    
                if(request.getParameter("gender") != null) {
                    gender = request.getParameter("gender");
                }
                    
                if(request.getParameter("bday") != null) {
                    bday = request.getParameter("bday");
                }
                    
                if(request.getParameter("contact_no") != null) {
                    contact_no = request.getParameter("contact_no");
                }
                    
                if(request.getParameter("address") != null) {
                    address = request.getParameter("address");
                }
                    
                if(request.getParameter("EM_name") != null) {
                    EM_name = request.getParameter("EM_name");
                }
                    
                if(request.getParameter("EM_address") != null) {
                    EM_address = request.getParameter("EM_address");
                }
                    
                if(request.getParameter("EM_contact_no") != null) {
                    EM_contact_no = request.getParameter("EM_contact_no");
                }
                    
                if(request.getParameter("country") != null) {
                    country = request.getParameter("country");
                }
                    
                if(request.getParameter("status") != null) {
                    status = request.getParameter("status");
                }
                
                if(request.getParameter("reject_reason") != null) {
                    reject_reason = request.getParameter("reject_reason");
                }
                    
                if(request.getParameter("TO_username") != null) {
                    TO_username = request.getParameter("TO_username");
                }
                
                result = client.setClient(username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, country, status, reject_reason, TO_username);
            }
        
      out.write("\n");
      out.write("        <form name=\"myForm\" action=\"create.jsp\" method=\"POST\">\n");
      out.write("            <table border=\"0\">\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Username : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"username\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Last Name : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"last_name\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>First Name : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"first_name\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Password : </td>\n");
      out.write("                        <td><input type=\"password\" name=\"password\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Gender : </td>\n");
      out.write("                        <td><select name=\"gender\">\n");
      out.write("                                <option value=\"M\">Male</option>\n");
      out.write("                                <option value=\"F\">Female</option>\n");
      out.write("                            </select></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Birthday : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"bday\" value=\"2019-01-01\" size=\"12\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Contact # : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"contact_no\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Address : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"address\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Emergency Contact Name : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"EM_name\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Emergency Contact Address : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"EM_address\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Emergency Contact # : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"EM_contact_no\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Nationality : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"country\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Status : </td>\n");
      out.write("                        <td><select name=\"status\">\n");
      out.write("                                <option value=\"A\">Approved</option>\n");
      out.write("                                <option value=\"P\">Pending</option>\n");
      out.write("                                <option value=\"D\">Denied</option>\n");
      out.write("                            </select></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Disapproval Reason : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"reject_reason\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Travel Officer : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"TO_username\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("            <input type=\"reset\" value=\"Clear\" name=\"clear\" />\n");
      out.write("            <input type=\"submit\" value=\"Submit\" name=\"submit\" />\n");
      out.write("            <input type=\"hidden\" name=\"hidden\" value=\"");
      out.print( result);
      out.write("\" />\n");
      out.write("        </form>\n");
      out.write("            <a href=\"homepage.html\">Back</a>\n");
      out.write("    </body>\n");
      out.write("            <SCRIPT LANGUAGE =\"JAVASCRIPT\">\n");
      out.write("                <!-- \n");
      out.write("                    function displayResults()\n");
      out.write("                    {\n");
      out.write("                        if(document.myForm.hidden.value == 1) {\n");
      out.write("                            alert(\"Data Inserted\");\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                -->\n");
      out.write("            </SCRIPT>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
