class Header
  def initialize(app)
    @app = app
    @salutation = "<h1>Hey there</h1><br/>"
  end

  def call(env)
    status, headers, @response = @app.call(env)
    Rack::Response.new(self, status, headers)
  end

  def each(&block)
    block.call(@salutation)
    @response.each(&block)
  end
end
