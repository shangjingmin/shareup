#-*-encoding:utf-8-*-
class Metadoc < ActiveRecord::Base
  searchable do
    text :title
    text :content
    text :from_url
    time :collect_at
  end
end
