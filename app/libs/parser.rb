require 'csv'

class Parser
  SETTINGS = {
    dollar_format: { column_separator: '$', date_format: '%d-%m-%Y' },
    percent_format: { column_separator: '%', date_format: '%Y-%m-%d' }
  }

  def self.get_people(people_params)
    parsed_people = parse_people(people_params)
    parsed_people
      .sort_by(&people_params[:order])
      .map(&:convert_to_string)
  end

  def self.parse_people(people_params)
    result = SETTINGS.map do |key, value|
      rows = parse(people_params[key], value[:column_separator], value[:date_format])
      rows.map { |r| Person.new(r) }
    end
    result
      .compact
      .flatten
  end

  def self.parse(str, column_separator, date_format)
    CSV.parse(str,
              col_sep: column_separator,
              headers: :first_row, header_converters: :symbol,
              converters: [->(v) { s = v.strip; Date.strptime(s, date_format) rescue s }]).map(&:to_h)
  end
end
