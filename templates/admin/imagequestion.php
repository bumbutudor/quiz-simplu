<form id="quessImage" method="post" enctype="multipart/form-data">
  <div class="modal-body">
    <p>Adaugă imagine din calculator<p>
      <div style="text-align: center;" class="btn btn-info btn-file">
        <span>Alegeți o imagine</span>
        <input type="file" title="Alege o imagine din calculator" name="image" id="image" class="btn btn-secondary"/>
      </div>
    </br>
    <input type="hidden" id="fileBase64" name="fileBase64"/>
    <br/>

    <div id="preview"></div>

          <table style="width: 60% !important;" id="newanswers" class="table table-responsive borderless">
          <tbody>
              <tr class="answer-row" >
                  <td hidden>
                     <input class="correct" name="correct" value="1" type="text" /> 
                  </td>
                  <td style="border-top: none;">
                      <div class="input-group">
                          <input type="text" name="answer[]" placeholder="Răspuns" class="form-control">
                          <span class="input-group-btn">
                              <button class="remove btn btn-default btn-danger" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                          </span>
                      </div>
                  </td>
              </tr>
              <tr class="template answer-row" style="display:none;">
                  <td hidden>
                     <input class="correct" name="correct" type="text" value="1" /> 
                  </td>
                  <td style="border-top: none;">
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
        <button id="addanswer" type="button" class="btn btn-primary">Adăugați încă un răspuns corect pentru această imagine <span class="glyphicon glyphicon-plus-sign"></span></button>
      </p>

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