/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.69
 * Generated at: 2021-08-23 01:43:20 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.kh.member.model.vo.Member;

public final class memberLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/views/member/../common/menuSideBar.jsp", Long.valueOf(1629682970936L));
    _jspx_dependants.put("/views/member/../common/footer.jsp", Long.valueOf(1629276191580L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.kh.member.model.vo.Member");
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
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("	<meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n");
      out.write("	<!-- Favicon icon -->\r\n");
      out.write("    <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"./images/do_32.png\">\r\n");
      out.write("    \r\n");
      out.write("<!--     Custom Stylesheet\r\n");
      out.write("	<script src=\"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity=\"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("	<link href=\"./css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("	<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\r\n");
      out.write("	<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("	<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("	 -->\r\n");
      out.write("	\r\n");
      out.write("	<title>로그인</title>\r\n");
      out.write("	<script>\r\n");
      out.write("		$(function(){\r\n");
      out.write("			if(msg != \"null\"){\r\n");
      out.write("				alert(msg);\r\n");
      out.write("				");
session.removeAttribute("msg");
      out.write("\r\n");
      out.write("			}\r\n");
      out.write("		})\r\n");
      out.write("		function loginValidate(){\r\n");
      out.write("			if($(\"#userId\").val().trim().length == 0){\r\n");
      out.write("				alert(\"아이디를 입력하세요.\");\r\n");
      out.write("				$(\"#userId\").focus();\r\n");
      out.write("				return false;\r\n");
      out.write("			}\r\n");
      out.write("			if($(\"#userPwd\").val().trim().length == 0){\r\n");
      out.write("				alert(\"비밀번호를 입력하세요.\");\r\n");
      out.write("				$(\"#userPwd\").focus();\r\n");
      out.write("				return false;\r\n");
      out.write("			}\r\n");
      out.write("			\r\n");
      out.write("			return true;\r\n");
      out.write("		}\r\n");
      out.write("	\r\n");
      out.write("	</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"h-100\">\r\n");
      out.write("	<div id=\"main-wrapper\">\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("\r\n");
 	
 	// Member loginUser = (Member)session.getAttribute("loginUser");
 	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg"); 
	String contextPath = request.getContextPath();


      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n");
      out.write("    <title>DO LIKE - Do Whatever You Like, Community</title>\r\n");
      out.write("    <!-- Favicon icon \r\n");
      out.write("    <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=../../images/do_32.png\">\r\n");
      out.write("    <!-- Favicon icon -->\r\n");
      out.write("    <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"./images/do_32.png\">\r\n");
      out.write("    \r\n");
      out.write("    <!-- Custom Stylesheet -->\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity=\"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<link href=\"./css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\r\n");
      out.write("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("	function msgLoginerror(){\r\n");
      out.write("		alert(\"로그인 후 이용가능합니다.\");\r\n");
      out.write("	}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    \r\n");
      out.write("        <!--**********************************\r\n");
      out.write("            Nav header start  \r\n");
      out.write("        ***********************************-->\r\n");
      out.write("        <div class=\"nav-header\">\r\n");
      out.write("            <div class=\"brand-logo\">\r\n");
      out.write("                <a href=\"index2.jsp\" style=\"background:#eceeef\">\r\n");
      out.write("                    <b class=\"logo-abbr\"><img src=\"images/do_32.png\" alt=\"\"> </b>\r\n");
      out.write("                    <span class=\"logo-compact\"><img src=\"./images/mainLogo_text.png\" alt=\"\"></span>\r\n");
      out.write("                    <span class=\"brand-title\">\r\n");
      out.write("                        <img src=\"./images/mainLogo_text.png\" alt=\"\">\r\n");
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
      out.write("                    <div class=\"hamburger is-active\">\r\n");
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
      out.write("                \r\n");
      out.write("            ");
 if(loginUser == null) {
      out.write("  \r\n");
      out.write("			<div class=\"loginArea\">\r\n");
      out.write("				<button class=\"btn btn-primary px-3 ml-4\" id=\"loginBtn\" type=\"button\" onclick=\"location.href='");
      out.print(contextPath);
      out.write("/loginForm.me'\">로그인</button>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("            ");
}else{ 
      out.write("\r\n");
      out.write("            <div class=\"header-right\">\r\n");
      out.write("                    <ul class=\"clearfix\">\r\n");
      out.write("                        <li class=\"icons dropdown show\"><a href=\"list.ms\" data-toggle=\"dropdown\" aria-expanded=\"true\"> \r\n");
      out.write("                                <i class=\"mdi mdi-email-outline\"></i>\r\n");
      out.write("                            </a>\r\n");
      out.write("\r\n");
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
      out.write("                        <li class=\"icons dropdown\">\r\n");
      out.write("                            <div class=\"user-img c-pointer position-relative\" data-toggle=\"dropdown\">\r\n");
      out.write("                                <span class=\"activity active\"></span>\r\n");
      out.write("                                <img src=\"images/user/1.png\" height=\"40\" width=\"40\" alt=\"\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"drop-down dropdown-profile animated fadeIn dropdown-menu\">\r\n");
      out.write("                                <div class=\"dropdown-content-body\">\r\n");
      out.write("                                    <ul>\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"app-profile.html\"><i class=\"icon-user\"></i> <span>");
      out.print( loginUser.getNickName() );
      out.write("님</span></a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"");
      out.print( request.getContextPath() );
      out.write("/list.ms\">\r\n");
      out.write("                                                <i class=\"icon-envelope-open\"></i> <span>쪽지함</span> <div class=\"badge gradient-3 badge-pill gradient-1\">3</div>\r\n");
      out.write("                                            </a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        \r\n");
      out.write("                                        <hr class=\"my-2\">\r\n");
      out.write("                                        <li>\r\n");
      out.write("                                            <a href=\"");
      out.print( request.getContextPath() );
      out.write("/challengeMain.ch\"><i class=\"icon-lock\"></i> <span>진행중인 챌린지</span></a>\r\n");
      out.write("                                        </li>\r\n");
      out.write("                                        <li><a href=\"");
      out.print( request.getContextPath() );
      out.write("/logout.me\"><i class=\"icon-key\"></i> <span>로그아웃</span></a></li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("               	");
} 
      out.write(" \r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("           </div>\r\n");
      out.write("      <!--**********************************\r\n");
      out.write("                Header end ti-comment-alt\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("       <!--**********************************\r\n");
      out.write("               Sidebar start\r\n");
      out.write("        ***********************************-->\r\n");
      out.write("       <div class=\"nk-sidebar\">           \r\n");
      out.write("            <div class=\"slimScrollDiv\" style=\"position: relative; overflow: hidden; width: auto; height: 100%;\"><div class=\"nk-nav-scroll active\" style=\"overflow: hidden; width: auto; height: 100%;\">\r\n");
      out.write("                <ul class=\"metismenu in\" id=\"menu\">\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"index2.jsp\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"icon-menu menu-icon\"></i><span class=\"nav-text\">메인</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"mega-menu-sm\">\r\n");
      out.write("                        <a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\" class=\"active\">\r\n");
      out.write("                            <i class=\"icon-grid menu-icon\"></i><span class=\"nav-text\">카테고리</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul aria-expanded=\"false\" class=\"collapse\">\r\n");
      out.write("                            <li><a href=\"list.bo\">카테고리1</a></li>\r\n");
      out.write("                            <li><a href=\"../board/boardView.jsp\">카테고리2</a></li>\r\n");
      out.write("                            <li><a href=\"../board/boardView.jsp\">카테고리3</a></li>\r\n");
      out.write("                            <li><a href=\"../board/boardView.jsp\">카테고리4</a></li>\r\n");
      out.write("                            <li><a href=\"../board/boardView.jsp\">카테고리5</a></li>\r\n");
      out.write("                            <li><a href=\"../board/boardView.jsp\">카테고리6</a></li>\r\n");
      out.write("                            <li><a href=\"../board/boardView.jsp\">카테고리7</a></li>\r\n");
      out.write("                           \r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                      <li class=\"mega-menu-sm\">\r\n");
      out.write("                        <a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"icon-heart menu-icon\"></i><span class=\"nav-text\">즐겨찾는 게시판</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul aria-expanded=\"false\" class=\"collapse\">\r\n");
      out.write("                        <!-- 나중에 코드로 구현할 부분 -->\r\n");
      out.write("                            <li><a href=\"./layout-blank.html\">카테고리1</a></li>\r\n");
      out.write("                            <li><a href=\"./layout-one-column.html\">카테고리2</a></li>\r\n");
      out.write("                     \r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"mega-menu-sm\">\r\n");
      out.write("                        <a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"icon-people menu-icon\"></i> <span class=\"nav-text\">팔로잉</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul aria-expanded=\"false\" class=\"collapse\">\r\n");
      out.write("                            <li><a href=\"");
      out.print( request.getContextPath() );
      out.write("/followMain.fl\">추천 친구</a></li>\r\n");
      out.write("                            <li><a href=\"");
      out.print( request.getContextPath() );
      out.write("/MyFollow.fl\">나의 친구</a></li>\r\n");
      out.write("                   \r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    ");
 if(loginUser == null) {
      out.write("  \r\n");
      out.write("                    <li class=\"mega-menu-sm\">\r\n");
      out.write("                        <a class=\"has-arrow\" aria-expanded=\"false\" onclick=\"msgLoginerror();\">\r\n");
      out.write("                            <i class=\"icon-envelope menu-icon\" ></i><span class=\"nav-text\">쪽지</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    ");
}else{ 
      out.write("\r\n");
      out.write("                     <li class=\"mega-menu-sm\">\r\n");
      out.write("                        <a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"icon-envelope menu-icon\"></i><span class=\"nav-text\">쪽지</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul aria-expanded=\"false\" class=\"collapse\">\r\n");
      out.write("                            <li><a href=\"");
      out.print( request.getContextPath() );
      out.write("/list.ms\">쪽지함</a></li>\r\n");
      out.write("                            <li><a href=\"");
      out.print( request.getContextPath() );
      out.write("/writeForm.ms\">쪽지 보내기</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    ");
} 
      out.write(" \r\n");
      out.write("                    <li class=\"mega-menu-sm\">\r\n");
      out.write("                        <a class=\"has-arrow\" href=\"javascript:void()\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"icon-note menu-icon\"></i><span class=\"nav-text\">챌린지</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul aria-expanded=\"false\" class=\"collapse\">\r\n");
      out.write("                            <li><a href=\"");
      out.print( request.getContextPath() );
      out.write("/challengeMain.ch\">진행중인 챌린지</a></li>\r\n");
      out.write("                            <li><a href=\"./app-calender.html\">챌린지2</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </li>\r\n");
      out.write("               		<li>\r\n");
      out.write("                        <a href=\"");
      out.print( request.getContextPath() );
      out.write("/noticeView.no\" aria-expanded=\"false\">\r\n");
      out.write("                            <i class=\"mdi mdi-bell-outline menu-icon\"></i><span class=\"nav-text\">공지사항</span>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div><div class=\"slimScrollBar\" style=\"background: transparent; width: 5px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 5533.32px;\"></div><div class=\"slimScrollRail\" style=\"width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;\"></div></div>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("		<script src=\"plugins/common/common.min.js\"></script>\r\n");
      out.write("	    <script src=\"js/custom.min.js\"></script>\r\n");
      out.write("	    <script src=\"js/settings.js\"></script>\r\n");
      out.write("	    <script src=\"js/gleek.js\"></script>\r\n");
      out.write("	    <script src=\"js/styleSwitcher.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write(" \r\n");
      out.write("    \r\n");
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
      out.write("    <div class=\"login-form-bg h-100\">\r\n");
      out.write("        <div class=\"container h-100\">\r\n");
      out.write("            <div class=\"row justify-content-center h-100\">\r\n");
      out.write("                <div class=\"col-xl-6\">\r\n");
      out.write("                    <div class=\"form-input-content\">\r\n");
      out.write("                        <div class=\"card login-form mb-0\">\r\n");
      out.write("                            <div class=\"card-body pt-5\">\r\n");
      out.write("                                <a class=\"text-center\"> <h4>로그인</h4></a>\r\n");
      out.write("                                <form class=\"mt-5 mb-5 login-input\" action=\"");
      out.print( request.getContextPath() );
      out.write("/login.me\" method=\"post\" onsubmit=\"return loginValidate();\">\r\n");
      out.write("                                    <div class=\"form-group\">\r\n");
      out.write("                                        <input id=\"userId\" name=\"userId\" type=\"text\" class=\"form-control\" placeholder=\"아이디\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"form-group\">\r\n");
      out.write("                                        <input id=\"userPwd\" name=\"userPwd\" type=\"password\" class=\"form-control\" placeholder=\"비밀번호\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <button class=\"btn login-form__btn submit w-100\" type=\"submit\">로그인</button>\r\n");
      out.write("                                </form>\r\n");
      out.write("                                <p class=\"mt-5 login-form__footer\">계정이 없으신가요? <a href=\"");
      out.print( request.getContextPath());
      out.write("/enrollForm.me\" class=\"text-primary\">회원가입</a> 하러가기</p>\r\n");
      out.write("                                <p class=\"mt-5 login-form__footer\">로그인이 안되시나요? <a href=\"");
      out.print( request.getContextPath());
      out.write("/noticeView.no\" class=\"text-primary\">공지사항</a> 보러가기</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("        <div class=\"footer\">\r\n");
      out.write("            <div class=\"copyright\">\r\n");
      out.write("                <p>&copy; <a href=\"https://github.com/pastelto/DOLIKE\">TEAM DOLIKE</a> 2021</p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!--**********************************\r\n");
      out.write("        Scripts\r\n");
      out.write("    ***********************************-->\r\n");
      out.write("    <script src=\"plugins/common/common.min.js\"></script>\r\n");
      out.write("    <script src=\"js/custom.min.js\"></script>\r\n");
      out.write("    <script src=\"js/settings.js\"></script>\r\n");
      out.write("    <script src=\"js/gleek.js\"></script>\r\n");
      out.write("    <script src=\"js/styleSwitcher.js\"></script>\r\n");
      out.write("</body>\r\n");
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
