# text fragments
keys_and_values = [
  ]

keys_and_values.each do |pair|
  TextFragment.create(:key => pair[0], :value => pair[1]) unless TextFragment.find(:first, :conditions => {:key => pair[0]})
end