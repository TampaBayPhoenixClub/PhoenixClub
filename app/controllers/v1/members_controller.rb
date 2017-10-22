class V1::MembersController < ApplicationController
  def show
    if @members.present?
      render :show, formats: [:json], status: :ok, location: nil
    else
      render json: @members.errors, status: :not_found
    end
  end

  def members
    result = Schema.execute params[:query]
    render json: result
  end

  def member_search
    query = params['query']
    Member.search(query)
  end

  def update
    if @member.update_attributes(item_params)
      render :show, formats: [:json], status: :ok, location: nil
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def create
    @member = Member.new(item_params)

    if @member.save
      render :item, formats: [:json], status: :created, location: nil
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def create_visit
    if @member.visits << Visit.new(visit_params)
      render :visit, formats: [:json], status: :created, location: nil
    else
      render json: @member.errors, status: :unprocessable_entity
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
    params.require(:visit).permit(:id, :code, :sponsor_id)
  end
end
