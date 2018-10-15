<form id="questionTypeInput" method="post" action="">
      <div class="modal-body">
          <p><label for="newquestiontypeinput">Exemplu:</label>
             <input name="questiontext" id="newquestiontypeinput" type="text" placeholder="Întrebarea aici" class="form-control" />
             <span class="helper help-block">Nu este exemlu!</span>
          </p>
          <button type="button" id="transpormText">Accepta</button>
          <button type="button" id="createInput">Creează input</button>
          <button type="button" id="editText" class="hidden">Editeaza textul</button>
          
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Anulează</button>
          <button type="submit" class="btn btn-success">Salvează Exemplu</button>
      </div>
</form>