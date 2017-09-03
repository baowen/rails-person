class Person < Flexirest::Base
  extend ActiveModel::Naming
  include ActiveModel::Conversion

#  attr_reader   :errors

  base_url Rails.application.config.api_server_url

  request_body_type :json

  verbose! if Rails.env == 'development'

  get :all, "/person"
  get :find, "/person/:id"
  put :save, "/person/:id"
  post :create, "/person"
  delete :remove, "/person/:id"

  # # Class method to create a new instance from a params hash
  # def self.from_params params
  #   person = self.new.tap do |p|
  #     p.id = 8
  #     p.firstName                     = params[:firstName] if params[:firstName]
  #     p.lastName                      = params[:lastName]
  #     p.email                         = params[:email]
  #   end
  #   person
  # end

  # def initialize
  #   @errors = ActiveModel::Errors.new(self)
  # end
  #
  # def validate!
  #   errors.add(:firstName, "can not be nil") if firstName == nil
  # end
  #
  # def read_attribute_for_validation(attr)
  #   send(attr)
  # end
  #
  # def Person.human_attribute_name(attr, options = {})
  #   attr
  # end
  #
  # def Person.lookup_ancestors
  #   [self]
  # end

  # def hash
  #   id.hash
  # end

  # is this a new record or one that we are editing
  def persisted?
    !id.blank?
  end

end
