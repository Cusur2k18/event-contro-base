(function($, moment){

  function init() {
    // Configure datetime pickers
    setDefaultConfigDatetimepicker();

    const pickerConfig = {
      inline: true, // show the datepicker
      step: 30, // each 30min
      minDate: 0, // Today
      scrollMonth: false,
      timepicker: false
    }

    // Set the date pickers
    $('.datepicker').datetimepicker(pickerConfig);
    $('.datepicker.with_time').datetimepicker(Object.assign({}, pickerConfig, { timepicker: true }));
  }

  function setDefaultConfigDatetimepicker() {
    // Set default date formatter function
    $.datetimepicker.setDateFormatter('moment');

    // set default locale
    $.datetimepicker.setLocale('es');
  }

  $(document).ready(init)
}(jQuery, moment))