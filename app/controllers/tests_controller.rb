class TestsController < ApplicationController

http_basic_authenticate_with name: "Nlegion", password: "9346", only: :destroy
 
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(set_params) 

    if @test.save
      redirect_to @test
    else
      render 'new'
    end
  end

  def show
    @test = Test.find(params[:id])
  end 

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
   
    if @test.update(test_params)
      redirect_to @test
    else
      render 'edit'
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to tests_path
  end

  private

  def set_params
    params.require(:test).permit(:name, :description)
  end

end