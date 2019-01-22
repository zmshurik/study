module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for element in self
          yield(element)
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each { |element| result << yield(element) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |element| result << element unless element.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        result = initial
        my_each do |element|
          if element == first && result.nil?
            result = element
            next
          end
          result = yield(result, element)
        end
        result
      end
    end
  end
end
