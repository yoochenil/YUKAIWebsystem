<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>YUKAI WEBSYSTEM ADMIN</title>

    <meta name="description" content="YUKAI WEBSYSTEM ADMIN DESCRIOTION"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath }/resources/images/favicon.ico">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/resources/css/fonts.googleapis.com.css"/>
    <link rel="stylesheet" href="/resources/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <link rel="stylesheet" href="/resources/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="/resources/css/ace-rtl.min.css"/>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/full-calendar/jquery.min.js"></script>
    <script src="/resources/js/ace-extra.min.js"></script>
    <script src="/resources/js/jquery-2.1.4.min.js"></script>
</head>

<body class="no-skin">
<shiro:notAuthenticated>
    <jsp:forward page="404.jsp"/>
</shiro:notAuthenticated>
<shiro:authenticated>
    <div id="navbar" class="navbar navbar-default ace-save-state">
        <div class="navbar-container ace-save-state" id="navbar-container">
            <div class="navbar-header pull-left">
                <a href="/" class="navbar-brand">
                    <small>
                        <i class="fa fa-leaf"></i>
                        YUKAI Admin
                    </small>
                </a>
            </div>
            <div class="navbar-buttons navbar-header pull-right" role="navigation">
                <ul class="nav ace-nav">
                    <li class="light-blue dropdown-modal">
                        <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <span class="user-info">
									<small>ようこそ,<shiro:hasRole name="ADMIN">【ADMIN】</shiro:hasRole></small>
                            <shiro:principal/>
						</span>
                            <i class="ace-icon fa fa-caret-down"></i>
                        </a>

                        <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                            <li>
                                <a href="#">
                                    <i class="ace-icon fa fa-cog"></i>
                                    設定
                                </a>
                            </li>

                            <li>
                                <a href="profile.html">
                                    <i class="ace-icon fa fa-user"></i>
                                    個人情報
                                </a>
                            </li>

                            <li class="divider"></li>

                            <li>
                                <a href="/logout">
                                    <i class="ace-icon fa fa-power-off"></i>
                                    ログアウト
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>

        </div>
    </div>

    <div class="main-container ace-save-state" id="main-container">
        <div id="sidebar" class="sidebar responsive ace-save-state menu-min">

            <ul class="nav nav-list">
                <li class="">
                    <a href="/work/board">
                        <i class="menu-icon fa fa-tachometer"></i>
                        <span class="menu-text"> Dashboard </span>
                    </a>
                </li>
                <li class="store1">
                    <a href="#">
                        <i class="menu-icon fa fa-angle-right"></i>
                        <span class="menu-text">1号店</span>
                    </a>
                </li>
                <li class="store2">
                    <a href="#">
                        <i class="menu-icon fa fa-angle-right"></i>
                        <span class="menu-text">２号店</span>
                    </a>
                </li>
                <li class="store3">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-angle-right"></i>
                        <span class="menu-text">３号店</span>
                    </a>
                </li>
                <li class="store4">
                    <a href="#">
                        <i class="menu-icon fa fa-angle-right"></i>
                        <span class="menu-text">４号店</span>
                    </a>
                </li>
                <li class="datatable">
                    <a href="#">
                        <i class="menu-icon fa fa-calendar"></i>
                        <span class="menu-text">データ</span>
                    </a>
                </li>
                <li class="datachart">
                    <a href="#">
                        <i class="menu-icon fa fa-picture-o"></i>
                        <span class="menu-text"> Chart </span>
                    </a>
                </li>
                <li class="">
                    <a href="#">
                        <i class="menu-icon fa fa-tag"></i>
                        <span class="menu-text"> More Pages </span>
                    </a>
                </li>
            </ul>
            <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
                <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state"
                   data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
            </div>
        </div>

        <div class="main-content">
            <div class="main-content-inner">
                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12" id="board-main">
                            <embed type="text/html" src="/work/board-main" width="100%" height="750px">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="footer-inner">
                <div class="footer-content">
                <span class="bigger-120">
                    <span class="blue bolder">YUKAI</span>
                    Web Application &copy; 2018-2019
                </span>
                </div>
            </div>
        </div>

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/ace-elements.min.js"></script>
    <script src="/resources/js/ace.min.js"></script>
    <script>
        $('.store1').click(function(){
            const html='<embed type="text/html" src="/work/store-1" width="100%" height="750px">';
            $('#board-main').html(html);
        });
        $('.store2').click(function(){
            const html='<embed type="text/html" src="/work/store-2" width="100%" height="750px">';
            $('#board-main').html(html);
        });
        $('.store3').click(function(){
            const html='<embed type="text/html" src="/work/store-3" width="100%" height="750px">';
            $('#board-main').html(html);
        });
        $('.store4').click(function(){
            const html='<embed type="text/html" src="/work/store-4" width="100%" height="750px">';
            $('#board-main').html(html);
        });
        $('.datatable').click(function(){
            const html='<embed type="text/html" src="/work/data-table" width="100%" height="750px">';
            $('#board-main').html(html);
        });
        $('.datachart').click(function(){
            const html='<embed type="text/html" src="/chart/main" width="100%" height="100px">' +
                '<embed type="text/html" src="/chart/data-chart" width="100%" height="750px">';
            $('#board-main').html(html);
        });
    </script>
</shiro:authenticated>
</body>
</html>
