<form id="selectTypeInput" method="post" action="">
      <div class="modal-body">
      <table id="newanswers" class="table table-responsive table-hover table-bordered">
                    <thead>
                        <tr><th style="text-align: center;">Text corectat (bifat)</th><th>Texte</th></tr>
                    </thead>
                    <tbody>
                        <tr class="answer-row">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" value="1" type="checkbox" checked="checked" disabled/> 
                            </td>
                            <td>
                                <div class="input-group">
                                    <textarea id="rightanswer" name="answer[]" placeholder="Text" class="form-control" cols="70" rows="7"></textarea>
                                </div>
                            </td>
                        </tr>
                        <tr class="answer-row">
                            <td style="text-align: center;">
                               <input class="correct" name="correct" value="0" type="checkbox" disabled/> 
                            </td>
                            <td>
                                <div class="input-group">
                                    <textarea id="wronganswer" class="form-control" name="answer[]" placeholder="Text" cols="70" rows="7"></textarea>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" class="btn btn-primary" name="copytext">Copiați textul</button>
          </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.reload()">Anulează</button>
          <button type="submit" class="btn btn-success">Salvează Exemplu</button>
      </div>
</form>