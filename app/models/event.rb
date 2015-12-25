class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.search(query)
    if query
      where('name LIKE ? AND starts_at > ?', "%#{query}%", Time.zone.now.beginning_of_day)
    else
      where("starts_at > ?", Time.zone.now.beginning_of_day)
    end
  end
end
