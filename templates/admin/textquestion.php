<form id="selectTypeInput" method="post" action="">
      <div class="modal-body">
          <p><label for="newquestiontypeinput">Text:</label><br/>
             <textarea name="questiontext" id="newquestiontypeinput" type="text" placeholder="Întrebarea aici" class="form-control" style="width:100% !important" ></textarea>
             <span class="helper help-block">Nu este exemlu!</span>
          </p>
          <button type="button" id="transpormTextarea" class="btn btn-secondary">Accepta</button>
          <button type="button" id="editTextarea" class="hidden btn btn-secondary">Editeaza optiunile</button>
          <button type="button" id="createTextareaInput" class="btn btn-primary">Creează input</button>
                
                <p style="margin-top: 50px"><hr/><label for="">Comentariu: <sup>*</sup></label>
                   <input name="explanation" id="explanation" type="text" placeholder="Comentează aici" class="form-control" />
                </p>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.reload()">Anulează</button>
          <button type="submit" class="btn btn-success">Salvează Exemplu</button>
      </div>
</form>