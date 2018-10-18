<form id="questionTypeInput" method="post" action="">
      <div class="modal-body">
          <p><label for="newquestiontypeinput">Exemplu:</label>
             <input name="questiontext" id="newquestiontypeinput" type="text" placeholder="Scrie propoziția aici" class="form-control" />
             <span class="helper help-block">Nu este exemlu!</span>
          </p>
          <button type="button" class="btn btn-secondary" id="transpormText">Acceptă</button>
          <button type="button" class="btn btn-primary" id="createInput">Creează căsuță</button>
          <button type="button" id="editText" class="hidden btn btn-secondary">Editează propoziția</button>
          <hr/>
          <p><label title="Comentariul este opțional" for="">Comentariu: <sup>*</sup></label>
             <input name="explanation" id="explanation" type="text" placeholder="Comentează aici" class="form-control" />
          </p>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Anulează</button>
          <button type="submit" class="btn btn-success">Salvează Exemplu</button>
      </div>
</form>