require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "全ての必須項目の入力が存在すれば登録できる" do
      @user.save
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したメールアドレスだと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスに＠が含まれていないと登録できない" do
      @user.email = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが６文字以上ないと登録できない" do
      @user.password = "a0000"
      @user.password_confirmation = 'a0000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードが数字のみの場合登録できない" do
      @user.password = "000000"
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      @user
    end
    it "パスワード確認が空だと登録できない" do
      @user.password = "a00000"
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it " パスワードとパスワード確認が一致しないと登録できない" do
      @user.password = "a00000"
      @user.password_confirmation = "a11111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "性別は選択されていなくても登録できる" do
      @user.sex_id = 1
      expect(@user).to be_valid
    end
    it "年齢は選択されていなくても登録できる" do
      @user.age_id = 1
      expect(@user).to be_valid
    end
    it "住所は選択されていなくても登録できる" do
      @user.prefecture_id = 1
      expect(@user).to be_valid
    end
    
  end
end
