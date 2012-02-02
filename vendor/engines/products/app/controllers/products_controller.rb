class ProductsController < ApplicationController

  before_filter :find_all_products
  before_filter :find_page

  def index
    @title = "Products"
    
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end
  
  def category
    @title = params[:category].to_s.split('-').each{|word| word.capitalize!}.join(' ')
    @products = Product.order('position ASC')
                       .where(:category => Product_Categories[params[:category]
                       .split('-').each{|word| word.capitalize!}.join('_').to_sym])
                       .paginate(:page => params[:page], :per_page => 9)
    
    @page = Page.where(:link_url =>  "/products/category/#{params[:category]}").first
    
    render 'index'
  end
  
  def clearance
    @title = "Clearance"
    @products = Product.order('position ASC')
                       .where("clearance_price IS NOT NULL AND clearance_price > 0")
                       .paginate(:page => params[:page], :per_page => 9)
    
    @page = Page.where(:link_url => "/products/category/clearance").first
    
    render 'index'
  end

  def show
    @product = Product.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end

protected

  def find_all_products
    @products = Product.order('position ASC').paginate(:page => params[:page], :per_page => 9)
  end

  def find_page
    @page = Page.where(:link_url => "/products").first
  end

end
