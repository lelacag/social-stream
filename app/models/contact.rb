class Contact
  include Validatable
  attr_accessor :email
  attr_accessor :name
  attr_accessor :subject

  # validates :email, :name, :message, presence: true

  # validates_format_of     :email,
  #                         :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
  #                         :message    => 'email must be valid'

  def initialize(params = {})
    self.email = params[:email]
    self.name = params[:name]
    self.subject = params[:subject]
  end
end
