package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCINFOM.*;
import java.util.*;
import java.sql.*;

public final class reportGroups2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Report 1</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Monthly Completed, Cancelled, Sales</h1>\n");
      out.write("        ");

            Groups groups = new Groups();
            ResultSet result = null;
            String year = new String();
            String month = new String();
            
            if(request.getParameter("submit") != null) {
                if(request.getParameter("month") != null && (request.getParameter("month") != null)) {
                    year = request.getParameter("year");
                    month = request.getParameter("month");
                    result = groups.groupsReport(year, month);
                }
            }
        
      out.write("\n");
      out.write("        ");
      out.print( request.getParameter("year"));
      out.write(' ');
      out.print( request.getParameter("month"));
      out.write("<br>\n");
      out.write("        <table border=\"1\">\n");
      out.write("            <tbody>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Completed</td>\n");
      out.write("                    <td>Cancelled</td>\n");
      out.write("                    <td>Total Sales</td>\n");
      out.write("                </tr>\n");
      out.write("                ");
while (result.next()) { 
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print( result.getInt("COUNT(b.booking_ID)-COUNT(b.date_cancelled)"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( result.getInt("COUNT(b.date_cancelled)"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( result.getDouble("SUM(t.amount)"));
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("        <a href=\"reportGroups.jsp\">Back</a>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
