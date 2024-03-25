module Requests
    module JsonHepers
        def json
            JSON.parse(response.body)
        end
    end
end