class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones

  accepts_nested_attributes_for :phones, allow_destroy: true

  def as_json(opts={}) 
    hash = super(opts)
    hash[:birthdate] = (I18n.l self.birthdate) unless self.birthdate.blank?
    hash
  end
end
