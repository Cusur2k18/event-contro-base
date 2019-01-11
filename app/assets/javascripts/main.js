(function($){

  function init() {
    // Configure datetime pickers
    setCustomDatetimepicker();

    // Add the target to the download links
    addTargetToDownloadLinks();

    // Set the checkbox toggle
    setCheckboxToggle();

  }

  function setCustomDatetimepicker() {
    // Set default date formatter function
    $.datetimepicker.setDateFormatter('moment');

    // set default locale
    $.datetimepicker.setLocale('es');

    // Init custom datepickers
    const pickerConfig = {
      inline: false,
      step: 30, // each 30min
      minDate: 0, // Today
      scrollMonth: false,
      timepicker: true
    }

    // Set the date pickers
    $('.custom-datepicker').datetimepicker(pickerConfig);
    $('.edit .custom-datepicker').datetimepicker(Object.assign(pickerConfig, { inline: true }));
    $('.filter_form .custom-datepicker').datetimepicker(Object.assign(pickerConfig, { inline: false, timepicker: false, format: 'DD/MM/YYYY', minDate: false }));
  }

  function addTargetToDownloadLinks() {
    const links = $('.download_links a, .target_blank')

    links.each(function(i, el) {
      $(el).attr('target', '_blank')
    })
  }

  function setCheckboxToggle() {
    $('input[type="checkbox"]').switchButton({
      on_label: 'Si',
      off_label: 'No'  
    });
  }

  $(document).ready(init)
}(jQuery))