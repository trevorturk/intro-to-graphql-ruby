author_1 = Author.create! name: "John", auth_token: "john_token"
author_2 = Author.create! name: "Jane", auth_token: "jane_token"
author_1.posts.create!(title: "John's post", published: true)
author_2.posts.create!(title: "Jane's post", published: true)
author_2.posts.create!(title: "Jane's draft post", published: false)
