module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :posts, [Types::PostType], null: true

    # missing a loader...
    def posts
      if context[:current_user] == object
        object.posts.all
      else
        object.posts.published.all
      end
    end

    field :paginated_posts, PostType.connection_type, null: true

    def paginated_posts
      object.posts
    end
  end
end
