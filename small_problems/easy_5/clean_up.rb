def cleanup(str)
  str.gsub(/[^A-z]/, ' ').gsub(/[ ]+/, ' ')   
end
  

p cleanup("---what's my +*& line?") == ' what s my line '