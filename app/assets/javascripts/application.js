// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.button
//= require jquery.ui.datepicker
//= require jquery.ui.slider
//= require jquery.ui.spinner
//= require jquery.ui.tooltip
//= require jquery.ui.effect
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-tokenfield
//= require bootstrap-datetimepicker
//= require dataTables/jquery.dataTables
//= require flatuipro
//= require_tree .

$(function(){
  // $('.checkbox').checkbox();
  $('.data').dataTable({
        "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
        aoColumnDefs: [
          {
             bSortable: false,
             aTargets: [ 0 ]
          }
        ]
    });



  $('#Tabs a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
  })

  $("[data-toggle='switch']").wrap('<div class="switch" />').parent().bootstrapSwitch();

  $('#select_all').on( 'click', function() {
    if($(this).prop('checked')) {
      $('tbody :checkbox').prop('checked', true);
    } else {
      $('tbody :checkbox').prop('checked', false);
    }
  });

});

function legend(parent, data) {
    parent.className = 'legend';
    var datas = data.hasOwnProperty('datasets') ? data.datasets : data;

    datas.forEach(function(d) {
        var title = document.createElement('span');
        title.className = 'title';
        title.style.borderColor = d.hasOwnProperty('strokeColor') ? d.strokeColor : d.color;
        title.style.borderStyle = 'solid';
        parent.appendChild(title);

        var text = document.createTextNode(d.title);
        title.appendChild(text);
    });

}

$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );