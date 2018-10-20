<form id="selectTypeInput" method="post" action="">
      <div class="modal-body">
      <table id="newanswers" class="table table-responsive table-hover table-bordered">
                    <thead>
                        <tr><th style="text-align: center;">Răspuns corect?</th><th>Texte</th></tr>
                    </thead>
                    <tbody>
                        <tr class="answer-row">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" value="1" type="radio" checked="checked" disabled/> 
                            </td>
                            <td>
                                <div class="input-group" style="width: 100%;">
                                    <textarea id="rightanswer" name="answer[]" placeholder="Text" class="form-control" style="min-height: 200px;"></textarea>
                                </div>
                            </td>
                        </tr>
                        <tr class="answer-row">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" value="0" type="radio" disabled/> 
                            </td>
                            <td>
                                <div class="input-group"  style="width: 100%;">
                                    <textarea id="wronganswer" class="form-control" name="answer[]" placeholder="Text" style="min-height: 200px;"></textarea>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" class="btn btn-secondary" name="copytext">Copieeaza textul</button>
          </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.reload()">Anulează</button>
          <button type="submit" class="btn btn-success">Salvează Exemplu</button>
      </div>
</form>