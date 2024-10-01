# OnTrack

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


https://excalidraw.com/#room=96657c962190ad2805a4,_q9Tz7_oy-y4mRYWpwqvGQ

mix phx.gen.context Trips Trip trips trip_name:string trip_date:date trip_group:string origin:string destination:string etd:utc_datetime eta:utc_datetime start_time:utc_datetime end_time:utc_datetime status:string pax:integer capacity:integer

mix phx.gen.context Persons Person persons person_id:string full_name:string mobile_no:string center:string age:integer gender:string trip_option:string trip_group:string trip_status:string 