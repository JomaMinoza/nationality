require "nationality/version"
require "yaml"

module Nationality
  
  YML_NATIONALITY = YAML.load_file(File.join(File.dirname(__FILE__),"nationality", "yml", "nationality.yml"))

  NATIONALITY = YML_NATIONALITY.map { |_, v| v }.flatten.compact.sort

  class Nationality

  	class << self

      def count
        NATIONALITY.map { |v| v }.flatten.count
      end

      def default_option(default_option)
        nationalities = NATIONALITY

        default_nationality = default_option.split(" ").map{ |word| word.include?("and") ? word : word.capitalize }.join(" ")

        if nationalities.include? default_nationality
          nationalities = nationalities - [default_nationality]
          nationalities.unshift(default_nationality)
          return nationalities
        else
          raise NationalityNotFound
        end
      end
    end

  end

  class NationalityNotFound < StandardError
    def initialize(msg="Nationality not found on the list")
      super
    end
  end
end
