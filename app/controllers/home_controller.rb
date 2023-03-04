class HomeController < ApplicationController
  def schedules
	  @people = Person.all.order('name ASC')
    @kinds = Person.kinds.keys
  end

  def welcome
  end

  def student_panel
  end
end
