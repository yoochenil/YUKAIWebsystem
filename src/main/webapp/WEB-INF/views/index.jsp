<!DOCTYPE HTML>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="Referrer" content="origin">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=1100">
    <meta name="description" content="Websystem's Description">
    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath }/resources/images/favicon.ico">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+JP" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/ace.min.css"/>
    <link rel="stylesheet" href="/resources/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/resources/css/datetimepicker.css">

    <script src="/resources/js/jquery-2.1.4.min.js"></script>
    <script src="/resources/js/datetimepicker.js"></script>
    <title>Home</title>


</head>
<body class="login-layout light-login">
<shiro:notAuthenticated>
    <div class="main-container">
        <div class="main-content">
            <div class="row">
                <c:if test="${errorMsg != null}">
                    <div class="alert alert-danger" role="alert">
                        <p style="text-align: center">${errorMsg}</p>
                    </div>
                </c:if>
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="login-container">
                        <div class="center">
                            <h1>
                                <i class="ace-icon fa fa-leaf green"></i>
                                <span class="red">癒快</span>
                                <span class="grey" id="id-text2">WebSystem</span>
                            </h1>
                            <h4 class="blue" id="id-company-text">&copy; 何とか株式会社</h4>
                        </div>

                        <div class="space-6"></div>

                        <div class="position-relative">
                            <div id="login-box" class="login-box visible widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header blue lighter bigger">
                                            <i class="ace-icon fa fa-coffee green"></i>
                                            ログイン情報
                                        </h4>

                                        <div class="space-6"></div>

                                        <form id="loginForm" method="post">
                                            <fieldset>
                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" name="userName"
                                                                   placeholder="アカウント"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" name="password"
                                                                   placeholder="パスワード"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                                </label>

                                                <div class="space"></div>

                                                <div class="clearfix">
                                                        <%--<label class="inline">
                                                            <input type="checkbox" class="ace" />
                                                            <span class="lbl"> Remember Me</span>
                                                        </label>--%>

                                                    <button type="button" id="login"
                                                            class="width-35 pull-right btn btn-sm btn-primary">
                                                        <i class="ace-icon fa fa-key"></i>
                                                        <span class="bigger-110">ログイン</span>
                                                    </button>
                                                </div>

                                                <div class="space-4"></div>
                                            </fieldset>
                                        </form>
                                        <div class="space-6"></div>
                                    </div><!-- /.widget-main -->

                                    <div class="toolbar clearfix">
                                        <div>
                                            <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                                    <%--<i class="ace-icon fa fa-arrow-left"></i>
                                                    <i style="font-size: 13px;">パスワードを忘れた場合</i>--%>
                                            </a>
                                        </div>

                                        <div>
                                            <a href="#" data-target="#signup-box" class="user-signup-link">
                                                新規登録
                                                <i class="ace-icon fa fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div><!-- /.widget-body -->
                            </div><!-- /.login-box -->

                            <div id="forgot-box" class="forgot-box widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header red lighter bigger">
                                            <i class="ace-icon fa fa-key"></i>
                                            パスワードを取り戻す
                                        </h4>

                                        <div class="space-6"></div>
                                        <p>
                                            E-mailを入力してください。
                                        </p>

                                        <form id="">
                                            <fieldset>
                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control"
                                                                   placeholder="Email"/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
                                                </label>

                                                <div class="clearfix">
                                                    <button type="button"
                                                            class="width-35 pull-right btn btn-sm btn-danger">
                                                        <i class="ace-icon fa fa-lightbulb-o"></i>
                                                        <span class="bigger-110">進む</span>
                                                    </button>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div><!-- /.widget-main -->

                                    <div class="toolbar center">
                                        <a href="#" data-target="#login-box" class="back-to-login-link">
                                            ログイン画面に戻る
                                            <i class="ace-icon fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div><!-- /.widget-body -->
                            </div><!-- /.forgot-box -->

                            <div id="signup-box" class="signup-box widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header green lighter bigger">
                                            <i class="ace-icon fa fa-users blue"></i>
                                            新規ユーザー登録
                                        </h4>

                                        <div class="space-6"></div>
                                        <p> 情報を入力してください: </p>

                                        <form id="registerForm" method="post">
                                            <fieldset>
                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="userName" class="form-control"
                                                                   placeholder="アカウント"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="password" class="form-control"
                                                                   placeholder="パスワード"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="paswordCheck"
                                                                   class="form-control" placeholder="パスワードチェック"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" name="email" class="form-control"
                                                                   placeholder="E-mail"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="name_kanji" class="form-control"
                                                                   placeholder="氏名「漢字」"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="name_kana" class="form-control"
                                                                   placeholder="氏名「カナ」"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="name_display" class="form-control"
                                                                   placeholder="店舗用名称"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="birthday"
                                                                   class="form-control form-date" placeholder="生年月日"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
                                                          <c:choose>
                                                              <c:when test="${GENDER != null }">
                                                                <select name="gender" class="form-control">
                                                                    <option disabled selected>性別
                                                                        <c:forEach items="${GENDER }" var="gender">
                                                                        <option value="${gender.masterti}" ${gender.masterti == gender ? 'selected' : '' }>${gender.masterti}</option>
                                                                    </c:forEach>
                                                                    </option>
                                                                </select>
                                                              </c:when>
                                                              <c:otherwise>
                                                                  <input type="text" class="form-control" name="gender"
                                                                         placeholder="性別">
                                                              </c:otherwise>
                                                          </c:choose>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="number" name="post" class="form-control"
                                                                   placeholder="郵便番号"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
                                                          <c:choose>
                                                              <c:when test="${TODOHUKEN != null }">
                                                                <select name="todohuken" class="form-control">
                                                                    <option disabled selected>都道府県
                                                                        <c:forEach items="${TODOHUKEN }"
                                                                                   var="ToDoHuKen">
                                                                        <option value="${ToDoHuKen}" ${TODOHUKEN == ToDoHuKen ? 'selected' : '' }>${ToDoHuKen}</option>
                                                                    </c:forEach>
                                                                    </option>
                                                                </select>
                                                              </c:when>
                                                              <c:otherwise>
                                                                  <input type="text" class="form-control"
                                                                         name="todohuken" placeholder="都道府県">
                                                              </c:otherwise>
                                                          </c:choose>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="address1" class="form-control"
                                                                   placeholder="住所１"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="address2" class="form-control"
                                                                   placeholder="住所２"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="address3" class="form-control"
                                                                   placeholder="住所３"/>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
                                                          <c:choose>
                                                              <c:when test="${STORE != null }">
                                                                <select name="storeid" class="form-control">
                                                                    <option disabled selected>常駐店舗
                                                                        <c:forEach items="${STORE }" var="store">
                                                                        <option value="${store.storeid}" ${store.storename == storename ? 'selected' : '' }>${store.storename}</option>
                                                                    </c:forEach>
                                                                    </option>
                                                                </select>
                                                              </c:when>
                                                              <c:otherwise>
                                                                  <input type="text" class="form-control" name="storeid"
                                                                         placeholder="常駐店舗">
                                                              </c:otherwise>
                                                          </c:choose>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
                                                          <c:choose>
                                                              <c:when test="${WORK_TIME != null }">
                                                                <select name="work_time" class="form-control">
                                                                    <option disabled selected>勤務時間帯
                                                                        <c:forEach items="${WORK_TIME }"
                                                                                   var="work_time">
                                                                        <option value="${work_time.masterti}" ${work_time.masterti == work_time ? 'selected' : '' }>${work_time.masterti}</option>
                                                                    </c:forEach>
                                                                    </option>
                                                                </select>
                                                              </c:when>
                                                              <c:otherwise>
                                                                  <input type="text" class="form-control"
                                                                         name="work_time" placeholder="勤務時間帯">
                                                              </c:otherwise>
                                                          </c:choose>
														</span>
                                                </label>


                                                <label class="block">
                                                    <input type="checkbox" name="termCheck" class="ace"/>
                                                    <span class="lbl">
															<a target="_blank" href="/terms">利用規約</a>に同意
														</span>
                                                </label>

                                                <div class="space-24"></div>

                                                <div class="clearfix">
                                                    <button type="reset" class="width-30 pull-left btn btn-sm">
                                                        <i class="ace-icon fa fa-refresh"></i>
                                                        <span class="bigger-110">リセット</span>
                                                    </button>

                                                    <button type="button" id="register"
                                                            class="width-65 pull-right btn btn-sm btn-success">
                                                        <span class="bigger-110">登録</span>
                                                        <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                    </button>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>

                                    <div class="toolbar center">
                                        <a href="#" data-target="#login-box" class="back-to-login-link">
                                            <i class="ace-icon fa fa-arrow-left"></i>
                                            ログイン画面に戻る
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</shiro:notAuthenticated>
<shiro:authenticated>
    <div class="main-container">
        <div class="main-content">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="login-container">
                        <div class="center">
                            <h1>
                                <i class="ace-icon fa fa-leaf green"></i>
                                <span class="red">癒快</span>
                                <span class="grey">WebSystem</span>
                            </h1>
                            <h4 class="blue">&copy; 何とか株式会社</h4>
                        </div>
                        <div class="space-6"></div>
                        <div class="position-relative">
                            <div class="login-box visible widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header blue lighter bigger">
                                            <i class="ace-icon fa fa-coffee green"></i>
                                            ログイン情報
                                        </h4>
                                        <div class="space-6"></div>
                                        <h6 class="pink">アカウント：<shiro:principal/>ログインされています。</h6>
                                        <div class="space-6"></div>
                                        <div class="clearfix">
                                            <button type="reset" id="dashboard" class="width-45 pull-left btn btn-sm">
                                                <i class="ace-icon fa fa-refresh"></i>
                                                <span class="bigger-110">DashBoard</span>
                                            </button>
                                            <button type="button" id="logout"
                                                    class="width-45 pull-right btn btn-sm btn-success">
                                                <span class="bigger-110">ログアウト</span>
                                                <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</shiro:authenticated>
