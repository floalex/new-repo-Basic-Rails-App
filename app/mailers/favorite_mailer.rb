class FavoriteMailer < ApplicationMailer

  default from: "flo.liang@my.com"
  layout 'mailer'

  def new_comment(user, post, comment)

    #New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@flo-bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@flo-bloccit.example>"
    headers["References"] = "<post/#{post.id}@flo-bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
