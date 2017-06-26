class Department
  include Mongoid::Document
  include Mongoid::Slug
  include Concerns::Descriptable
  include Concerns::Rankable
  include Concerns::Subscribable
  include Concerns::Collaboratable

  slug :name
end