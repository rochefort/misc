require 'mongo'

class Mongo::Cursor
  def peach
    self.each { |row| p row }
  end
end

def puts_title(title)
  puts
  puts title
end

conn = Mongo::Connection.new

puts_title '-- db list'
puts conn.database_names


puts_title '-- db info => [name, bytes]'
conn.database_info.each { |info| p info }


# select db
db = conn.db('sandbox')

# select collection
coll = db.collection('test_coll')
coll.drop

# insert
doc = { name: 'MongoDB', type: 'db', count: 1, info: {x: 203,  y:102} }
id = coll.insert(doc)

10.times { |i| coll.insert(i: i) }

puts_title 'first collection'
puts coll.find_one

puts_title 'list collections'
coll.find.peach

puts_title 'i fields == 7'
coll.find(i: 7).peach

puts_title 'sort'
coll.find.sort(:i).peach

puts_title 'compare'
# $gt, $lt, $gte, $gle
coll.find(i: {'$gt' => 5}).peach

puts_title 'select'
p id
coll.find({'_id' => id}, {:fields => ['name', 'type']}).peach

puts_title 'regexp'
coll.find({name: /^M/}).peach

puts_title 'dynamic regexp using constracter'
params = {search: 'DB'}
search_string = params[:search]
coll.find({name: Regexp.new(search_string)}).peach

puts_title 'dynamic regexp using literal'
coll.find({name: /#{search_string}/}).peach

puts_title('-- update')
puts 'before'
coll.find({_id: id}).peach

doc[:name] = 'MongoDB Ruby'
coll.update({'_id' => id}, doc)
puts 'after'
coll.find({_id: id}).peach


puts_title('--delete')
puts 'before'
puts coll.count

coll.remove(i: 7)
puts 'after'
puts coll.count
# can't load
coll.find(i: 7).peach


puts_title('-- all delete')
puts 'before'
puts coll.count

coll.remove
puts 'after'
puts coll.count


puts_title('-- delete collection')
puts 'before'
puts db.collection_names

coll.drop
puts 'after'
puts db.collection_names


puts_title('-- delete db')
puts 'before'
puts conn.database_names

conn.drop_database('sandbox')
puts 'after'
puts conn.database_names
