class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @kittens }
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @kitten }
      format.json { render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash.notice = "Kitten successfully created"
      redirect_to @kitten
    else
      render :new
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash.notice = "Kitten successfully updated"
      redirect_to @kitten
    else
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash.notice = "Kitten successfully deleted"
    redirect_to :root
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
