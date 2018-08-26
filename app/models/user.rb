class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_many :moms
  has_many :likes
  
  has_many :boards
 
   acts_as_voter
  has_many :cat_infos
  has_many :liked_cat_infos, through: :likes, source: :cat_info
  
  # 회원 가입과 동시에 newbie 권한 부여
  after_create :assign_default_role
  
  def assign_default_role
    add_role(:newbie)
  end
end
