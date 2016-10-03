require "nationality/version"
require "yaml"

module Nationality
  
  YML_NATIONALITY = YAML.load_file(File.join(File.dirname(__FILE__),"nationality", "yml", "nationality.yml"))

  NATIONALITY = YML_NATIONALITY.map { |_, v| v }.flatten.compact.sort

end
