defmodule Mailer do
  @my_username "bradcypert"
  @my_password "password"

  def deliver(email) do
    Mailman.deliver(email, config)
  end

  def config do
    %Mailman.Context{
      config: %Mailman.SmtpConfig {
        relay: "smtp.gmail.com",
        username: @my_username,
        password: @my_password,
        port: 465,
        ssl: true,
        tls: :never,
        auth: :always},
      composer: %Mailman.EexComposeConfig{}
    }
  end

end
