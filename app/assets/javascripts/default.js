$(document).ready(function () {
  // $('select').not('.x-category-select').material_select();

  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year
    format: 'yyyy/mm/dd',
    clear: '',
    close: 'select'
  });

  $('#table-data').DataTable({
      language: {
      search: "Wyszukaj w tabeli:",
      lengthMenu: "Wyświetlaj _MENU_",
      emptyTable: "Brak danych",
      info: "Wyświetlone od _START_ do _END_ z _TOTAL_ rekordów",
      infoEmpty: "Wyświetlone 0 rekordów",
      infoFiltered: "(z _MAX_)",
      zeroRecords: "Nie znaleziono rekordów spełniających kryteria wyszukiwania",
      paginate: {
        "first":      "First",
        "last":       "Last",
        "next":       "Następne",
        "previous":   "Poprzednie"
      },
    }
  });

  $('select').material_select();

  $('.x-propagate-stop').on('click', function(e){
    e.stopPropagation();
  });

  $('.x-drawer-button').sideNav({
      menuWidth: 488,
      edge: 'right',
      closeOnClick: false,
      draggable: true
    }
  );

  $('ul.tabs').tabs();

  $('.select-dropdown').dropdown({
     constrainWidth: false,
     belowOrigin: true
   }
 );

  $('.dropdown-button').dropdown({
     constrainWidth: false,
     belowOrigin: true
   }
 );

 $('.x-search-trigger').on('click', function(e) {
   $('.x-header').addClass('page-header__search');
   e.preventDefault();
 });

 $('.x-search-close').on('click', function(e) {
   $('.x-header').removeClass('page-header__search');
   e.preventDefault();
 });

 $('.x-resize-half').on('click', function(e) {
   $('.custom-modal__content').addClass('custom-modal__content--half');
   $('.x-resize-default').removeClass('active');
   $(this).addClass('active');
   e.preventDefault();
 });

 $('.x-resize-default').on('click', function(e) {
   $('.custom-modal__content').removeClass('custom-modal__content--half');
   $('.x-resize-half').removeClass('active');
   $(this).addClass('active');
   e.preventDefault();
 });

  $('.x-button-add').click(function(e) {
    e.preventDefault();
  });

 $('body').on('click', 'a.x-disable-add-files', function(e) {
   e.preventDefault();
   (new StatusToast).upload_failed();
 })

 $('body').on('click', '.x-brand', function(e) {
   e.preventDefault();
   window.location = '/app/uploads';
 })

 $(document).ready( function () {

} );

});
$(window).load(function() {
  //$('.x-loader-body').fadeOut();
});

function disableUploadFiles() {
  $('.x-button-add').addClass('x-disable-add-files pointer-events-auto');
  $('.x-fileupload').fileupload('disable');
  $('.x-dropzone').on('drop', function(e){
    (new StatusToast).upload_failed();
  });
}
