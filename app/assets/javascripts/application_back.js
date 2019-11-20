//= require jquery
//= require jquery_ujs
//= require back/plugins/bootstrap/bootstrap.min
//= require back/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min
//= require back/plugins/datatables/jquery.dataTables.min
//= require back/plugins/datatables/dataTables.bootstrap.min
//= require back/plugins/iCheck/icheck

//= jquery.fancytree/dist/jquery.fancytree-all.min.js
//= require back/app
//= require back/files
$(document).ready(function() {
  var table = $('.dataTable').DataTable();

  // Get sidebar state from localStorage and add the proper class to body
  $('body').addClass(localStorage.getItem('sidebar-state'));

  var activePage = stripTrailingSlash(window.location.pathname);
  $('.sidebar-menu li a').each(function(){
    var currentPage = stripTrailingSlash($(this).attr('href'));
    if (activePage == currentPage) {
      $(this).closest('.treeview').addClass('active');
      $(this).parent().addClass('active');
    }
  });
  function stripTrailingSlash(str) {
    if(str.substr(-1) == '/') { return str.substr(0, str.length - 1); }
    return str;
  }

  // Save sidebar state in localStorage browser
  $('.sidebar-toggle').on('click', function(){
    if($('body').attr('class').indexOf('sidebar-collapse') != -1) {
      localStorage.setItem('sidebar-state', '');
    } else {
      localStorage.setItem('sidebar-state', 'sidebar-collapse');
    }
  });

    $(document).off("click.sm").on("click.sm", "a.details-link", function(e){
      e.preventDefault()
      var id = $(this).data("id")
      $.get("/admin/processing_results/"+id, function(html){
        $("div#modal-container").html(html)
        $("div.modal[data-id='" +id + "']").modal("show")
      })
    })
  
});
