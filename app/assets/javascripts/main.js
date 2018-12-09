(function($){

  function init() {
    // Configure datetime pickers
    setDefaultConfigDatetimepicker();

    const pickerConfig = {
      inline: true,
      step: 30, // each 30min
      minDate: 0, // Today
      scrollMonth: false,
      timepicker: true
    }

    // Set the date pickers
    $('.custom-datepicker').datetimepicker(pickerConfig);
  }

  function setDefaultConfigDatetimepicker() {
    // Set default date formatter function
    $.datetimepicker.setDateFormatter('moment');

    // set default locale
    $.datetimepicker.setLocale('es');
  }

  $(document).ready(init)
}(jQuery))