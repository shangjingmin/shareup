#-*-encoding:utf-8-*-
class Metadoc < ActiveRecord::Base

  validates_presence_of :title

  searchable do
    text :title
    text :content
    text :from_url
    time :collect_at
  end
end
