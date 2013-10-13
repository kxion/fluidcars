require 'spec_helper'

describe Order do

  it 'order will change rent status' do
    rent = create(:rent)
    expect(rent.status).to eq '可预订'
    order = build(:order, rent: rent)
    order.save
    expect(rent.status).to eq '已预订'
  end

end
