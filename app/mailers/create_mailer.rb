class CreateMailer < ApplicationMailer
    def create_mail(blog_create)
        @blog_create = blog_create
        
        mail to: "rirurarura@gmail.com", subject: "お問い合わせの確認メール"
    end
end
