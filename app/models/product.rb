# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  price       :decimal(8, 2)
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  default_scope :order=>'title'
  validates :title, :presence => true, :length => {:maximum => 50}
  validates :description, :presence => true, :length => {:maximum => 1000}
  validates :image_url, :format => {:with=>/.(gif|jpg|png)/, :message => 'must be a URL for Gif, Jpg or PNG image.'}
  validates :price, :numericality =>{:greater_than_or_equal_to => 0.1}
end
