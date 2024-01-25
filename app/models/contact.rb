class Contact < ApplicationRecord
  belongs_to :kind, optional: true

  def to_br 
    {
      id: self.id,
      name: self.name,
      birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?),
    }
  end
end
