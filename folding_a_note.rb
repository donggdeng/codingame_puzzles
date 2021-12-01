require 'pry'

n = gets.to_i
unfolded_notes = n.times.map{ gets.chomp.chars }

def fold_twice(notes, range_h, range_v)
    notes = notes.map{|note| range_h.map{|i| note[i].reverse + note[note.size-1-i]}}
    range_v.map{|i| notes[i].map{|a|a.reverse}.zip(notes[notes.size-1-i]).map{|a|a.inject(:+)}}
end

def fold_left_top(notes, width, height)
    fold_twice(notes, (width/2-1).downto(0), (height/2-1).downto(0))
end

def fold_right_bottom(notes, width, height)
    fold_twice(notes, (width-1).downto(width/2), (height-1).downto(height/2))
end

right_bottom = true

while unfolded_notes.size > 1 do
    width = unfolded_notes[0].size
    height = unfolded_notes.size
    if right_bottom
        unfolded_notes = fold_right_bottom(unfolded_notes, width, height)
    else
        unfolded_notes = fold_left_top(unfolded_notes, width, height)
    end
    right_bottom = !right_bottom
end

puts unfolded_notes[0]