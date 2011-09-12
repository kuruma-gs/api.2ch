# Check out https://github.com/joshbuddy/http_router for more information on HttpRouter
HttpRouter.new do
  add('/q').to(ThreAction)
  add('/t').to(ResAction)
  add('/fake').to(FakeAction)
end
