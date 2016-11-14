today = Date.today
two_days_ago = Date.today - 2.days
three_days_ago = Date.today - 3.days
dates = [today, two_days_ago, three_days_ago]
end_of_year = Date.new(Date.today.year,12,31)

User.destroy_all
TodoList.destroy_all

TodoList.create! list_name: "Tarefas da Escola", list_due_date: end_of_year
TodoList.create! list_name: "Lista de Compras", list_due_date: end_of_year
TodoList.create! list_name: "Lista de Ideias", list_due_date: end_of_year

TodoList.all.each do |list|
  list.todo_items.create! [
    { title: "Task 1", due_date: dates.sample, description: "very important task TEST", completed: false },
    { title: "Task 2", due_date: dates.sample, description: "do something else TEST", completed: true},
    { title: "Task 3", due_date: dates.sample, description: "learn Action Pack TEST", completed: true}
  ]
end

users = User.create! [
  { username: "demo", password: "demo" },
  { username: "jean", password: "nasan"}
]

TodoList.all.each do |list|
  list.user = users[1]
  list.save!
end
