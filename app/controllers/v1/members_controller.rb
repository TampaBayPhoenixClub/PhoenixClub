class V1::MembersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_member

  def query
    result = Schema.execute params[:query]
    render json: result
  end

  def update
    if @member.update_attributes(member_params)
      render json: @member, status: :ok, location: nil
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member, status: :created, location: nil
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def create_visit
    @visit = @member.visits.build(visit_params)
    if @visit.save
      render json: @visit, status: :created, location: nil
    else
      render json: @visit.errors, status: :unprocessable_entity
    end
  end

  private

  def set_member
    @member =  Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:id, :first_name, :last_name, :scene_name, :join_date, :renewal_date, :status, visit_params: [:code, :sponsor_id])
  end

  def visit_params
    params.require(:visit).permit(:id, :code)
  end
end
