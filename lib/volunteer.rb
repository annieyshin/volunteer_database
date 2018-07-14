require("pry")

class Volunteer

attr_reader(:name, :id, :project_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @project_id = attributes.fetch(:project_id)
  end

  def name
    @name
  end

  def project_id
    @project_id
  end



  # def actors
  #   volunteer_name_return = []
  #   results = DB.exec("SELECT name FROM volunteers WHERE project_id = #{self.id()};")
  #
  # end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i()
      id = volunteer.fetch("id").to_i()
      volunteers.push({:name => name, :id => id, :project_id => project_id})
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(new_volunteer)
    self.name.==(new_volunteer.name)
  end

  def self.find(id)
    return_list = nil
    Volunteer.all().each() do |volunteer|
      if volunteer.id().==(id)
        return_list = volunteer
      end
    end
    return_list
  end

end
