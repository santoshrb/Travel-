
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
//= require jquery-ui


//= require bootstrap-datetimepicker
//= require_tree .





  $("#example1").DataTable();
  $('#example2').DataTable({
    "paging": true,
    "lengthChange": false,
    "searching": false,
    "ordering": true,
    "info": true,
    "autoWidth": false
  });


$(function () {
  //Initialize Select2 Elements
  $(".select2").select2();
});

$(function () {
  //Datemask dd/mm/yyyy
  $(".datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
  //Datemask2 mm/dd/yyyy
  $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
  //Money Euro
  $("[data-mask]").inputmask();
  //Date range picker
  $('#reservation').daterangepicker();
  //Date range picker with time picker
  $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'DD/MM/YYYY h:mm A'});

  //Timepicker
  $(".timepicker").timepicker({
    showInputs: false
  });
});
$(function () {
  //Datemask dd/mm/yyyy
  $(".date").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
  //Datemask2 mm/dd/yyyy
  $("#date").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
  //Money Euro
  $("[data-mask]").inputmask();
  //Date range picker
  $('#reservation').daterangepicker();
  //Date range picker with time picker
  $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'DD/MM/YYYY h:mm A'});

  //Timepicker
  $(".timepicker").timepicker({
    showInputs: false
  });
});
// Automatic hide alert
$(function(){
  $("#success-alert").alert();
  $("#success-alert").fadeTo(3000, 500).slideUp(500, function(){
  $("#success-alert").alert('close');
  });
});

Date.format = "yyyy-mm-dd"
// $(document).ready(function() {
//   sh_highlightDocument();
//   $('.date_filter').datePicker({startDate: '2010-01-01'});
//   $("#dp-popup").addClass("dp-popup")
// })

// Datepicker
$(function(){
  $('.company_start_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-200:-0',
  dateFormat: 'dd-mm-yy' });

  $('.birth_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-100:-0',
  dateFormat: 'dd-mm-yy' });

  $('.birth_date1').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-100:+10',
  dateFormat: 'dd-mm-yy' });

  $('.interview_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-100:+10',
  dateFormat: 'dd-mm-yy' });

  $('.family_birth_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-100:-0',
  dateFormat: 'dd-mm-yy' });

  $('.passport_issue_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-100:+2',
  dateFormat: 'dd-mm-yy' });

  $('.passport_expiry_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-100:+2',
  dateFormat: 'dd-mm-yy' });

  $('.workingday_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-10:+50',
  dateFormat: 'dd-mm-yy' });

  $('.bonus_start_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-10:+50',
  dateFormat: 'dd-mm-yy' });

  $('.bonus_end_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-10:+50',
  dateFormat: 'dd-mm-yy' });

  $('.request_end_date').datepicker({
  changeYear:true,
  changeMonth: true,
  yearRange: '-10:+50',
  dateFormat: 'dd-mm-yy' });
});
