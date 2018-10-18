    <script src="<?php echo $root; ?>/res/bootstrap/assets/js/jquery.js"></script>
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

    <script>
    	// Quiljs pentru editare text
    var quill = new Quill('#editor', {
          modules: {
            toolbar: [
              ['bold', 'italic', 'underline'],
              [{'color': ["#000000", "#e60000", "#ff9900", "#ffff00", "#008a00", "#0066cc", "#9933ff"]}]
            ]
          },
          theme: 'snow'
        });

    $("#questionadd").on("submit",function(){
	$("#explanation").val(quill.root.innerHTML);
	// var justHtml = editor.root.innerHTML;

	})
    </script>

    <script>
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
    <script src="<?php echo $root; ?>/res/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<?php echo $root; ?>/res/js/admin.js"></script>
</body>
</html>
