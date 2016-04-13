class ReviewsController < ApplicationController
  before_action :authenticate_user! , only: [:edit, :update, :destroy]
  before_action :set_review, only: [:edit, :update, :show]
  before_action :set_product, only: [:new, :destroy]

  def index
  end

  def new
    @review = set_product.reviews.new
  end

  def create
    @review = Review.new(review_params)
    @product = Product.find(@review.product_id)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to @product, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @product, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
      @product = Product.find(@review.product_id)
      @user = User.find(@review.user_id)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :description, :product_id, :user_id)
    end
end
