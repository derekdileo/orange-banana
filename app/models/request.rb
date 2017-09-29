class Request < ApplicationRecord
	validate :one_field_present
	validates :artist, length: { minimum: 2 }, allow_blank: true
	validates :title, length: { minimum: 2 }, allow_blank: true
	validates :comments, length: { minimum: 2 }, allow_blank: true

	private

	def one_field_present
	  if %w(artist title comments).all? { |attr| self[attr].blank? }
	    errors.add :base, 'Please fill in at least one field'
	    throw :abort
	  end
	end
end