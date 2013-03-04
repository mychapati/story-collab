class NotificationMailer < ActionMailer::Base
  default from: "ensemble@cs.stanford.edu"

  ### MOD EMAILS ###
  #
  # Sends you an email when a user makes a comment on a
  # story you are moderating.
  def mod_comment_notification(user, other, comment)
    @user = user
    @other = other
    @comment = comment
    mail(:to => user.email, :subject => "#{other.name} made a comment on your story at Ensemble")
  end

  # Sends you an email when a user contributes to a scene on
  # a story you are moderating.
  def mod_paragraph_notification(user, other, paragraph)
    @user = user
    @other = other
    @para = paragraph
    mail(:to => user.email, :subject => "#{other.name} wrote for a scene in your story at Ensemble")
  end

  # Sends you an email when a user updates a paragraph
  # they wrote in a story you are moderating.
  def mod_update_paragraph_notification(user, other, paragraph)
    @user = user
    @other = other
    @para = paragraph
    mail(:to => user.email, :subject => "#{other.name} edited their paragraph in your story at Ensemble")
  end

  # Sends you an email when a user likes a paragraph
  # in a story you are moderating.
  def mod_like_notification(user, other, paragraph)
    @user = user
    @other = other
    @para = paragraph
    mail(:to => user.email, :subject => "#{other.name} liked a paragraph in your story at Ensemble")
  end

  # Sends you an email when a paragraph is marked as a winner
  # in a story you are moderating.
  def mod_winner_notification(user, other, paragraph)
    @user = user
    @other = other
    @para = paragraph
    mail(:to => user.email, :subject => "A paragraph was marked as a winner in your story at Ensemble")
  end

  ### PARTICIPANT EMAILS ###
  #
  # Sends you an email when a user comments on a scene
  # you commented on.
  def comment_notification(user, other, comment)
    @user = user
    @other = other
    @comment = comment
    mail(:to => user.email, :subject => "#{other.name} replied to your comment on Ensemble")
  end

  # Sends you an email when a user comments on a scene you
  # contributed to.
  def comment_para_notification(user, other, comment)
    @user = user
    @other = other
    @comment = comment
    mail(:to => user.email, :subject => "#{other.name} commented on a scene you wrote for on Ensemble")
  end

  # Sends you an email when a user contributes to a scene
  # you commented on or contributed to.
  def paragraph_notification(user, other, paragraph)
    @user = user
    @other = other
    @para = paragraph
    mail(:to => user.email, :subject => "#{other.name} wrote for a scene you commented on at Ensemble")
  end

  # Sends you an email when another user edits a paragraph
  # that you wrote.
  def update_paragraph_notification(user, other, paragraph)
    @user = user
    @other = other
    @para = paragraph
    mail(:to => user.email, :subject => "#{other.name} made edits to a paragraph you wrote on Ensemble")
  end

  # Sends you an email when a user updates a scene
  # that you commented on.
  def update_scene_notification(user, other, scene)
    @user = user
    @other = other
    @scene = scene
    mail(:to => user.email, :subject => "#{other.name} made edits to a scene you commented on at Ensemble")
  end

  # Sends you an email when a user updates a scene
  # that you contributed to.
  def update_scene_para_notification(user, other, scene)
    @user = user
    @other = other
    @scene = scene
    mail(:to => user.email, :subject => "#{other.name} made edits to a scene you wrote a paragraph for on Ensemble")
  end

  # Sends you an email when a user likes a paragraph you
  # wrote.
  def like_notification(user, other, paragraph)
    @user = user
    @other = other
    @para = paragraph
    mail(:to => user.email, :subject => "#{other.name} liked your paragraph on Ensemble")
  end

  # Sends you an email when a paragraph you wrote is
  # marked as a winner.
  def winner_notification(user, paragraph)
    @user = user
    @para = paragraph
    mail(:to => user.email, :subject => "Your paragraph was crowned a winner on Ensemble")
  end
end
