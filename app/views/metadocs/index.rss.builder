xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Shareup"
    xml.description "share up your docs and links"
    xml.link metadocs_url

    for meta in @metadocs
      xml.item do
        xml.title truncate(meta.title.titleize, :length=>40) + meta.nickname.to_s
        xml.description meta.tags + '\n' + truncate(meta.content, :length=>300)
        xml.pubDate meta.collect_at.to_s(:rfc822)
        xml.link meta
        xml.guid meta.from_url
      end
    end
  end
end
