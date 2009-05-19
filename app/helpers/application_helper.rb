# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def locales
		[['English', 'en'],['Español', 'es']]
	end
	
	def error_messages_list(model)
	  if !model.errors.empty?
  	  messages = "<ul>"
  	  model.errors.each_full {|msg| messages << "<li>" << msg << "</li>"}
  	  messages << "</ul>"
  	  messages.delete!("'") #for passing to string js variables with: ''
  	  messages
  	end
	end
	
end
