def initialize_lights(num)
  lights = {}
  1.upto(num) {|count| lights[count] = "off"}
  lights
end

def toggle_a_light(hash, key)
  if hash[key] == "off"
    hash[key] = "on"
  elsif hash[key] == "on"
    hash[key] = "off"
  end
end

def lights(num)
  all_lights = initialize_lights(num)
  (1..num).each do |number|
    0.step(num, number) {|stepper| toggle_a_light(all_lights, stepper)}
  end
  on_lights = all_lights.select {|_, v| v == "on"}.keys.join(", ")
  off_lights = all_lights.select {|_, v| v == "off"}.keys.join(", ")
  
  puts "These lights are on: #{on_lights}"
  puts "These lights are off: #{off_lights}"
end

p lights(5)
p lights(10)
p lights(1000)