$(function() {
  var htmlEntities = function(str) {
    return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
  }

  $widget = $('#calendar-widget')

  if ($widget.length) {

    $.get('confs.json', function(data){
      /*
      var eventList = $.makeArray($('.vevent', data).map(function(i, ev){
        var $dtstart = $('.dtstart', ev),
            fragment = '#' + $('h2[id]', ev).attr('id');

        if (!$dtstart.attr('title') || $dtstart.attr('title').match(/T/)) {
          return;
        }

        // FIXME: Handle errant "&" in IDs
        try {
          // Reset the link if it's not found on the page
          // Be sure to handle (incorrect) spaces in IDs
          if (!$(fragment.replace(/ /g, '\\ ')).length) {
            fragment = undefined;
          }

          return {
            title: $('.summary', ev).eq(0).text(),
            start: new Date(Date.parse($('.dtstart', ev).attr('title'))),
            end: new Date(Date.parse($('.dtend', ev).attr('title'))) || undefined,
            url: fragment,
            allDay: !$('.dtstart', ev).attr('title').match(/T/)
          }
        } catch(e) {
        }
      }));
      */

     var eventList = data;

     console.log(eventList);

      $widget.fullCalendar({
        editable: false,
        header: {
          left: 'title',
          firstDay: 1,
          center: '',
          aspectRatio: 1,
          right: 'today prev,next'
        },
        //theme: true,
        events: eventList
      });
    });

  }

});
