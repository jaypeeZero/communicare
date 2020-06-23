defmodule Api.Router do
  use Api.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", Api do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/api", Api do
    pipe_through(:api)

    get("/todos", TodoController, :index)
    get("/todos/:id", TodoController, :show)

    get("/messages", MessageController, :index)
  end
end
