class Producer
  def self.call(*payload)
    puts "Produce: #{payload}"
  end
end
