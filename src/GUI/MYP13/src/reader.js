 function readerFile(the_file) {

    var f = the_file.target.files[0]; 

    if (f) {
      var r = new FileReader();
      r.onload = function(e) { 
	      var contents = e.target.result;
        alert(contents); //print the contents of the file in an alert message box 
      }
      r.readAsText(f);
    } else { 
      alert("Failed to load the file");
    }
  }

  document.getElementById('fileinput').addEventListener('change', readerFile, false);
