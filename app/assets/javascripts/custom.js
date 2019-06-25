$(document).on("turbolinks:load", function() {
  $("#modal-edit").find(".modal-content").html("<%= j (render 'subjects/edit') %>");
  $("#modal-edit").modal("show");
});

