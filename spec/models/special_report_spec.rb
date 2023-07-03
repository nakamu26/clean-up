require 'rails_helper'

RSpec.describe SpecialReport, type: :model do
  before do
    @special_report = FactoryBot.build(:special_report)
  end

  describe '特記事項投稿' do
    context '特記事項が投稿できる場合' do
      it 'すべての項目が存在していれば保存できる' do
        expect(@special_report).to be_valid
      end
      it 'imageが空でも保存できる' do
        @special_report.image = nil
        expect(@special_report).to be_valid
      end
      it 'commentが空でも保存できる' do
        @special_report.comment = ''
        expect(@special_report).to be_valid
      end
    end

    context '特記事項が投稿できない場合' do
      it 'location_idが0では登録できない' do
        @special_report.location_id = 0
        @special_report.valid?
        expect(@special_report.errors.full_messages).to include("Location can't be blank")
      end
      it 'category_idが0では登録できない' do
        @special_report.category_id = 0
        @special_report.valid?
        expect(@special_report.errors.full_messages).to include("Category can't be blank")
      end
      it 'pointが空では保存できない' do
        @special_report.point = ''
        @special_report.valid?
        expect(@special_report.errors.full_messages).to include("Point can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @special_report.user = nil
        @special_report.valid?
        expect(@special_report.errors.full_messages).to include('User must exist')
      end
    end
  end
end
