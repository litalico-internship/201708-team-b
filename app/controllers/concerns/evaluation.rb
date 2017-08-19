module Evaluation
  def self.evaluation(value)
    value >= 7
    if value >= 7
      return true
    end
    return false
  end

  # 今後の拡張次第では使用の可能性あり

  def self.verification(value)
    value.each do |key, val|
      if key.to_i == 65 && val <= 8
        return false
      elsif key.to_i == 67 && val <= 8
        return false
      elsif key.to_i >= 43 && val <= 2
        return false
      end
    end
    return true
  end


end