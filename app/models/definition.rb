class Definition < ActiveRecord::Base
  belongs_to :unit
  belongs_to :converted_to , :class_name => 'Unit'

  validates :unit, :converted_to, :formula, presence: true
  validate :unit_and_converted_to_cannot_be_same
  validate :include_unit
  validates :unit_id, uniqueness: {scope: :converted_to}


  private
  def include_unit
    errors.add(:unit, 'full name or alias must be in the text') unless formula.include?(unit.name) or formula.include?(unit.alias)
  end

  def unit_and_converted_to_cannot_be_same
    errors.add(:unit, 'and converted to cannot be same') if unit == converted_to
  end




end
