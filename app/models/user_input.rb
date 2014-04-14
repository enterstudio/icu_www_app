class UserInput < ActiveRecord::Base
  include Journalable
  journalize %w[label type], "/admin/user_inputs/%d"

  belongs_to :fee

  TYPES = %w[Option Amount Text].map{ |t| "UserInput::#{t}" }

  validates :type, inclusion: { in: TYPES }
  validates :label, presence: true
  validates :max_length, numericality: { integer_only: true, greater_than: 0, less_than_or_equal: 140 }, allow_nil: true

  def subtype
    Fee.subtype(type.presence || self.class.to_s)
  end

  def self.subtype(type)
    type.to_s.split("::").last.downcase
  end

  # This method is used to signal which extra attributes are used by each STI class.
  # Override in the subclass if it uses any attributes other than the basic :type and :label.
  def self.extras; []; end
end
