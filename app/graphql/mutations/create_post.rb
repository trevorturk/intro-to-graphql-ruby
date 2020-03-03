module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType, null: true
    field :errors, [Types::ErrorType], null: true

    argument :title, String, required: true

    def resolve(title:)
      raise GraphQL::ExecutionError, "not logged in" if context[:current_user]

      post = context[:current_user].posts.create(title: title)

      if post.valid?
        {
          post: post,
          errors: nil
        }
      else
        {
          post: nil,
          errors: post.errors.map do |attr, message|
            OpenStruct.new(message: "#{attr} #{message}")
          end
        }
      end
    end
  end
end
