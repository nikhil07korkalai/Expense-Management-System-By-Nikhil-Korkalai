function hideAjaxPopup(id){
  if($('#'+id).length > 0){
    $('#'+id).hide();
  }
}

function getHtmlError(id,text,field){
  // var hide_function_val = "hideAjaxPopup('"+id+"')"
  var fieldWidth 	= $("#"+field).width();
  var fieldHeight  = $("#"+field).height();
  var fieldLeft 	= $("#"+field).position().left;
  var fieldTop 	=  $("#"+field).position().top;
  top_side = fieldTop + fieldHeight + 5;
  left_Side = fieldLeft;
  window.scrollTo($("#"+field), $("#"+field).offset());
  // return ("<span id='"+id+"'><div class='toolcss'><div class='ui-item'><div class='ui-details'><p>"+text+"</p></div><div class='ui-user clearfix'></div></div></div></span>")
  return ("<div class='"+id+"formError parentFormVYMMJSXG formError' style='opacity: 0.87; position: absolute; top:"+ top_side+"px; left: "+left_Side+"px; margin-top: 0px;'><div class='formErrorArrow formErrorArrowBottom'><div class='line1'><!-- --></div><div class='line2'><!-- --></div><div class='line3'><!-- --></div><div class='line4'><!-- --></div><div class='line5'><!-- --></div><div class='line6'><!-- --></div><div class='line7'><!-- --></div><div class='line8'><!-- --></div><div class='line9'><!-- --></div><div class='line10'><!-- --></div></div><div class='formErrorContent'>"+text+"<br></div></div>");
}