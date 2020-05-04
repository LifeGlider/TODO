class TaskValidator < ActiveModel::Validator
  def validate(record)
    tasks = Task.all
    tasks.each do |task|
      if record.todo.downcase.delete(' ') == task.todo.downcase.delete(' ')
        record.errors.add(:todo, "Such task already exists!")
      end
    end
  end
end
