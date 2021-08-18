# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_session_token  (session_token)
#  index_users_on_username       (username)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  #Validations
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  

  # subject(:test) { FactoryBot.create(:user) }
  # it { should validate_presence_of(:session_token) }


end
