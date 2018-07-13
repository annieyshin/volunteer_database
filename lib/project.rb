require("pry")
class Project

attr_writer(:project_title)

  def initialize(attributes)
    @project_title = attributes.fetch(:project_title)
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM project;")
    projects = []
    returned_projects.each() do |project|
      project_title = project.fetch("title")
      project_id = project.fetch("id").to_i()
      unless name == nil
        projects.push({:project_title => project_title, :id => project_id})
      end
    end
    projects
  end

  def save
    DB.exec("INSERT INTO project (name) VALUES ('#{@project_title}');")
  end

  def title
    DB.exec("SELECT * FROM projects WHERE title = ('#{@project_title}') ")

  end

  # def update
  #   DB.exec("UPDATE project SET name = ('#{@project_name}') WHERE id = ('#{@project_id}');")
  # end
  #
  # def delete
  #   DB.exec("DELETE FROM project WHERE name = ('#{@project_name}');")
  # end

  # def self.sort
  #   returned_sorted_lists = DB.exec("SELECT * FROM tasks ORDER BY due_date;")
  #   @lists = []
  #   returned_sorted_lists.each() do |list|
  #     description = list.fetch("description")
  #     list_id = list.fetch("list_id").to_i()
  #     due_date = list.fetch("due_date")
  #     @lists.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date}))
  #   end
  #   @lists
  # end

end
