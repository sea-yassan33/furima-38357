require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it 'email,pwssword(確認含む),nickname,last及びfirstname(カナ含む),birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'nicknameが空白である' do
        @user.nickname = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空白である' do
        @user.email = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含まないと登録できな' do
        @user.email = 'aaabbb.com'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空白では登録できない' do
        @user.password = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordがでは半角英数字が混合で含まれていないと登録できない' do
        @user.password = '123456'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordとでpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'b234567'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空白である' do
        @user.last_name = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空白である' do
        @user.first_name = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが全角ではない' do
        @user.last_name = 'test'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
      it 'first_nameが全角ではない' do
        @user.first_name = 'tarou'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
      it 'last_name_kanaがカナではない' do
        @user.last_name_kana = 'てすと'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it 'first_name_kanaがカナではない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'birth_dateが空白である' do
        @user.birth_date = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
