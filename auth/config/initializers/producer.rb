#@@producer = 

class Producer
  def self.call(payload, topic:)
    puts "Producing to #{topic} with payload: #{payload}"
    self.producer.produce_async(payload: payload, topic: topic)
  end

  def self.producer
    WaterDrop::Producer.new do |config|
      config.deliver = true
      config.kafka = {
        'bootstrap.servers': 'localhost:9092',
        'request.required.acks': 1
      }
    end
  end
end
