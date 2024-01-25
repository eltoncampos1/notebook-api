class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind, optional: true do
    link(:kind) {kind_url(object.kind.id)}
  end
  has_many :phones
  has_one :address

  link(:self) {contact_url(object.id)}
  link(:kind) {kind_url(object.kind.id)}

  meta do
    {author: "eltoncampos1"}
  end

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = h[:birthdate].to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
