# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Dummy data for table Users
# => User(id: integer, email: string, encrypted_password: string, reset_password_token: string, reset_password_sent_at: datetime, remember_created_at: datetime, name: string, level: integer, created_at: datetime, updated_at: datetime)
#User.create(email: 'bandithijo@gmail.com', name: 'Rizqi Assyaufi', level: 1, password: 'bandithijo')
#User.create(email: 'budiman@gmail.com', name: 'Budiman', level: 0, password: 'budiman')

# Dummy data for table ForumThreads
# => ForumThread(id: integer, title: string, content: text, sticky_order: integer, user_id: integer, created_at: datetime, updated_at: datetime)
#ForumThread.create(title: 'Peraturan Forum', content: 'Adipisicing corporis quaerat eveniet dolorum quam blanditiis? Eligendi aliquam accusantium reprehenderit quisquam vero. Libero ipsa nihil autem quidem nobis Vitae quibusdam est distinctio distinctio dicta? Rerum minima quo beatae quibusdam', sticky_order: 1, user_id: 1)
#ForumThread.create(title: 'Buku Tamu', content: 'Ipsum consequatur tempora sit neque officiis? Aspernatur quibusdam quod dignissimos sint delectus Alias amet molestiae laboriosam nemo reiciendis? Dignissimos perspiciatis excepturi hic quidem veritatis Veritatis dignissimos totam ex minus ad!', sticky_order: 1, user_id: 1)
#ForumThread.create(title: 'Belajar Ruby on Rails', content: 'Learning to build a modern web application is daunting. Ruby on Rails makes it much easier and more fun. It includes everything you need to build fantastic applications, and you can learn it with the support of our large, friendly community.', sticky_order: 100, user_id: 2)

# Dummy data for table ForumPosts
# => ForumPost(id: integer, content: text, forum_thread_id: integer, user_id: integer, created_at: datetime, updated_at: datetime)
ForumPost.create(content: 'Ijin bergabung, gan!', forum_thread_id: 1, user_id: 2)
ForumPost.create(content: 'Selamat datang dan selamat bergabung, mas Bro!', forum_thread_id: 1, user_id: 1)
ForumPost.create(content: 'Terima kasih, gan.', forum_thread_id: 1, user_id: 2)
ForumPost.create(content: 'Perkenalkan, nama saya Budiman. Asal dari kota Balikpapan.', forum_thread_id: 2, user_id: 2)
ForumPost.create(content: 'Wah, Ruby on Rails sepertinya menarik juga untuk dipelajari nih.', forum_thread_id: 3, user_id: 2)
ForumPost.create(content: 'Yoi gan! Saya jug abaru belajar nih.', forum_thread_id: 3, user_id: 1)
