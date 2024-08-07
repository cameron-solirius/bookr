# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

Book.create([
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    stars: 5.0,
    finished: true,
    thoughts: "Still amazed by Atticus Finch. If only my lawyer were this cool!",
    finishedDate: Date.new(2024, 1, 15)
  },
  {
    title: "1984",
    author: "George Orwell",
    stars: 4.5,
    finished: true,
    thoughts: "Big Brother is watching! And I thought my boss was bad.",
    finishedDate: Date.new(2024, 2, 20)
  },
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    finished: false
  },
  {
    title: "The Catcher in the Rye",
    author: "J.D. Salinger",
    stars: 3.5,
    finished: true,
    thoughts: "Holden Caulfield is my spirit animal. If I had a dollar for every time I felt like him...",
    finishedDate: Date.new(2024, 3, 10)
  },
  {
    title: "Pride and Prejudice",
    author: "Jane Austen",
    stars: 5.0,
    finished: true,
    thoughts: "Mr. Darcy, where art thou? If only love were always this witty and complicated.",
    finishedDate: Date.new(2024, 4, 5)
  },
  {
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    stars: 4.8,
    finished: true,
    thoughts: "Off to the Shire again! Why can’t my vacations be this adventurous?",
    finishedDate: Date.new(2024, 5, 12)
  },
  {
    title: "Moby-Dick",
    author: "Herman Melville",
    finished: false
  },
  {
    title: "War and Peace",
    author: "Leo Tolstoy",
    stars: 5.0,
    finished: true,
    thoughts: "Worth every page. Who knew Russia could be this dramatic?",
    finishedDate: Date.new(2024, 6, 22)
  },
  {
    title: "The Odyssey",
    author: "Homer",
    stars: 4.5,
    finished: true,
    thoughts: "Odysseus, you tricky man! I can barely navigate my commute, let alone the Mediterranean.",
    finishedDate: Date.new(2024, 7, 1)
  },
  {
    title: "Crime and Punishment",
    author: "Fyodor Dostoevsky",
    stars: 4.7,
    finished: true,
    thoughts: "Raskolnikov's mind is a maze. If only my guilt trips were this philosophical.",
    finishedDate: Date.new(2024, 8, 3)
  },
  {
    title: "The Divine Comedy",
    author: "Dante Alighieri",
    stars: 4.9,
    finished: true,
    thoughts: "Hell has some interesting neighbors. And I thought my apartment complex was bad!",
    finishedDate: Date.new(2024, 9, 15)
  },
  {
    title: "Jane Eyre",
    author: "Charlotte Brontë",
    stars: 4.3,
    finished: true,
    thoughts: "Gothic romance at its best. I wouldn't mind a mysterious attic or two in my love life.",
    finishedDate: Date.new(2024, 10, 18)
  },
  {
    title: "Brave New World",
    author: "Aldous Huxley",
    finished: false
  },
  {
    title: "The Alchemist",
    author: "Paulo Coelho",
    stars: 4.4,
    finished: true,
    thoughts: "Follow your dreams! But maybe not through the desert, unless you’re really committed.",
    finishedDate: Date.new(2024, 11, 12)
  },
  {
    title: "Les Misérables",
    author: "Victor Hugo",
    stars: 4.6,
    finished: true,
    thoughts: "Jean Valjean, what a hero! And here I am, struggling to get out of bed.",
    finishedDate: Date.new(2024, 12, 8)
  },
  {
    title: "Harry Potter and the Sorcerer's Stone",
    author: "J.K. Rowling",
    stars: 5.0,
    finished: true,
    thoughts: "Expecto Patronum! If only I could magic away my chores.",
    finishedDate: Date.new(2024, 5, 20)
  },
  {
    title: "The Lord of the Rings",
    author: "J.R.R. Tolkien",
    stars: 5.0,
    finished: true,
    thoughts: "One does not simply put this book down. Seriously, I tried.",
    finishedDate: Date.new(2024, 6, 15)
  },
  {
    title: "The Hitchhiker's Guide to the Galaxy",
    author: "Douglas Adams",
    stars: 4.8,
    finished: true,
    thoughts: "42 is the answer to everything. Including why my socks disappear.",
    finishedDate: Date.new(2024, 7, 7)
  },
  {
    title: "The Da Vinci Code",
    author: "Dan Brown",
    finished: false
  },
  {
    title: "To the Lighthouse",
    author: "Virginia Woolf",
    stars: 4.2,
    finished: true,
    thoughts: "Stream of consciousness at its finest. Makes my daily thoughts seem so mundane.",
    finishedDate: Date.new(2024, 8, 15)
  }
])
