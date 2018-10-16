<form id="selectTypeInput" method="post" action="">
      <div class="modal-body">
          <p style="display: inline-block;" "><label for="newquestiontypeinput">Exemplu:</label>
             <input name="questiontext" id="newquestiontypeinput" type="text" placeholder="Întrebarea aici" class="form-control" />
             <span class="helper help-block">Nu este exemlu!</span>
          </p>

          <button type="button" id="transpormText" class="btn btn-secondary">Accepta</button>
          <button type="button" id="editText" class="hidden btn btn-secondary">Editeaza optiunile</button>

                <h5><strong>Răspunsuri:</strong></h5>
                <table id="newanswers" class="table table-responsive table-hover table-bordered">
                    <thead>
                        <tr><th style="text-align: center;">Răspuns corect?</th><th>Raspuns</th></tr>
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
                <button type="button" id="createSelect" class="btn btn-primary">Creează select</button>
                
                <p style="margin-top: 50px"><label for="">Comentariu: <sup>*</sup></label>
                   <input name="explanation" id="explanation" type="text" placeholder="Comentează aici" class="form-control" />
                </p>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.reload()">Anulează</button>
          <button type="submit" class="btn btn-success">Salvează Exemplu</button>
      </div>
</form>