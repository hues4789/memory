require 'rails_helper'
describe 'POST #create_user_post' do
  it "確認用パスワードが異なる場合" do
    @user = User.new(name: "sampleTarou", email: "tarou@example.com", password: "aaaaaa", password_confirmation: "bbbbbb")
    expect(@user.save).to eq false
  end
end