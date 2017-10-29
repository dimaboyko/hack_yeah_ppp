$(document).ready(function() {

  var table = $('#table-data').DataTable({
    language: {
      search: "Wyszukaj w tabeli:",
      lengthMenu: "Wyświetlaj _MENU_",
      emptyTable: "Brak danych",
      info: "Wyświetlone od _START_ do _END_ z _TOTAL_ rekordów",
      infoEmpty: "Wyświetlone 0 rekordów",
      infoFiltered: "(z _MAX_)",
      zeroRecords: "Nie znaleziono rekordów spełniających kryteria wyszukiwania",
      paginate: {
        "first": "First",
        "last": "Last",
        "next": "Następne",
        "previous": "Poprzednie"
      }
    }
  });

  table.on('draw', function() {
    $('.x-drawer-button').sideNav({menuWidth: 488, edge: 'right', closeOnClick: false, draggable: true});
  });

  $('select').material_select();

  $('.x-drawer-button').sideNav({menuWidth: 488, edge: 'right', closeOnClick: false, draggable: true});

  $('#modal').modal();

  $('.select-dropdown').dropdown({constrainWidth: false, belowOrigin: true});

  $('.dropdown-button').dropdown({constrainWidth: false, belowOrigin: true});

  $('.x-msg').on('click', function(){
    Materialize.toast('Wysłano zgłoszenie do kontroli.', 2000);
  });

  $('.x-modal').on('click', function(){
    var auctionId = $(this).attr('data-auction-id');
    $('.x-modal-auction-id').val(auctionId);
    $('.x-description').val('').blur();
  });

});
