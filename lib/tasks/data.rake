namespace :data do

  desc "Fill message URL counts"
  task :fill_counts => :environment do
    $stdout.sync = true
    puts "-----> Filling message URL counts: #{Message.count}"
    i = 0
    Message.find_each do |message|
      i += 1
      putc "."
      "| #{i} |".each_char{|c| putc c } if i % 100 == 0
      message.message_urls_count = message.message_urls.count
      message.save!
    end
    puts
  end

end
