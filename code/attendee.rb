class Attendee
  def initialize(height)
    @height = height
    @pass_id = nil
  end

  attr_reader :height, :pass_id

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  def has_pass?
    !@pass_id.nil?
  end

  def fits_ride?(ride_minimum_height)
    @height >= ride_minimum_height
  end

  def allowed_to_ride?(ride_minimum_height)
    has_pass? && fits_ride?(ride_minimum_height)
  end
end

if __FILE__ == $0
  attendee = Attendee.new(180)
  puts "Height: #{attendee.height}"
  attendee.issue_pass!(42)
  puts "Pass ID: #{attendee.pass_id}"
  attendee.revoke_pass!
  puts "Pass Id: #{attendee.pass_id}"

  puts "Has Pass: #{attendee.has_pass?}"
  attendee.issue_pass!(42)
  puts "Has Pass: #{attendee.has_pass?}"

  puts "Height Met: #{attendee.fits_ride?(100)}"
  puts "Height not Met: #{attendee.fits_ride?(200)}"

  attendee.revoke_pass!
  puts "Not allowed to ride: #{attendee.allowed_to_ride?(200)}"
  attendee.issue_pass!(10)
  puts "Not allowed to ride: #{attendee.allowed_to_ride?(200)}"
  puts "Allowed to ride: #{attendee.allowed_to_ride?(150)}"
end
