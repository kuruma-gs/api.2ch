# Check out https://github.com/joshbuddy/http_router for more information on HttpRouter
HttpRouter.new do
  add('/thres').to(ThreAction)
  add('/reses').to(ResAction)
  add('/fake').to(FakeAction)
end
