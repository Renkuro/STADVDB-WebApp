package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCINFOM.*;
import java.util.*;
import java.sql.*;

public final class createGroups_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Create a Record</title>\n");
      out.write("    </head>\n");
      out.write("    <body onload=\"displayResults()\">\n");
      out.write("        <h1>Create a Record</h1>\n");
      out.write("            ");

                int g_ID = 0;
                int result = 0;
                Groups groups = new Groups();
                String group_ID = new String();
                String start_date = new String();
                String username_rep = new String();
                
                if(request.getParameter("submit") != null) {
                    
                    if(request.getParameter("group_ID") != null) {
                        group_ID = request.getParameter("group_ID");
                        g_ID = Integer.parseInt(group_ID);
                    }

                    if(request.getParameter("start_date") != null) {
                        start_date = request.getParameter("start_date");
                    }

                    if(request.getParameter("username_rep") != null) {
                        username_rep = request.getParameter("username_rep");
                    }

                    result = groups.setGroups(g_ID, start_date, username_rep);
                }
        
      out.write("\n");
      out.write("        <form name=\"myForm\" action=\"createGroups.jsp\" method=\"POST\">\n");
      out.write("            <table border=\"0\">\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Group ID : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"group_ID\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Start Date : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"start_date\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Representative Username : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"username_rep\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("            <input type=\"reset\" value=\"Clear\" name=\"clear\" />\n");
      out.write("            <input type=\"submit\" value=\"Submit\" name=\"submit\" />\n");
      out.write("            <input type=\"hidden\" name=\"hidden\" value=\"");
      out.print( result);
      out.write("\" />\n");
      out.write("        </form>\n");
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
