class UsersController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    users_scope = User.all.includes(:bio)
    users_scope = users_scope.like(params[:filter]) if params[:filter]
    # @users = smart_listing_create :users, users_scope, partial: "users/list", page_sizes: [5, 7, 13, 26]
    @users = smart_listing_create(:users, users_scope, partial: 'users/list',
                                   sort_attributes: [
                                    [:name, 'name'],
                                    [:surname, 'surname'],
                                    [:email, 'email'],
                                    [:city, 'bio.city'],
                                    [:birthday, 'bio.birthday']
                                   ],
                                   default_sort: { start_at: 'desc' }
                                   )
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  def delete
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email)
  end
end
