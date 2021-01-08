require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do
      it '全てが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@が含まれていないといけない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードが数字のみの場合登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードに数字が含まれない場合無効な状態であること' do
        @user = User.new(password: 'A' + 'a' * 5, password_confirmation: '1A' + 'a' * 3)
        @user.valid?
        expect(@user.errors[:password]).to include('Password Include both letters and numbers')
      end

      it 'surnameが空では登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end

      it 'surnameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.surname = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname Full-width characters')
      end

      it 'surname_kが空では登録できない' do
        @user.surname_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname k can't be blank")
      end

      it 'surname_kのフリガナは全角（カタカナ）でなければ登録できない' do
        @user.surname_k = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname k Full-width katakana characters')
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.family_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Full-width characters')
      end

      it 'family_name_kが空では登録できない' do
        @user.family_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name k can't be blank")
      end

      it 'family_name_kのフリガナは全角（カタカナ）でなければ登録できない' do
        @user.family_name_k = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name k  Full-width katakana characters')
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
