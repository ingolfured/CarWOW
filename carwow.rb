action = ''
puts "Possible inputs: I,C,L,V,H,F and X"
while action != 'X' do
  input = gets.chomp.split
  action = input[0]
  case
  when action == 'I'
    if input.size == 3
      i1 = input[2].to_i
      i2 = input[1].to_i
      unless  i1 < 1 or 250 < i1 or i2 < 1 or 250 < i2
        pixels = Array.new(i1){Array.new(i2){'O'}}
      else
        puts "The picture has to have size 0<X,Y<251"
      end
    else
      puts "Wrong number of arguments, please try again"
    end

  when action == 'C'
    if input.size == 1
      pixels = Array.new(pixels.length){Array.new(pixels[0].length){'O'}}
    else
      puts "Wrong number of arguments, please try again"
    end

  when action == 'L'
    if input.size == 4
      pixels[input[2].to_i-1][input[1].to_i-1] = input[3]
    else
      puts "Wrong number of arguments, please try again"
    end

  when action == 'H'
    if input.size == 5
      for i in input[1].to_i..input[2].to_i do
        pixels[input[3].to_i-1][i-1] = input[4]
      end
    else
      puts "Wrong number of arguments, please try again"
    end

  when action == 'V'
    if input.size == 5
      for i in input[2].to_i..input[3].to_i do
        pixels[i-1][input[1].to_i-1] = input[4]
      end
    else
      puts "Wrong number of arguments, please try again"
    end

  when action == 'F'
    if input.size == 4
      i1 = (input[2].to_i) -1
      i2 = (input[1].to_i) -1
      base_color =   pixels[i1][i2]
      q = Queue.new
      q << [i1,i2]

      while not q.empty? do
        v = q.pop
        pixels[v[0]][v[1]] = input[3]
        [ [v[0]-1,v[1]], [v[0]+1,v[1]], [v[0],v[1]+1], [v[0],v[1]-1] ].each do |j|
          if 0 <= j[0] and 0<= j[1] and j[0] < pixels.length and j[1] < pixels[0].length  and  pixels[j[0]][j[1]] == base_color
            pixels[j[0]][j[1]] = input[3]
            q << j
          end
        end
      end
    else
      puts "Wrong number of arguments, please try again"
    end

  when action == 'S'
    if input.size == 1
      pixels.each do |row|
        row.each do |x|
          print x
        end
        puts
      end
    else
      puts "Wrong number of arguments, please try again"
    end

  else
    puts "Illegal input, please try again"
  end

end
