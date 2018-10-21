<form id="selectTypeInput" method="post" action="">
      <div class="modal-body">
          <p ><label for="newquestiontypeinput">Exemplu:</label>
             <input name="questiontext" id="newquestiontypeinput" type="text" placeholder="Scrie aici propoziția" class="form-control" /></span>
             <span class="helper help-block">Nu este exemlu!</span>
          </p>

          <button type="button" id="transpormText" class="btn btn-secondary">Acceptă</button>
          <button type="button" id="editText" data-toogle="tooltip" title="Editează propoziția" class="hidden btn btn-secondary">Editează</button>
                <div id="responseArea" class="hidden">
                <h5><strong>Răspunsuri afișate în căsuță:</strong></h5>
                <table id="newanswers" class="table table-responsive table-hover table-bordered">
                    <thead>
                        <tr><th style="text-align: center;">Răspuns corect?</th><th>Răspuns</th></tr>
                    </thead>
                    <tbody>
                        <tr class="answer-row">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" value="0" type="radio" /> 
                            </td>
                            <td>
                                <div class="input-group">
                                    <input type="text" name="answer[]" placeholder="Răspuns" class="form-control">
                                    <span class="input-group-btn">
                                        <button class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr class="answer-row">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" value="1" type="radio" /> 
                            </td>
                            <td>
                                <div class="input-group">
                                    <input type="text" name="answer[]" placeholder="Răspuns" class="form-control">
                                    <span class="input-group-btn">
                                        <button class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr class="template answer-row" style="display:none;">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" type="radio" /> 
                            </td>
                            <td>
                                <div class="input-group">
                                <input type="text" placeholder="Răspuns" name="" value="" class="form-control answerinput">
                                <span class="input-group-btn">
                                    <button class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                </span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p>
                  <button id="addanswer" type="button" class="btn btn-primary pull-right">Adaugă încă un răspuns <span class="glyphicon glyphicon-plus-sign"></span></button>
                </p>
                <button type="button" id="createSelect" data-toogle="tooltip" title="Înserează cuvântul și apasă pe acest buton" class="btn btn-primary hidden">Creează căsuță</button>
              </div>
                <hr/>
                <p><label for="">Comentariu: <sup>*</sup></label>
                    <div id="editor"></div>
                    <input name="explanation" id="explanation" type="hidden" class="form-control" />
                </p>
      </div>
      <div class="modal-footer">
          <input type="hidden" name="questiontext" id="questiontext"/>
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.reload()">Anulează</button>
          <button type="submit" class="btn btn-success">Salvează Exemplu</button>
      </div>
</form>