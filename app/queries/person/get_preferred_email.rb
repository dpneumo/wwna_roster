# frozen_string_literal: true

class Person
  class GetPreferredEmail < ApplicationQuery
    def initialize(person_id)
      @person_id = person_id
      super()
    end

    def call
      Email.where(person_id: @person_id, preferred: true).first
    end
  end
end
