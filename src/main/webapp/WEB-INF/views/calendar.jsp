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

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/full-calendar/fullcalendar.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/full-calendar/scheduler.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/zui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/datetimepicker.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/websystem.css">
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/full-calendar/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/full-calendar/jquery-ui.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/full-calendar/moment.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/full-calendar/fullcalendar.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/full-calendar/scheduler.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/full-calendar/locale-all.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/zui.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/datetimepicker.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/js/websystem.js"></script>
    <script>
        $(function () {
            $('.fc-widget-content').children().css( "height", "50px" );

            $('#external-events .fc-event').each(function () {

                $(this).data('event', {
                    title: $.trim($(this).text()),
                    stick: false // maintain when user navigates (see docs on the renderEvent method)
                });

                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0 //  original position after the drag
                });

            });


            $('#calendar').fullCalendar({
                schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source', //ライセンスkey
                now: moment(), //現在時間
                //themeSystem:'bootstrap4',
                editable: true, //編集可能
                droppable: true, //ドロップ可能
                //selectable: false,
                //selectHelper:true,
                contentHeight: 652,//カレンダーの高さ  //５店舗:295  ++　51　　　heightはタイトル行も含む
                scrollTime: '09:00', //スクロールの初期位置
                minTime: '09:00', //timelineの開始時間
                nowIndicator:true,//
                customButtons: { //新規カスタマーボタン
                    addWorkButton: { //ボタン名
                        text: '新規追加', //表示名
                        click: function () { //クリックされた時の処理
                            $("#myModal").modal({
                                name: 'newEvent',
                                backdrop: 'static',
                                keyboard: true,
                                moveable: true
                            });
                            $(".modal-title").html("新規スケジュール追加");
                            document.getElementById("workForm").reset();
                            $("select[name=staffid]").css("border","3px solid orange");
                            $("select[name=storeid]").css("border","3px solid orange");
                            $("select[name=roomid]").css("border","3px solid orange");
                            $("select[name=courseid]").css("border","3px solid orange");
                            $("input[name=start]").css("border","3px solid orange");
                            $("input[name=end]").css("border","3px solid orange");
                            $("select[name=level]").css("border","3px solid orange");

                            $('div[name=id]').hide();
                            $('.btn-primary').show();
                            $('.btn-warning').hide();
                            $('.btn-danger').hide();
                        }
                    },
                    refreshButton: { //ボタン名
                        text:"リフレッシュ",
                        click:function(){
                            location.reload();
                        }
                    }
                },
                header: {
                    left: 'today prevYear,prev,next,nextYear addWorkButton refreshButton', //左上のボタン集
                    center: 'title', //中の表示項目
                    right: 'timelineDay,agendaWeek,month' //右のボタン集 {agendaWeek,month}
                },
                defaultView: 'timelineDay', //デフォルト表示形式
                titleFormat: 'LL', //タイトルに表示する今日の日付の形式
                locale: "ja", //言語、時間などの日本語化
                firstDay: 1, //曜日の始まり　１＝月曜日
                timeFormat: 'HH:mm',//eventの表示時間フォーマット
                displayEventTime: true, //eventの開始時間表示
                displayEventEnd: true, //eventの終了時間表示
                resourceAreaWidth: '9%', //店舗、ROOMの表示幅
                eventOverlap: false, //EVENTの被せるFLG
                loading: false,
                views: { //各表示形式の個別設定
                    timelineDay: {
                        buttonText: '日', //ボタン表示名
                        slotDuration: '00:10', //表示時間サイクル
                        slotLabelFormat: 'HH:mm', //サイクル時間形式
                        slotWidth: '20', //サイクルの幅Pixcel
                        slotLabelInterval: "00:30"//시간표시 빈도
                    },
                    agendaWeek: {
                        buttonText: '週'
                    },
                    month: {
                        buttonText: '月'
                    }
                },
                resourceColumns: [ //店舗、ROOMの設定
                    {
                        group: true, //まとめFLG
                        labelText: '店舗', //表示名
                        field: 'store' //フィールド名
                    }, {
                        labelText: 'ROOM',
                        field: 'title'
                    }
                ],
                resources: function(callback){
                    $.ajax({
                        url: '/get-store-info',
                        type: 'post',
                        dataType: 'json',
                        data: {"storeId": $('#storeId').val()},
                        success: function (data) {
                            var resources = [];
                            $(data).each(function () {
                                resources.push({
                                    id: $(this).attr('id'),
                                    store: $(this).attr('store'),
                                    title: $(this).attr('title'),
                                    eventColor: $(this).attr('eventColor'),
                                    eventBackgroundColor: $(this).attr('eventBackgroundColor'),
                                    eventBorderColor: $(this).attr('eventBorderColor'),
                                    eventTextColor: $(this).attr('eventTextColor'),
                                    eventClassName: $(this).attr('eventClassName'),
                                    businessHours: $(this).attr('businessHours')
                                });
                            });
                            callback(resources);
                        }
                    });
                },
                events: function (start, end, timezone, callback) {
                    var date = start.format('YYYYMMDD');
                    $.ajax({
                        url: '/work/getWork',
                        type: 'post',
                        dataType: 'json',
                        data: {
                            "date": date,
                            "storeid":$('#storeId').val()
                        },
                        success: function (data) {
                            var events = [];
                            $(data).each(function () {
                                events.push({
                                    id: $(this).attr('id'),
                                    resourceId: $(this).attr('resourceid'),
                                    title: $(this).attr('title'),
                                    start: moment($(this).attr('start'), 'YYYY-MM-DD HH:mm:ss'),
                                    end: moment($(this).attr('end'), 'YYYY-MM-DD HH:mm:ss'),
                                    staffid: $(this).attr('staffid'),
                                    courseid: $(this).attr('courseid'),
                                    note: $(this).attr('note'),
                                    level: $(this).attr('level')
                                });
                            });
                            callback(events);
                        }
                    });
                },
                eventRender: function(event, element) {
                    element.css({
                        "font-size": 15,
                        "height":38
                    });
                    if(event.courseid==='1'){
                        $(this).css("background-color","yellow");
                    }
                },
                drop: function (date, jsEvent, ui, resourceId) {
                    console.log('drop', date.format(), resourceId);
                    if ($('#drop-remove').is(':checked')) {
                        $(this).remove();
                    }
                },
                eventReceive: function (event,calEvent, jsEvent, view) { //익스터널이벤트를 캘린더에 내려놓았을때
                    console.log("event",event);
                    console.log("calEvent",calEvent);
                    console.log("jsEvent",jsEvent);
                    console.log("view",view);
                    $("#myModal").modal({
                        name: 'external-event',
                        backdrop: 'static',
                        keyboard: true,
                        moveable: true
                    });
                    $(".modal-title").html("新規スケジュール追加");
                    document.getElementById("workForm").reset();

                    $("select[name=staffid]").css("border","3px solid orange");
                    $("select[name=storeid]").val(event.resourceId.substring(5,6));
                    storeSelected();
                    $("select[name=roomid]").val(event.resourceId.substring(10,12));
                    roomidSelected();
                    $("select[name=courseid]").css("border","3px solid orange");
                    $("input[name=start]").val(moment(event.start,'llll').format('YYYY-MM-DD HH:mm:ss'));
                    $("input[name=end]").val(moment(event.end,'llll').format('YYYY-MM-DD HH:mm:ss'));
                    $("select[name=level]").css("border","3px solid orange");

                    $('div[name=id]').hide();
                    $('.btn-primary').show();
                    $('.btn-warning').hide();
                    $('.btn-danger').hide();
                },
                eventDrop: function (calEvent, jsEvent, view) { // 이번트를 이동하여 새로운 위치에 내려놓을때
                    console.log('eventDrop', event);
                    $("#myModal").modal({
                        name: 'newEvent',
                        backdrop: 'static',
                        keyboard: true,
                        moveable: true
                    });
                    $(".modal-title").html("スケジュール変更");
                    $("input[name=id]").val(calEvent.id);
                    $("input[name=title]").val(calEvent.title);
                    $("select[name=staffid]").val(calEvent.staffid);
                    $("select[name=storeid]").val(calEvent.resourceId.substring(5,6));
                    storeSelected();
                    $("select[name=roomid]").val(calEvent.resourceId.substring(10,12));
                    $("select[name=courseid]").val(calEvent.courseid);
                    $("input[name=start]").val(moment(calEvent.start,'llll').format('YYYY-MM-DD HH:mm:ss'));
                    $("input[name=end]").val(moment(calEvent.end,'llll').format('YYYY-MM-DD HH:mm:ss'));
                    $("textarea[name=note]").val(calEvent.note);
                    $("select[name=level]").val(calEvent.level);

                    $('div[name=id]').show();
                    $('.btn-primary').hide();
                    $('.btn-warning').show();
                    $('.btn-danger').show();
                },
                select:function( start, end, jsEvent, view, resource){
                    console.log(start);
                },

                /*           dayClick: function(date, jsEvent, view, resourceObj) {//캘린더 패널 클릭했을때

                               alert('Date: ' + date.format());
                               alert('Resource ID: ' + resourceObj.id);

                             }, */
                eventClick: function(calEvent, jsEvent, view) {//이벤트를 클릭했을때
                    $("#myModal").modal({
                        name: 'newEvent',
                        backdrop: 'static',
                        keyboard: true,
                        moveable: true
                    });
                    $(".modal-title").html("スケジュール変更");
                    $("input[name=id]").val(calEvent.id);
                    $("input[name=title]").val(calEvent.title);
                    $("select[name=staffid]").val(calEvent.staffid);
                    $("select[name=storeid]").val(calEvent.resourceId.substring(5,6));
                    storeSelected();
                    $("select[name=roomid]").val(calEvent.resourceId.substring(10,12));
                    roomidSelected();
                    $("select[name=courseid]").val(calEvent.courseid);
                    $("input[name=start]").val(moment(calEvent.start,'llll').format('YYYY-MM-DD HH:mm:ss'));
                    $("input[name=end]").val(moment(calEvent.end,'llll').format('YYYY-MM-DD HH:mm:ss'));
                    $("textarea[name=note]").val(calEvent.note);
                    $("select[name=level]").val(calEvent.level);

                    $('div[name=id]').show();
                    $('.btn-primary').hide();
                    $('.btn-warning').show();
                    $('.btn-danger').show();
                 },

                eventMouseover: function(calEvent, jsEvent, view) {//마우스가 이벤트에 들어올때
                   $(this).css("border","3px solid pink");
                 },
                eventMouseout: function(calEvent, jsEvent, view) {//마우스가 이벤트를 나갈때
                   $(this).css('border', '');
                 }
/*                loading: function (isLoading, view) {
                    if (isLoading != true) {
                        $("#loadingModal").modal({
                            name: 'loading',
                            backdrop: 'static',
                            keyboard: true,
                        })
                    }
                }*/
            });

        });

    </script>
