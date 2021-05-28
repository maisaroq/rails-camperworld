class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    # scope.all -> everyone can acess the listing per default
    # scope.where -> only the argument(e.gg user) can acess the listing

    # listing polivy is centralised in this file, easier to manage bigger project
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true

  end


  def destroy?
    true
  end

end
