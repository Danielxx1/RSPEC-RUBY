class EnemiesController < ApplicationController
  before_action :set_enemy , only: [:update, :destroy, :show]
  
  def index
    @enemies = Enemy.all
    render json: @enemies
  end

  def show
    render json: @enemy
  end

  def create
    @enemy = Enemy.create(enemy_params)
    render json: @enemy, status: :created
  end
  def update
    if @enemy.update(enemy_params)
      render json: @enemy, status: :ok
    else
      render json: { errors: @enemy.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @enemy.destroy
    head 204
  end


  private

  def enemy_params
    params.require(:enemy).permit(:name, :power_base, :power_step, :level, :kind)
  end

  def set_enemy
    @enemy = Enemy.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :not_found
  end
end
