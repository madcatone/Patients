# encoding: UTF-8
module V1
  class API < Grape::API
    version 'v1', using: :path
    format :json
    content_type :json, 'application/json; charset=utf-8'
=begin rdoc
    format :xml
    content_type :xml, "text/xml"
=end
       
    prefix :api
    # Mount the APIs
    mount V1::CommentsApi

    add_swagger_documentation
  end
end

