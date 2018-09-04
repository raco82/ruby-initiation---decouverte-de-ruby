#!/usr/bin/env ruby
def jean_michel_data(word, dictionary)
	# Split les mots en un tableau au cas où il s'agit d'une phrase
	phrase = word.split(" ")
	# Configure le hash de réponse
	answer = Hash.new(0)
	# Parcours chaque mot de la phrase
	phrase.each do |word|
		# Parcours chaque mot dans le dictionnaire
		dictionary.each do |dword|
			# Si un des mots est dans dictionnaire, on ajoute 1 au hash de mots du dictionnaire 
			if word.downcase.include?(dword)
				answer[dword] += 1
			end
		end
	end
	print answer
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts jean_michel_data("below", dictionary) # => {"below"=>1, "low"=>1}

puts jean_michel_data("Howdy partner, sit down! How's it going?", dictionary)
	# => {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}