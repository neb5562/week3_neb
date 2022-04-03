class Validation
  def initialize
    @validations = []
  end

  def validate_type(value, type, name)
    Class.send(type.to_s, value) rescue @validations.push("#{name} must be #{type}!")
  end

  def validate_presence(value, name)
    @validations.push("you must enter #{name}!") if value.to_s.empty? 
  end

  def validate_range(value, range_start, range_end)
    first_check = value >= range_start
    second_check = value <= range_end
    @validations.push("#{value} must be greater or equal to #{range_start}!") if !first_check
    @validations.push("#{value} must be less or equal to #{range_end}!") if !second_check
  end

  def check_all_validations
    if @validations.empty? == false
      puts "\e[41mYou have validation errors!\e[0m"
      @validations.each do |message|
        puts "\e[31m#{message}\e[0m"
      end
      exit 1
    end
  end
end
