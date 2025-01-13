require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/user情報' do
    context 'user新規登録_成功' do
      it '条件を満たしている場合_登録可' do
        expect(@user).to be_valid
      end
    end

    context 'user新規登録_失敗' do
      it 'nicknameが空_登録不可(= user必須)' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空_登録不可(= email必須)' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合_登録不可' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まない_登録不可' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空_登録不可(= password必須)' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下_登録不可(= password6文字以上)' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは、半角英数字混合での入力が必須' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it 'passwordとpassword_confirmationが不一致の場合_登録不可' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe '新規登録/本人確認情報' do
    context 'user確認_成功' do
      it '条件を満たしている場合_登録可' do
        expect(@user).to be_valid
      end
    end

    context 'user確認_失敗' do
      it 'family_nameが空_登録不可(= family_name必須)' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'personal_nameが空_登録不可(= personal_name必須)' do
        @user.personal_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Personal name can't be blank")
      end

      it 'family_nameとpersonal_nameが英語入力_登録不可(= 漢字・かな・カナ入力のみ)' do
        @user.family_name = 'aaaa'
        @user.personal_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it 'family_name_kanaが空_登録不可(= family_name_kana必須)' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'personal_name_kanaが空_登録不可(= personal_name_kana必須)' do
        @user.personal_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Personal name kana can't be blank")
      end

      it 'family_name_kanaとpersonal_name_kanaが漢字・かな・カナ・英語入力_登録不可(= カナ入力のみ)' do
        @user.family_name = 'aaaa'
        @user.personal_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages)
      end

      it 'birthdayが空_登録不可(= birthday必須)' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
