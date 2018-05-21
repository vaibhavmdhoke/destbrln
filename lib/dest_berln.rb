require "dest_berln/version"
require 'dest_berln/prime_number_generator'

module DestBerln
  def self.print_prime_number(max_limit = 10)
    _prime_number_generator = PrimeNumberGenerator.new(max_limit )
    _prime_number_generator.sieve_of_erastosthenes
    _prime_number_generator.multiplication_table
  end
end
