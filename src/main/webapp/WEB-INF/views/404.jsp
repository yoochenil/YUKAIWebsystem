<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page session="false" %>
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
    <link rel="stylesheet" href="/resources/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>

</head>

<body class="no-skin">
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
    </div>
</div>
<div class="main-container ace-save-state" id="main-container">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="error-container">
                            <div class="well">
                                <h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="ace-icon fa fa-sitemap"></i>
												404
											</span>
                                    Page Not Found
                                </h1>
                                <hr/>
                                <h3 class="lighter smaller">We looked everywhere but we couldn't find it!</h3>
                                <div>
                                    <form class="form-search">
												<span class="input-icon align-middle">
													<i class="ace-icon fa fa-search"></i>

													<input type="text" class="search-query"
                                                           placeholder="Give it a search..."/>
												</span>
                                        <button class="btn btn-sm" type="button">Go!</button>
                                    </form>
                                    <div class="space"></div>
                                    <h4 class="smaller">Try one of the following:</h4>
                                    <ul class="list-unstyled spaced inline bigger-110 margin-15">
                                        <li>
                                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                                            Re-check the url for typos
                                        </li>
                                        <li>
                                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                                            Read the faq
                                        </li>
                                        <li>
                                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                                            Tell us about it
                                        </li>
                                    </ul>
                                </div>
                                <hr/>
                                <div class="space"></div>

                                <div class="center">
                                    <a href="/" class="btn btn-grey">
                                        <i class="ace-icon fa fa-arrow-left"></i>
                                        Go Back
                                    </a>
                                </div>
                            </div>
                        </div>
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
</div>
</body>
</html>