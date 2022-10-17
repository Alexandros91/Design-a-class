# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

```ruby
# EXAMPLE

class TrackList

  def initialize
    @list = []
  end

  def add(track)
    @list << track
  end

  def show_list
    @list
  end
end
```

## 3. Create Examples as Tests

```ruby
# EXAMPLE

# 1
my_list = TrackList.new
my_list.show_list => []

# 2
my_list = TrackList.new
my_list.add() => error 'You cannot add a track without a name'

# 3
my_list = TrackList.new
my_list.add("Moonchild") => ["Moonchild"]

# 4
my_list = TrackList.new
my_list.add("Moonchild", "Hero") => ["Moonchild", "Hero"]

# 5
my_list = TrackList.new
my_list.add("Toxic") 
my_list.add("Moonchild") => ["Toxic", "Moonchild"]

# 6
my_list = TrackList.new
my_list.add("Toxic") 
my_list.add("Toxic") => ["Toxic"]
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._