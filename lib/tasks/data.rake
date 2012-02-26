namespace :data do

  task :load_36kr_recommands=>:environment do
    recommand_ids = (85800..85900).to_a
    #recommand_ids = [86245]
    puts "====>Begin..." 
    recommand_ids.each do |rid|
      begin
        url = "http://www.36kr.com/p/#{rid}.html"
        puts "===>#{url}"
        doc = Metadoc.extract_with_defaults(:doc_url=>url, :user_id=>1)
        puts "==>Collect doc#{doc.id} with title: #{doc.title}"
      rescue Exception=>e
        puts "===>error: #{e.message}"
        #p e.backtrace
      end
      puts "===>#{rid}"
    end
    puts "====>End #{recommand_ids.size}..." 
  end
end
