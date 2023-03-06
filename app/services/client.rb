class Client
    HOST_URL = ENV['HOST_URL']
    def initialize(apikey='')
      @apikey = apikey
    end

    def get(path, options = {})
        response = RestClient::Request.execute(method: :get, url: HOST_URL.to_s + path, headers:
            { params: request_params(options), content_type: :json, accept: :json })
            body_parser(response)
        rescue => e
          Rails.logger.error [e.message, e.backtrace].join($/)
    end

    private

    def request_params(options)
      params = {api_key: @apikey.to_s}
      params.merge(options)
    end    

    def body_parser(res)
        res.code == 200 ? JSON.parse(res.body) : nil      
    end    
end