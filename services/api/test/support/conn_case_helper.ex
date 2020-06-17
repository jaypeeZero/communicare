defmodule Api.ConnCaseHelper do
  def render_json(view, template, assigns) do
    view.render(template, assigns) |> format_json
  end

  defp format_json(json) do
    json |> Poison.encode!() |> Poison.decode!()
  end
end
