class PostsRelationship < ApplicationRecord
  belongs_to :original, class_name: "Post"
  belongs_to :comment, class_name: "Post"
end
