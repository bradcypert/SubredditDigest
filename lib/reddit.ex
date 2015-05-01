defmodule Reddit do
  @subreddit_file "lib/sites/subreddits.txt"

  defp process_url(subreddit) do
    "http://www.reddit.com/r/" <> subreddit <> "/top.json?limit=5"
  end

  defp get_all_top_posts([head]), do: [get_top_posts head]
  defp get_all_top_posts([head | tail]) do
    [get_top_posts head] ++ get_all_top_posts tail
  end

  defp get_top_posts(subreddit) do
    IO.puts "Getting " <> subreddit <> "..."
    body = (subreddit
    |> process_url
    |> HTTPotion.get
    |> Map.get :body)
    JSX.decode! body
  end

  defp get_subreddits_from_file do
    body = File.read! @subreddit_file
    String.split(body, "\n")
    |> Enum.filter(fn(x) -> x != "" end)
  end

  def generate_email_from_top_posts do
    get_subreddits_from_file
    |> get_all_top_posts
  end

end
