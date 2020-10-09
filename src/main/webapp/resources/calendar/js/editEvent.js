/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {
	
    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID
	console.log(event._id);
    $('.popover.fade.top').remove();
    $(element).popover("hide");

 

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시 실행
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }


          var startDate = editStart.val();
          var endDate = editEnd.val();
          var displayDate = endDate;

        eventModal.modal('hide');

        
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();

        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트시 데이터를 전송함
        $.ajax({
            type: "post",
            url: "/event/updateEvent",
            data: {
            	 "event_id": event._id,
                 "event_title": event.title,
            	 "event_start": event.start,
            	 "event_end": event.end,
            	 "event_type": event.type,
            	 "event_description": event.description,
            	 "event_backgroundColor": event.backgroundColor,
            	 "event_textColor": '#ffffff'
            },
            success: function (response) {
                alert('일정이 수정되었습니다.');
            }
        });

    });
// 삭제버튼 클릭시 실행
$('#deleteEvent').on('click', function () {
    
    $('#deleteEvent').unbind();
    $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
    eventModal.modal('hide');

    //삭제시 데이터를 전송함
    $.ajax({
        type: "get",
        url: "/event/deleteEvent",
        data: {
            "event_id" : event._id
        },
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });

});
};
