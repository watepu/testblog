class SubmitMailer < ApplicationMailer
  def submit_mail(blog)
    @blog = blog
    mail to: @blog.user.email, subject:"ブログを投稿しました"
    # current_user.email
  end
end
