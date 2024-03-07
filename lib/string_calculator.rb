class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers.split("\n", 2).last
    end

    numbers = numbers.split(/#{delimiter}|\n/)
    negatives = numbers.select { |num| num.to_i.negative? }

    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(',')}"
    end

    numbers.map(&:to_i).inject(0, :+)
  end
end
