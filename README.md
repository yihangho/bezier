# Bézier
A Ruby library to draw Bézier curves.

# Quick Start

```ruby
require 'bezier'

p0 = Bezier::Point.new(20, 20)
p1 = Bezier::Point.new(20, 100)
p2 = Bezier::Point.new(200, 100)
p3 = Bezier::Point.new(200, 20)

bezier = Bezier::Bezier.new(p0, p1, p2, p3)
Bezier::Painter.new(bezier.run).save # Check Bézier.png
```

# Documentation
[RubyDoc](http://rubydoc.info/github/yihangho/bezier/master/frames)
