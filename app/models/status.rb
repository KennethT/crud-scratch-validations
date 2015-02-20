class Status < ActiveRecord::Base


  def index
    @status = Status.all
  end

  def show
    @status = Status.find(params[:id])
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if @status.update(status_params)
      redirect_to @status
    else
      render:edit
    end
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to statuss_path, notice: 'Status was successfully created.'
    else
      render:new
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to status_path
  end

  private
  def status_status
    @statuses = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:status, :status, :like)
  end



end