module Types
  class PostType < Types::BaseObject
    field :id, ID, null: true

    def id
      if context[:current_user] == object.author
        object.id
      end
    end

    field :title, String, null: true
    field :published, Boolean, null: true
    field :author, Types::AuthorType, null: true, complexity: 10

    def author
      Loaders::RecordLoader.for(Author).load(object.author_id)
    end
  end
end
