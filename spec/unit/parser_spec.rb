RSpec.describe Parser do
  describe 'Parser for dollar and percent formats' do
    it 'check dollar parser / date format functionalities' do
      parsed_rows = Parser.parse(File.read('spec/fixtures/people_by_dollar.txt'), '$', '%d-%m-%Y')
      expect(parsed_rows.count).to be > 0
    end

    it 'check percent parser / date format functionalities' do
      parsed_rows = Parser.parse(File.read('spec/fixtures/people_by_percent.txt'), '%', '%Y-%m-%d')
      expect(parsed_rows.count).to be > 0
    end
  end
end
