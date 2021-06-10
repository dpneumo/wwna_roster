class Person::MakePrefUnique < ApplicationQuery
	def initialize(model)
		@model = model
	end

  def call
  	klass
  	  .where('person_id = ? and not id = ?', person_id, pref_model_id)
  	  .update_all(preferred: false, updated_at: DateTime.now)
  end

  private
	  def person_id
	    @model.person_id
	  end

	  def pref_model_id
	    @model.id
	  end

	  def klass
	    @model.class
	  end
end