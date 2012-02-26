class Docshot < ActiveRecord::Base

  #shot a url
  def self.shot(url)
    raise "Invalid blank url for shot!" if url.blank?
    url = url.to_s.strip
    shotdoc = find_by_url(url)
    if shotdoc.nil?
      doc = Pismo[url]
      shotdoc = create(:url=>doc.url, :content=>doc.html, :shot_times=>1)
    else
      shotdoc.increment(:shot_times, 1)
    end
    shotdoc
  end

  #get a Pismo::Document by this object
  def doc
    Pismo::Document.new(StringIO.new(self.content), self.url)
  end
end
