// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require bootstrap-datetimepicker
//= require_tree .
$(function () {
  //Initialize Select2 Elements
  $(".select2").select2();
});


$(function(){
  $('.company').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-200:-0',
  dateFormat: 'dd-mm-yy' });

  $('.birth_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-100:-0',
  dateFormat: 'dd-mm-yy' });

  $(function(){
    $('.request_date').datepicker({
    changeYear:true,
    changeMonth: true,
    yearRange: '-200:+1',
    dateFormat: 'dd-mm-yy' });
 

});
