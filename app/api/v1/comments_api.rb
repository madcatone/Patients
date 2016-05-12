# encoding: UTF-8
module V1
  class CommentsApi < Grape::API
    resource :comments do
      # response 400 if error
      desc "Return a public timeline."
      get :public_timeline do
        all = Comment.limit(20)
        present all, with: V1::Entities::CommentBasic
      end
 
      desc "Return a personal timeline."
      get :home_timeline do
        #authenticate!
        #current_user.statuses.limit(20)
        all = Comment.limit(20)
        present all, with: V1::Entities::CommentBasic
      end
 
      desc "Return a status."
      params do
        requires :id, type: Integer, desc: "Status id."
      end
      route_param :id do
        get do
          single =Comment.find(params[:id])
          present single, with: V1::Entities::CommentBasic
        end
      end
 
      desc "Create a status."
      # response 201 created
      params do
        requires :title, type: String, desc: "Your status."
        requires :context, type: String, desc: "Your status."
      end
      post do
        #authenticate!
        Comment.create!({
                           #user: current_user,
                           #text: params[:status]
                           title: params[:title],
                           context: params[:context]
                       })
      end
 
      desc "Update a status."
      # 200 ok (true)
      # 500 error
      params do
        requires :id, type: String, desc: "Status ID."
        requires :title, type: String, desc: "Your status."
        requires :context, type: String, desc: "Your status."
      end
      put ':id' do
=begin rdoc
        authenticate!
        current_user.statuses.find(params[:id]).update({
                                                           user: current_user,
                                                           text: params[:status]
                                                       })
=end
        Comment.find(params[:id]).update({
                                            title: params[:title],
                                            context: params[:context]
                                         })
      end
 
      desc "Delete a status."
      # 200 ok (json)
      params do
        requires :id, type: String, desc: "Status ID."
      end
      delete ':id' do
=begin rdoc
        authenticate!
        current_user.statuses.find(params[:id]).destroy
=end
        Comment.find(params[:id]).destroy
      end
    end
  end
end

