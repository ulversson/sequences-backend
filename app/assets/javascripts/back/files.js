var Files = function() {
    return {
        submitForm: function(event) {
            event.preventDefault()
            return false;
            if ($("input#input_file_file").val() === "") {
                alert("You must select a file to continue")
                return false;
            }
            else {
                $("form#new_input_file")[0].submit() 
            }
      }
   }
}();