class Footer
  def initialize(app)
    @app = app
    @salutation = "<h1>Bye there</h1><br/>"
  end

  def call(env)
    status, headers, @response = @app.call(env)
    Rack::Response.new(self, status, headers)
  end

  def each(&block)
    @response.each(&block)
    block.call(@salutation)
  end
end
