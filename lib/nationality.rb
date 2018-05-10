require 'nationality/version'
require 'yaml'

module Nationality
  YML_NATIONALITY = YAML.load_file(File.join(File.dirname(__FILE__), 'nationality', 'yml', 'nationality.yml'))
  NATIONALITY = YML_NATIONALITY.map { |_, v| v }.flatten.compact.sort

  YML_NATIONALITY_EXPANDED_SPELLING = YAML.load_file(File.join(File.dirname(__FILE__),
                                                               'nationality',
                                                               'yml',
                                                               'nationality_expanded_spelling.yml'))
  NATIONALITY_EXPANDED_SPELLING = YML_NATIONALITY_EXPANDED_SPELLING.map { |_, v| v }.flatten.compact.sort

  class Nationality
    class << self
      def count
        NATIONALITY.map { |v| v }.flatten.count
      end

      def default_option(default_option, expanded = false)
        nationalities = expanded ? NATIONALITY_EXPANDED_SPELLING : NATIONALITY

        default_nationality = default_option.split(' ').map { |word| word.include?('and') ? word : word.capitalize }.join(' ')

        if nationalities.include? default_nationality
          nationalities -= [default_nationality]
          nationalities.unshift(default_nationality)
          return nationalities
        else
          raise NationalityNotFound
        end
      end
    end
  end

  class NationalityNotFound < StandardError
    def initialize(msg = 'Nationality not found on the list')
      super
    end
  end
end
