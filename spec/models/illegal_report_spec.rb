require 'rails_helper'

RSpec.describe IllegalReport, type: :model do
  before do
    @illegal_report = FactoryBot.build(:illegal_report)
  end

  describe '不法物投稿' do
    context '不法物が投稿できる場合' do
      it 'すべての項目が存在していれば保存できる' do
        expect(@illegal_report).to be_valid
      end
      it 'imageが空でも保存できる' do
        @illegal_report.image = nil
        expect(@illegal_report).to be_valid
      end
      it 'commentが空でも保存できる' do
        @illegal_report.comment = ''
        expect(@illegal_report).to be_valid
      end
    end

    context '不法物が投稿できない場合' do
      it 'location_idが0では登録できない' do
        @illegal_report.location_id = 0
        @illegal_report.valid?
        expect(@illegal_report.errors.full_messages).to include("Location can't be blank")
      end
      it 'pointが空では保存できない' do
        @illegal_report.point = ''
        @illegal_report.valid?
        expect(@illegal_report.errors.full_messages).to include("Point can't be blank")
      end
      it 'contentが空では保存できない' do
        @illegal_report.content = ''
        @illegal_report.valid?
        expect(@illegal_report.errors.full_messages).to include("Content can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @illegal_report.user = nil
        @illegal_report.valid?
        expect(@illegal_report.errors.full_messages).to include('User must exist')
      end
    end
  end
end