<!-- inline scripts related to this page -->
<script type="text/javascript">
    $(function ($) {
        $(document).on('click', '.toolbar a[data-target]', function (e) {
            e.preventDefault();
            var target = $(this).data('target');
            $('.widget-box.visible').removeClass('visible');//hide others
            $(target).addClass('visible');//show target
        });
    });
    $('#login').click(function () {
        if ($('input[name=userName]').val() == "" && $('input[name=password]').val() == "") {
            alert("アカウントとパスワードを入力してください！");
        } else if ($('input[name=userName]').val() == "") {
            alert("アカウントを入力してください！");
        } else if ($('input[name=password]').val() == "") {
            alert("パスワードを入力してください！");
        } else {
            $('#loginForm').attr('action', '/login');
            $('#login').attr('type', 'submit');
            $('#login').submit();
        }
    });
    $('#logout').click(function () {
        document.location.href = "/logout";
    });
    $('#dashboard').click(function () {
        document.location.href = "/work/board";
    });
    $('#register').click(function () {
        if (!$('input[name=termCheck]').prop("checked")) {
            alert("利用規約を確認の上チェックしてください！");
        } else {
            $('#registerForm').attr('action', '/register');
            $('#register').attr('type', 'submit');
            $('#register').submit();
        }

    });
    $('.alert-danger').on('click', function () {
        $('.alert-danger').hide();
    });
    // 仅选择日期
    $(".form-date").datetimepicker(
        {
            language: "zh-CN",
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            format: "yyyy-mm-dd"
        });
</script>
</body>
</html>
