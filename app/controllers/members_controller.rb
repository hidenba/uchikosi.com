class MembersController < ApplicationController
  before_filter :authenticate_user_account!
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params[:member].merge(user_account: current_user_account))
    if @member.save
      redirect_to members_path
    end
  end

  def destroy
    Member.find(params[:id]).remove
    redirect_to :back
  end
end
