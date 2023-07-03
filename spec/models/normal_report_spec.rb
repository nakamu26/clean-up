require 'rails_helper'

RSpec.describe NormalReport, type: :model do
  before do
    @normal_report = FactoryBot.build(:normal_report)
  end

  describe '報告投稿' do
    context '報告が投稿できる場合' do
      it 'すべての項目が存在していれば保存できる' do
        expect(@normal_report).to be_valid
      end
      it 'imageが空でも保存できる' do
        @normal_report.image = nil
        expect(@normal_report).to be_valid
      end
    end
    context '報告が投稿できない場合' do
      it 'location_idが0では登録できない' do
        @normal_report.location_id = 0
        @normal_report.valid?
        expect(@normal_report.errors.full_messages).to include("Location can't be blank")
      end
      it 'number_of_times_idが0では登録できない' do
        @normal_report.number_of_times_id = 0
        @normal_report.valid?
        expect(@normal_report.errors.full_messages).to include("Number of times can't be blank")
      end
      it 'pointが空では保存できない' do
        @normal_report.point = ''
        @normal_report.valid?
        expect(@normal_report.errors.full_messages).to include("Point can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @normal_report.user = nil
        @normal_report.valid?
        expect(@normal_report.errors.full_messages).to include('User must exist')
      end
    end
  end
end
