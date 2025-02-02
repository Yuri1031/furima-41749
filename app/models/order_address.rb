class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area, :num_of_address, :building, :phone_num, :prefecture_id, :token, :order_id

  validates :postcode, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :phone_num, presence: true, numericality: { only_integer: true },
                        length: { in: 10..11, message: 'must be 10 to 11 digits and only numbers allowed.' }
  validates :area, presence: true
  validates :num_of_address, presence: true
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, area: area,
                   num_of_address: num_of_address, building: building, phone_num: phone_num, order_id: order.id)
  end
end
