class Commit
  include Virtus::ValueObject

  attribute :commit_hash, String
  attribute :message, String
  attribute :author, String
  attribute :author_date, DateTime
  attribute :committer, String
  attribute :committer_date, DateTime

  attr_accessor :kategorie
end
