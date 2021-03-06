class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # accepts_nested_attributes_for :messages



  has_many :received_messages, class_name: 'Message', foreign_key: :receiver_id
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                     default_url: "/system/images/noimg.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/



  has_paper_trail


  extend FriendlyId
  # friendly_id :first_name
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
  [[:first_name, :last_name]]
  end

  def should_generate_new_friendly_id?
      slug.blank? || first_name_changed? || last_name_changed?
  end
end
