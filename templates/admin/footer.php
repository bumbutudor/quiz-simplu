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

        var quillinput = new Quill('#formattedInputArea', {
              modules: {
                toolbar: [
                  ['bold', 'italic']
                ]
              },
              theme: 'snow'
            });
        
        //comentariu test grila
        $("#questionadd").on("submit",function(){
      	$("#explanation").val(quill.root.innerHTML);
        })

        //comentariu in casuta
        $("#questionTypeInput").on("submit",function(){
        $("#explanation").val(quill.root.innerHTML);
      	})

        //comentariu din casuta
        $("#selectTypeInput").on("submit",function(){
        $("#explanation").val(quill.root.innerHTML);
        })

        //comentariu imagine
        $("#quessImage").on("submit",function(){
        $("#explanation").val(quill.root.innerHTML);
        })


    </script>
    <script>  
     $(document).ready(function(){  
          $('#insert').click(function(){  
               var image_name = $('#image').val();  
               if(image_name == '')  
               {  
                    alert("Nu este imagine, vă rugăm selectați o imagine");  
                    return false;  
               }  
               else  
               {  
                    var extension = $('#image').val().split('.').pop().toLowerCase();  
                    if(jQuery.inArray(extension, ['gif','png','jpg','jpeg']) == -1)  
                    {  
                         alert('Nu este fișier valid!');  
                         $('#image').val('');  
                         return false;  
                    }  
               }  
          });  
     });  
     </script>  

    <script>
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
    <script src="<?php echo $root; ?>/res/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- Intro js pentru prezentare -->
    <script src="<?php echo $root; ?>/res/js/intro.js"></script>
    <script type="text/javascript">
        document.getElementById('startButton').onclick = function() {
        introJs().setOption('doneLabel', 'Final!').start().oncomplete(function() {
        });
      };
    </script>

    <script src="<?php echo $root; ?>/res/js/admin.js"></script>
</body>
</html>
