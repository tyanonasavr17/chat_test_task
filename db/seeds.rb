# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

chats = Chat.create([
                      { name: "Чат 1" },
                      { name: "Чат 2" },
                      { name: "Чат 3" }
                    ])

chats.each do |chat|
  chat.messages.create([
                         { content: "Cообщение 1" },
                         { content: "Cообщение 2" },
                         { content: "Cообщение 3" }
                       ])
end