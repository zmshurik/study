module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |item| item.negative? ? item : max }
      end

      def search(array, query)
        first_element_index = 0
        last_element_index = array.size - 1
        while last_element_index >= first_element_index
          index = (first_element_index + last_element_index) / 2
          return index if array[index] == query
          first_element_index = index + 1 if array[index] < query
          last_element_index = index - 1 if array[index] > query
        end
        -1
      end
    end
  end
end
