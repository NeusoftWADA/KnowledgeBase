<%@ page import="entity.Userdata" %>
<%@ page import="database.Database" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<!DOCTYPE html>--%>
<html lang="en">

<head>
    <style>
        .top {
            margin: 18px 0px 18px 0px
        }

        .picture {
            text-align: center
        }

        .name {
            height: 40px;
            line-height: 40px;
            font-size: 18px;
            color: #000000;
            text-align: center
        }

        .border_b2 {
            margin-left: 20px;
            border-bottom: 1px solid #9c9c9c
        }

        .title {
            height: 30px;
            font-weight: bold;
            color: #000000
        }

        .wid {
            width: 225px
        }

        .mes_l {
            margin-left: 20px
        }

        .per_list {
            line-height: 35px;
            font-size: 12px;
            color: #323232
        }

        .y_black {
            color: #000000
        }

        .dir {
            vertical-align: top
        }

        .limit2 {
            width: 204px
        }

        .limit1 {
            width: 180px
        }
    </style>

    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8" />
    <!-- 这个属性主要是设置浏览器优先使用什么模式来渲染页面的-->
    <!-- #下面的meta标签告诉IE浏览器，IE8/9及以后的版本都会以最高版本IE来渲染页面。  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!--移动设备都是这Viewport里面打开，width=device-width表示打开页面默认和设备一致，initial-scale=1表示页面不进行缩放   -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <!--<link href="css/bootstrap.min.css" rel="stylesheet"/>-->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet"
          href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</head>

<body>

<% HttpSession httpSession=request.getSession(); Userdata user_session=(Userdata)
        httpSession.getAttribute("user_session"); %>

<!-- --导航条  默认高度50px, 反色（黑色） 固定在顶部 -->
<nav class="navbar navbar-inverse .navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <!--当浏览器宽度变窄的时候会显示这个Button按钮，并且会把data-target中的div中ul收缩导航到Button下方-->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <!--定义小按钮的样式-->
                <span class="sr-only">Toggle navigation</span>
                <!-- 页面变窄时 ， 按钮的3条横线 -->
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!--Logo位置-->

        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <!--导航条内容-->
                <li class="active"><a href="#">首页 <span
                        class="sr-only">(current)</span></a></li>
                <li><a href="#">JAVA</a></li>
                <li><a href="#">PS</a></li>
                <li><a href="#">C++</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                       role="button" aria-expanded="false">更多<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Vue</a></li>
                        <li><a href="#">C#</a></li>
                        <li><a href="#">Html</a></li>
                        <li><a href="#">C#高级</a></li>
                        <li><a href="#">Python</a></li>
                    </ul>
                </li>
            </ul>
            <!--搜索表单-->
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search" />
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>

            <ul class="nav navbar-nav navbar-right">


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                       role="button" aria-expanded="false">用户<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a
                                href="http://localhost:63342/KnowledgeBase/myk1/web/log.html?_ijt=cep164d2hrj9srgkhn2irb71u0">登录</a>
                        </li>
                        <li><a href="#">注册</a></li>
                    </ul>
                </li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                       role="button" aria-expanded="false">联系我们<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">地址</a></li>
                        <li><a href="#">电话</a></li>
                        <li><a href="#">邮箱</a></li>
                        <li class="divider"></li>
                        <li><a href="#">微信</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<!--------栅格系统， 全局CSS样式-栅格系统  -------->

<!--栅格系统放在container容器中-->
<!-- 	<div class="container" style="margin-top">
<div class="row" align="left">
<div class="col-sm-12">

