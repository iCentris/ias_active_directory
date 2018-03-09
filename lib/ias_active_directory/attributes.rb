# frozen_string_literal: true

%w[sam_account_type group_type].each do |file_name|
  require 'ias_active_directory/attributes/' + file_name
end
