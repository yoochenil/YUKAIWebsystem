<!DOCTYPE HTML>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="Referrer" content="origin">
    <meta name="viewport" content="width=1100">
    <meta name="description" content="Websystem's Description">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jq-grid/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jq-grid/jquery-ui.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jq-grid/bootstrap-datepicker3.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jq-grid/ui.jqgrid.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jq-grid/fonts.googleapis.com.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jq-grid/ace.min.css"/>

    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/full-calendar/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jq-grid/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jq-grid/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jq-grid/bootstrap-datepicker.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jq-grid/jquery.jqGrid.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jq-grid/grid.locale-en.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jq-grid/ace-elements.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jq-grid/ace.min.js"></script>


</head>
<body class="no-skin">
<div class="main-container ace-save-state" id="main-container">

    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">



                        <div class="step-pane active" data-step="1">
                            <h3 class="lighter block green bolder">検索条件を入力してください。</h3>

                            <form class="col-xs-10 form-horizontal" id="search-form">
                                <div class="col-sm-4 form-group has-warning">
                                    <label for="inputDate" class="col-sm-3 control-label no-padding-right">日付</label>
                                    <div class="col-sm-9">
                                        <span class="block input-icon input-icon-right">
                                            <input type="text" id="inputDate" class="width-100 " value=""/>
                                            <i class="ace-icon fa fa-calendar"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-sm-4 form-group has-error">
                                    <label for="inputStoreid" class="col-sm-3 control-label no-padding-right">店舗</label>
                                    <div class="col-sm-9">
                                        <span class="block input-icon input-icon-right">
                                            <c:choose>
                                                <c:when test="${STORELIST != null }">
                                                    <select id="inputStoreid" class="form-control width-100">
                                                        <option selected>
                                                            <c:forEach items="${STORELIST }" var="store">
                                                            <option value="${store.storeid}" ${store.storename == storename ? 'selected' : '' }>${store.storename}</option>
                                                        </c:forEach>

                                                    </select>
                                                </c:when>
                                            </c:choose>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-sm-4 form-group has-success">
                                    <label for="inputStaffid" class="col-sm-3 control-label no-padding-right">スタッフ</label>
                                    <div class="col-sm-9">
                                        <span class="block input-icon input-icon-right">
                                            <c:choose>
                                                <c:when test="${USERLIST != null }">
                                                    <select id="inputStaffid" class="form-control width-100">
                                                        <option selected>
                                                            <c:forEach items="${USERLIST }" var="user">
                                                            <option value="${user.userName}" ${user.userName == userName ? 'selected' : '' }>${user.name_display}</option>
                                                        </c:forEach>

                                                    </select>
                                                </c:when>
                                            </c:choose>
                                        </span>
                                    </div>
                                </div>
                            </form>
                            <button type="button" class="col-xs-1 btn btn-primary" id="dataSearch">検索</button>
                        </div>

                    <div class="col-xs-12" id="dataTable">
                        <table id="grid-table"></table>
                        <div id="grid-pager"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->



