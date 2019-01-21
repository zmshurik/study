module Inatra
  class << self
    def routes(&block)
      module_exec(&block)
    end

    def call(env)
      request = Rack::Request.new(env)
      method = request.request_method
      path = request.path
      get_handler(path, method).call
    end

    private

    def get_handler(path, method)
      needed_route = @routes_map.find { |route| route[:method] == method && route[:path] == path }
      needed_route[:handler] || -> { [404, {}, ''] }
    end

    def get(path, &block)
      @routes_map ||= []
      @routes_map << { method: 'GET', path: path, handler: block }
    end
  end
end
