class CreateMailer < ApplicationMailer
    def create_mail(blog)
        @blog = blog
        # @blogcreate_userid = @blog.user_id
        # @user = User.find_by(id: @blogcreate_userid)
        mail to: @blog.user.email, subject: "お問い合わせの確認メール"
    end
end

# @blogでブログの内容、user_idを取得。→ユーザidからユーザテーブルを取得。そこのemailを設定