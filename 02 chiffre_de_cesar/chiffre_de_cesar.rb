#!/usr/bin/env ruby

#Salut les loulous correcteurs, j'ai foutu des commentaires de partout pour vous faciliter la tâches (j'en ai marre de me faire baiser la gueule en correction)

def chiffre_de_cesar(string, shift, decode = false) 
	alphabet = ('A'..'Z').to_a   # là je m'occupe de la plage des majuscules et je la convertit en tableau array: ['A', 'B', … 'Z']
	shift = -shift if decode     # Si je décode, il faut annuler le décalage. La valeur négative change la direction de Array.rotate
	key = alphabet.rotate(shift) # va encoder ou décoder le tableau en faisant tourner l'aplhabet. ['A', 'B', 'C', 'D'].rotate(2) => ['C', 'D', 'A', 'B']  
  
	string.chars.inject("") do |result, char| # string.chars donne l'énumérateur des caractères dans la chaîne. Chaque caractère sera traité dans le bloc affecté à 'char'
    case_changed = char.upcase!   # upcase va renvoyer nil si aucun changement n'a été fait (on va éviter les erreurs)       
    result_char = (alphabet.include?(char) ? key[alphabet.index(char)] : char) #si char est dans l'alphabet, je récupère la correspondance dans le tableau
    result << (case_changed ? result_char.downcase : result_char) #si le char original était en minuscules, le char à la sorti sera en minuscules aussi dans la chaîne string
	end
end

def cesar_decode(string, shift)
	chiffre_de_cesar string, shift, true #va appeler chiffre_de_cesar en mode decode (flag set to true)
end

alias cesar_encode chiffre_de_cesar #va créer un alias pour la méthode chiffre_de_cesar appelé cesar_encode

puts cesar_encode("What a string!", 5) #la version encode
puts cesar_decode("Bmfy f xywnsl!", 5) #même phrase en décode