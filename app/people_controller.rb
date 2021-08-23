class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    Parser.get_people(params)
  end

  private

  attr_reader :params
end