</head>
<body>
<div id='wrap'>
    <div id='external-events'>
        <h5>全身</h5>
        <div class='fc-event' data-duration='00:30' data-event='{"title":"30","courseid":"1","start":"2018-10-25 21:00:00","end":"2018-10-25 21:30:00","note":"this is note"}'>３０分全身</div>
        <div class='fc-event' data-duration='00:60'>６０分全身</div>
        <div class='fc-event' data-duration='01:30'>９０分全身</div>
        <div class='fc-event' data-duration='02:00'>１２０分全身</div>
        <h5>足ツボ</h5>
        <div class='fc-event' data-duration='00:30'>３０分足ツボ</div>
        <div class='fc-event' data-duration='00:60'>６０分足ツボ</div>
        <div class='fc-event' data-duration='01:30'>９０分足ツボ</div>
        <h5>アロマ</h5>
        <div class='fc-event' data-duration='01:00'>６０分アロマ</div>
        <div class='fc-event' data-duration='01:30'>９０分アロマ</div>
        <div class='fc-event' data-duration='02:00'>１２０分アロマ</div>
        <h5>セットコース</h5>
        <div class='fc-event' data-duration='00:60'>３０分全身+３０分足ツボ</div>
        <div class='fc-event' data-duration='01:30'>３０分全身+６０分足ツボ</div>
        <div class='fc-event' data-duration='02:00'>３０分全身+９０分足ツボ</div>

    </div>
    <div id='calendar'></div>

    <div style='clear:both'></div>


    <div class="modal fade" id="loadingModal">
        <div class="modal-dialog">
            Loading...
        </div>
    </div>

    <!-- 对话框触发按钮 -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" style="text-align:left">新規スケジュール追加</h4>
                </div>
                <form class="form-horizontal" action="" id="workForm" method="post">
                    <div class="modal-body">
                        <div class="form-group" name="id">
                            <label class="col-sm-2">ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="id" placeholder="ID" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2">タイトル</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="title" placeholder="タイトル">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2">担当者</label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${USERLIST != null}">
                                        <select name="staffid" class="form-control" onchange="staffidSlected();">
                                            <option selected>
                                                <c:forEach items="${USERLIST}" var="user">
                                                <option value="${user.userName}" ${user.userName == staffid ? 'selected' : '' }>${user.name_display}</option>
                                                </c:forEach>
                                        </select>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2">店舗</label>
                            <div class="col-sm-4">
                                <c:choose>
                                    <c:when test="${STORELIST != null }">
                                        <select name="storeid" class="form-control" onchange="storeSelected();">
                                            <option selected>
                                            <c:forEach items="${STORELIST }" var="store">
                                                <option value="${store.storeid}" ${store.storename == storename ? 'selected' : '' }>${store.storename}</option>
                                            </c:forEach>
                                            </option>
                                        </select>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" name="storeid" placeholder="店舗">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <label class="col-sm-2">室番</label>
                            <div class="col-sm-4">
                                <select name="roomid" class="form-control" onchange="roomidSelected();">
                                    <option selected></option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2">コース</label>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${COURSELIST != null}">
                                        <select name="courseid" class="form-control" onchange="courseidSelected();">
                                            <option selected>
                                                <c:forEach items="${COURSELIST}" var="courselist">
                                            <option value="${courselist.courseid}" ${courselist.courseid == courseid ? 'selected' : '' }>【${courselist.price}円】:${courselist.coursename}</option>
                                            </c:forEach>
                                        </select>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2">開始</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control form-datetime" name="start" readonly="" placeholder="開始時間" onchange="startInputed();">
                            </div>
                            <label class="col-sm-2">終了</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control form-datetime" name="end" readonly="" placeholder="終了時間" onchange="endInputed();">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2">指名</label>
                            <div class="col-sm-10">
                                <select name="level" class="form-control" onchange="levelInputed();">
                                    <option selected></option>
                                    <option value="1">指名</option>
                                    <option value="0">非指名</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2">メモ</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="note" rows="2" placeholder="メモ"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger" >削除</button>
                        <button type="button" class="btn btn-warning">変更</button>
                        <button type="button" class="btn btn-primary">追加</button>
                    </div>
                </form>
            </div>
        </div>
        <script>
            //选择时间和日期
            $(".form-datetime").datetimepicker(
                {
                    weekStart: 1,
                    todayBtn: 1,
                    autoclose: 1,
                    todayHighlight: 1,
                    startView: 2,
                    forceParse: 0,
                    showMeridian: 1,
                    format: "yyyy-mm-dd hh:ii:ss"
                });
            //仅选择日期
            $(".form-date").datetimepicker(
                {
                    language: "ja",
                    weekStart: 1,
                    todayBtn: 1,
                    autoclose: 1,
                    todayHighlight: 1,
                    startView: 2,
                    minView: 2,
                    forceParse: 0,
                    format: "yyyy-mm-dd"
                });
            //选择时间
            $(".form-time").datetimepicker({
                language: "ja",
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 1,
                minView: 0,
                maxView: 1,
                forceParse: 0,
                format: 'yyyy-mm-dd hh:ii:ss'
            });

            $('.btn-primary').click(function(){
                $('#workForm').attr('action','/work/insWork');
                $('.btn-primary').attr('type','submit');
                $('.btn-primary').submit();
            });
            $('.btn-warning').click(function(){
                $('#workForm').attr('action','/work/updWork');
                $('.btn-warning').attr('type','submit');
                $('.btn-warning').submit();
            });
            $('.btn-danger').click(function(){
                $('#workForm').attr('action','/work/delWork');
                $('.btn-danger').attr('type','submit');
                $('.btn-danger').submit();
            });
            $('.btn-default').click(function(){
                location.reload();
            });

            $(document).ready(function() {
                moment.locale('ja');
                var html = `<h2 id='time'></h2>`;
                $('.fc-center').append(html);
                setInterval(function() {
                    var momentNow = moment();
                    $('#time').html(momentNow.format('dddd') + ' ' + momentNow.format('HH:mm:ss'));
                }, 100);
            });
        </script>
    </div>
</div>
<input type="hidden" id="storeId" value="${STOREID}"/>

</body>
</html>