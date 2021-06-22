# app/views/api/v1/comments/show.json.jbuilder
json.extract! @comment, :id, :user_id, :restaurant_id, :content, :rating
