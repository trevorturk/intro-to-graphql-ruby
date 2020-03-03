module Types
  class QueryType < Types::BaseObject
    field :posts, [Types::PostType], null: true, description: "All published Posts"

    def posts
      Post.published.all
    end

    field :post, Types::PostType, null: true do
      argument :id, ID, required: true
    end

    # missing a loader...
    def post(id:)
      Post.published.find_by_id(id)
    end

    field :authors, [Types::AuthorType], null: true, description: "All Authors"

    def authors
      Author.all
    end
  end
end
