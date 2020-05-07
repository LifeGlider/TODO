class TaskValidator < ActiveModel::Validator
  def validate(record)
    if Task.where("lower(replace(todo, ' ', '')) = lower(replace(?, ' ', ''))", record.todo).exists?
      record.errors.add(:todo, "such task already exists")
    end
  end
end