</div>
</div>
</div> -->
<div class="container" style="margin-top: -15px">
    <!--添加一行占用12列，添加img-->
    <div class="row">
        <div class="col-sm-4">
            <div class="top">
                <p class="picture"><img src="<%=user_session.getAvatar()%>" width="100" height="100" style="border-radius: 100%"></p>
                <p class="name"><%=user_session.getName()%></p>
            </div>
        </div>

        <div class="col-sm-8">
            <img src="./fengmian.jpg" style="width: 760px; height: 260px" />
        </div>
    </div>


    <div class="row" style="margin-top: 15px">
        <div class="col-sm-4">
            <table class="border_b2">
                <tbody>
                <tr class="title">
                    <td class="wid"><span>个人信息</span></td>
                </tr>
                </tbody>
            </table>


            <table class="mes_l">
                <tbody>
                <tr class="per_list">
                    <td><span>昵称：</span></td>
                    <td><span class="y_black"><%=user_session.getName()%></span></td>
                </tr>
                </tbody>
            </table>


            <table class="mes_l">
                <tbody>
                <tr class="per_list">
                    <td class="dir"><span>知识点数量：</span></td>
                    <%
                        int user_id=user_session.getId();
                        int cnt=0; Database database=new Database();
                        PreparedStatement preparedStatement=database.getConnection().prepareStatement("select COUNT(k_id) from knowledge where user_id=?");
                        preparedStatement.setInt(1, user_id);
                        ResultSet resultSet=preparedStatement.executeQuery();
                        while(resultSet.next() ) {
                            cnt=resultSet.getInt(1);
                        }
                    %>
                    <td class="limit2"><span class="y_black"><%=cnt%></span>
                    </td>
                </tr>
                </tbody>
            </table>

            <table class="mes_l">
                <tbody>
                <tr class="per_list">
                    <td class="dir"><span>E-mail：</span></td>
                    <td class="limit1"><span class="y_black"><%=user_session.getEmail()%></span>
                    </td>


                    <%-- <tr class="per_list">--%>
                    <%-- <td><span>专业：</span></td>--%>
                    <%-- <td class="limit1"><span
                            class="y_black">软件工程</span></td>--%>
                    <%-- </tr>--%>

                    <%-- <tr class="per_list">--%>
                    <%-- <td class="dir"><span>学校：</span></td>
                        --%>
                    <%-- <td class="limit1"><a
                            class="y_black">大连东软信息学院</a>
                        </td>--%>
                    <%-- </tr>--%>
                </tbody>
            </table>
            <a href="entering.jsp">
                <button>发布知识点</button>
            </a>
        </div>


        <div class="col-sm-4">
            <!--添加列表组件-->
            <div class="list-group">
                <a href="#" class="list-group-item active disabled"
                   align="center">知识库人气榜</a>
                <a href="#" class="list-group-item" align="center">123</a>
                <a href="#" class="list-group-item" align="center">我的新闻</a>
                <a href="#" class="list-group-item" align="center">新闻新闻新闻新闻新闻新闻</a>
                <a href="#" class="list-group-item" align="center">新闻新闻新闻新闻新闻新闻</a>
                <a href="#" class="list-group-item" align="center">新闻新闻新闻新闻新闻新闻</a>
                <a href="#" class="list-group-item" align="center">新闻新闻新闻新闻新闻新闻</a>
            </div>
        </div>

        <div class="col-sm-4">
            <!--添加列表组件-->
            <div class="list-group">
                <a href="#" class="list-group-item active disabled"
                   align="center">知识库人气榜</a>
                <a href="#" class="list-group-item" align="center">关注关注>关注关注>关注关注</a>
                <a href="#" class="list-group-item" align="center">新闻新闻新闻新闻新闻新闻</a>
                <a href="#" class="list-group-item" align="center">精华精华精华精华精华精华</a>
                <a href="#" class="list-group-item" align="center">我评我评我评我评我评我评</a>
                <a href="#" class="list-group-item" align="center">我赞我赞我赞我赞我赞我赞</a>
                <a href="#" class="list-group-item" align="center">我赞我赞我赞我赞我赞我赞</a>
            </div>
        </div>

        <!-- 添加分页效果 -->
        <nav>
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </a>
                </li>
            </ul>
        </nav>

    </div>
</div>

</div>





</body>

</html>