# frozen_string_literal: true

class Array
  def deep_dup
    map { |a| a.instance_of?(Array) ? a.deep_dup : a.dup }
  end
end

# TESTS

#
# arr = [
#   [ 1, [ 2, 3 ] ],
#   [ 4, 5, 6],
#   [ [ 7, 8, [ 9, 10 ]], [11, 13] ]
# ]
# duper = arr.deep_dup
#
# puts "object_id -> arr = #{arr.object_id} | duper = #{duper.object_id}"
# puts "arr[1] = #{arr[1]} | duper[1] = #{duper[1]}"
# puts "object_id -> arr[1] = #{arr[1].object_id} | duper[1] = #{duper[1].object_id}"
# puts "arr[2][0][2] = #{arr[2][0][2]} | duper[2][0][2] = #{duper[2][0][2]}"
# puts "object_id -> arr[2][0][2] = #{arr[2][0][2].object_id} | duper[2][0][2] = #{duper[2][0][2].object_id}"
#
