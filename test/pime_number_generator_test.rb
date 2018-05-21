require 'test_helper'
class PrimeNumberGeneratorTest  < Minitest::Test
  
  def setup
    @max_limit_for_testing = 25
    @prime_numbers_till_hundred = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
    @prime_number_sieve_of_eratosthenes = PrimeNumberGenerator.new(@max_limit_for_testing)
  end

  def test_initilization
    assert(@prime_number_sieve_of_eratosthenes.max_limit != nil)
    assert(@prime_number_sieve_of_eratosthenes.max_prime_numbers != nil)
    assert_equal(@prime_number_sieve_of_eratosthenes.max_prime_numbers, @max_limit_for_testing)
  end


  # def test_generate_prime_numbers
  #   @prime_number_generator.generate_prime_numbers
  #   assert_equal(@prime_number_generator.prime_number_array, @prime_numbers_till_hundred)
  # end

  def test_sieve_of_erastosthenesis
    assert_equal(@prime_number_sieve_of_eratosthenes.prime_number_array.size, 0)
    @prime_number_sieve_of_eratosthenes.sieve_of_eratosthenes
    assert_equal(@prime_number_sieve_of_eratosthenes.prime_number_array, @prime_numbers_till_hundred)
    assert_equal(@prime_number_sieve_of_eratosthenes.prime_number_array.size, @max_limit_for_testing)
  end

end