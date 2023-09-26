def priority(operator)
  case operator
  when '+', '-' then 1
  when '*', '/' then 2
  else 0 end
end

def rpn(input)
  output = []
  operators = []

  input.each_char do |char|
    if char.to_i.to_s == char
      output << char

    elsif %w[+ - * /].include?(char)
      while !operators.empty? && priority(operators.last) >= priority(char)
        output << operators.pop
      end
      operators << char

    elsif char == '('
      operators << char

    elsif char == ')'
      while operators.last != '('
        output << operators.pop
      end
      operators.pop
    end

  end #each

  output += operators.reverse
  output.join
end #def rpn

loop do
  puts <<here
--------------------------
1. Convert to RPN
2. Exit
Your choice:
here
  case gets.to_i
  when 1
    puts "Enter an expression"
    rpn = rpn(gets.chomp)
    puts "RPN: #{rpn}"
  when 2 then abort('Bye!')
  else puts 'Incorrect input'
  end
end
