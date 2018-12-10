(function($){

  function init() {
    // Configure datetime pickers
    setCustomDatetimepicker();

    // Add the target to the download links
    addTargetToDownloadLinks();

  }

  function setCustomDatetimepicker() {
    // Set default date formatter function
    $.datetimepicker.setDateFormatter('moment');

    // set default locale
    $.datetimepicker.setLocale('es');

    // Init custom datepickers
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

  function addTargetToDownloadLinks() {
    const links = $('.download_links a')

    links.each(function(i, el) {
      $(el).attr('target', '_blank')
    })
  }

  $(document).ready(init)
}(jQuery))