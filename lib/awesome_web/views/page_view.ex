defmodule AwesomeWeb.PageView do
  use AwesomeWeb, :view

  @spec to_id(String.t()) :: String.t()
  def to_id(str) do
    String.downcase(str) |> String.replace(" ", "-")
  end

  @spec to_html(String.t()) :: String.t()
  def to_html(md) do
    Earmark.as_html!(md)
  end

  @spec github(GitRepo.t()) :: String.t()
  def github(%GitRepo{owner: owner, repo: repo}) do
    "https://github.com/#{owner}/#{repo}"
  end

  @spec days_since(DateTime.t()) :: non_neg_integer
  def days_since(dt) do
    div(DateTime.diff(DateTime.utc_now(), dt), 3600 * 24)
  end

  @spec style(GitRepo.t()) :: String.t()
  def style(%GitRepo{last_commit: dt}) do
    if days_since(dt) > 365 do
      """
      style="opacity:0.4"
      """
    else
      ""
    end
  end
end
