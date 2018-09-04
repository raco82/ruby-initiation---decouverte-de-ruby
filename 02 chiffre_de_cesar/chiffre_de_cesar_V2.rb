#!/usr/bin/env ruby

#Salut les correcteurs, j'ai les couilles à l'envers avec le foutage de gueule hier en rapport avec la correction
#du coup je vous ai compilé un truc sympatique qui fait plus que le job, amusez vous bien ^^


def init
    puts "Pour crypter tapez '1' pour décrypter tapez'2'"
    answer = gets.chomp.to_i
    case answer 
        when 1
        puts "Programme de cryptage"
        ta_mere_la_crypto("text", 5)
        when 2
        puts "Programme de décryptage"
        ta_mere_la_decrypto("text", 5)
    else
        puts "Putain t'es débile, c'est 1 ou 2 c'est pourtant facile ..."
    end
end

def ta_mere_la_crypto(text, shift)
    puts "Quel est ton texte ?"
    text = gets.chomp.downcase.chars.to_a
    puts "Quelle est ta clef ?"
    shift = gets.chomp.to_i
    result = []
    text.each do |char|
        case char.ord
            when 32
            result.push(char.chr)
            when 97..(122-shift)
            first_case = char.ord + shift
            result.push(first_case.chr)
            when (122-shift)..122
            second_case = char.ord - (26 - shift)
            result.push(second_case.chr)
        else
            puts "Y'a un truc chelou... recommence stp."
        end
    end.join
    puts "Voici ta nouvelle clef : #{result.join}"
end

def ta_mere_la_decrypto(code, key)
    puts "Quel est ton code ?"
    code = gets.chomp.downcase.chars.to_a
    puts "Quelle est ta clef ?"
    key = gets.chomp.to_i
    result = []
    code.each do |char|
        case char.ord
            when 32
            result.push(char.chr)
            when (97+key)..122
            first_case = char.ord - key
            result.push(first_case.chr)
            when 97..(97+key)
            second_case = char.ord + (26 - key)
            result.push(second_case.chr)
        else
            puts "Y'a un truc chelou... J'appel les hendeks."
        end
    end.join
    puts "Voici le code de base : #{result.join}"
end

init
