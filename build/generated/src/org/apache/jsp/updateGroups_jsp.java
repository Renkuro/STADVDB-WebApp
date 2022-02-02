package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCINFOM.*;
import java.util.*;
import java.sql.*;

public final class updateGroups_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Update a Record</title>\n");
      out.write("    </head>\n");
      out.write("    <body onload=\"displayResults()\">\n");
      out.write("        <h1>Update End Date</h1>\n");
      out.write("        ");

            int result = 0;
            int g_ID = 0;
            Groups groups = new Groups();
            ResultSet results = groups.getGroups();
            String group_ID = new String();
            String username_rep = new String("");

            if (request.getParameter("submit") != null) {
                if (request.getParameter("group_ID") != null) {
                        group_ID = request.getParameter("group_ID");
                        g_ID = Integer.parseInt(group_ID);
                    }   

                if (request.getParameter("username_rep") != null) {
                        username_rep = request.getParameter("username_rep");
                    }

                    result = groups.changeGroups(g_ID, username_rep);      
                }
        
      out.write("  \n");
      out.write("       <form name=\"myForm\" action=\"updateGroups.jsp\" method=\"POST\">\n");
      out.write("            <table border=\"0\">\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Groups: </td>\n");
      out.write("                        <td><select name=\"group_ID\">\n");
      out.write("                                ");
while (results.next()) {
      out.write("\n");
      out.write("                                 <option value =\"");
      out.print( results.getString("group_ID"));
      out.write('"');
      out.write('>');
      out.print( results.getString("start_date"));
      out.write(' ');
      out.print( results.getString("username_rep"));
      out.write("</option>\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                            </select>\n");
      out.write("                        </td>\n");
      out.write("                         <tr>\n");
      out.write("                        <td>Group Representative : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"username_rep\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("             <input type=\"reset\" value=\"Clear\" name=\"clear\" />\n");
      out.write("             <input type=\"submit\" value=\"Submit\" name=\"submit\" />\n");
      out.write("             <input type=\"hidden\" name=\"hidden\" value=\"");
      out.print( result);
      out.write("\" />\n");
      out.write("        </form>\n");
      out.write("            <a href=\"index.html\">Back</a>\n");
      out.write("            <a href=\"updateGroups.jsp\">Refresh</a>\n");
      out.write("    </body>\n");
      out.write("            <SCRIPT LANGUAGE =\"JAVASCRIPT\">\n");
      out.write("                <!--\n");
      out.write("                    function displayResults()\n");
      out.write("                    {\n");
      out.write("                        if(document.myForm.hidden.value == 1) {\n");
      out.write("                            alert(\"Data Updated\");\n");
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
