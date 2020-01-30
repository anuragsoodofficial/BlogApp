class ArticlePolicy < ApplicationPolicy
  def update?
    record.user == user
  end

  def destroy?
    user.role == 'admin' || record.user == user
  end
end
