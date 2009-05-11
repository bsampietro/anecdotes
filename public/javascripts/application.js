// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// shows the loading div from the master layout  
  function show_loading(){
  	$('#loading').css('visibility', 'visible');
  };
  
  // hides the loading div from the master layout  
  function hide_loading(){
  	$('#loading').css('visibility', 'hidden');
  };
  
  //add initial text to input text boxes
  function add_initial_text(element_id, initial_text){
	var element = $('#' + element_id);	
	if (element.val() == initial_text || element.val() == ''){
		element.css({'color' : 'gray', 'font-style' : 'italic'});
		element.val(initial_text);
  	}
  	element.focus(function(){
  		if (element.val() == initial_text){
			element.css({'color' : 'black', 'font-style' : 'normal'});
  			element.val('');
  		}
  	});
  	element.blur(function(){
  		if (element.val() == ''){
			element.css({'color' : 'gray', 'font-style' : 'italic'});
  			element.val(initial_text);
  		}
  	});
  }
