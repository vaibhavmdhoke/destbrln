class PrimeNumberGenerator
  attr_accessor :max_limit, :prime_number_array, :max_prime_numbers

  def initialize(max_prime_numbers = 10)
    @max_limit = 1000_000
    @max_prime_numbers = max_prime_numbers
    @prime_number_array =[]
  end


  # Sieve of Sundaram (https://en.wikipedia.org/wiki/Sieve_of_Sundaram)
  # If we start with integers from 1 to n, the final list contains only odd integers from 3 to {\displaystyle 2n+1} 2n+1.
  # From this final list, some odd integers have been excluded; we must show these are precisely the composite odd
  # integers less than {\displaystyle 2n+2} 2n + 2.
  # def generate_prime_numbers()
  #   ## Find n from size
  #   # size = 2n +2
  #   @max_limit = (max_prime_numbers * 3)
  #   n = (max_limit() -2)/2
  #
  #   array_of_size_n = (1..n).to_a
  #
  #   ### TO generate first N prime numbers, subtract compisite numbers from prime
  #   ## temp_value and temp_array will be removed as they will be composite
  #   # So we will remove
  #
  #   temp_array = []
  #   n.times do |i|
  #     next if i == 0
  #     break if  (i - temp_array.size) >= max_prime_numbers || 3*i >= n
  #     # puts "\n *#{i}"
  #     n.times do |j|
  #       next if j == 0
  #       temp_value =  i + j + (2*i*j)
  #       if temp_value <= n
  #         temp_array << temp_value
  #         # print "-- #{j}, size #{temp_array.size}"
  #       else
  #         break
  #       end
  #     end
  #   end ## end of i
  #   array_of_size_n -= temp_array
  #
  #   array_of_size_n.each do |prime_number|
  #     # _prime = ((2 * prime_number) + 1)
  #     prime_number_array << ((2 * prime_number) + 1) # _prime
  #   end
  #
  #
  # end ## End of generate_prime_numbers


  ## Sieve of Eratosthenes
  def sieve_of_eratosthenes
    is_prime = Array.new(max_limit, true)
    is_prime[0] = is_prime[1] = true
    smallest_prime_factor = Array.new(max_limit, 0)

    max_limit.times do |i|
      next if i < 2
      if is_prime[i]
        prime_number_array << i
        smallest_prime_factor[i] = i
        break if max_prime_numbers == prime_number_array.size
      end

      for j in 0..max_limit
        break if j == prime_number_array.size || i * prime_number_array[j] >= max_limit || prime_number_array[j] > smallest_prime_factor[i]
        is_prime[i*prime_number_array[j]] = false
        smallest_prime_factor[i*prime_number_array[j]] = prime_number_array[j]
      end ## end of j

    end ## end of i

  end


  def multiplication_table
    greatest_number = prime_number_array[-1]
    longest_number = greatest_number * greatest_number
    longest_number_size = longest_number.to_s.size

    longest_number_space = ''
    longest_number_size.times {|i| longest_number_space.concat' '}

    print longest_number_space

    prime_number_array.each do |row|
      print longest_number_space
      print "%.#{longest_number_size}d" % row
    end

    puts "\n"
    puts "\n"

    prime_number_array.each do |row|

      print "%.#{longest_number_size}d" % row

      print longest_number_space
      prime_number_array.each do |column|
        product = row * column
        print "%.#{longest_number_size}d" % product

        print longest_number_space

      end
      puts "\n"
      puts "\n"

    end

  end


end

