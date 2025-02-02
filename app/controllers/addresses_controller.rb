class AddressesController < ApplicationController
  def new
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    Address.create(address_params)
    redirect_to action: :index
  end

  private

  def address_params
    params.require(:address).permit(:postcode, :area, :num_of_address, :building, :phone_num, :prefecture_id)
  end
end
