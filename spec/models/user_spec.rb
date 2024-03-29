# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nik                    :string(255)
#  balance                :decimal(6, 2)    default(0.0), not null
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  roles_mask             :integer
#  configApp_id           :integer
#  topics_count           :integer          default(0)
#  posts_count            :integer          default(0)
#

# -*- encoding : utf-8 -*-
require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
