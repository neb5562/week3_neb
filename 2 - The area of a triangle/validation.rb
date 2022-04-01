class Validation
  def initialize
    @validations = []
  end

  def validate_float(number, name)
    if (number.is_a? Numeric) == false
      @validations.push("#{name} must be numeric!")
    end
  end

  def validate_presence_of(value, name)
    if value.to_s.empty? == true
      @validations.push("you must enter #{name}!")
    end
  end

  def check_all_validations
    if @validations.empty? == false
      @validations.each do |message|
        puts message
      end
      exit 1
    end
  end
end
