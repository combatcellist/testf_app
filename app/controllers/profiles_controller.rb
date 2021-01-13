class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only: [:show, :edit, :update, :destroy]

  def show
    
  end

  def new
    return redirect_to edit_profile_path(current_user.profile) if current_user.profile.present?
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to root_path, notice: "プロフィールの登録が完了しました"
    else
      render :new
    end
  end

  def update
    if @profile.uodate(profile_params)
      redirect_to root_path, notice: "プロフィールが更新されました"
    end
  end

  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :purpose, :image)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
