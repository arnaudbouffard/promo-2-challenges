def tag(tag_name, attr = nil)
  #TODO:  Build HTML tags around  content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  '<'+ tag_name +'>' + yield + '</'+ tag_name +'>'
end

def timer_for
  #TODO:  Return time taken to execute the given block
end

def transform(element)
  #TODO:  Simply execute the given block on element
end
