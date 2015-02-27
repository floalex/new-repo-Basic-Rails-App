class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

  def update?
    user.admin? || user.moderator? or not post.published?
  end
  
  def index?
    true
  end
end
