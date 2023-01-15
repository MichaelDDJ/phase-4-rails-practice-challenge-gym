class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :membership_total

  has_many :memberships

  def membership_total
    self.object.memberships.length
  end
end
