require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
      it '正しい情報が入力されていれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do
      # emailに関して
      it '空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複している場合登録できないこと' do
        # 重複したemailを持つユーザーを作成
        @user.save
        duplicate_user = FactoryBot.build(:user)
        duplicate_user.email=@user.email
        duplicate_user.save
        expect(duplicate_user.errors.full_messages).to include 'Email has already been taken'
      end

      it '@が含まれていないと登録できないこと' do
        @user.email = 'invalid_email'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      # passwordに関して
      it '空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it '6文字以上でないと登録できないこと' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'password_confirmationと一致していないと登録できないこと' do
        @user.password_confirmation = 'mismatched_password'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it '英字のみでは登録できないこと' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password must contain at least one numeric character'
      end

      it '数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password must contain at least one numeric character'
      end

      it '全角だと登録できないこと' do
        @user.password = 'パスワード１a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password must contain at least one numeric character'
      end

      # ユーザー名に関して
      it '空では登録できないこと' do
        @user.user_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "User name can't be blank"
      end

      # ユーザー名フリガナに関して
      it '空では登録できないこと' do
        @user.last_name_frigana = ''
        @user.first_name_frigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name frigana can't be blank"
        expect(@user.errors.full_messages).to include "First name frigana can't be blank"
      end

      it 'カタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できないこと' do
        @user.last_name_frigana = ''
        @user.first_name_frigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name frigana can't be blank"
        expect(@user.errors.full_messages).to include "First name frigana can't be blank"
      end

      # birthdayに関して
      it '空だと登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
