class ReportMailer < ActionMailer::Base
  default from: "ppp@system.com", to: 'ivan89pl@gmail.com'
  layout 'mailer'

  def report(auction_id, full_description, admin)
    @auction = Auction.find_by_auction_id(auction_id)
    @full_description = full_description
    @admin = admin
    mail(subject: 'Aukcja zgłoszona do kontroli')
  end

end
