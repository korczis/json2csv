require_relative '../../lib/json2csv'

describe Json2Csv do
  it 'Is defined' do
    expect(Json2Csv::VERSION.nil?).to be_falsey
  end
end
