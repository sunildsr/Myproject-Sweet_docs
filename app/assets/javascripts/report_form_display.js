$(document).ready(function(){
  $("#select-date").hide()
  $("#select-month").hide()
  $(".submit-selection").hide()

  showDateOptions("#report_type__daily");
  showDateOptions("#report_type__month-to-date");
  showMonthOptions("#report_type__monthly");
  showSubmitButton("#date");
  showSubmitButton("#month");
})

function showDateOptions(checkBoxId){
  $(checkBoxId).on("click", function(){
    $("#select-month").hide()
    $("#select-date").show()
  })
}

function showMonthOptions(checkBoxId){
  $(checkBoxId).on("click", function(){
    $("#select-date").hide()
    $("#select-month").show()
  })
}

function showSubmitButton(dropdownId){
  $(dropdownId).on("click", function(){
    $(".submit-selection").show()
  })
}



function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
