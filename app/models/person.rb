class Person

  attr_reader :first_name, :last_name, :birthdate, :city

  CITIES = {
    'LA'  => 'Los Angeles',
    'NYC' => 'New York City'
  }

  def initialize(first_name:, last_name: nil, birthdate:, city:)
    @first_name = first_name
    @last_name = last_name
    @birthdate = birthdate
    @city = get_full_city_name(city)
  end

  def get_full_city_name(city)
    if CITIES.has_key? city
      CITIES[city]
    else
      city
    end
  end

  def convert_to_string
    "#{first_name}, #{city}, #{birthdate.strftime('%-m/%-d/%Y')}"
  end
end
