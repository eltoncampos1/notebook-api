class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones

  def as_json(opts={}) 
    hash = super(opts)
    hash[:birthdate] = (I18n.l self.birthdate) unless self.birthdate.blank?
    hash
  end
end
