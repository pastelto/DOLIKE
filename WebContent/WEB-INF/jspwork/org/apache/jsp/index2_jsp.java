/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.69
 * Generated at: 2021-08-16 16:28:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index2_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n");
      out.write("    <title>DO LIKE - Do Whatever You Like, Community</title>\r\n");
      out.write("    <!-- Favicon icon -->\r\n");
      out.write("    <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"./images/do_32.png\">\r\n");
      out.write("    <!-- Pignose Calender -->\r\n");
      out.write("    <link href=\"./plugins/pg-calendar/css/pignose.calendar.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <!-- Chartist -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"./plugins/chartist/css/chartist.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css\">\r\n");
      out.write("    <!-- Custom Stylesheet -->\r\n");
      out.write("    <link href=\"css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\r\n");
      out.write("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity=\"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <!--*******************\r\n");
      out.write("        Preloader start\r\n");
      out.write("    ********************-->\r\n");
      out.write("    <div id=\"preloader\">\r\n");
      out.write("        <div class=\"loader\">\r\n");
      out.write("            <svg class=\"circular\" viewBox=\"25 25 50 50\">\r\n");
      out.write("                <circle class=\"path\" cx=\"50\" cy=\"50\" r=\"20\" fill=\"none\" stroke-width=\"3\" stroke-miterlimit=\"10\" />\r\n");
      out.write("            </svg>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!--*******************\r\n");
      out.write("        Preloader end\r\n");
      out.write("    ********************-->\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    <!--**********************************\r\n");
      out.write("        Main wrapper start\r\n");
      out.write("    ***********************************-->\r\n");
      out.write("    <div id=\"main-wrapper\">\r\n");
      out.write("\r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Nav header start\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("        <div class=\"nav-header\">\r\n");
      out.write("            <div class=\"brand-logo\">\r\n");
      out.write("                <a href=\"index.html\">\r\n");
      out.write("                    <b class=\"logo-abbr\"><img src=\"images/do_32.png\" alt=\"\"> </b>\r\n");
      out.write("                    <span class=\"logo-compact\"><img src=\"./images/mainLogo_text.png\" alt=\"\"></span>\r\n");
      out.write("                    <span class=\"brand-title\">\r\n");
      out.write("                        <img src=\"images/mainLogo_text.png\" alt=\"\">\r\n");
      out.write("                    </span>\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Nav header end\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("\r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Header start\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("        <div class=\"header\">    \r\n");
      out.write("            <div class=\"header-content clearfix\">\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"nav-control\">\r\n");
      out.write("                    <div class=\"hamburger\">\r\n");
      out.write("                        <span class=\"toggle-icon\"><i class=\"icon-menu\"></i></span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"header-left\">\r\n");
      out.write("                    <div class=\"input-group icons\">\r\n");
      out.write("                        <div class=\"input-group-prepend\">\r\n");
      out.write("                            <span class=\"input-group-text bg-transparent border-0 pr-2 pr-sm-3\" id=\"basic-addon1\"><i class=\"mdi mdi-magnify\"></i></span>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <input type=\"search\" class=\"form-control\" placeholder=\"전체 게시글 검색하기\" aria-label=\"Search Dashboard\">\r\n");
      out.write("                        <div class=\"drop-down animated flipInX d-md-none\">\r\n");
      out.write("                            <form action=\"#\">\r\n");
      out.write("                                <input type=\"text\" class=\"form-control\" placeholder=\"Search\">\r\n");
      out.write("                            </form>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"header-right\">\r\n");
      out.write("                    <ul class=\"clearfix\">\r\n");
      out.write("                        <li class=\"icons dropdown\"><a href=\"javascript:void(0)\" data-toggle=\"dropdown\">\r\n");
      out.write("                                <i class=\"mdi mdi-email-outline\"></i>\r\n");
      out.write("                                <span class=\"badge badge-pill gradient-1\">3</span>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <div class=\"drop-down animated fadeIn dropdown-menu\">\r\n");
      out.write("                                <div class=\"dropdown-content-heading d-flex justify-content-between\">\r\n");
      out.write("                                    <span class=\"\">3 New Messages</span>  \r\n");
      out.write("                                    <a href=\"javascript:void()\" class=\"d-inline-block\">\r\n");
      out.write("                                        <span class=\"badge badge-pill gradient-1\">3</span>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"dropdown-content-body\">\r\n");
      out.write("                                    <ul>\r\n");
      out.write("                                        <li class=\"notification-unread\">\r\n");
      out.write("                                            <a href=\"javascript:void()\">\r\n");
      out.write("                                                <img class=\"float-left mr-3 avatar-img\" src=\"images/avatar/1.jpg\" alt=\"\">\r\n");
      out.write("                                                <div class=\"notification-content\">\r\n");
      out.write("                                                    <div class=\"notification-heading\">Saiful Islam</div>\r\n");
      out.write("                                                    <div class=\"notification-timestamp\">08 Hours ago</div>\r\n");
      out.write("                                                    <div class=\"notification-text\">Hi Teddy, Just wanted to let you ...</div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li class=\"notification-unread\">\r\n");
      out.write("                                            <a href=\"javascript:void()\">\r\n");
      out.write("                                                <img class=\"float-left mr-3 avatar-img\" src=\"images/avatar/2.jpg\" alt=\"\">\r\n");
      out.write("                                                <div class=\"notification-content\">\r\n");
      out.write("                                                    <div class=\"notification-heading\">Adam Smith</div>\r\n");
      out.write("                                                    <div class=\"notification-timestamp\">08 Hours ago</div>\r\n");
      out.write("                                                    <div class=\"notification-text\">Can you do me a favour?</div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"javascript:void()\">\r\n");
      out.write("                                                <img class=\"float-left mr-3 avatar-img\" src=\"images/avatar/3.jpg\" alt=\"\">\r\n");
      out.write("                                                <div class=\"notification-content\">\r\n");
      out.write("                                                    <div class=\"notification-heading\">Barak Obama</div>\r\n");
      out.write("                                                    <div class=\"notification-timestamp\">08 Hours ago</div>\r\n");
      out.write("                                                    <div class=\"notification-text\">Hi Teddy, Just wanted to let you ...</div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"javascript:void()\">\r\n");
      out.write("                                                <img class=\"float-left mr-3 avatar-img\" src=\"images/avatar/4.jpg\" alt=\"\">\r\n");
      out.write("                                                <div class=\"notification-content\">\r\n");
      out.write("                                                    <div class=\"notification-heading\">Hilari Clinton</div>\r\n");
      out.write("                                                    <div class=\"notification-timestamp\">08 Hours ago</div>\r\n");
      out.write("                                                    <div class=\"notification-text\">Hello</div>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                    \r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"icons dropdown\"><a href=\"javascript:void(0)\" data-toggle=\"dropdown\">\r\n");
      out.write("                                <i class=\"mdi mdi-bell-outline\"></i>\r\n");
      out.write("                                <span class=\"badge badge-pill gradient-2\">3</span>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <div class=\"drop-down animated fadeIn dropdown-menu dropdown-notfication\">\r\n");
      out.write("                                <div class=\"dropdown-content-heading d-flex justify-content-between\">\r\n");
      out.write("                                    <span class=\"\">2 New Notifications</span>  \r\n");
      out.write("                                    <a href=\"javascript:void()\" class=\"d-inline-block\">\r\n");
      out.write("                                        <span class=\"badge badge-pill gradient-2\">5</span>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"dropdown-content-body\">\r\n");
      out.write("                                    <ul>\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"javascript:void()\">\r\n");
      out.write("                                                <span class=\"mr-3 avatar-icon bg-success-lighten-2\"><i class=\"icon-present\"></i></span>\r\n");
      out.write("                                                <div class=\"notification-content\">\r\n");
      out.write("                                                    <h6 class=\"notification-heading\">Events near you</h6>\r\n");
      out.write("                                                    <span class=\"notification-text\">Within next 5 days</span> \r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"javascript:void()\">\r\n");
      out.write("                                                <span class=\"mr-3 avatar-icon bg-danger-lighten-2\"><i class=\"icon-present\"></i></span>\r\n");
      out.write("                                                <div class=\"notification-content\">\r\n");
      out.write("                                                    <h6 class=\"notification-heading\">Event Started</h6>\r\n");
      out.write("                                                    <span class=\"notification-text\">One hour ago</span> \r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"javascript:void()\">\r\n");
      out.write("                                                <span class=\"mr-3 avatar-icon bg-success-lighten-2\"><i class=\"icon-present\"></i></span>\r\n");
      out.write("                                                <div class=\"notification-content\">\r\n");
      out.write("                                                    <h6 class=\"notification-heading\">Event Ended Successfully</h6>\r\n");
      out.write("                                                    <span class=\"notification-text\">One hour ago</span>\r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"javascript:void()\">\r\n");
      out.write("                                                <span class=\"mr-3 avatar-icon bg-danger-lighten-2\"><i class=\"icon-present\"></i></span>\r\n");
      out.write("                                                <div class=\"notification-content\">\r\n");
      out.write("                                                    <h6 class=\"notification-heading\">Events to Join</h6>\r\n");
      out.write("                                                    <span class=\"notification-text\">After two days</span> \r\n");
      out.write("                                                </div>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                    \r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"icons dropdown d-none d-md-flex\">\r\n");
      out.write("                            <a href=\"javascript:void(0)\" class=\"log-user\"  data-toggle=\"dropdown\">\r\n");
      out.write("                                <span>한국어</span>  <i class=\"fa fa-angle-down f-s-14\" aria-hidden=\"true\"></i>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <div class=\"drop-down dropdown-language animated fadeIn  dropdown-menu\">\r\n");
      out.write("                                <div class=\"dropdown-content-body\">\r\n");
      out.write("                                    <ul>\r\n");
      out.write("                                        <li><a href=\"javascript:void()\">한국어</a></li>\r\n");
      out.write("                                        <li><a href=\"javascript:void()\">English</a></li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"icons dropdown\">\r\n");
      out.write("                            <div class=\"user-img c-pointer position-relative\"   data-toggle=\"dropdown\">\r\n");
      out.write("                                <span class=\"activity active\"></span>\r\n");
      out.write("                                <img src=\"images/user/1.png\" height=\"40\" width=\"40\" alt=\"\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"drop-down dropdown-profile animated fadeIn dropdown-menu\">\r\n");
      out.write("                                <div class=\"dropdown-content-body\">\r\n");
      out.write("                                    <ul>\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"app-profile.html\"><i class=\"icon-user\"></i> <span>Profile</span></a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"javascript:void()\">\r\n");
      out.write("                                                <i class=\"icon-envelope-open\"></i> <span>Inbox</span> <div class=\"badge gradient-3 badge-pill gradient-1\">3</div>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        \r\n");
      out.write("                                        <hr class=\"my-2\">\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"page-lock.html\"><i class=\"icon-lock\"></i> <span>Lock Screen</span></a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li><a href=\"page-login.html\"><i class=\"icon-key\"></i> <span>Logout</span></a></li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Header end ti-comment-alt\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("\r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Sidebar start\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("        <div class=\"nk-sidebar\">           \r\n");
      out.write("            <div class=\"nk-nav-scroll\">\r\n");
      out.write("                <ul class=\"metismenu\" id=\"menu\">\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"icon-speedometer menu-icon\"></i><span class=\"nav-text\">메인</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul aria-expanded=\"false\">\r\n");
      out.write("                            <li><a href=\"./index.html\">하위 카테고리</a></li>\r\n");
      out.write("                            <!-- <li><a href=\"./index-2.html\">Home 2</a></li> -->\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"icon-envelope menu-icon\"></i> <span class=\"nav-text\">카테고리</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul aria-expanded=\"false\">\r\n");
      out.write("                            <li><a href=\"./email-inbox.html\">하위카테고리1</a></li>\r\n");
      out.write("                            <li><a href=\"./email-read.html\">하위카테고리2</a></li>\r\n");
      out.write("                            <li><a href=\"./email-compose.html\">하위카테고리3</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                     <li>\r\n");
      out.write("                        <a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"icon-screen-tablet menu-icon\"></i><span class=\"nav-text\">팔로잉</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul aria-expanded=\"false\">\r\n");
      out.write("                            <li><a href=\"./app-profile.html\">Profile</a></li>\r\n");
      out.write("                            <li><a href=\"./app-calender.html\">Calender</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"icon-graph menu-icon\"></i> <span class=\"nav-text\">챌린지</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul aria-expanded=\"false\">\r\n");
      out.write("                            <li><a href=\"./chart-flot.html\">Flot</a></li>\r\n");
      out.write("                            <li><a href=\"./chart-morris.html\">Morris</a></li>\r\n");
      out.write("                            <li><a href=\"./chart-chartjs.html\">Chartjs</a></li>\r\n");
      out.write("                            <li><a href=\"./chart-chartist.html\">Chartist</a></li>\r\n");
      out.write("                            <li><a href=\"./chart-sparkline.html\">Sparkline</a></li>\r\n");
      out.write("                            <li><a href=\"./chart-peity.html\">Peity</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"icon-notebook menu-icon\"></i><span class=\"nav-text\">공지사항</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul aria-expanded=\"false\">\r\n");
      out.write("                            <li><a href=\"./page-login.html\">Login</a></li>\r\n");
      out.write("                            <li><a href=\"./page-register.html\">Register</a></li>\r\n");
      out.write("                            <li><a href=\"./page-lock.html\">Lock Screen</a></li>\r\n");
      out.write("                            <li><a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\">Error</a>\r\n");
      out.write("                                <ul aria-expanded=\"false\">\r\n");
      out.write("                                    <li><a href=\"./page-error-404.html\">Error 404</a></li>\r\n");
      out.write("                                    <li><a href=\"./page-error-403.html\">Error 403</a></li>\r\n");
      out.write("                                    <li><a href=\"./page-error-400.html\">Error 400</a></li>\r\n");
      out.write("                                    <li><a href=\"./page-error-500.html\">Error 500</a></li>\r\n");
      out.write("                                    <li><a href=\"./page-error-503.html\">Error 503</a></li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Sidebar end\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("\r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Content body start\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("        <div class=\"content-body\">\r\n");
      out.write("\r\n");
      out.write("     \r\n");
      out.write("            <!-- #/ container -->\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Content body end\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Footer start\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("        <div class=\"footer\">\r\n");
      out.write("            <div class=\"copyright\">\r\n");
      out.write("                <p>&copy; <a href=\"https://github.com/pastelto/DOLIKE\">TEAM DOLIKE</a> 2021</p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Footer end\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("    </div>\r\n");
      out.write("    <!--**********************************\r\n");
      out.write("        Main wrapper end\r\n");
      out.write("    ***********************************-->\r\n");
      out.write("\r\n");
      out.write("    <!--**********************************\r\n");
      out.write("        Scripts\r\n");
      out.write("    ***********************************-->\r\n");
      out.write("    <script src=\"plugins/common/common.min.js\"></script>\r\n");
      out.write("    <script src=\"js/custom.min.js\"></script>\r\n");
      out.write("    <script src=\"js/settings.js\"></script>\r\n");
      out.write("    <script src=\"js/gleek.js\"></script>\r\n");
      out.write("    <script src=\"js/styleSwitcher.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!-- Chartjs -->\r\n");
      out.write("    <script src=\"./plugins/chart.js/Chart.bundle.min.js\"></script>\r\n");
      out.write("    <!-- Circle progress -->\r\n");
      out.write("    <script src=\"./plugins/circle-progress/circle-progress.min.js\"></script>\r\n");
      out.write("    <!-- Datamap -->\r\n");
      out.write("    <script src=\"./plugins/d3v3/index.js\"></script>\r\n");
      out.write("    <script src=\"./plugins/topojson/topojson.min.js\"></script>\r\n");
      out.write("    <script src=\"./plugins/datamaps/datamaps.world.min.js\"></script>\r\n");
      out.write("    <!-- Morrisjs -->\r\n");
      out.write("    <script src=\"./plugins/raphael/raphael.min.js\"></script>\r\n");
      out.write("    <script src=\"./plugins/morris/morris.min.js\"></script>\r\n");
      out.write("    <!-- Pignose Calender -->\r\n");
      out.write("    <script src=\"./plugins/moment/moment.min.js\"></script>\r\n");
      out.write("    <script src=\"./plugins/pg-calendar/js/pignose.calendar.min.js\"></script>\r\n");
      out.write("    <!-- ChartistJS -->\r\n");
      out.write("    <script src=\"./plugins/chartist/js/chartist.min.js\"></script>\r\n");
      out.write("    <script src=\"./plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <script src=\"./js/dashboard/dashboard-1.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
