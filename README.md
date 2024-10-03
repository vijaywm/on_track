# OnTrack

### use tailwind

- common  templates https://tailblocks.cc


### Sync Data from Sheets
- Person and Trip can be synced from google sheets 
- Create a google spreadsheet and share "Anyone With Link". Add 2 sheets Person Master and Trip Master.
- Download credentials.json from google cloud console and place in config/goth_credentials.json.


### Google Sheets API setup
Use [this](https://console.developers.google.com/start/api?id=sheets.googleapis.com) wizard.


Reference links
- [Space Rocket](https://space-rocket.com/blog/elixir-getting-started-with-google-sheets-api-and-service-accounts)
- [https://www.youtube.com/watch?v=sFYpxx7HWig](https://www.youtube.com/watch?v=sFYpxx7HWig)
- [Create Service Account](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwjxloDBlPGIAxWVRWwGHdcaDLQQpMsLKAJ6BAgKEBQ&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DsVURhxyc6jE%26t%3D67&usg=AOvVaw39S-tRKqnhQIlZNmBttOXs&opi=89978449)
- [https://www.youtube.com/watch?v=fxGeppjO0Mg](https://www.youtube.com/watch?v=fxGeppjO0Mg)
- [https://hex.pm/packages/google_api_sheets](https://hex.pm/packages/google_api_sheets)
- [https://medium.com/@bopingliu/using-the-google-sheets-api-1f75316d784b](https://medium.com/@bopingliu/using-the-google-sheets-api-1f75316d784b)





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