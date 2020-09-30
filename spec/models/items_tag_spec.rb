require 'rails_helper'

RSpec.describe ItemsTag, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:items_tag)
      @item.image = fixture_file_upload('public/images/sample.jpg')
    end

    it "image、price、number、unit_price、name、textが存在すれば登録できる" do
      expect(@item).to be_valid
    end

    it "imageが空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    
    it "priceが空では登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "numberが空では登録できない" do
      @item.number = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Number can't be blank")
    end
    
    it "unit_priceが空では登録できない" do
      @item.unit_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Unit price can't be blank")
    end

    it "nameが空では登録できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it "textは空でも登録できること" do
      @item.text = nil
      expect(@item).to be_valid
    end
  end
end
