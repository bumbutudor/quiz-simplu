<form id="quessImage" method="post" enctype="multipart/form-data">
      <div class="modal-body">
          <p>Adaugă imagine din calculator<p>
          <div style="text-align: center;" class="btn btn-primary btn-file">
              <span>Alege o imagine</span>
              <input type="file" title="Alege o imagine din calculator" name="image" id="image" class="btn btn-secondary"/>
          </div>
          </br>
          <input type="hidden" id="fileBase64" name="fileBase64"/>
          <br/>

          <div id="preview"></div>

          <input class="correct" name="correct" value="1" type="checkbox" checked="checked" hidden/>
          <div class="input-group">
             <input style="border-radius: 4px !important;" name="answer[]" placeholder="Scrie denumirea" class="form-control formControlul" />
          </div>

          

          <hr/>    
          <p><label for="">Comentariu: <sup>*</sup></label>
                   <div id="editor"></div>
                   <input name="explanation" id="explanation" type="hidden" class="form-control" />
          </p>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.reload()">Anulează</button>
          <button type="submit" class="btn btn-success">Salvează Exemplu</button>
      </div>
</form>