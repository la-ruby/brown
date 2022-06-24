# frozen_string_literal: true

# My Properties
class Property < ApplicationRecord
  belongs_to :user

  def self.import(blob, user)
    blob['ReturnValue'].each do |item|
      existing = user.properties.where("blob->>'TransactionId' = ?", item['TransactionId'])
      if existing.count > 0
        existing.first.update(blob: item)
      else
        Property.create(
          user: user,
          blob: item
        )
      end
    end
  end
end
