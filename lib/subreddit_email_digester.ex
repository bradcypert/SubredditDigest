defmodule SubredditEmailDigester do

  def main do
    email = Reddit.generate_email_from_top_posts
    Mailer.deliver email
  end

end
