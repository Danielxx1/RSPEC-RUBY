class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(weapon_params)
  end

  def destroy
    @weapon = Weapon.find(params[:id])
    @weapon.destroy
  end

  def show
    @weapon = Weapon.find(params[:id])
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :title, :description, :currentpower, :description, :power_base, :power_step, :level)
  end
end
