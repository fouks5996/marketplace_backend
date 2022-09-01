class UserMailer < Devise::Mailer
   default from: "<marketplace@yopmail.com>" 
   # before_action :add_inline_attachments!
  
   def reset_password_instructions(record, token, opts={})
     super
   end
  
   # private
   # def add_inline_attachments!
   #   attachments.inline['your-logo.png'] = File.read(Rails.root.join('app/assets/images/your-logo.png'))
   # end
end