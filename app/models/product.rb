class Product < ActiveRecord::Base
  default_scope :order=>'title'
  validates :title, :presence => true, :length => {:maximum => 50}
  validates :description, :presence => true, :length => {:maximum => 1000}
  validates :image_url, :format => {:with => %r{\.gif|jpg|png%}i, :message => 'must be a URL for Gif, Jpg or PNG image.'}
  validates :price, :numericality =>{:greater_than_or_equal_to => 0.1}
end
