class Paragraph < ActiveRecord::Base
  belongs_to :user
  belongs_to :scene, :touch => true
  acts_as_list :scope => :scene
  attr_accessible :content, :position, :title, :scene_id
  validates :content, :presence => true, :if => lambda {|p| p.user != p.scene.story.user}
  has_paper_trail :only => [:content], :meta => {:scene_id => :scene_id}
  acts_as_votable
  is_impressionable

  scope :by_oldest_to_newest, -> {
    reorder("created_at ASC")
  }

  scope :by_newest_to_oldest, -> {
    reorder("created_at DESC")
  }

  scope :by_author, -> {
    joins(:user).reorder("users.name ASC")
  }

  before_destroy :paragraph_cleanup

  def set_as_winner
    self.scene.winner_id = self.id
    self.scene.save
  end

  def unset_as_winner
    self.scene.winner_id = nil
    self.scene.save
  end

  def is_winner?
    self.scene.winner_id == self.id
  end

  def word_count
    if self.content.nil?
      0
    else
      self.content.split.size
    end
  end

  # Checks if the deleted paragraph is a winner,
  # and if so, removes the winning id from the scene.
  def paragraph_cleanup
    if self.scene.winner_id == self.id
      self.scene.winner_id = nil
      self.scene.save
    end
  end
end
