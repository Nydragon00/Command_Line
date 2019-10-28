puts "Enter the radius"
r = gets

r = r.to_f
r = r*r

print "diameter: "
puts r*Math::PI

print "perimeter: "
puts 2*r*Math::PI
