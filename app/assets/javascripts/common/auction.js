
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

});
