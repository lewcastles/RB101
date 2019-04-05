BLOCKS = %w[BO XK DQ CP NA GT RE FS JW HU VI LY ZM]

def block_word?(str)
  BLOCKS.none? do |block| 
    str.count(block) > 1
  end 
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true