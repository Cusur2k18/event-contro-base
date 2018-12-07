(function($, moment){

  function init() {

    // Configure datetime pickers
    setDefaultConfigDatetimepicker();

    const pickerConfig = {
      inline: true, // show the datepicker
      step: 30, // each 30min
      minDate: 0, // Today
      timepickerScrollbar: false,
      scrollMonth: false,
      scrollTime: false,
      timepicker: false
    }

    // Set the date pickers
    $('.datepicker.with_time').datetimepicker(Object.assign({}, pickerConfig, { timepicker: true }));

    $('.datepicker').datetimepicker(pickerConfig);


  }

  function setDefaultConfigDatetimepicker() {
    // Set default date formatter function
    $.datetimepicker.setDateFormatter('moment');

    // set default locale
    $.datetimepicker.setLocale('es');
  }

  $(document).ready(init)
}(jQuery, moment))