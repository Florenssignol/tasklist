task :daily_mail => :environment do
    CountingMailer.automated_count.deliver_now
end
