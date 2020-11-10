require 'rails_helper'

RSpec.describe Plan, type: :model do
  before do
    @plan = FactoryBot.build(:plan)
  end

  describe '企画新規投稿' do
    it '全ての項目の入力が存在すれば投稿できる' do
      @plan.save
      expect(@plan).to be_valid
    end
    it '画像がないと投稿できない' do
      @plan.image = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Image can't be blank")
    end
    it 'タイトルが空だと投稿できない' do
      @plan.title = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Title can't be blank")
    end
    it '旅行先が選択されていないと投稿できない' do
      @plan.trip_id = 1
      @plan.valid?
      expect(@plan.errors.full_messages).to include('Trip must be other than 1')
    end
    it '金額が空だと投稿できない' do
      @plan.price = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Price can't be blank")
    end
    it '定員が選択されていないと投稿できない' do
      @plan.capacity_id = 1
      @plan.valid?
      expect(@plan.errors.full_messages).to include('Capacity must be other than 1')
    end
    it '出発日が空だと投稿できない' do
      @plan.first_day = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("First day can't be blank")
    end
    it '帰宅日が空だと投稿できない' do
      @plan.final_day = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Final day can't be blank")
    end
    it '締切日が空だと投稿できない' do
      @plan.deadline = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Deadline can't be blank")
    end
    it 'メッセージが空だと投稿できない' do
      @plan.message = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Message can't be blank")
    end
  end
end
