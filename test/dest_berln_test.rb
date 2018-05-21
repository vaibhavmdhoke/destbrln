require "test_helper"

class DestBerlnTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::DestBerln::VERSION
  end


  def test_print_prime_number_without_any_parameter
    # assert_equal(DestBerln.print_prime_number, )
    first_ten_prime_numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    assert_equal(DestBerln.print_prime_number, first_ten_prime_numbers)
  end

  def test_print_prime_number_with_parameter
    first_five_prime_numbers = [2, 3, 5, 7, 11]
    assert_equal(DestBerln.print_prime_number(5), first_five_prime_numbers)
  end

end
