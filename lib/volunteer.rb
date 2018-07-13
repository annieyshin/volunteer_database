require('pry')

class Volunteer

attr_writer(:name)

  def initialize(attributes)
    @name = attributes.fetch(:name)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      volunteer_id = volunteer.fetch("volunteer_id").to_i()
      unless volunteer == nil
        volunteers.push({:name => volunteer_name, :id => volunteer_id})
      end
    end
    volunteers
  end

  def save
    DB.exec("INSERT INTO volunteers (name) VALUES ('#{@volunteer_name}');")
  end

  def ==(another_list)
    self.volunteer_name().==(another_list.volunteer_name()).&(self.volunteer_id().==(another_list.volunteer_id()))
  end

end