<!-- inline scripts related to this page -->
<script type="text/javascript">
    var request;
    $('#dataSearch').on('click',function() {
        var defaultGridHtml = "<table id=\"grid-table\"></table><div id=\"grid-pager\"></div>";//クリックする毎に初期化
        $('#gbox_grid-table').html(defaultGridHtml);

        var date = $('#inputDate').val();
        var storeid = $('#inputStoreid').val();
        var staffid = $('#inputStaffid').val();

            $.ajax({
                url: '/work/getWorkDataTable',
                type: 'post',
                async: false,
                dataType: 'json',
                data: {
                    "date": date,
                    "storeid": storeid,
                    "staffid": staffid
                },
                success: function (data) {
                    request = data;
                },
                error: function (data) {
                    alert("データが取れませんでした。ERROR")
                }
            });

            var grid_selector = "#grid-table";
            var pager_selector = "#grid-pager";
            var parent_column = $(grid_selector).closest('[class*="col-"]');
            //resize to fit page size
            $(window).on('resize.jqGrid', function () {
                $(grid_selector).jqGrid('setGridWidth', parent_column.width());
            });
            //resize on sidebar collapse/expand
            $(document).on('settings.ace.jqGrid', function (ev, event_name, collapsed) {
                if (event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed') {
                    //setTimeout is for webkit only to give time for DOM changes and then redraw!!!
                    setTimeout(function () {
                        $(grid_selector).jqGrid('setGridWidth', parent_column.width());
                    }, 20);
                }
            })
            //if your grid is inside another element, for example a tab pane, you should use its parent's width:
            /**
             $(window).on('resize.jqGrid', function () {
					var parent_width = $(grid_selector).closest('.tab-pane').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				})
             //and also set width when tab pane becomes visible
             $('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				  if($(e.target).attr('href') == '#mygrid') {
					var parent_width = $(grid_selector).closest('.tab-pane').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				  }
				})
             */
            jQuery(grid_selector).jqGrid({
                data: request,
                datatype: "local",
                height: 'auto',//テーブルの高さ
                colNames: [' ', 'スタッフ', 'タイトル', '店番', '室番', '開始', '終了', 'コース', '売上金額', '原価金額','指名','備考'],
                colModel:[
                    {name:'check',index:'', width:70, fixed:true, sortable:false, resize:false,
                        formatter:'actions',
                        formatoptions:{
                            keys:true,
                            //delbutton: false,//disable delete button

                            delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
                            //editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
                        }
                    },
                    {name:'name_display',index:'name_display', width:30, sorttype:"text" ,editable: false, edittype:"text"},
                    {name:'title',index:'title',width:90, sorttype:"text", editable:true},
                    {name:'storeid',index:'storeid', width:30, sorttype:"int", editable: false, edittype:"text"},
                    {name:'roomid',index:'roomid', width:30, sorttype:"int", editable: false, edittype:"text"},
                    {name:'start',index:'start', width:120, sorttype:"date", editable: true, unformat: pickDate, align:"center"},
                    {name:'end',index:'end', width:120, sorttype:"date", editable: true, unformat: pickDate, align:"center"},
                    {name:'course',index:'course', width:100, sorttype:"text", editable: false, edittype:"text"},
                    {name:'price',index:'price', width:50, sorttype:"float", formatter:"number", summaryType:'sum', align:"right"},
                    {name:'genka',index:'genka', width:50, sorttype:"float", formatter:"number", summaryType:'sum', align:"right"},
                    {name:'level',index:'level', width:30, sorttype:"int", editable: true, edittype:"checkbox", editoptions: {value:"指名:通常"}},
                    {name:'note',index:'note', width:150, sortable:false,editable: true,edittype:"textarea", editoptions:{rows:"2",cols:"30"}}
                ],

                rowNum: 30,
                rowList: [30, 50, 100],
                pager: pager_selector,
                grouping:true,
                groupingView : {
                    groupField : ['name_display'],
                    groupColumnShow : [false],
                    groupSummary : [true],
                    groupText : ['<b>{0} - {1} 件</b>'],
                    groupCollapse : false,
                    groupOrder: ['asc']
                },
                altRows: true,
                multiselect: true,

                loadComplete: function () {
                    var table = this;
                    setTimeout(function () {
                        styleCheckbox(table);
                        updateActionIcons(table);
                        updatePagerIcons(table);
                        enableTooltips(table);
                    }, 0);
                },

                editurl: "./dummy.php",//nothing is saved
                caption: "データテーブル",//タイトル
                autowidth: true,
            });
            $(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size

            //switch element when editing inline
            function aceSwitch(cellvalue, options, cell) {
                setTimeout(function () {
                    $(cell).find('input[type=checkbox]')
                        .addClass('ace ace-switch ace-switch-5')
                        .after('<span class="lbl"></span>');
                }, 0);
            }

            //enable datepicker
            function pickDate(cellvalue, options, cell) {
                setTimeout(function () {
                    $(cell).find('input[type=text]')
                        .datepicker({format: 'yyyy-mm-dd', autoclose: true});
                }, 0);
            }

            //navButtons
            jQuery(grid_selector).jqGrid('navGrid', pager_selector,
                { 	//navbar options
                    edit: true,
                    editicon: 'ace-icon fa fa-pencil blue',
                    add: true,
                    addicon: 'ace-icon fa fa-plus-circle purple',
                    del: true,
                    delicon: 'ace-icon fa fa-trash-o red',
                    search: true,
                    searchicon: 'ace-icon fa fa-search orange',
                    refresh: true,
                    refreshicon: 'ace-icon fa fa-refresh green',
                    view: true,
                    viewicon: 'ace-icon fa fa-search-plus grey',
                },
                {
                    //edit record form
                    //closeAfterEdit: true,
                    //width: 700,
                    recreateForm: true,
                    beforeShowForm: function (e) {
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                        style_edit_form(form);
                    }
                },
                {
                    //new record form
                    //width: 700,
                    closeAfterAdd: true,
                    recreateForm: true,
                    viewPagerButtons: false,
                    beforeShowForm: function (e) {
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
                            .wrapInner('<div class="widget-header" />')
                        style_edit_form(form);
                    }
                },
                {
                    //delete record form
                    recreateForm: true,
                    beforeShowForm: function (e) {
                        var form = $(e[0]);
                        if (form.data('styled')) return false;

                        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                        style_delete_form(form);

                        form.data('styled', true);
                    },
                    onClick: function (e) {
                        //alert(1);
                    }
                },
                {
                    //search form
                    recreateForm: true,
                    afterShowSearch: function (e) {
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
                        style_search_form(form);
                    },
                    afterRedraw: function () {
                        style_search_filters($(this));
                    }
                    ,
                    multipleSearch: true,
                    /**
                     multipleGroup:true,
                     showQuery: true
                     */
                },
                {
                    //view record form
                    recreateForm: true,
                    beforeShowForm: function (e) {
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
                    }
                }
            )


            function style_edit_form(form) {
                //enable datepicker on "sdate" field and switches for "stock" field
                form.find('input[name=sdate]').datepicker({format: 'yyyy-mm-dd', autoclose: true})

                form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
                //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
                //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');


                //update buttons classes
                var buttons = form.next().find('.EditButton .fm-button');
                buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
                buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
                buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')

                buttons = form.next().find('.navButton a');
                buttons.find('.ui-icon').hide();
                buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
                buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');
            }

            function style_delete_form(form) {
                var buttons = form.next().find('.EditButton .fm-button');
                buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
                buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
                buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
            }

            function style_search_filters(form) {
                form.find('.delete-rule').val('X');
                form.find('.add-rule').addClass('btn btn-xs btn-primary');
                form.find('.add-group').addClass('btn btn-xs btn-success');
                form.find('.delete-group').addClass('btn btn-xs btn-danger');
            }

            function style_search_form(form) {
                var dialog = form.closest('.ui-jqdialog');
                var buttons = dialog.find('.EditTable')
                buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
                buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
                buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
            }

            function beforeDeleteCallback(e) {
                var form = $(e[0]);
                if (form.data('styled')) return false;

                form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                style_delete_form(form);

                form.data('styled', true);
            }

            function beforeEditCallback(e) {
                var form = $(e[0]);
                form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                style_edit_form(form);
            }


            //it causes some flicker when reloading or navigating grid
            //it may be possible to have some custom formatter to do this as the grid is being created to prevent this
            //or go back to default browser checkbox styles for the grid
            function styleCheckbox(table) {
                /**
                 $(table).find('input:checkbox').addClass('ace')
                 .wrap('<label />')
                 .after('<span class="lbl align-top" />')


                 $('.ui-jqgrid-labels th[id*="_cb"]:first-child')
                 .find('input.cbox[type=checkbox]').addClass('ace')
                 .wrap('<label />').after('<span class="lbl align-top" />');
                 */
            }


            //unlike navButtons icons, action icons in rows seem to be hard-coded
            //you can change them like this in here if you want
            function updateActionIcons(table) {
                /**
                 var replacement =
                 {
						'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
						'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
						'ui-icon-disk' : 'ace-icon fa fa-check green',
						'ui-icon-cancel' : 'ace-icon fa fa-times red'
					};
                 $(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
                 */
            }

            //replace icons with FontAwesome icons like above
            function updatePagerIcons(table) {
                var replacement =
                    {
                        'ui-icon-seek-first': 'ace-icon fa fa-angle-double-left bigger-140',
                        'ui-icon-seek-prev': 'ace-icon fa fa-angle-left bigger-140',
                        'ui-icon-seek-next': 'ace-icon fa fa-angle-right bigger-140',
                        'ui-icon-seek-end': 'ace-icon fa fa-angle-double-right bigger-140'
                    };
                $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
                    var icon = $(this);
                    var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

                    if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
                })
            }

            function enableTooltips(table) {
                $('.navtable .ui-pg-button').tooltip({container: 'body'});
                $(table).find('.ui-pg-div').tooltip({container: 'body'});
            }

            $(document).one('ajaxloadstart.page', function (e) {
                $.jgrid.gridDestroy(grid_selector);
                $('.ui-jqdialog').remove();
            });


        });
</script>
<script>
    $( "#inputDate" ).val(moment().format('YYYY/MM/DD'));
    $( "#inputDate" ).datepicker({
        showOtherMonths: true,
        selectOtherMonths: false,
        autoclose:true,
        isRTL:true,
        changeMonth: true,
        changeYear: true,
        format:'yyyy/mm/dd',
        showButtonPanel: true,
        beforeShow: function() {
            //change button colors
            var datepicker = $(this).datepicker( "widget" );
            setTimeout(function(){
                var buttons = datepicker.find('.ui-datepicker-buttonpane')
                    .find('button');
                buttons.eq(0).addClass('btn btn-xs');
                buttons.eq(1).addClass('btn btn-xs btn-success');
                buttons.wrapInner('<span class="bigger-110" />');
            }, 0);
        }
    });
</script>
</body>
</html>