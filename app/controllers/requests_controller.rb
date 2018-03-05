class RequestsController < ApplicationController
  before_action :find_request, except: [:new, :create, :index]

  def new
    @request_user = Request.new
  end

  def create
    request_user = current_user.requests.new request_params

    if request_user.save
      flash[:success] = t "controllers.requests.create.success"
      redirect_to root_url
    else
      flash[:danger] = t "controllers.requests.create.form_fail"
      redirect_to request.referrer
    end
  end

  def index
    @requests = Request.all.order(:topic).page(params[:page]).per Settings.show_limit.requests
  end

  def edit
  end

  def update
    if @request.update_attributes request_params
      flash[:success] = t "controllers.requests.update.success"
      redirect_to root_path
    else
      flash[:danger] = t "controllers.requests.update.danger"
      render :edit
    end
  end

  def show
  end

  private

  def request_params
    params.require :request .permit :topic, :content, :header, :bill
  end

  def find_request
    @request = Request.find_by id: params[:id]

    return if @request
    flash[:danger] = t "controllers.requests.get_request.not_found"
    redirect_to root_url
  end

end
