class Unit < ActiveRecord::Base
  has_many :definitions, :dependent => :destroy
  validates :name,:alias, presence: true

  alias_attribute :short_name, :alias

  # Static method gets the base unit and then
  # Determines which definition should be used
  # And return the hash that includes unit and the number
  def self.convert(params)
    base_unit = find_base_unit(params)
    calculator = Dentaku::Calculator.new
    results = base_unit.definitions.inject({}) do |results,definition|
      calculator.store("#{base_unit.alias.downcase}": params["#{base_unit.name}"])
      result = calculator.evaluate(definition.formula.downcase)
      results[definition.converted_to.name.to_sym] = result
      results
    end
    results[base_unit.name.to_sym] = params[base_unit.name]
    results
  end
  # Static method gets the base unit
  def self.find_base_unit(params)
    all.each do |unit|
      break find_by_name(unit.name) if params[unit.name] != ''
    end
  end
end
