# == Schema Information
#
# Table name: newsletters
#
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  month             :date
#

require 'rails_helper'

RSpec.describe Newsletter, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
