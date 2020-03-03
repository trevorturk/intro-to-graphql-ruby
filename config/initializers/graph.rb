require "graphql/client"
require "graphql/client/http"

module Graph
  begin
    HTTP = GraphQL::Client::HTTP.new("http://localhost:3000/graphql")
    Schema = GraphQL::Client.load_schema(HTTP)
    Client = GraphQL::Client.new(schema: Schema, execute: HTTP)

    PostsQuery = Client.parse <<-'GRAPHQL'
      query {
        posts {
          title
        }
      }
    GRAPHQL

    PostQuery = Client.parse <<-'GRAPHQL'
      query($id: ID!) {
        post(id: $id) {
          title
        }
      }
    GRAPHQL
  rescue
  end
end

# result = Graph::Client.query(Graph::PostsQuery)
# result = Graph::Client.query(Graph::PostQuery, variables: {id: "1"})
