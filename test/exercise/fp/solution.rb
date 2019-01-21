module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films_with_more_than_2_countries = array.reject { |film| film['country'].nil? }
                                                .reject { |film| film['country'].split(',').size < 2 }
        ratings = films_with_more_than_2_countries.map { |film| film['rating_kinopoisk'] }
        needed_ratings = ratings.reject(&:nil?).map(&:to_f).reject(&:zero?)
        sum_of_ratings = needed_ratings.reduce(&:+)
        sum_of_ratings / needed_ratings.size
      end

      def chars_count(films, threshold)
        films_with_appropriate_rating = films.reject { |film| film['rating_kinopoisk'].nil? }
                                             .select { |film| film['rating_kinopoisk'].to_f >= threshold }
        films_with_appropriate_rating.map { |film| film['name'] }
                                     .map { |film_name| film_name.count('и') }
                                     .reduce(&:+)
      end
    end
  end
end
