 function readerFile(the_file) {

    var f = the_file.target.files[0]; 

    if (f) {
      var r = new FileReader();
      r.onload = function(e) { 
	      var contents = e.target.result;
        alert(contents); //print contens of the file broo in an alert message box 
      }
      r.readAsText(f);
    } else { 
      alert("Failed to load file");
    }
  }

  document.getElementById('fileinput').addEventListener('change', readerFile, false);