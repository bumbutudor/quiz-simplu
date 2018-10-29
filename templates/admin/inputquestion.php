<form id="questionTypeInput" method="post" action="">
      <div class="modal-body">
          <p><label for="newquestiontypeinput">Propoziție:</label>
             <div id="newquestiontypeinput" name="questiontext" class="nomargin">
                  <div id="formattedInputArea" style="border-radius: 4px; border-top: 1px solid #ccc;"></div>
             </div>
             <span class="helper help-block">Nu este propoziție!</span>
          </p>
          <button type="button" class="btn btn-secondary" id="transpormText">Acceptă</button>
          <button type="button" class="btn btn-primary hidden" id="createInput">Creează căsuță</button>
          <button type="button" id="editText" class="hidden btn btn-secondary">Editează propoziția</button>
          <hr/>
          <p><label title="Comentariul este opțional" for="">Comentariu: <sup>*</sup></label>
             <div id="editor"></div>
             <input name="explanation" id="explanation" type="hidden" class="form-control" />
          </p>
      </div>
      <div class="modal-footer">
          <input type="hidden" name="questiontext" id="questiontext"/>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Anulează</button>
          <button type="submit" class="btn btn-success">Salvează Exemplu</button>
      </div>
</form>