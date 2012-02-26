#-*-encoding:utf-8-*-
class Metadoc < ActiveRecord::Base

  validates_presence_of :title
  validates_uniqueness_of :from_url, :scope=>:user_id

  searchable do
    text :title
    text :content
    text :from_url
    time :collect_at
  end

  def self.extract_with_defaults(params = {})
    raise "Invalid blank url" if params[:doc_url].blank?
    url = params[:doc_url].to_s.strip
    doc = find_by_from_url_and_user_id(url, params[:user_id]) 
    if doc.nil?
      doc_online = Pismo[url]
      create(:title=>doc_online.title,
             :content=>"    " + doc_online.description,
             :from_url=>url,
             :from_mark=>doc_online.title,
             :user_id=>params[:user_id],
             :public=>true, #TODO ADD DEFAULT AT DB
             :collect_at=>Time.now)
    else
      puts "====>has existed: #{doc.id}"
    end
  end
end
