require('pry')

class Volunteer

attr_reader(:name, :id, :project_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @project_id = attributes.fetch(:project_id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id")
      id = volunteer.fetch("id").to_i()
      volunteers.push({:name => name, :id => id, :project_id => project_id})
      end
    end
    volunteers
  end

  def save
    DB.exec("INSERT INTO volunteers (name) VALUES ('#{@volunteer_name}');")
  end

  def ==(another_list)
    self.name().==(another_list.name()).&(self.id().==(another_list.id())).&(self.project_id().==(another_list.project_id()))
  end

end
