

function staffidSlected(){
    var staffid = $('select[name=staffid]').val();
    if(staffid === '' || staffid === null || staffid === undefined){
        $("select[name=staffid]").css("border","3px solid orange");
    }else{
        $("select[name=staffid]").css("border","1px solid #ccc");
    }
}



function storeSelected(){
    var storeid = $('select[name=storeid]').val();
    if(storeid === '' || storeid === null || storeid === undefined){
        $("select[name=storeid]").css("border","3px solid orange");
    }else{
        $("select[name=storeid]").css("border","1px solid #ccc");
        $.ajax({
            url: '/work/getRoomnum',
            type: 'post',
            async: false,
            dataType: 'json',
            data: {"storeId": storeid},
            success: function (data) {
                var html = '<option selected></option>';
                for(var i = 1;i<=data;i++){
                    html += '<option value=\"';
                    html += i;
                    html += '\">';
                    html += i + '号室</option>';
                }
                $('select[name=roomid]').html(html);
            },
            error:function(){
                alert("室番取得に失敗しました、管理者に連絡してください。");
            }
        });
    }
}

function roomidSelected(){
    var roomid = $('select[name=roomid]').val();
    if(roomid === '' || roomid === null || roomid === undefined){
        $("select[name=roomid]").css("border","3px solid orange");
    }else{
        $("select[name=roomid]").css("border","1px solid #ccc");
    }
}

function courseidSelected(){
    var courseid = $('select[name=courseid]').val();
    if(courseid === '' || courseid === null || courseid === undefined){
        $("select[name=courseid]").css("border","3px solid orange");
    }else{
        $("select[name=courseid]").css("border","1px solid #ccc");
    }
}

function startInputed(){
    var start = $('input[name=start]').val();
    if(start === '' || start === null || start === undefined){
        $("input[name=start]").css("border","3px solid orange");
    }else{
        $("input[name=start]").css("border","1px solid #ccc");
    }
}

function endInputed(){
    var end = $('input[name=end]').val();
    if(end === '' || end === null || end === undefined){
        $("input[name=end]").css("border","3px solid orange");
    }else{
        $("input[name=end]").css("border","1px solid #ccc");
    }
}

function levelInputed(){
    var level = $('input[name=level]').val();
    if(level === '' || level === null || level === undefined){
        $("input[name=level]").css("border","3px solid orange");
    }else{
        $("input[name=level]").css("border","1px solid #ccc");
    }
}

    function formCheck(){
    staffidSlected();
    storeSelected();
    roomidSelected();
    courseidSelected();
    startInputed();
    endInputed();
    levelInputed();
}
