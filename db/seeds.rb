# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

# 追加のユーザーをまとめて生成する
30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# サンプルタスクリストの作成
5.times do |n|
  TaskList.create!(content: "list #{n+1}")
end

# サンプルタスクを追加-false
5.times do |n|
  number = rand(1..5)
  Task.create!(content: "false_test#{n}",
              status: false,
              task_list_id: number)
end
# サンプルタスクを追加-true
5.times do |n|
  number = rand(1..5)
  Task.create!(content: "true_test#{n}",
              status: true,
              task_list_id: number)
end

# サンプルコメントの作成(一番初めのユーザー用)
10.times do |n|
  task = rand(1..10)
  Comment.create!(content: "comment-#{n+1}",
                  user_id: 1,
                  task_id: task)
end

# サンプルコメントの作成(他ユーザー用)
10.times do |n|
  task = rand(1..10)
  user = rand(1..5)
  Comment.create!(content: "comment-#{n+1}",
                  user_id: user,
                  task_id: task)
end